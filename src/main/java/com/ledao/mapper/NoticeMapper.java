package com.ledao.mapper;

import com.ledao.entity.Notice;

import java.util.List;
import java.util.Map;

/**
 * 文章类型Mapper接口
 *
 * @author
 * @company
 * @create 2024-01-03 21:59
 */
public interface NoticeMapper {

    /**
     * 条件查询文章类型
     *
     * @param map
     * @return
     */
    List<Notice> list(Map<String, Object> map);

    /**
     * 获取记录数
     *
     * @param map
     * @return
     */
    Long getTotal(Map<String, Object> map);

    /**
     * 添加文章类型
     *
     * @param notice
     * @return
     */
    Integer add(Notice notice);

    /**
     * 修改文章类型
     *
     * @param notice
     * @return
     */
    Integer update(Notice notice);

    /**
     * 根据id查询文章类型
     *
     * @param id
     * @return
     */
    Notice findById(Integer id);

    /**
     * 根据id删除文章类型
     *
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    /**
     * 根据名称查询
     *
     * @param name
     * @return
     */
    List<Notice> findByName(String name);
}
