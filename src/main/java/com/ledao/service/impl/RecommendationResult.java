package com.ledao.service.impl;

import com.ledao.entity.Article;

import java.util.List;

public class RecommendationResult {
    private List<Article> recommendedArticles;
    private List<Integer> similarUserIds;

    public RecommendationResult(List<Article> recommendedArticles, List<Integer> similarUserIds) {
        this.recommendedArticles = recommendedArticles;
        this.similarUserIds = similarUserIds;
    }

    public List<Article> getRecommendedArticles() {
        return recommendedArticles;
    }

    public List<Integer> getSimilarUserIds() {
        return similarUserIds;
    }
}
