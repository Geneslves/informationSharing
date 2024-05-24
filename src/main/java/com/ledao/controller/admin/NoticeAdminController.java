package com.ledao.controller.admin;

import com.ledao.entity.Notice;
import com.ledao.entity.PageBean;
import com.ledao.service.ArticleService;
import com.ledao.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/notice")
@Controller
public class NoticeAdminController {

    @Resource
    private NoticeService noticeService;

    @Resource
    private ArticleService articleService;

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
