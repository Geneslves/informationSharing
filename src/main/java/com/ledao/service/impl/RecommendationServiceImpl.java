package com.ledao.service.impl;

import com.ledao.entity.Article;
import com.ledao.entity.DownloadMessage;
import com.ledao.entity.RecommendedArticle;
import com.ledao.mapper.DownloadMessageMapper;
import com.ledao.mapper.RecommendedArticleMapper;
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

    @Autowired
    private RecommendedArticleMapper recommendedArticleMapper;

    /**
     * 基于用户协同过滤的推荐方法
     *
     * @return 推荐的文章列表和相似用户ID
     */
    public RecommendationResult recommendArticles(int userId, int limit) {
        // 获取所有用户的下载记录
        List<DownloadMessage> allDownloads = downloadMessageMapper.findAll();
        // 获取当前用户的下载记录
        Set<Integer> userDownloadedArticleIds = allDownloads.stream()
                .filter(dm -> dm.getUserId() == userId)
                .map(DownloadMessage::getArticleId)
                .collect(Collectors.toSet());
        // 打印已下载的文章ID
        //System.out.println("Downloads article IDs: " + userDownloadedArticleIds);
        // 计算用户之间的相似度
        Map<Integer, Double> userSimilarities = new HashMap<>();
        for (DownloadMessage dm : allDownloads) {
            if (dm.getUserId() != userId) {
                int similarUserId = dm.getUserId();
                if (!userSimilarities.containsKey(similarUserId)) {
                    double similarity = calculateSimilarity(userDownloadedArticleIds, allDownloads.stream()
                            .filter(d -> d.getUserId() == similarUserId)
                            .map(DownloadMessage::getArticleId)
                            .collect(Collectors.toSet()));
                    userSimilarities.put(similarUserId, similarity);
                }
            }
        }

        // 找到相似用户
        List<Integer> similarUserIds = userSimilarities.entrySet().stream()
                .sorted(Map.Entry.<Integer, Double>comparingByValue().reversed()) // 根据值（相似性得分）降序排序
                .limit(5)  // 假设选取前5个相似用户
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
        // 打印相似用户的ID
        System.out.println("Top 5 similar user IDs: " + similarUserIds);

        // 获取相似用户下载的文章ID，排除当前用户已经下载的文章
        Set<Integer> recommendedArticleIds = allDownloads.stream()
                .filter(dm -> similarUserIds.contains(dm.getUserId()) && !userDownloadedArticleIds.contains(dm.getArticleId()))
                .map(DownloadMessage::getArticleId)
                .collect(Collectors.toSet());

        // 打印实际获取的文章ID
        System.out.println("Recommended article IDs: " + recommendedArticleIds);

        // 从推荐文章ID集合中随机选择文章ID
        List<Integer> randomRecommendedArticleIds = new ArrayList<>(recommendedArticleIds);
        Collections.shuffle(randomRecommendedArticleIds); // 随机排序
        randomRecommendedArticleIds = randomRecommendedArticleIds.stream()
                .limit(limit) // 限制数量
                .collect(Collectors.toList());

        // 打印推荐的文章ID
        System.out.println("Actual recommended article IDs: " + randomRecommendedArticleIds);
        System.out.println("         ______________________________________________________________________");

        // 根据文章ID获取文章
        List<Article> recommendedArticles = articleService.findArticlesByIds(randomRecommendedArticleIds);

        // 返回推荐结果，包含所有推荐文章ID
        return new RecommendationResult(recommendedArticles, similarUserIds, recommendedArticleIds);
    }

    /**
     * 计算两个用户的相似度（使用余弦相似度）
     *
     * @param user1ArticleIds 用户1的下载文章ID集合
     * @param user2ArticleIds 用户2的下载文章ID集合
     * @return 相似度
     */
    private double calculateSimilarity(Set<Integer> user1ArticleIds, Set<Integer> user2ArticleIds) {
        Set<Integer> intersection = new HashSet<>(user1ArticleIds);
        intersection.retainAll(user2ArticleIds);
        return intersection.size() / Math.sqrt(user1ArticleIds.size() * user2ArticleIds.size());
    }

    /**
     * 使用随机的推荐方法
     *
     * @return 推荐的文章列表
     */
    public List<Article> recommendRandomArticles(int limit) {
        return articleService.findRandomArticles(limit);
    }

    /**
     * 根据用户ID获取推荐文章
     *
     * @param userId 用户ID
     * @param limit  推荐数量
     * @return 推荐的文章列表
     */
    public List<Article> getRecommendations(int userId, int limit) {
        List<Article> recommendedArticles;
        if (userId > 0) {
            // 用户已登录，根据下载记录推荐
            RecommendationResult result = recommendArticles(userId, limit);
            recommendedArticles = result.getRecommendedArticles();
            // 插入推荐数据到数据库
            insertRecommendedArticles(userId, recommendedArticles, result.getSimilarUserIds(), result.getRecommendedArticleIds());
        } else {
            // 用户未登录，随机推荐
            recommendedArticles = recommendRandomArticles(limit);
        }

        return recommendedArticles;
    }

    private void insertRecommendedArticles(int userId, List<Article> recommendedArticles, List<Integer> similarUserIds, Set<Integer> allRecommendedArticleIds) {
        RecommendedArticle recommendedArticle = new RecommendedArticle();
        recommendedArticle.setUserId(userId);

        // 收集推荐文章ID
        List<Integer> recommendedArticleIds = recommendedArticles.stream()
                .map(Article::getId)
                .collect(Collectors.toList());

        // 填充recommendedArticle对象的articleId字段
        for (int i = 0; i < Math.min(recommendedArticles.size(), 10); i++) {
            Article article = recommendedArticles.get(i);
            switch (i) {
                case 0:
                    recommendedArticle.setArticleId1(article.getId());
                    break;
                case 1:
                    recommendedArticle.setArticleId2(article.getId());
                    break;
                case 2:
                    recommendedArticle.setArticleId3(article.getId());
                    break;
                case 3:
                    recommendedArticle.setArticleId4(article.getId());
                    break;
                case 4:
                    recommendedArticle.setArticleId5(article.getId());
                    break;
                case 5:
                    recommendedArticle.setArticleId6(article.getId());
                    break;
                case 6:
                    recommendedArticle.setArticleId7(article.getId());
                    break;
                case 7:
                    recommendedArticle.setArticleId8(article.getId());
                    break;
                case 8:
                    recommendedArticle.setArticleId9(article.getId());
                    break;
                case 9:
                    recommendedArticle.setArticleId10(article.getId());
                    break;
                default:
                    break;
            }
        }

        // 插入所有推荐的文章ID（未限制数量）
        recommendedArticle.setRecommendedArticleIds(allRecommendedArticleIds.toString());
        recommendedArticle.setSimilarUserIds(similarUserIds.toString());

        recommendedArticleMapper.insert(recommendedArticle);
    }
}
