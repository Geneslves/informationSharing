package com.ledao.controller;

import com.ledao.entity.Article;
import com.ledao.entity.ArticleType;
import com.ledao.entity.Comment;
import com.ledao.lucene.ArticleIndex;
import com.ledao.service.ArticleService;
import com.ledao.service.ArticleTypeService;
import com.ledao.service.CommentService;
import com.ledao.service.UserService;
import com.ledao.util.DateUtil;
import com.ledao.util.StringUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 前台文章Controller层
 *
 * @author
 * @company
 * @create 2024-01-07 20:11
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Value("${articleImageFilePath}")
    private String articleImageFilePath;

    @Value("${articleFilePath}")
    private String articleFilePath;

    @Resource
    private ArticleService articleService;

    @Resource
    private ArticleTypeService articleTypeService;

    @Resource
    private UserService userService;

    @Resource
    private CommentService commentService;

    private final ArticleIndex articleIndex = new ArticleIndex();

    /**
     * 获得纯文本
     *
     * @param strHtml
     * @return
     */
    public static String StripHT(String strHtml) {
        //剔出<html>的标签
        String txtcontent = strHtml.replaceAll("</?[^>]+>", "");
        //去除字符串中的空格,回车,换行符,制表符
        txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
        return txtcontent;
    }

    // 上传文件方法
    @ResponseBody
    @RequestMapping("/uploadFile")
    public Map<String, Object> uploadFile(@RequestParam("upload") MultipartFile file) throws Exception {
        String fileName = file.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = DateUtil.getCurrentDateStr2() + suffixName;
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(articleFilePath + newFileName));
        Map<String, Object> result = new HashMap<>();
        result.put("filePath", articleFilePath + newFileName);
        result.put("fileName", newFileName);
        return result;
    }

    @RequestMapping("/save")
    public ModelAndView save(@RequestParam(value = "file", required = false) MultipartFile file, Article article) throws Exception {
        if (file != null && !file.isEmpty()) {
            Map<String, Object> uploadResult = uploadFile(file);
            String filePath = (String) uploadResult.get("filePath");
            article.setFilePath(filePath);
        } else if (article.getId() != null) {
            Article existingArticle = articleService.findById(article.getId());
            article.setFilePath(existingArticle.getFilePath());
        }

        int maxStringLength = 600;
        if (article.getId() == null) {
            ModelAndView mav = new ModelAndView();
            article.setSummary(StripHT(article.getContent()));
            if (article.getSummary().length() >= maxStringLength) {
                article.setSummary(article.getSummary().substring(0, 600));
            }
            articleService.add(article);
            Map<String, Object> map = new HashMap<>(16);
            map.put("sortByPublishDate", 1);
            List<ArticleType> articleTypeList = articleTypeService.list(null);
            List<Article> articleList = articleService.list(map);
            articleIndex.addIndex(articleList.get(0));
            mav.addObject("writeArticleSuccess", true);
            mav.addObject("articleTypeList", articleTypeList);
            mav.addObject("title", "发布资源");
            mav.addObject("mainPage", "page/writeArticle");
            mav.addObject("mainPageKey", "#b");
            mav.setViewName("index");

            // 为用户添加2积分
            article.setUser(userService.findById(article.getUserId()));
            Integer points = 2;
            Integer userId = article.getUserId(); // 获取文章发布者的用户 ID
            articleService.addPoints(points, userId);

            return mav;
        } else {
            Article trueArticle = articleService.findById(article.getId());
            String summary = StripHT(article.getContent());
            if (summary.length() >= maxStringLength) {
                article.setSummary(summary.substring(0, 600));
            } else {
                article.setSummary(summary);
            }
            article.setIsUseful(trueArticle.getIsUseful());
            article.setState(1);
            article.setIsUseful(1);
            articleService.update(article);
            articleIndex.updateIndex(article);
            if (article.getIsUseful() == 1) {
                ModelAndView mav = new ModelAndView("redirect:/toArticleManagePage");
                return mav;
            } else if (article.getIsUseful() == 0) {
                ModelAndView mav = new ModelAndView("redirect:/toArticleFailureManagePage");
                return mav;
            }
        }
        return null;
    }

    /**
     * 根据id删除资源
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(Integer id) throws Exception {
        articleIndex.deleteIndex(id.toString());
        articleService.deleteById(id);
        ModelAndView mav = new ModelAndView("redirect:/toArticleManagePage");
        return mav;
    }

    /**
     * ckeditor上传图片
     *
     * @param file
     * @param CKEditorFuncNum
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/ckeditorUpload")
    public String ckeditorUpload(@RequestParam("upload") MultipartFile file, String CKEditorFuncNum) throws Exception {
        // 获取文件名
        String fileName = file.getOriginalFilename();
        // 获取文件的后缀
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        //拼接新的文件名
        String newFileName = DateUtil.getCurrentDateStr2() + ".jpg";
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(articleImageFilePath + newFileName));
        String sb = "<script type=\"text/javascript\">" +
                "window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'" + "/static/images/articleImage/" + newFileName + "','')" +
                "</script>";
        return sb;
    }

    /**
     * 查看资源详情
     *
     * @param id
     * @return
     */
    @RequestMapping("/{id}")
    public ModelAndView details(@PathVariable("id") Integer id) {
        ModelAndView mav = new ModelAndView();
        Article article = articleService.findById(id);
        article.setClick(article.getClick() + 1);
        articleService.update(article);
        article.setUser(userService.findById(article.getUserId()));
        article.setArticleType(articleTypeService.findById(article.getArticleTypeId()));
        Map<String, Object> map = new HashMap<>(16);
        map.put("articleId", id);
        map.put("state", 1);
        List<Comment> commentList = commentService.list(map);
        for (Comment comment1 : commentList) {
            comment1.setUser(userService.findById(comment1.getUserId()));
        }
        mav.addObject("commentList", commentList);
        mav.addObject("article", article);
        mav.addObject("title", article.getName());
        mav.addObject("mainPage", "page/articleView");
        mav.addObject("mainPageKey", "#b");
        mav.setViewName("index");
        return mav;
    }

    /**
     * 根据关键字查询相关资源信息
     *
     * @param q 查询条件
     * @return
     * @throws Exception
     */
    @RequestMapping("/q")
    public ModelAndView search(String q, @RequestParam(value = "page", required = false) String page, HttpServletRequest request) throws Exception {
        int pageSize = 3;
        if (StringUtil.isEmpty(page)) {
            page = "1";
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("title", "搜索关键字'" + q + "'结果页面");
        mav.addObject("mainPage", "page/articleResult");
        mav.addObject("mainPageKey", "#b");
        List<Article> articleList = articleIndex.searchArticle(q);
        for (Article article : articleList) {
            article.setState(articleService.findById(article.getId()).getState());
        }
        Iterator<Article> iterator = articleList.iterator();
        while (iterator.hasNext()) {
            Article article = iterator.next();
            if (article.getState() == 1) {
                iterator.remove();
            }
        }
        for (Article article : articleList) {
            Article trueArticle = articleService.findById(article.getId());
            article.setClick(trueArticle.getClick());
            article.setPoints(trueArticle.getPoints());
            article.setUser(userService.findById(trueArticle.getUserId()));
            article.setArticleType(articleTypeService.findById(trueArticle.getArticleTypeId()));
            article.setPublishDate(trueArticle.getPublishDate());
            ArticleType articleType = articleTypeService.findById(trueArticle.getArticleTypeId());
            article.setArticleType(articleType);
        }
        //算出第一页到当前页的总记录条数
        Integer toIndex = articleList.size() >= Integer.parseInt(page) * pageSize ? Integer.parseInt(page) * pageSize : articleList.size();
        mav.addObject("articleList", articleList.subList((Integer.parseInt(page) - 1) * pageSize, toIndex));
        mav.addObject("pageCode", this.genUpAndDownPageCode(Integer.parseInt(page), articleList.size(), q, pageSize, request.getServletContext().getContextPath()));
        mav.addObject("q", q);
        mav.addObject("resultTotal", articleList.size());
        mav.setViewName("index");
        return mav;
    }

    /**
     * 获取上一页，下一页代码
     *
     * @param page           当前页
     * @param totalNum       总记录数
     * @param q              查询条件
     * @param pageSize       每页记录数
     * @param projectContext url地址
     * @return
     */
    private String genUpAndDownPageCode(Integer page, Integer totalNum, String q, Integer pageSize, String projectContext) {
        //数据总页数
        long totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;
        StringBuffer pageCode = new StringBuffer();
        if (totalPage == 0) {
            return null;
        } else {
            if (page > 1) {
                pageCode.append("<a href='" + projectContext + "/article/q?page=" + (page - 1) + "&q=" + q + "' class='layui-btn layui-btn-sm layui-bg-blue'>上一页</a>");
            } else {
                pageCode.append("<a href='#' class='layui-btn layui-btn-sm layui-bg-blue  layui-btn-disabled' title='没有上一页了'>上一页</a>");
            }
            if (page < totalPage) {
                pageCode.append("<a href='" + projectContext + "/article/q?page=" + (page + 1) + "&q=" + q + "' class='layui-btn layui-btn-sm layui-bg-blue'>下一页</a>");
            } else {
                pageCode.append("<a href='#' class='layui-btn layui-btn-sm layui-bg-blue layui-btn-disabled' title='没有下一页了'>下一页</a>");
            }
        }
        return pageCode.toString();
    }
}
