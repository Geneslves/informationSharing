package com.ledao.controller;

import com.ledao.entity.Article;
import com.ledao.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RecommendationController {

    @Autowired
    private RecommendationService recommendationService;

    @GetMapping("/recommendations")
    public List<Article> getRecommendations(@RequestParam("userId") int userId) {
        return recommendationService.getRecommendations(userId, 3);
    }

}
