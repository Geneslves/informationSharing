package com.ledao.controller.admin;

import com.ledao.entity.Notice;
import com.ledao.entity.PageBean;
import com.ledao.service.ArticleService;
import com.ledao.service.NoticeService;
import com.ledao.util.StringUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date; // Added import for Date
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台资源类型Controller层
 *
 * @author
 * @company
 * @create 2024-01-16 21:15
 */
@RestController
@RequestMapping("/admin/notice")
public class NoticeAdminController {

    @Resource
    private NoticeService noticeService;

    @Resource
    private ArticleService articleService;

    /**
     * 分页分条件查询资源类型
     *
     * @param notice
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/list")
    public Map<String, Object> list(Notice notice, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "rows", required = false) Integer rows) {
        PageBean pageBean = new PageBean(page, rows);
        Map<String, Object> resultMap = new HashMap<>(16);
        Map<String, Object> map = new HashMap<>(16);
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        map.put("time", new Date()); // Added current time
        List<Notice> noticeList = noticeService.list(map);
        for (Notice type : noticeList) {
            Map<String, Object> map2 = new HashMap<>(16);
            map2.put("noticeId", type.getId());
        }
        Long total = noticeService.getTotal(map);
        resultMap.put("rows", noticeList);
        resultMap.put("total", total);
        return resultMap;
    }

    /**
     * 添加或修改资源类型
     *
     * @param notice
     * @return
     */
    @RequestMapping("/save")
    public Map<String, Object> save(Notice notice) {
        Map<String, Object> resultMap = new HashMap<>(16);
        int key;
        if (notice.getId() == null) {//            notice.setTime(String.valueOf(new Date())); // Added current time
            key = noticeService.add(notice);
        } else {
            key = noticeService.update(notice);
        }
        if (key > 0) {
            resultMap.put("success", true);
        } else {
            resultMap.put("success", false);
        }
        return resultMap;
    }
    /**
     * 删除资源类型(可批量删除)
     *
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    public Map<String, Object> delete(String ids) {
        Map<String, Object> resultMap = new HashMap<>(16);
        int key = 0;
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            int id = Integer.parseInt(idsStr[i]);
            Map<String, Object> map = new HashMap<>(16);
            map.put("noticeId", id);
            key = noticeService.deleteById(id);
            resultMap.put("success", true);
        }
        if (key > 0) {
            resultMap.put("success", true);
        }
        return resultMap;
    }
}
