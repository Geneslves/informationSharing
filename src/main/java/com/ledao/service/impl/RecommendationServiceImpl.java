package com.ledao.service.impl;

import com.ledao.entity.DownloadMessage;
import com.ledao.mapper.DownloadMessageMapper;
import com.ledao.entity.Article;
import com.ledao.service.ArticleService;
import com.ledao.service.RecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class RecommendationServiceImpl implements RecommendationService {

    @Autowired
    private DownloadMessageMapper downloadMessageMapper;

    @Autowired
    private ArticleService articleService;
    /**
     * 基于用户协同过滤的推荐方法
     * @return 推荐的文章列表
     */
//    public List<Article> recommendArticles(int userId) {
//        List<Integer> articleIds = downloadMessageMapper.findArticlesNotDownloadedByUser(userId);
//        return articleService.findArticlesByIds(articleIds);
//    }
    public List<Article> recommendArticles(int userId) {
        // 获取所有用户的下载记录
        List<DownloadMessage> allDownloads = downloadMessageMapper.findAll();
        // 获取当前用户的下载记录
        List<DownloadMessage> userDownloads = allDownloads.stream()
                .filter(dm -> dm.getUserId() == userId)
                .collect(Collectors.toList());

        // 计算用户之间的相似度
        Map<Integer, Double> userSimilarities = new HashMap<>();
        for (DownloadMessage dm : allDownloads) {
            if (dm.getUserId() != userId) {
                double similarity = calculateSimilarity(userDownloads, allDownloads.stream()
                        .filter(d -> d.getUserId() == dm.getUserId())
                        .collect(Collectors.toList()));
                userSimilarities.put(dm.getUserId(), similarity);
            }
        }

        // 找到相似用户
        List<Integer> similarUserIds = userSimilarities.entrySet().stream()
                .sorted(Map.Entry.<Integer, Double>comparingByValue().reversed())// 根据值（相似性得分）降序排序
                .limit(5)  // 假设选取前5个相似用户
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
//        // 找到最近的用户
//        List<Integer> similarUserIds = userSimilarities.entrySet().stream()
//                .sorted(Map.Entry.comparingByValue()) // 根据值（相似性得分）升序排序
//                .limit(10)  // 选择最近的10个用户
//                .map(Map.Entry::getKey)
//                .collect(Collectors.toList());


        // 获取相似用户下载的文章ID
        List<Integer> recommendedArticleIds = allDownloads.stream()
                .filter(dm -> similarUserIds.contains(dm.getUserId()) && !userDownloads.contains(dm))
                .map(DownloadMessage::getArticleId)
                .distinct()
                .collect(Collectors.toList());

        // 根据文章ID获取文章
        return articleService.findArticlesByIds(recommendedArticleIds);
    }


    /**
     * 计算两个用户的相似度（使用余弦相似度）
     *
     * @param user1Downloads 用户1的下载记录
     * @param user2Downloads 用户2的下载记录
     * @return 相似度
     */
    private double calculateSimilarity(List<DownloadMessage> user1Downloads, List<DownloadMessage> user2Downloads) {
        Set<Integer> user1ArticleIds = user1Downloads.stream()
                .map(DownloadMessage::getArticleId)
                .collect(Collectors.toSet());
        Set<Integer> user2ArticleIds = user2Downloads.stream()
                .map(DownloadMessage::getArticleId)
                .collect(Collectors.toSet());

        Set<Integer> intersection = new HashSet<>(user1ArticleIds);
        intersection.retainAll(user2ArticleIds);

        return intersection.size() / Math.sqrt(user1ArticleIds.size() * user2ArticleIds.size());
    }
    /**
     * 使用随机的推荐方法
     * @return 推荐的文章列表
     */
    public List<Article> recommendRandomArticles(int limit) {
        return articleService.findRandomArticles(limit);
    }

//    public List<Article> getRecommendations(int userId, int limit) {
//        if (userId > 0) {
//            // 用户已登录，根据下载记录推荐
//            List<Integer> articleIds = downloadMessageMapper.findArticlesNotDownloadedByUser(userId);
//            return articleService.findArticlesByIds(articleIds);
//        } else {
//            // 用户未登录，随机推荐
//            return articleService.findRandomArticles(limit);
//        }
//    }
    /**
     * 根据用户ID获取推荐文章
     *
     * @param userId 用户ID
     * @param limit 推荐数量
     * @return 推荐的文章列表
     */
    public List<Article> getRecommendations(int userId, int limit) {
        if (userId > 0) {
            // 用户已登录，根据下载记录推荐
            return recommendArticles(userId);
        } else {
            // 用户未登录，随机推荐
            return recommendRandomArticles(limit);
        }
    }
}
