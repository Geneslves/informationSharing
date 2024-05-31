package com.ledao.controller;

import com.ledao.entity.Article;
import com.ledao.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/recommendations")
public class RecommendationController {

    @Autowired
    private RecommendationService recommendationService;

    @GetMapping
    public List<Article> getRecommendations(@RequestParam("userId") int userId, @RequestParam("limit") int limit) {
        return recommendationService.getRecommendations(userId, limit);
    }
}
