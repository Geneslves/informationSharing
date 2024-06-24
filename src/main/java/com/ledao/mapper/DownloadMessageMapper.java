package com.ledao.mapper;

import com.ledao.entity.DownloadMessage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 下载记录Mapper接口
 *
 * @author
 * @company
 * @create 2024-01-10 20:32
 */
@Mapper
public interface DownloadMessageMapper {

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

    @Select("SELECT * FROM t_download_message WHERE articleId = #{articleId}")
    List<DownloadMessage> findByArticleId(@Param("articleId") int articleId);

    @Select("SELECT * FROM t_download_message WHERE userId = #{userId}")
    List<DownloadMessage> findByUserId(@Param("userId") int userId);

    @Select("SELECT DISTINCT articleId FROM t_download_message WHERE articleId NOT IN (SELECT articleId FROM t_download_message WHERE userId = #{userId})")
    List<Integer> findArticlesNotDownloadedByUser(@Param("userId") int userId);

    @Select("SELECT * FROM t_download_message")
    List<DownloadMessage> findAll();
}
