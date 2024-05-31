package com.ledao.mapper;

import com.ledao.entity.RecommendedArticle;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecommendedArticleMapper {

    @Insert("INSERT INTO t_recommended (time,userId, articleId1, articleId2, articleId3, articleId4, articleId5, articleId6, articleId7, articleId8, articleId9, articleId10) " +
            "VALUES (now(),#{userId}, #{articleId1}, #{articleId2}, #{articleId3}, #{articleId4}, #{articleId5}, #{articleId6}, #{articleId7}, #{articleId8}, #{articleId9}, #{articleId10})")
    void insert(RecommendedArticle recommendedArticle);
}
