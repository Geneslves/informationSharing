package com.ledao.service;

import com.ledao.entity.Link;

import java.util.List;
import java.util.Map;

/**
 * 友情链接Service接口
 *
 * @author
 * @company
 * @create 2021-01-04 1:43
 */
public interface LinkService {

    /**
     * 条件查询
     *
     * @param map
     * @return
     */
    List<Link> list(Map<String, Object> map);

    /**
     * 获取记录数
     *
     * @param map
     * @return
     */
    Long getTotal(Map<String, Object> map);

    /**
     * 添加友情链接
     *
     * @param link
     * @return
     */
    Integer add(Link link);

    /**
     * 修改友情链接
     *
     * @param link
     * @return
     */
    Integer update(Link link);

    /**
     * 根据id删除友情链接
     *
     * @param id
     * @return
     */
    Integer deleteById(Integer id);
}
