package com.ledao.quartz;

import com.ledao.entity.Article;
import com.ledao.lucene.ArticleIndex;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class IndexUpdater {
    private final ArticleIndex articleIndex = new ArticleIndex();
    private final DatabaseHelper databaseHelper = new DatabaseHelper();

    public void startScheduledTask() {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.scheduleAtFixedRate(() -> {
            try {
                List<Article> articles = databaseHelper.getArticles();
                for (Article article : articles) {
                    articleIndex.updateIndex(article);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }, 0, 1, TimeUnit.HOURS); // 每小时执行一次任务
    }

    public static void main(String[] args) {
        IndexUpdater updater = new IndexUpdater();
        updater.startScheduledTask();
    }
}
