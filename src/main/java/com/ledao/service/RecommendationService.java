package com.ledao.service;


import com.ledao.entity.Article;
import com.ledao.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class RecommendationService {

    @Autowired
    private ArticleMapper articleMapper;

    public List<Article> recommendArticles(Integer userId) {
        List<Article> allArticles = articleMapper.getAllArticles();
        // 简单的基于点击率的协同过滤算法
        // 这里的点击率可以用用户点击文章的次数来代替
        // 需要一个用户点击历史记录的数据库表来支持这个逻辑
        // 例如：user_article_click(userId, articleId, clickCount)

        // 示例代码，仅供参考
        Map<Integer, Integer> articleClickCount = getUserArticleClickCount(userId);

        // 推荐点击次数最多的文章
        return allArticles.stream()
                .sorted((a1, a2) -> articleClickCount.getOrDefault(a2.getId(), 0)
                        .compareTo(articleClickCount.getOrDefault(a1.getId(), 0)))
                .collect(Collectors.toList());
    }

    private Map<Integer, Integer> getUserArticleClickCount(Integer userId) {
        // 模拟数据，实际情况应该从数据库查询
        Map<Integer, Integer> clickCount = new HashMap<>();
        clickCount.put(1, 10);
        clickCount.put(2, 5);
        clickCount.put(3, 20);
        return clickCount;
    }
}