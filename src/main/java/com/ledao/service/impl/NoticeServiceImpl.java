package com.ledao.service.impl;

import com.ledao.entity.Notice;
import com.ledao.mapper.NoticeMapper;
import com.ledao.service.NoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> list(Map<String, Object> map) {
        return noticeMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return noticeMapper.getTotal(map);
    }

    @Override
    public Integer add(Notice notice) {
        return noticeMapper.add(notice);
    }

    @Override
    public Integer update(Notice notice) {
        return noticeMapper.update(notice);
    }

    @Override
    public Notice findById(Integer id) {
        return noticeMapper.findById(id);
    }

    @Override
    public Integer deleteById(Integer id) {
        return noticeMapper.deleteById(id);
    }
}
