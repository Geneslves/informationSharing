package com.ledao.entity;

import javax.xml.crypto.Data;

public class RecommendedArticle {
    private Integer id;
    private Data time;
    private Integer userId;

    public String getSimilarUserIds() {
        return similarUserIds;
    }

    public void setSimilarUserIds(String similarUserIds) {
        this.similarUserIds = similarUserIds;
    }

    public String getRecommendedArticleIds() {
        return recommendedArticleIds;
    }

    public void setRecommendedArticleIds(String recommendedArticleIds) {
        this.recommendedArticleIds = recommendedArticleIds;
    }

    private String similarUserIds;
    private String recommendedArticleIds;
    private Integer articleId1;
    private Integer articleId2;
    private Integer articleId3;
    private Integer articleId4;
    private Integer articleId5;
    private Integer articleId6;
    private Integer articleId7;
    private Integer articleId8;
    private Integer articleId9;
    private Integer articleId10;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Data getTime() {
        return time;
    }

    public void setTime(Data time) {
        this.time = time;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getArticleId1() {
        return articleId1;
    }

    public void setArticleId1(Integer articleId1) {
        this.articleId1 = articleId1;
    }

    public Integer getArticleId2() {
        return articleId2;
    }

    public void setArticleId2(Integer articleId2) {
        this.articleId2 = articleId2;
    }

    public Integer getArticleId3() {
        return articleId3;
    }

    public void setArticleId3(Integer articleId3) {
        this.articleId3 = articleId3;
    }

    public Integer getArticleId4() {
        return articleId4;
    }

    public void setArticleId4(Integer articleId4) {
        this.articleId4 = articleId4;
    }

    public Integer getArticleId5() {
        return articleId5;
    }

    public void setArticleId5(Integer articleId5) {
        this.articleId5 = articleId5;
    }

    public Integer getArticleId6() {
        return articleId6;
    }

    public void setArticleId6(Integer articleId6) {
        this.articleId6 = articleId6;
    }

    public Integer getArticleId7() {
        return articleId7;
    }

    public void setArticleId7(Integer articleId7) {
        this.articleId7 = articleId7;
    }

    public Integer getArticleId8() {
        return articleId8;
    }

    public void setArticleId8(Integer articleId8) {
        this.articleId8 = articleId8;
    }

    public Integer getArticleId9() {
        return articleId9;
    }

    public void setArticleId9(Integer articleId9) {
        this.articleId9 = articleId9;
    }

    public Integer getArticleId10() {
        return articleId10;
    }

    public void setArticleId10(Integer articleId10) {
        this.articleId10 = articleId10;
    }
}
