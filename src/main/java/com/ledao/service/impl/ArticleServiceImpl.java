package com.ledao.service.impl;

import com.ledao.entity.Article;
import com.ledao.mapper.ArticleMapper;
import com.ledao.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章Service接口
 *
 * @author
 * @company
 * @create 2024-01-04 0:06
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Resource
    private ArticleMapper articleMapper;

    @Override
    public List<Article> list(Map<String, Object> map) {
        return articleMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return articleMapper.getTotal(map);
    }

    @Override
    public Integer add(Article article) {
        return articleMapper.add(article);
    }

    @Override
    public Integer update(Article article) {
        return articleMapper.update(article);
    }

    @Override
    public Integer deleteById(Integer id) {
        return articleMapper.deleteById(id);
    }

    @Override
    public Article findById(Integer id) {
        return articleMapper.findById(id);
    }

    @Override
    public Integer addPoints(Integer points, Integer userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("points", points);
        params.put("userId", userId);
        return articleMapper.addPoints(params);
    }

    public List<Article> findArticlesByIds(List<Integer> ids) {
        return articleMapper.findArticlesByIds(ids);
    }

    public List<Article> findRandomArticles(int limit) {
        return articleMapper.findRandomArticles(limit);
    }

}
