package com.ledao.service;

import com.ledao.entity.DownloadMessage;

import java.util.List;
import java.util.Map;

/**
 * 下载记录Service接口
 *
 * @author
 * @company
 * @create 2024-01-10 20:39
 */
public interface DownloadMessageService {

    /**
     * 根据条件查询
     *
     * @param map
     * @return
     */
    List<DownloadMessage> list(Map<String, Object> map);

    /**
     * 获取记录数
     *
     * @param map
     * @return
     */
    Long getTotal(Map<String, Object> map);

    /**
     * 添加下载记录
     *
     * @param downloadMessage
     * @return
     */
    Integer add(DownloadMessage downloadMessage);

    /**
     * 根据id删除下载记录
     *
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    List<DownloadMessage> findByUserId(int userId);

    List<DownloadMessage> findByArticleId(int articleId);
}
