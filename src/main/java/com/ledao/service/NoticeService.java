package com.ledao.service;

import com.ledao.entity.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

    List<Notice> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);

    Integer add(Notice notice);

    Integer update(Notice notice);

    Notice findById(Integer id);

    Integer deleteById(Integer id);
}
