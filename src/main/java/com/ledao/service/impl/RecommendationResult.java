package com.ledao.service.impl;

import com.ledao.entity.Article;

import java.util.List;
import java.util.Set;

public class RecommendationResult {
    private List<Article> recommendedArticles;
    private List<Integer> similarUserIds;
    private Set<Integer> recommendedArticleIds;

    public RecommendationResult(List<Article> recommendedArticles, List<Integer> similarUserIds, Set<Integer> recommendedArticleIds) {
        this.recommendedArticles = recommendedArticles;
        this.similarUserIds = similarUserIds;
        this.recommendedArticleIds = recommendedArticleIds;
    }

    public List<Article> getRecommendedArticles() {
        return recommendedArticles;
    }

    public List<Integer> getSimilarUserIds() {
        return similarUserIds;
    }

    public Set<Integer> getRecommendedArticleIds() {
        return recommendedArticleIds;
    }
}
