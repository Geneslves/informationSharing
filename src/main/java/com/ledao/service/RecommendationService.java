package com.ledao.service;

import com.ledao.mapper.DownloadMessageMapper;
import com.ledao.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecommendationService {

    @Autowired
    private DownloadMessageMapper downloadMessageMapper;

    @Autowired
    private ArticleService articleService;

    public List<Article> recommendArticles(int userId) {
        List<Integer> articleIds = downloadMessageMapper.findArticlesNotDownloadedByUser(userId);
        return articleService.findArticlesByIds(articleIds);
    }
    /**
     * 基于用户协同过滤的推荐方法
     *
     * @return 推荐的文章列表
     */
    public List<Article> recommendRandomArticles(int limit) {
        return articleService.findRandomArticles(limit);
    }

    public List<Article> getRecommendations(int userId, int limit) {
        if (userId > 0) {
            // 用户已登录，根据下载记录推荐
            List<Integer> articleIds = downloadMessageMapper.findArticlesNotDownloadedByUser(userId);
            return articleService.findArticlesByIds(articleIds);
        } else {
            // 用户未登录，随机推荐
            return articleService.findRandomArticles(limit);
        }
    }
}
