package com.ledao.service;

import com.ledao.entity.Article;

import java.util.List;

public interface RecommendationService {
    List<Article> getRecommendations(int userId, int limit);

}
