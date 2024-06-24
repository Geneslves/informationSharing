package com.ledao.service.impl;

import com.ledao.entity.DownloadMessage;
import com.ledao.mapper.DownloadMessageMapper;
import com.ledao.service.DownloadMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 下载记录Service接口实现类
 *
 * @author
 * @company
 * @create 2024-01-10 20:39
 */
@Service("downloadMessageService")
public class DownloadMessageServiceImpl implements DownloadMessageService {

    @Resource
    private DownloadMessageMapper downloadMessageMapper;

    @Override
    public List<DownloadMessage> list(Map<String, Object> map) {
        return downloadMessageMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return downloadMessageMapper.getTotal(map);
    }

    @Override
    public Integer add(DownloadMessage downloadMessage) {
        return downloadMessageMapper.add(downloadMessage);
    }

    @Override
    public Integer deleteById(Integer id) {
        return downloadMessageMapper.deleteById(id);
    }

    @Override
    public List<DownloadMessage> findByArticleId(int articleId) {
        return downloadMessageMapper.findByArticleId(articleId);
    }

    @Override
    public List<DownloadMessage> findByUserId(int userId) {
        return downloadMessageMapper.findByUserId(userId);
    }

}
