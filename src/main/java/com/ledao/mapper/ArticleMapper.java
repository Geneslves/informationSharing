package com.ledao.mapper;

import com.ledao.entity.Article;
import com.ledao.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 文章Mapper接口
 *
 * @author
 * @company
 * @create 2024-01-03 23:38
 */
public interface ArticleMapper {

    /**
     * 条件查询
     *
     * @param map
     * @return
     */
    List<Article> list(Map<String, Object> map);

    /**
     * 获取记录数
     *
     * @param map
     * @return
     */
    Long getTotal(Map<String, Object> map);

    /**
     * 添加文章
     *
     * @param article
     * @return
     */
    Integer add(Article article);

    /**
     * 修改文章
     *
     * @param article
     * @return
     */
    Integer update(Article article);

    /**
     * 根据id删除文章
     *
     * @param id
     * @return
     */
    Integer deleteById(Integer id);

    /**
     * 根据id查询文章
     *
     * @param id
     * @return
     */
    Article findById(Integer id);

    Integer addPoints(Map<String, Object> params);

//    @Select("<script>" +
//            "SELECT * FROM t_article WHERE id IN " +
//            "<foreach item='id' index='index' collection='ids' open='(' separator=',' close=')'>" +
//            "#{id}" +
//            "</foreach>" +
//            "</script>")
//    List<Article> findArticlesByIds(@Param("ids") List<Integer> ids);
@Select("<script>" +
        "SELECT * FROM t_article WHERE id IN " +
        "<foreach item='id' index='index' collection='ids' open='(' separator=',' close=')'>" +
        "#{id}" +
        "</foreach>" +
        " LIMIT 5" + // 添加 LIMIT 子句
        "</script>")
    List<Article> findArticlesByIds(@Param("ids") List<Integer> ids);


    @Select("SELECT * FROM t_article ORDER BY RAND() LIMIT #{limit}")
    List<Article> findRandomArticles(@Param("limit") int limit);
}
