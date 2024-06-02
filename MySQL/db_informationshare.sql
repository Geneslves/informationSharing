/*
 Navicat Premium Data Transfer

 Source Server         : MySQL 8.0.32
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : db_informationshare

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 02/06/2024 20:31:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章名称',
  `publishDate` datetime NULL DEFAULT NULL COMMENT '发布日期',
  `userId` int NULL DEFAULT NULL COMMENT '发布人id',
  `articleTypeId` int NULL DEFAULT NULL COMMENT '文章类型id',
  `points` int NULL DEFAULT NULL COMMENT '下载所需积分',
  `summary` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `downloadLink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '百度云链接',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接密码',
  `isHot` int NULL DEFAULT NULL COMMENT '是否热门 0代表不是 1代表是',
  `state` int NULL DEFAULT NULL COMMENT '状态 1代表未审核 2代表审核通过 3代表审核未通过',
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核未通过理由',
  `checkDate` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `isUseful` int NULL DEFAULT NULL COMMENT '链接是否失效 1代表未失效 0代表已经失效',
  `click` int NULL DEFAULT NULL COMMENT '点击次数',
  `filePath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件上传路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `articleTypeId`(`articleTypeId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `name`(`name` ASC) USING BTREE,
  CONSTRAINT `t_article_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (1, 'JavaScript基础教程', '2024-06-03 10:00:00', 3, 8, 2, '适合初学者的JavaScript基础教程', '本教程详细介绍了JavaScript的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 1, 2, NULL, '2024-05-24 18:12:49', 1, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (2, 'JavaScript进阶指南', '2024-06-04 11:30:00', 4, 8, 3, '深入学习JavaScript进阶知识和技巧', '本指南介绍了JavaScript的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 0, NULL, '2024-06-05 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (3, '拳皇版超级玛丽13可执行文件', '2024-01-10 23:00:53', 6, 1, 4, '拳皇版超级玛丽13可执行文件\n', '<p>拳皇版超级玛丽13可执行文件</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 12, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (4, '2024年java常见笔试面试题汇总(附答案)', '2024-05-10 23:01:14', 6, 1, 5, '2024年java常见笔试面试题汇总(附答案)\n', '<p>2024年java常见笔试面试题汇总(附答案)</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-01-13 19:49:35', 1, 28, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (5, '常用日期函数', '2024-05-10 23:01:36', 6, 2, 5, '常用日期函数\n', '<p>常用日期函数</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-16 11:25:29', 1, 15, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (6, '王二暖Oracle视频教程 下载', '2024-05-10 23:02:24', 6, 2, 3, '王二暖Oracle视频教程 下载\n', '<p>王二暖Oracle视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 22, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (7, 'Mysql从入门到精通视频教程（共29集）下载', '2024-05-10 23:02:56', 6, 2, 5, 'Mysql从入门到精通视频教程（共29集）下载\n', '<p>Mysql从入门到精通视频教程（共29集）下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-16 16:42:42', 1, 30, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (8, 'Postgresql数据库优化视频教程 下载', '2024-05-10 23:03:13', 6, 2, 5, 'Postgresql数据库优化视频教程 下载\n', '<p>Postgresql数据库优化视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-01-13 19:49:25', 1, 21, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (9, 'Oracle Rachel操作手册', '2024-05-10 23:03:46', 6, 2, 4, 'Oracle Rachel操作手册\n', '<p>Oracle Rachel操作手册</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-20 19:33:38', 1, 5, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (10, 'mysql高级mycat集群视频&redis视频视频教程 下载', '2024-05-10 23:04:06', 6, 2, 3, 'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n', '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-22 09:49:35', 1, 11, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (11, '50份优秀Java求职者简历', '2024-05-10 23:04:53', 7, 1, 4, '50份优秀Java求职者简历\n', '<p>50份优秀Java求职者简历</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 29, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (12, '高级架构师进阶24天视频教程', '2024-05-10 23:05:07', 7, 1, 4, '高级架构师进阶24天视频教程\n', '<p>高级架构师进阶24天视频教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 31, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (13, '从零开始学java', '2024-05-10 23:05:19', 7, 1, 5, '从零开始学java\n', '<p>从零开始学java</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 43, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (14, '刘道成MySQL系列教程', '2024-05-10 23:05:34', 7, 2, 4, '刘道成MySQL系列教程\n', '<p>刘道成MySQL系列教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 33, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (15, 'mybatis教程pdf合集', '2024-05-10 23:05:51', 7, 2, 3, 'mybatis教程pdf合集\n', '<p>mybatis教程pdf合集</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (16, '黑马JavaEE 57期', '2024-05-10 23:06:15', 7, 2, 4, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 39, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (17, 'SSM整合案例【企业权限管理系统】视频教程', '2024-05-10 23:06:30', 7, 4, 4, 'SSM整合案例【企业权限管理系统】视频教程\n', '<p><a href=\"http://download.java1234.com/article/1942\" target=\"_blank\" title=\"SSM整合案例【企业权限管理系统】视频教程\">SSM整合案例【企业权限管理系统】视频教程</a></p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 55, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (18, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-05-10 23:07:29', 7, 3, 2, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视\n', '<p>Vue2.0+Node.js+MongoDB全栈打造商城系统视</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (19, 'Vue项目实战教程', '2024-05-10 23:07:42', 7, 3, 5, 'Vue项目实战教程\n', '<p>Vue项目实战教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 53, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (20, 'MUI全接触', '2024-01-10 23:07:55', 7, 3, 7, 'MUI全接触\n', '<p>MUI全接触</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-22 09:46:30', 1, 125, '');
INSERT INTO `t_article` VALUES (21, 'web打印分页设置', '2024-01-10 23:12:11', 8, 3, 5, 'web打印分页设置\n', '<p><a href=\"http://download.java1234.com/article/1845\" target=\"_blank\" title=\"web打印分页设置\">web打印分页设置</a></p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-20 19:32:25', 1, 8, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (22, 'Web前端技术', '2024-01-17 22:49:01', 6, 3, 4, 'Web前端技术Web前端技术\n&nbsp;\n', '<p>Web前端技术Web前端技术</p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240117224856.jpg\" style=\"height:457px; width:700px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240118141517.jpg\" style=\"height:62px; width:700px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-20 20:48:12', 1, 221, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (23, 'Java技术全解', '2024-05-12 11:31:29', 14, 1, 1, '本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。&nbsp;\n', '<p>本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。&nbsp;</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-20 20:58:29', 1, 38, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (24, 'MySQL数据库', '2024-05-12 11:31:52', 14, 2, 6, '本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。', '<p>本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-20 19:32:21', 1, 6, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (25, 'SQLServer数据库', '2024-05-16 17:08:35', 14, 2, 4, '数据库\n', '<p><img alt=\"\" src=\"/static/images/articleImage/20240516170806.jpg\" />数据库</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-22 13:10:45', 1, 15, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (26, 'Java基础入门', '2024-05-22 08:00:00', 6, 1, 5, 'Java基础知识概览', 'Java基础入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 19, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (27, 'Java高级编程', '2024-05-22 09:00:00', 7, 1, 8, '深入了解Java高级特性', 'Java高级编程内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 12, '');
INSERT INTO `t_article` VALUES (28, 'Java并发编程', '2024-05-22 10:00:00', 8, 1, 7, '学习Java并发编程', 'Java并发编程内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 29, '');
INSERT INTO `t_article` VALUES (29, 'Java设计模式', '2024-05-22 11:00:00', 9, 1, 6, '深入理解常用的Java设计模式', 'Java设计模式内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 15, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (30, 'Spring框架入门', '2024-05-22 12:00:00', 10, 5, 7, '学习Spring框架的基础知识', 'Spring框架入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 22, '');
INSERT INTO `t_article` VALUES (31, 'Hibernate框架入门', '2024-05-23 10:00:00', 14, 5, 7, '学习Hibernate框架的基础知识', 'Hibernate框架入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 30, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (32, 'Spring Boot入门', '2024-05-23 11:00:00', 14, 5, 7, '学习Spring Boot的基础知识', 'Spring Boot入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 3, '链接失效', '2024-05-20 18:21:57', 1, 21, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (33, 'java编程思想', '2024-01-10 22:58:56', 14, 1, 2, 'java编程思想\n', '<p><a href=\"http://localhost:8080/article/23\" title=\"java编程思想\">java编程思想</a></p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 3, '链接失效', '2024-01-17 21:42:54', 1, 5, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (34, '数据结构与算法分析', '2024-12-15 14:30:00', 15, 1, 2, '拳皇版超级玛丽13可执行文件\n', '<p>拳皇版超级玛丽13可执行文件</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 23, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (35, 'Python编程', '2024-01-02 10:00:00', 18, 2, 3, '2020年java常见笔试面试题汇总(附答案)\n', '<p>2020年java常见笔试面试题汇总(附答案)</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 29, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (36, '机器学习实战', '2024-05-20 09:15:00', 13, 3, 4, '常用日期函数\n', '<p>常用日期函数</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 31, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (37, '深度学习入门', '2024-06-05 16:45:00', 11, 3, 4, '王二暖Oracle视频教程 下载\n', '<p>王二暖Oracle视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (38, 'Java编程实践', '2024-05-01 08:30:00', 13, 1, 2, 'Postgresql数据库优化视频教程 下载\n', '<p>Postgresql数据库优化视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (39, '数据挖掘基础', '2024-03-29 15:55:00', 13, 3, 4, 'Oracle Rachel操作手册\n', '<p>Oracle Rachel操作手册</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 39, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (40, '计算机网络原理', '2024-02-14 17:10:00', 13, 1, 2, 'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n', '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 55, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (41, '编程艺术', '2024-01-03 11:20:00', 17, 1, 4, '高级架构师进阶24天视频教程\n', '<p>高级架构师进阶24天视频教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 53, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (42, '操作系统导论', '2024-05-14 13:25:00', 16, 7, 2, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 38, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (43, 'JavaEE Overview', '2024-05-01 10:00:00', 1, 4, NULL, 'An overview of JavaEE', 'Detailed content about JavaEE overview.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc123', 0, 2, NULL, '2024-05-01 12:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (44, 'JavaEE Servlets', '2024-05-02 11:00:00', 1, 4, 4, 'Introduction to JavaEE Servlets', 'Detailed content about JavaEE Servlets.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'def456', 1, 2, NULL, '2024-05-02 13:00:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (45, 'JavaEE JSP', '2024-05-03 12:00:00', 2, 4, 4, 'Understanding JSP in JavaEE', 'Detailed content about JSP in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'ghi789', 1, 2, NULL, '2024-05-03 14:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (46, 'JavaEE EJB', '2024-05-04 13:00:00', 2, 4, 5, 'Enterprise JavaBeans in JavaEE', 'Detailed content about EJB in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'jkl012', 1, 2, NULL, '2024-05-04 15:00:00', 1, 250, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (47, 'JavaEE JPA', '2024-05-05 14:00:00', 3, 4, 5, 'Java Persistence API in JavaEE', 'Detailed content about JPA in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'mno345', 1, 2, NULL, '2024-05-05 16:00:00', 1, 300, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (48, 'JavaEE CDI', '2024-05-06 15:00:00', 3, 4, 3, 'Contexts and Dependency Injection in JavaEE', 'Detailed content about CDI in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'pqr678', 1, 2, NULL, '2024-05-06 17:00:00', 1, 350, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (49, 'JavaEE JAX-RS', '2024-05-07 16:00:00', 4, 4, 5, 'Java API for RESTful Web Services in JavaEE', 'Detailed content about JAX-RS in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'stu901', 1, 2, NULL, '2024-05-07 18:00:00', 1, 400, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (50, 'JavaEE JMS', '2024-05-08 17:00:00', 4, 4, 5, 'Java Message Service in JavaEE', 'Detailed content about JMS in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'vwx234', 1, 2, NULL, '2024-05-08 19:00:00', 1, 450, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (51, 'JavaEE Security', '2024-05-09 18:00:00', 5, 4, 4, 'Security in JavaEE Applications', 'Detailed content about security in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'yz567', 1, 2, NULL, '2024-05-09 20:00:00', 1, 500, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (52, 'JavaEE Testing', '2024-05-10 19:00:00', 5, 4, 3, 'Testing JavaEE Applications', 'Detailed content about testing in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc890', 1, 2, NULL, '2024-05-10 21:00:00', 1, 550, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (53, 'Introduction to SQL', '2024-05-01 10:00:00', 1, 2, 4, 'Introduction to SQL for beginners', 'Detailed content about SQL.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc123', 0, 2, NULL, '2024-05-01 12:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (54, 'Advanced SQL Queries', '2024-05-02 11:00:00', 1, 2, 4, 'Advanced SQL query techniques', 'Detailed content about advanced SQL queries.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'def456', 1, 2, NULL, '2024-05-02 13:00:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (55, 'Database Normalization', '2024-05-03 12:00:00', 2, 2, 5, 'Understanding database normalization', 'Detailed content about database normalization.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'ghi789', 1, 2, NULL, '2024-05-03 14:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (56, 'Indexing in Databases', '2024-05-04 13:00:00', 2, 2, 4, 'How to use indexing in databases', 'Detailed content about indexing.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'jkl012', 1, 2, NULL, '2024-05-04 15:00:00', 1, 250, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (57, 'Database Transactions', '2024-05-05 14:00:00', 3, 2, 3, 'Understanding database transactions', 'Detailed content about transactions.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'mno345', 1, 2, NULL, '2024-05-05 16:00:00', 0, 300, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (58, 'NoSQL Databases', '2024-05-06 15:00:00', 3, 2, 4, 'Introduction to NoSQL databases', 'Detailed content about NoSQL.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'pqr678', 1, 2, NULL, '2024-05-06 17:00:00', 1, 350, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (59, 'Database Security', '2024-05-07 16:00:00', 4, 2, 4, 'Best practices for database security', 'Detailed content about database security.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'stu901', 1, 2, NULL, '2024-05-07 18:00:00', 1, 400, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (60, 'Data Warehousing', '2024-05-08 17:00:00', 4, 2, 2, 'Introduction to data warehousing', 'Detailed content about data warehousing.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'vwx234', 1, 2, NULL, '2024-05-08 19:00:00', 1, 450, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (61, 'Database Backup and Recovery', '2024-05-09 18:00:00', 5, 2, 5, 'Techniques for database backup and recovery', 'Detailed content about backup and recovery.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'yz567', 1, 2, NULL, '2024-05-09 20:00:00', 1, 500, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (62, 'Optimizing Database Performance', '2024-05-10 19:00:00', 5, 2, 7, 'Tips for optimizing database performance', 'Detailed content about performance optimization.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc890', 1, 2, NULL, '2024-05-10 21:00:00', 1, 550, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (63, '前端开发入门指南', '2024-05-24 10:00:00', 1, 3, 5, '本指南适合初学者入门', '这是一篇关于前端开发入门的指南。', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (64, 'JavaScript高级编程技巧', '2024-05-25 11:30:00', 2, 3, 4, '深入探讨JavaScript高级特性', '本文介绍了一些JavaScript高级编程技巧。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (65, 'Vue.js实战教程', '2024-05-26 09:45:00', 3, 3, 1, '学习Vue.js的最佳实践', '本教程详细介绍了Vue.js的实战应用。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (66, 'React入门指南(一)', '2024-05-27 14:20:00', 4, 3, 6, '适合新手学习React的入门指南', '这是一份React入门指南，适合初学者阅读。', 'https://pan.baidu.com/s/xyz', '1234', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, '');
INSERT INTO `t_article` VALUES (67, 'CSS布局技巧', '2024-05-28 16:00:00', 5, 3, 4, '学习实用的CSS布局技巧', '本文介绍了一些实用的CSS布局技巧，适合前端开发者阅读。', 'https://pan.baidu.com/s/abc', 'security', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (68, 'Web前端性能优化指南', '2024-05-29 09:00:00', 6, 3, 5, '提升网页性能的最佳实践', '本指南总结了一些Web前端性能优化的方法。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (69, 'Angular框架入门教程', '2024-05-30 13:45:00', 7, 3, 8, '学习Angular框架的基础知识', '本教程适合初学者学习Angular框架。', 'https://pan.baidu.com/s/ghi', '123456', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, '');
INSERT INTO `t_article` VALUES (70, '前端安全指南', '2024-05-31 10:30:00', 8, 3, 7, '保护Web应用的安全性', '本指南介绍了一些保护Web应用安全的方法。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 0, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (71, 'TypeScript入门教程', '2024-06-01 12:15:00', 9, 3, 6, '学习TypeScript的基础知识', '本教程适合初学者学习TypeScript。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, '');
INSERT INTO `t_article` VALUES (72, '前端框架选型指南', '2024-06-02 15:20:00', 10, 3, 7, '选择适合项目的前端框架', '本指南帮助你选择适合项目的前端框架。', 'https://pan.baidu.com/s/pqr', '123456', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (73, '微服务架构设计原则', '2024-05-24 10:00:00', 1, 5, 7, '介绍微服务架构设计的基本原则', '本文详细介绍了微服务架构设计的一些基本原则和最佳实践。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 0, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (74, 'Spring Cloud入门指南', '2024-05-25 11:30:00', 2, 5, 7, '学习使用Spring Cloud构建分布式微服务应用', '本指南适合初学者学习如何使用Spring Cloud构建分布式微服务应用。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (75, '分布式系统中的数据一致性问题', '2024-05-26 09:45:00', 3, 5, 2, '探讨分布式系统中的数据一致性保障方法', '本文分析了分布式系统中常见的数据一致性问题，并介绍了一些解决方案。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (76, 'Docker容器化技术在微服务中的应用', '2024-05-27 14:20:00', 4, 5, 2, '使用Docker容器化技术部署和管理微服务应用', '本文介绍了如何使用Docker容器化技术来构建、部署和管理微服务应用。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (77, '服务发现与注册技术在微服务中的应用', '2024-05-28 16:00:00', 5, 5, 3, '介绍服务发现与注册技术在微服务架构中的重要性和应用', '本文详细介绍了服务发现与注册技术在微服务架构中的原理、实现方式以及应用场景。', 'https://pan.baidu.com/s/abc', '123456', 0, 2, NULL, '2024-05-29 16:00:00', 0, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (78, '分布式系统中的负载均衡策略', '2024-05-29 09:00:00', 6, 5, 4, '探讨分布式系统中常见的负载均衡策略', '本文分析了分布式系统中常用的负载均衡策略，并比较了它们的优缺点。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (79, '容错与故障恢复在分布式系统中的应用', '2024-05-30 13:45:00', 7, 5, 4, '介绍在分布式系统中实现容错与故障恢复的方法和技术', '本文介绍了在分布式系统中实现容错与故障恢复的一些常见方法和技术。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (80, '微服务安全架构设计指南', '2024-05-31 10:30:00', 8, 5, 2, '保障微服务架构的安全性', '本指南介绍了如何设计和实现安全的微服务架构，以保障系统的安全性。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (81, '微服务性能调优指南', '2024-06-01 12:15:00', 9, 5, 4, '优化微服务架构的性能', '本指南总结了一些优化微服务架构性能的常用方法和技巧。', 'https://pan.baidu.com/s/mno', 'abcdef', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (82, '微服务与容器编排技术选型指南', '2024-06-02 15:20:00', 10, 5, 2, '选择适合项目的微服务与容器编排技术', '本指南帮助你选择适合项目的微服务与容器编排技术，并提供了选型指南。', 'https://pan.baidu.com/s/pqr', 'abcdef', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (83, 'Flutter入门指南', '2024-05-24 10:00:00', 1, 6, 4, '学习使用Flutter构建跨平台移动应用', '本指南适合初学者学习如何使用Flutter构建跨平台移动应用。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (84, 'React Native实战教程', '2024-05-25 11:30:00', 2, 6, 2, '学习使用React Native开发移动应用的实战教程', '本教程详细介绍了如何使用React Native开发移动应用的实践经验。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (85, 'iOS应用开发入门指南', '2024-05-26 09:45:00', 3, 6, NULL, '适合新手学习iOS应用开发的入门指南', '本指南适合初学者学习如何使用Swift或Objective-C开发iOS应用。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (86, 'Android应用开发入门指南', '2024-05-27 14:20:00', 4, 6, NULL, '适合新手学习Android应用开发的入门指南', '本指南适合初学者学习如何使用Java或Kotlin开发Android应用。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-28 14:20:00', 0, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (87, '移动UI设计入门教程', '2024-05-28 16:00:00', 5, 6, NULL, '学习移动应用UI设计的基础知识', '本教程介绍了移动应用UI设计的基本原理和常见实践。', 'https://pan.baidu.com/s/abc', '1234', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (88, '移动应用性能优化指南', '2024-05-29 09:00:00', 6, 6, NULL, '提升移动应用性能的最佳实践', '本指南总结了一些提升移动应用性能的常用方法和技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (89, '移动应用安全架构设计指南', '2024-05-30 13:45:00', 7, 6, NULL, '保障移动应用架构的安全性', '本指南介绍了如何设计和实现安全的移动应用架构，以保障系统的安全性。', 'https://pan.baidu.com/s/ghi', '1234', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (90, '移动应用测试实践指南', '2024-05-31 10:30:00', 8, 6, NULL, '介绍移动应用测试的常用方法和技巧', '本指南详细介绍了移动应用测试的各种方法和实践经验。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (91, '移动应用用户体验设计指南', '2024-06-01 12:15:00', 9, 6, NULL, '优化移动应用用户体验的最佳实践', '本指南总结了一些优化移动应用用户体验的常用方法和技巧。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (92, '跨平台移动应用开发选型指南', '2024-06-02 15:20:00', 10, 6, NULL, '选择适合项目的跨平台移动应用开发技术', '本指南帮助你选择适合项目的跨平台移动应用开发技术，并提供了选型指南。', 'https://pan.baidu.com/s/pqr', '1234', 0, 2, NULL, '2024-05-24 17:46:13', 1, 86, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (93, 'Python基础教程', '2024-05-24 10:00:00', 1, 7, NULL, '适合初学者的Python基础教程', '本教程详细介绍了Python的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 0, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (94, 'Python进阶指南', '2024-05-25 11:30:00', 2, 7, NULL, '深入学习Python进阶知识和技巧', '本指南介绍了Python的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (95, 'Python数据分析入门', '2024-05-26 09:45:00', 3, 7, NULL, '学习使用Python进行数据分析的基础知识', '本指南介绍了使用Python进行数据分析的基本原理和常用工具，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (96, 'Python网络爬虫实战', '2024-05-27 14:20:00', 4, 7, NULL, '学习使用Python实战开发网络爬虫', '本教程介绍了使用Python开发网络爬虫的实践经验和技巧，适合对网络爬虫感兴趣的开发者阅读。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (97, 'Python人工智能入门', '2024-05-28 16:00:00', 5, 7, NULL, '学习使用Python进行人工智能开发的基础知识', '本指南介绍了使用Python进行人工智能开发的基本原理和常用工具，适合初学者入门。', 'https://pan.baidu.com/s/abc', 'pqr678', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (98, 'Python机器学习实战', '2024-05-29 09:00:00', 6, 7, NULL, '学习使用Python实战开发机器学习应用', '本教程介绍了使用Python进行机器学习开发的实践经验和技巧，适合对机器学习感兴趣的开发者阅读。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (99, 'Python自然语言处理入门', '2024-05-30 13:45:00', 7, 7, NULL, '学习使用Python进行自然语言处理的基础知识', '本指南介绍了使用Python进行自然语言处理的基本原理和常用工具，适合初学者入门。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (100, 'Python Web开发入门', '2024-05-31 10:30:00', 8, 7, 4, '学习使用Python进行Web开发的基础知识', '本指南介绍了使用Python进行Web开发的基本原理和常用框架，适合初学者入门。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (101, 'Python游戏开发入门', '2024-06-01 12:15:00', 9, 7, NULL, '学习使用Python进行游戏开发的基础知识', '本指南介绍了使用Python进行游戏开发的基本原理和常用库，适合初学者入门。', 'https://pan.baidu.com/s/mno', 'security', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (102, 'Python开发工具与环境配置指南', '2024-06-02 15:20:00', 10, 7, NULL, '介绍Python开发常用工具和环境配置方法', '本指南介绍了Python开发常用的编辑器、调试器和环境配置方法，适合开发者参考。', 'https://pan.baidu.com/s/pqr', '1234', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (103, '数据库设计基础教程', '2024-05-24 10:00:00', 1, 2, NULL, '适合初学者的数据库设计基础教程', '本教程详细介绍了数据库设计的基本原理和常用技巧，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (104, 'SQL基础教程', '2024-05-25 11:30:00', 2, 2, 3, '学习SQL语言基础知识和常用操作', '本教程介绍了SQL语言的基本语法和常见操作，适合初学者入门。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (105, '关系型数据库管理系统入门', '2024-05-26 09:45:00', 3, 2, 2, '学习关系型数据库管理系统的基础知识', '本指南介绍了关系型数据库管理系统的基本原理、常见操作和管理技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (106, '数据库优化与性能调优指南', '2024-05-28 16:00:00', 5, 2, 2, '学习数据库优化和性能调优的方法和技巧', '本指南介绍了数据库优化和性能调优的常见方法和技巧，适合数据库管理员和开发者参考。', 'https://pan.baidu.com/s/abc', 'abcdef', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (107, 'Spring Data JPA实战指南', '2024-05-29 09:00:00', 6, 8, 4, '学习Spring Data JPA的实战经验和技巧', '本指南介绍了Spring Data JPA的实际项目开发经验、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 0, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (108, '数据库与大数据技术融合实践', '2024-06-02 15:20:00', 10, 2, 7, '学习数据库与大数据技术融合的实践方法', '本指南介绍了数据库与大数据技术融合的实际应用场景和操作方法，适合数据工程师和开发人员参考。', 'https://pan.baidu.com/s/pqr', 'abcdef', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, '');
INSERT INTO `t_article` VALUES (109, 'Java基础教程', '2024-05-24 10:00:00', 1, 1, NULL, '适合初学者的Java基础教程', '本教程详细介绍了Java的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 1, 2, NULL, '2024-05-24 18:17:15', 1, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (110, 'Java进阶指南', '2024-05-25 11:30:00', 2, 1, 1, '深入学习Java进阶知识和技巧', '本指南介绍了Java的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (111, 'Java面向对象编程入门', '2024-05-26 09:45:00', 3, 1, NULL, '学习Java面向对象编程的基础知识', '本指南介绍了Java面向对象编程的基本原理和常用技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (112, 'Java集合框架详解', '2024-05-27 14:20:00', 4, 1, 2, '学习Java集合框架的基本用法和常见操作', '本指南介绍了Java集合框架的基本概念、常见类型和使用方法，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'security', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (113, 'Java并发编程实战', '2024-05-28 16:00:00', 5, 1, 5, '学习Java并发编程的实践经验和技巧', '本指南介绍了Java并发编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'abcdef', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (114, 'Java网络编程入门', '2024-05-29 09:00:00', 6, 1, 4, '学习Java网络编程的基础知识和实践经验', '本指南介绍了Java网络编程的基本原理、常用技术和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (115, 'Java图形用户界面开发指南', '2024-05-30 13:45:00', 7, 1, 7, '学习Java图形用户界面开发的基础知识和实践经验', '本指南介绍了Java图形用户界面开发的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-24 18:34:51', 1, 114, '');
INSERT INTO `t_article` VALUES (116, 'Java框架与工具介绍', '2024-05-31 10:30:00', 8, 1, 10, '了解Java常用框架和开发工具', '本指南介绍了Java常用框架（如Spring、Hibernate等）和开发工具（如IDE、构建工具等），适合开发者了解。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (117, 'Java服务器端开发实战', '2024-06-01 12:15:00', 9, 1, 4, '学习Java服务器端开发的实践经验和技巧', '本指南介绍了Java服务器端开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/mno', '123456', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (118, 'Java项目管理与团队协作指南', '2024-06-02 15:20:00', 10, 1, NULL, '学习Java项目管理和团队协作的方法和工具', '本指南介绍了Java项目管理和团队协作的常用方法、工具和实践经验，适合开发团队参考。', 'https://pan.baidu.com/s/pqr', 'security', 0, 2, NULL, '2024-05-24 17:46:18', 1, 86, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (119, 'JavaEE基础教程', '2024-05-24 10:00:00', 1, 4, 4, '适合初学者的JavaEE基础教程', '本教程详细介绍了JavaEE的基本概念、体系结构和常用组件，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (120, 'JavaEE Web开发指南', '2024-05-25 11:30:00', 2, 4, 3, '学习JavaEE Web应用开发的基础知识和实践经验', '本指南介绍了JavaEE Web应用开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (121, 'JavaEE企业应用开发实战', '2024-05-26 09:45:00', 3, 4, 7, '学习JavaEE企业应用开发的实践经验和技巧', '本指南介绍了JavaEE企业应用开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 0, 150, '');
INSERT INTO `t_article` VALUES (122, 'JavaEE数据库编程指南', '2024-05-27 14:20:00', 4, 4, 10, '学习JavaEE数据库编程的基础知识和实践经验', '本指南介绍了JavaEE数据库编程的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (123, 'JavaEE安全开发实践', '2024-05-28 16:00:00', 5, 4, 5, '学习JavaEE安全开发的实践经验和技巧', '本指南介绍了JavaEE安全开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'password', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (124, 'JavaEE微服务架构实践', '2024-05-29 09:00:00', 6, 4, 6, '学习JavaEE微服务架构的实践经验和技巧', '本指南介绍了JavaEE微服务架构的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, '');
INSERT INTO `t_article` VALUES (125, 'JavaEE消息队列应用指南', '2024-05-30 13:45:00', 7, 4, NULL, '学习JavaEE消息队列应用的基础知识和实践经验', '本指南介绍了JavaEE消息队列应用的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (126, 'JavaEE缓存技术应用指南', '2024-05-31 10:30:00', 8, 4, 3, '学习JavaEE缓存技术的基础知识和实践经验', '本指南介绍了JavaEE缓存技术的基本原理、常用技术和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (127, 'JavaEE监控与管理实践指南', '2024-06-01 12:15:00', 9, 4, NULL, '学习JavaEE监控与管理的实践经验和技巧', '本指南介绍了JavaEE监控与管理的基本原理、常用技术和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (128, 'JavaEE性能优化实践指南', '2024-06-02 15:20:00', 10, 4, NULL, '学习JavaEE性能优化的实践经验和技巧', '本指南介绍了JavaEE性能优化的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (129, 'Java技术入门指南', '2024-05-24 10:00:00', 11, 1, 5, 'Java初学者的入门指南', '介绍Java基础知识和常用功能，适合初学者阅读。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (130, '分布式微服务架构设计', '2024-05-28 16:00:00', 15, 5, 1, '分布式微服务架构设计的基本原理', '介绍分布式微服务架构设计的基本概念、优势和实践经验。', 'https://pan.baidu.com/s/abc', 'security', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (131, '移动APP界面设计指南(一)', '2024-05-29 09:00:00', 16, 6, 5, '移动APP界面设计的基本原则和实践技巧', '介绍移动APP界面设计的基本原则、常用工具和实践技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (132, 'Java多线程编程指南', '2024-05-31 10:30:00', 18, 1, 3, 'Java多线程编程的基本原理和实践技巧', '介绍Java多线程编程的基本原理、常见问题和解决方案。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-24 18:34:49', 1, 145, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (133, 'Java网络编程实战', '2024-06-04 09:00:00', 13, 4, 5, 'Java网络编程的实际应用案例', '介绍Java网络编程在实际项目开发中的应用场景和操作方法。', 'https://pan.baidu.com/s/stu', 'security', 0, 2, NULL, '2024-06-05 09:00:00', 1, 75, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (134, '数据库技术概述', '2024-05-25 11:30:00', 12, 2, 2, '数据库技术的基本概念和发展历程', '介绍数据库的基本概念、分类和应用领域，适合初学者了解。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (135, 'Web前端开发实践', '2024-05-26 09:45:00', 13, 3, 5, 'Web前端开发的实际操作和技巧', '介绍Web前端开发的基本原理、常用技术和实际操作，适合开发者学习。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 0, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (136, '移动APP界面设计指南(二)', '2024-05-29 09:00:00', 16, 6, 4, '移动APP界面设计的基本原则和实践技巧', '介绍移动APP界面设计的基本原则、常用工具和实践技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (137, 'Python数据分析实战', '2024-05-30 13:45:00', 17, 7, 2, 'Python数据分析的实际应用案例', '介绍使用Python进行数据分析的常见方法、工具和实践经验。', 'https://pan.baidu.com/s/ghi', '123456', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (138, '数据库管理与优化实践', '2024-06-01 12:15:00', 11, 2, 2, '数据库管理与性能优化的实践经验', '介绍数据库管理与性能优化的常用方法和实践技巧。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (139, 'JavaEE高级技术应用', '2024-05-27 14:20:00', 14, 4, 5, 'JavaEE高级技术的实践应用', '介绍JavaEE高级技术如消息队列、缓存等的应用场景和操作方法。', 'https://pan.baidu.com/s/xyz', 'security', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (140, '移动APP界面设计指南(三)', '2024-05-29 09:00:00', 16, 6, 6, '移动APP界面设计的基本原则和实践技巧', '介绍移动APP界面设计的基本原则、常用工具和实践技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, '');
INSERT INTO `t_article` VALUES (141, '前端框架与组件应用', '2024-06-02 15:20:00', 12, 3, 2, '前端框架与组件在实际项目中的应用', '介绍前端框架与组件在实际项目开发中的应用场景和操作方法。', 'https://pan.baidu.com/s/pqr', 'security', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (142, '微服务架构设计与实现', '2024-06-04 13:45:00', 14, 5, 4, '微服务架构设计与实现的基本原理', '介绍微服务架构设计与实现的基本概念、优势和实践经验。', 'https://pan.baidu.com/s/vwx', 'password', 0, 2, NULL, '2024-05-24 18:12:38', 1, 67, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (143, 'Java并发编程高级技巧', '2024-05-25 11:30:00', 12, 1, 2, '探讨Java并发编程中的高级应用场景和技巧', '本文介绍了Java并发编程的高级技巧和常见问题解决方案，适合有一定经验的开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (144, 'Node.js基础教程', '2024-05-29 09:00:00', 16, 8, 4, '适合初学者的Node.js基础教程', '本教程详细介绍了Node.js的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (145, '数据库安全防护指南', '2024-05-29 09:00:00', 8, 2, 1, '保障数据库系统的安全性', '本文介绍了如何设计和实施安全的数据库系统，以保障数据的安全性和完整性。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (146, '数据仓库设计与实践指南', '2024-05-30 13:45:00', 9, 2, 8, '介绍数据仓库设计的基本原理和实践经验', '本文介绍了数据仓库设计的基本概念、架构和实践经验，适合数据工程师和分析师学习。', 'https://pan.baidu.com/s/ghi', 'security', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (147, '数据库迁移与同步实践指南', '2024-06-01 12:15:00', 11, 2, 5, '介绍数据库迁移与同步的实践方法和工具', '本文详细介绍了数据库迁移与同步的实际操作步骤和常用工具，适合数据库管理员和开发人员参考。', 'https://pan.baidu.com/s/mno', 'abcdef', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (148, '前端性能优化实践指南', '2024-05-29 09:00:00', 18, 3, 5, '介绍前端性能优化的常见方法和实践技巧', '本文详细介绍了前端性能优化的常用方法和实践经验，涵盖了页面加载优化、资源压缩等方面，适合前端开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (149, '前端安全防护指南', '2024-05-30 13:45:00', 1, 3, 4, '保障前端应用的安全性和可靠性', '本文介绍了前端开发中常见的安全漏洞和攻击手法，并提供了相应的防护策略和实践经验，适合前端开发者阅读。', 'https://pan.baidu.com/s/ghi', 'security', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (150, 'Web前端工程化实践指南', '2024-05-31 10:30:00', 2, 3, 4, '介绍Web前端工程化的基本原理和实践经验', '本文详细介绍了Web前端工程化的概念、工具和最佳实践，适合前端开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 0, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (151, 'Java网络框架实战', '2024-05-26 09:45:00', 13, 1, 4, '介绍常用的Java网络框架及其实战应用', '本文详细介绍了Java中常用的网络框架及其在实际项目中的应用场景，适合网络开发人员阅读。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (152, 'Java微服务架构设计与实践', '2024-05-28 16:00:00', 15, 1, 8, '深入探讨Java微服务架构的设计和实践', '本文介绍了Java微服务架构的设计原则、常用技术和实际项目经验，适合架构师和开发人员学习。', 'https://pan.baidu.com/s/abc', '1234', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (153, 'Java大数据处理技术', '2024-05-29 09:00:00', 16, 1, 4, '介绍Java在大数据处理方面的应用和技术', '本文介绍了Java在大数据处理领域的常见应用场景、技术选型和实践经验，适合数据工程师学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (154, 'Java图像处理技术', '2024-05-30 13:45:00', 17, 1, 5, '介绍Java图像处理库及其在实际项目中的应用', '本文详细介绍了Java图像处理的常用库、技术和实际应用场景，适合图像处理领域的开发人员阅读。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (155, '数据库索引优化技巧', '2024-05-24 10:00:00', 3, 2, 7, '介绍数据库索引优化的常见方法和技巧', '本文详细介绍了数据库索引优化的常用方法和实践经验，适合数据库管理员和开发人员学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, '');
INSERT INTO `t_article` VALUES (156, 'NoSQL数据库介绍与应用', '2024-05-27 14:20:00', 6, 2, 1, '介绍NoSQL数据库的基本概念和应用场景', '本文介绍了NoSQL数据库的基本原理、分类和应用场景，适合初学者了解。', 'https://pan.baidu.com/s/xyz', '1234', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (157, 'Spring Boot入门教程', '2024-05-29 09:00:00', 8, 8, 4, '学习Spring Boot框架的基础知识和实践经验', '本指南介绍了Spring Boot框架的基本原理、常用组件和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (158, '数据库性能优化实践指南', '2024-05-31 10:30:00', 10, 2, 2, '介绍数据库性能优化的实践方法和技巧', '本文详细介绍了数据库性能优化的常见方法和实践经验，适合数据库管理员和开发人员学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (159, 'Docker基础入门', '2024-05-29 09:00:00', 18, 8, 4, '学习Docker容器化技术的基础知识和实践经验', '本指南介绍了Docker容器化技术的基本原理、常用命令和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (160, '前端跨平台开发技术介绍', '2024-06-01 12:15:00', 3, 3, 2, '介绍前端跨平台开发的基本概念和实践技巧', '本文介绍了前端跨平台开发的常见技术和实现方法，包括React Native、Flutter等，适合前端开发者了解。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (161, 'Web前端趋势与展望', '2024-06-02 15:20:00', 4, 3, NULL, '探讨Web前端技术的发展趋势和未来展望', '本文分析了当前Web前端技术的发展状况和未来趋势，适合前端从业者了解行业动向。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (162, 'Angular实战教程', '2024-05-29 09:00:00', 16, 8, NULL, '学习Angular框架的实战经验和技巧', '本指南介绍了Angular框架的实际项目开发经验、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (163, 'Java面试题精选', '2024-05-31 10:30:00', 18, 1, NULL, '汇总常见的Java面试题及详细解答', '本文收集了常见的Java面试题，并提供了详细的解答和思路分析，适合求职者准备面试。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (164, 'Spring Cloud微服务架构实践', '2024-05-29 09:00:00', 8, 8, NULL, '学习Spring Cloud微服务架构的实践经验和技巧', '本指南介绍了Spring Cloud微服务架构的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 0, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (165, 'HTML5新特性详解', '2024-05-24 10:00:00', 13, 3, NULL, '介绍HTML5新特性及其在Web前端开发中的应用', '本文详细介绍了HTML5的新特性和改进，以及在Web前端开发中的实际应用场景，适合前端开发者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (166, 'CSS3动画效果实践指南', '2024-05-25 11:30:00', 14, 3, 6, '介绍CSS3动画效果的实际应用和实现技巧', '本文详细介绍了CSS3动画效果的常见应用场景、实现方法和实践经验，适合前端开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, '');
INSERT INTO `t_article` VALUES (167, 'Kubernetes实践指南', '2024-05-29 09:00:00', 18, 8, NULL, '学习Kubernetes容器编排的实践经验和技巧', '本指南介绍了Kubernetes容器编排的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (168, 'React入门指南(二)', '2024-05-29 09:00:00', 16, 8, NULL, '学习React框架的基础知识和实践经验', '本指南介绍了React框架的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (169, 'Java开源项目解析', '2024-06-01 12:15:00', 1, 1, NULL, '深入解析Java开源项目的源码和设计思路', '本文深入解析了常见的Java开源项目的源码结构、设计思路和实现细节，适合Java开发者学习。', 'https://pan.baidu.com/s/mno', 'security', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (170, 'Java程序员职业规划', '2024-06-02 15:20:00', 2, 1, NULL, '提供Java程序员的职业规划建议和发展路径', '本文介绍了Java程序员的职业规划和发展路径，包括技术提升、职业规划和个人发展，适合Java从业者参考。', 'https://pan.baidu.com/s/pqr', '123456', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (171, 'Spring Boot与Redis实践指南', '2024-05-29 09:00:00', 8, 8, 5, '学习Spring Boot与Redis的实践经验和技巧', '本指南介绍了Spring Boot与Redis的结合使用方法、常用功能和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (172, '数据库监控与性能调优实践', '2024-06-02 15:20:00', 12, 2, 4, '介绍数据库监控与性能调优的实践方法', '本文介绍了数据库监控与性能调优的常见方法和实际案例，适合数据库管理员和开发人员学习。', 'https://pan.baidu.com/s/pqr', '123456', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (173, '前端框架Vue.js入门与实践', '2024-05-27 14:20:00', 16, 3, 1, '学习Vue.js前端框架的基础知识和实践经验', '本文介绍了Vue.js前端框架的基本原理、常用功能和实际项目实践，适合前端开发者学习。', 'https://pan.baidu.com/s/xyz', 'security', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (174, 'React.js实战指南', '2024-05-28 16:00:00', 17, 3, 2, '介绍React.js前端框架的实践应用和开发技巧', '本文详细介绍了React.js前端框架的实际应用场景、开发技巧和最佳实践，适合前端开发者学习。', 'https://pan.baidu.com/s/abc', 'abcdef', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (175, 'Express.js实战指南', '2024-05-29 09:00:00', 18, 8, 2, '学习Express.js框架的实战经验和技巧', '本指南介绍了Express.js框架的实际项目开发经验、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (176, 'Java性能调优指南', '2024-05-27 14:20:00', 14, 1, 2, '介绍Java性能调优的常见方法和工具', '本文介绍了Java性能调优的基本原理、常用工具和实际操作经验，适合Java开发者阅读。', 'https://pan.baidu.com/s/xyz', '1234', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (177, 'JavaScript异步编程实践', '2024-05-29 09:00:00', 16, 8, 7, '学习JavaScript异步编程的实践经验和技巧', '本指南介绍了JavaScript异步编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, '');
INSERT INTO `t_article` VALUES (178, '数据库事务处理实践指南', '2024-05-25 11:30:00', 4, 2, 9, '介绍数据库事务处理的实践经验和技巧', '本文介绍了数据库事务处理的基本原理、ACID特性和实际应用场景，适合开发人员学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (179, '数据库备份与恢复实践指南', '2024-05-26 09:45:00', 5, 2, 2, '介绍数据库备份与恢复的实践方法', '本文详细介绍了数据库备份与恢复的实际操作步骤和常见问题解决方案，适合数据库管理员参考。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (180, 'Spring Security安全开发实践', '2024-05-29 09:00:00', 8, 8, 6, '学习Spring Security安全开发的实践经验和技巧', '本指南介绍了Spring Security安全开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, '');
INSERT INTO `t_article` VALUES (181, 'Java设计模式详解', '2024-05-24 10:00:00', 11, 1, NULL, '介绍常见的Java设计模式及应用场景', '本文深入讲解了Java中的设计模式，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 0, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (182, 'Vue.js前端开发指南', '2024-05-29 09:00:00', 16, 8, 7, '学习Vue.js框架的前端开发经验和技巧', '学习Vue.js框架的前端开发经验和技巧\', \'本指南介绍了Vue.js框架的前端开发实践、常见组件和实际案例，适合前端开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, '');
INSERT INTO `t_article` VALUES (183, 'Python基础入门教程', '2024-05-24 10:00:00', 17, 7, 2, '从零开始学习Python编程基础知识', '本文详细介绍了Python编程语言的基础语法、数据类型、流程控制等知识点，并通过实例演示帮助读者快速入门。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (184, 'Python高级编程技巧', '2024-05-25 11:30:00', 18, 7, 1, '深入学习Python编程的高级特性和技巧', '本文介绍了Python编程语言的高级特性、函数式编程和面向对象编程的技巧，以及常用的第三方库，适合有一定Python基础的读者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (185, 'Python网络爬虫实战指南', '2024-05-26 09:45:00', 1, 7, 6, '学习使用Python编写网络爬虫的实际操作方法', '本文详细介绍了使用Python编写网络爬虫的基本原理、常用库和实战经验，帮助读者快速上手爬虫开发。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, '');
INSERT INTO `t_article` VALUES (186, 'Python数据分析实践指南', '2024-05-27 14:20:00', 2, 7, 1, '介绍使用Python进行数据分析的常用工具和技巧', '本文介绍了Python数据分析常用的库、数据处理技巧和可视化方法，帮助读者快速掌握数据分析的基本流程。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (187, 'Python人工智能实践指南', '2024-05-28 16:00:00', 3, 7, 9, '介绍使用Python进行人工智能开发的常用方法和工具', '本文详细介绍了使用Python进行人工智能开发的基本原理、常用库和实践经验，适合有一定Python基础的读者学习。', 'https://pan.baidu.com/s/abc', 'abc890', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (188, 'Python Web开发实战指南', '2024-05-29 09:00:00', 4, 7, 3, '学习使用Python进行Web开发的实际操作方法', '本文详细介绍了使用Python进行Web开发的常用框架、开发流程和实战经验，适合想要学习Web开发的Python初学者。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (189, 'Python图像处理与计算机视觉实践', '2024-05-30 13:45:00', 5, 7, 4, '学习使用Python进行图像处理和计算机视觉的实际操作方法', '本文详细介绍了使用Python进行图像处理和计算机视觉的基本原理、常用库和实践经验，帮助读者快速掌握图像处理和计算机视觉的基本技能。', 'https://pan.baidu.com/s/ghi', '1234', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (190, 'Python自然语言处理实战指南', '2024-05-31 10:30:00', 6, 7, 1, '学习使用Python进行自然语言处理的实际操作方法', '本文详细介绍了使用Python进行自然语言处理的基本原理、常用库和实践经验，帮助读者快速上手自然语言处理开发。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (191, 'Python机器学习实战指南', '2024-06-01 12:15:00', 7, 7, 2, '学习使用Python进行机器学习的实际操作方法', '本文详细介绍了使用Python进行机器学习的基本原理、常用库和实践经验，适合有一定Python基础的读者学习。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (192, 'Python深度学习实战指南', '2024-06-02 15:20:00', 8, 7, 1, '学习使用Python进行深度学习的实际操作方法', '本文详细介绍了使用Python进行深度学习的基本原理、常用库和实践经验，适合有一定机器学习基础的读者学习。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (193, '移动APP开发趋势与展望', '2024-05-24 10:00:00', 7, 6, 2, '探讨移动APP开发技术的发展趋势和未来展望', '本文分析了当前移动APP开发技术的发展状况和未来趋势，涵盖了移动前端、后端服务、人工智能等方面，适合移动开发者了解行业动向。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (194, '移动APP设计与用户体验指南', '2024-05-25 11:30:00', 8, 6, 2, '介绍移动APP设计与用户体验的基本原则和实践方法', '本文详细介绍了移动APP设计的基本原则、用户体验规范和实践方法，适合移动开发者和设计师学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (195, '移动端跨平台开发技术选型', '2024-05-26 09:45:00', 9, 6, 1, '比较常见的移动端跨平台开发技术及其特点', '本文介绍了移动端跨平台开发技术的种类、特点和适用场景，并对比了它们的优缺点，适合移动开发者选择合适的技术方案。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (196, '移动APP前端框架选型', '2024-05-27 14:20:00', 10, 6, 2, '介绍移动APP前端框架的选择和比较', '本文详细介绍了移动APP前端开发中常用的框架，包括React Native、Flutter等，以及它们的优劣比较，适合移动开发者学习。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (197, '移动端原生开发技术解析', '2024-05-28 16:00:00', 11, 6, 5, '深入解析移动端原生开发技术及其应用场景', '本文介绍了移动端原生开发技术的基本原理、常用工具和实际应用场景，适合移动开发者学习。', 'https://pan.baidu.com/s/abc', '1234', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (198, '移动APP性能优化实践指南', '2024-05-29 09:00:00', 12, 6, 3, '介绍移动APP性能优化的常见方法和实践技巧', '本文详细介绍了移动APP性能优化的常用方法和实践经验，涵盖了界面渲染、网络请求、内存管理等方面，适合移动开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (199, '移动APP安全防护指南', '2024-05-30 13:45:00', 13, 6, 9, '保障移动APP的安全性和可靠性', '本文介绍了移动APP开发中常见的安全漏洞和攻击手法，并提供了相应的防护策略和实践经验，适合移动开发者阅读。', 'https://pan.baidu.com/s/ghi', 'security', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (200, '移动APP后端服务架构设计', '2024-05-31 10:30:00', 14, 6, 4, '介绍移动APP后端服务架构的设计原则和技术选型', '本文详细介绍了移动APP后端服务架构的设计原则、技术组成和实际应用经验，适合移动开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (201, '移动APP测试与发布流程', '2024-06-01 12:15:00', 15, 6, 7, '介绍移动APP测试和发布的流程和注意事项', '本文详细介绍了移动APP测试和发布的流程、常用工具和注意事项，帮助移动开发者更高效地进行测试和发布工作。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-06-02 12:15:00', 0, 95, '');
INSERT INTO `t_article` VALUES (202, '移动APP数据分析与用户行为监控', '2024-06-02 15:20:00', 16, 6, 2, '介绍移动APP数据分析和用户行为监控的方法和工具', '本文详细介绍了移动APP数据分析的方法、常用工具和用户行为监控技术，帮助移动开发者更好地了解用户需求和行为特征。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (203, '微服务架构设计原则与实践', '2024-05-24 10:00:00', 15, 5, 4, '介绍微服务架构设计的基本原则和实践经验', '本文详细介绍了微服务架构的设计原则、组件划分和实际应用经验，适合架构师和开发者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (204, '服务注册与发现技术详解', '2024-05-25 11:30:00', 16, 5, 1, '深入解析服务注册与发现技术及其实现方式', '本文介绍了微服务架构中的服务注册与发现的基本原理、常用工具和实现方式，适合微服务开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (205, '微服务通信协议比较', '2024-05-26 09:45:00', 17, 5, 5, '比较常见的微服务通信协议及其特点', '本文详细比较了微服务架构中常见的通信协议，包括HTTP、gRPC等，适合微服务开发者了解和选择。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (206, '微服务容器化部署实践指南', '2024-05-27 14:20:00', 18, 5, 4, '介绍微服务容器化部署的实践方法和工具', '本文详细介绍了微服务容器化部署的流程、工具和最佳实践，适合微服务开发者学习。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (207, '微服务监控与治理实践', '2024-05-28 16:00:00', 1, 5, NULL, '介绍微服务架构中的监控和治理方案', '本文介绍了微服务架构中常用的监控工具、治理策略和实践经验，适合微服务开发者学习。', 'https://pan.baidu.com/s/abc', 'password', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (208, '服务网格技术在微服务中的应用', '2024-05-29 09:00:00', 2, 5, NULL, '介绍服务网格技术在微服务架构中的应用场景', '本文详细介绍了服务网格技术的基本原理、实现方式和微服务中的应用场景，适合微服务架构师学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (209, '容器编排技术在微服务中的应用', '2024-05-30 13:45:00', 3, 5, 6, '介绍容器编排技术在微服务架构中的应用', '本文详细介绍了常见的容器编排技术，如Kubernetes、Docker Swarm等，在微服务架构中的实践应用，适合微服务开发者学习。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, '');
INSERT INTO `t_article` VALUES (210, '微服务架构中的安全防护', '2024-05-31 10:30:00', 4, 5, NULL, '介绍微服务架构中的安全防护措施和策略', '本文详细介绍了微服务架构中的常见安全威胁和相应的防护策略，适合微服务开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (211, '微服务架构中的数据管理与一致性', '2024-06-01 12:15:00', 5, 5, 7, '介绍微服务架构中的数据管理和一致性保障方法', '本文详细介绍了微服务架构中的数据管理技术和保障一致性的方法，适合微服务开发者学习。', 'https://pan.baidu.com/s/mno', 'password', 0, 2, NULL, '2024-05-02 12:15:00', 1, 95, '');
INSERT INTO `t_article` VALUES (212, 'Serverless架构在微服务中的应用', '2024-05-02 15:20:00', 6, 5, 10, '介绍Serverless架构在微服务中的实践应用', '本文详细介绍了Serverless架构的基本概念、优势以及在微服务架构中的应用场景和实践经验，适合微服务架构师和开发者学习。', 'https://pan.baidu.com/s/pqr', 'abcdef', 0, 2, NULL, '2024-05-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (213, 'C#基础教程', '2024-05-24 10:00:00', 1, 8, 1, '适合初学者的C#基础教程', '本教程详细介绍了C#的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (214, 'C#进阶指南', '2024-05-25 11:30:00', 2, 8, 2, '深入学习C#进阶知识和技巧', '本指南介绍了C#的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (215, 'C#面向对象编程入门', '2024-05-26 09:45:00', 3, 8, 2, '学习C#面向对象编程的基础知识', '本指南介绍了C#面向对象编程的基本原理和常用技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (216, 'C#图形用户界面开发指南', '2024-05-27 14:20:00', 4, 8, 7, '学习C#图形用户界面开发的基础知识和实践经验', '本指南介绍了C#图形用户界面开发的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, '');
INSERT INTO `t_article` VALUES (217, 'C#服务器端开发实战', '2024-05-28 16:00:00', 5, 8, 3, '学习C#服务器端开发的实践经验和技巧', '本指南介绍了C#服务器端开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'security', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (218, 'C#框架与工具介绍', '2024-05-29 09:00:00', 6, 8, 4, '了解C#常用框架和开发工具', '本指南介绍了C#常用框架（如.NET Framework、ASP.NET等）和开发工具（如Visual Studio、NuGet等），适合开发者了解。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (219, 'C#项目管理与团队协作指南', '2024-05-30 13:45:00', 7, 8, 6, '学习C#项目管理和团队协作的方法和工具', '本指南介绍了C#项目管理和团队协作的常用方法、工具和实践经验，适合开发团队参考。', 'https://pan.baidu.com/s/ghi', 'vwx234', 1, 2, NULL, '2024-05-31 13:45:00', 1, 110, '');
INSERT INTO `t_article` VALUES (220, 'Go语言基础教程', '2024-05-31 10:30:00', 8, 8, 5, '适合初学者的Go语言基础教程', '本教程详细介绍了Go语言的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (221, 'Go语言进阶指南', '2024-06-01 12:15:00', 9, 8, 4, '深入学习Go语言进阶知识和技巧', '本指南介绍了Go语言的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/mno', 'webperf', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (222, 'Go语言并发编程实战', '2024-06-02 15:20:00', 10, 8, 2, '学习Go语言并发编程的实践经验和技巧', '本指南介绍了Go语言并发编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/pqr', 'mno345', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (223, 'C++基础教程', '2024-05-24 10:00:00', 11, 8, 7, '适合初学者的C++基础教程', '本教程详细介绍了C++的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-25 10:00:00', 1, 100, '');
INSERT INTO `t_article` VALUES (224, 'C++进阶指南', '2024-05-25 11:30:00', 12, 8, 5, '深入学习C++进阶知识和技巧', '本指南介绍了C++的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-26 11:30:00', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (225, 'C++面向对象编程入门', '2024-05-26 09:45:00', 13, 8, 5, '学习C++面向对象编程的基础知识', '本指南介绍了C++面向对象编程的基本原理和常用技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-27 09:45:00', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (226, 'C++图形用户界面开发指南', '2024-05-27 14:20:00', 14, 8, 4, '学习C++图形用户界面开发的基础知识和实践经验', '本指南介绍了C++图形用户界面开发的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'yz567', 0, 2, NULL, '2024-05-28 14:20:00', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (227, 'C++服务器端开发实战', '2024-05-28 16:00:00', 15, 8, 4, '学习C++服务器端开发的实践经验和技巧', '本指南介绍了C++服务器端开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'ghi789', 0, 2, NULL, '2024-05-29 16:00:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (228, 'C++框架与工具介绍', '2024-05-29 09:00:00', 16, 8, 4, '了解C++常用框架和开发工具', '本指南介绍了C++常用框架（如Qt、Boost等）和开发工具（如Visual Studio、CMake等），适合开发者了解。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-30 09:00:00', 0, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (229, 'C++项目管理与团队协作指南', '2024-05-30 13:45:00', 17, 8, 5, '学习C++项目管理和团队协作的方法和工具', '本指南介绍了C++项目管理和团队协作的常用方法、工具和实践经验，适合开发团队参考。', 'https://pan.baidu.com/s/ghi', 'stu901', 1, 2, NULL, '2024-05-31 13:45:00', 0, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (230, 'Swift基础教程', '2024-05-31 10:30:00', 18, 8, 4, '适合初学者的Swift基础教程', '本教程详细介绍了Swift的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-06-01 10:30:00', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (231, 'Swift进阶指南', '2024-06-01 12:15:00', 1, 8, 3, '深入学习Swift进阶知识和技巧', '本指南介绍了Swift的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/mno', 'webperf', 0, 2, NULL, '2024-06-02 12:15:00', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (232, 'Swift并发编程实战', '2024-06-02 15:20:00', 2, 8, 2, '学习Swift并发编程的实践经验和技巧', '本指南介绍了Swift并发编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-06-03 15:20:00', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `sortNum` int NULL DEFAULT NULL COMMENT '排列顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article_type' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES (1, 'Java技术', 'Java技术', 1);
INSERT INTO `t_article_type` VALUES (2, '数据库技术', '数据库技术', 3);
INSERT INTO `t_article_type` VALUES (3, 'Web前端技术', 'Web前端技术', 4);
INSERT INTO `t_article_type` VALUES (4, 'JavaEE技术', 'JavaEE技术', 2);
INSERT INTO `t_article_type` VALUES (5, '分布式微服务技术', '分布式微服务技术', 5);
INSERT INTO `t_article_type` VALUES (6, '移动APP开发技术', '移动APP开发技术', 6);
INSERT INTO `t_article_type` VALUES (7, 'Python', 'Python', 7);
INSERT INTO `t_article_type` VALUES (8, '其它', '其他类型', 100);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int NULL DEFAULT NULL COMMENT '评论人id',
  `articleId` int NULL DEFAULT NULL COMMENT '被评论的文章id',
  `commentContent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `date` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `articleAuthorId` int NULL DEFAULT NULL COMMENT '资源作者id',
  `state` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `articleId`(`articleId` ASC) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_comment' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 6, 19, '非常有帮助', '2024-01-10 23:10:12', 7, 1);
INSERT INTO `t_comment` VALUES (2, 6, 19, '不错的文章', '2024-01-10 23:10:14', 7, 1);
INSERT INTO `t_comment` VALUES (3, 7, 6, '非常详细', '2024-01-10 23:10:50', 6, 1);
INSERT INTO `t_comment` VALUES (4, 6, 11, '信息量很大', '2024-01-11 22:34:39', 7, 1);
INSERT INTO `t_comment` VALUES (5, 6, 11, '值得阅读', '2024-01-17 20:32:18', 7, 2);
INSERT INTO `t_comment` VALUES (6, 1, 21, '有用', '2024-05-12 11:20:47', 6, 1);
INSERT INTO `t_comment` VALUES (7, 14, 21, '很好', '2024-05-12 11:22:19', 6, 1);
INSERT INTO `t_comment` VALUES (8, 14, 20, '有压力的一天', '2024-05-12 11:30:45', 6, 1);
INSERT INTO `t_comment` VALUES (9, 6, 22, '资源不错', '2024-05-12 11:40:17', 14, 1);
INSERT INTO `t_comment` VALUES (10, 7, 25, '非常有帮助', '2024-05-13 12:00:00', 8, 1);
INSERT INTO `t_comment` VALUES (11, 8, 26, '不错的文章', '2024-05-13 13:00:00', 9, 1);
INSERT INTO `t_comment` VALUES (12, 9, 27, '非常详细', '2024-05-13 14:00:00', 10, 1);
INSERT INTO `t_comment` VALUES (13, 10, 28, '信息量很大', '2024-05-13 15:00:00', 11, 1);
INSERT INTO `t_comment` VALUES (14, 11, 29, '值得阅读', '2024-05-13 16:00:00', 12, 2);
INSERT INTO `t_comment` VALUES (30, 7, 25, '非常有帮助', '2024-05-13 12:00:00', 8, 1);
INSERT INTO `t_comment` VALUES (31, 8, 26, '不错的文章', '2024-05-13 13:00:00', 9, 1);
INSERT INTO `t_comment` VALUES (32, 9, 27, '非常详细', '2024-05-13 14:00:00', 10, 2);
INSERT INTO `t_comment` VALUES (33, 10, 28, '信息量很大', '2024-05-13 15:00:00', 11, 1);
INSERT INTO `t_comment` VALUES (34, 11, 29, '值得阅读', '2024-05-13 16:00:00', 12, 1);

-- ----------------------------
-- Table structure for t_download_message
-- ----------------------------
DROP TABLE IF EXISTS `t_download_message`;
CREATE TABLE `t_download_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int NULL DEFAULT NULL COMMENT '下载者id',
  `articleId` int NULL DEFAULT NULL COMMENT '资源id',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下载信息',
  `downloadDate` datetime NULL DEFAULT NULL COMMENT '下载时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `articleId`(`articleId` ASC) USING BTREE,
  CONSTRAINT `t_download_message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_download_message_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_download_message' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_download_message
-- ----------------------------
INSERT INTO `t_download_message` VALUES (1, 14, 19, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message` VALUES (2, 14, 10, '下载了：50份优秀Java求职者简历', '2024-01-10 23:15:17');
INSERT INTO `t_download_message` VALUES (3, 14, 7, '下载了：Postgresql数据库优化视频教程 下载', '2024-01-10 23:24:35');
INSERT INTO `t_download_message` VALUES (4, 14, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-11 01:51:23');
INSERT INTO `t_download_message` VALUES (5, 14, 19, '下载了：MUI全接触', '2024-01-11 01:58:11');
INSERT INTO `t_download_message` VALUES (6, 6, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:30');
INSERT INTO `t_download_message` VALUES (7, 6, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:35');
INSERT INTO `t_download_message` VALUES (8, 6, 15, '下载了：黑马JavaEE 57期', '2024-01-11 02:10:54');
INSERT INTO `t_download_message` VALUES (9, 6, 14, '下载了：mybatis教程pdf合集', '2024-01-11 02:11:03');
INSERT INTO `t_download_message` VALUES (10, 6, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-17 13:01:21');
INSERT INTO `t_download_message` VALUES (11, 6, 19, '下载了：MUI全接触', '2024-01-17 21:45:12');
INSERT INTO `t_download_message` VALUES (12, 6, 9, '下载了：mysql高级mycat集群视频&redis视频视频教程 下载', '2024-03-16 09:29:23');
INSERT INTO `t_download_message` VALUES (13, 14, 21, '下载了：Web前端技术', '2024-05-11 08:17:40');
INSERT INTO `t_download_message` VALUES (14, 14, 22, '下载了：Java技术全解', '2024-05-12 12:41:50');
INSERT INTO `t_download_message` VALUES (15, 14, 22, '下载了：Java技术全解', '2024-05-12 12:43:45');
INSERT INTO `t_download_message` VALUES (16, 14, 22, '下载了：Java技术全解', '2024-05-12 12:43:46');
INSERT INTO `t_download_message` VALUES (17, 14, 22, '下载了：Java技术全解', '2024-05-12 12:44:54');
INSERT INTO `t_download_message` VALUES (18, 14, 22, '下载了：Java技术全解', '2024-05-12 12:44:55');
INSERT INTO `t_download_message` VALUES (19, 14, 22, '下载了：Java技术全解', '2024-05-12 12:45:18');
INSERT INTO `t_download_message` VALUES (20, 14, 23, '下载了：MySQL数据库', '2024-05-19 21:32:48');
INSERT INTO `t_download_message` VALUES (21, 14, 24, '下载了：SQLServer数据库', '2024-05-21 14:52:48');
INSERT INTO `t_download_message` VALUES (22, 14, 24, '下载了：SQLServer数据库', '2024-05-21 15:03:15');
INSERT INTO `t_download_message` VALUES (23, 14, 24, '下载了：SQLServer数据库', '2024-05-21 15:05:04');
INSERT INTO `t_download_message` VALUES (24, 7, 19, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message` VALUES (25, 8, 10, '下载了：50份优秀Java求职者简历', '2024-01-10 23:15:17');
INSERT INTO `t_download_message` VALUES (26, 8, 7, '下载了：Postgresql数据库优化视频教程 下载', '2024-01-10 23:24:35');
INSERT INTO `t_download_message` VALUES (27, 6, 19, '下载了：MUI全接触', '2024-01-11 01:58:11');
INSERT INTO `t_download_message` VALUES (28, 9, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:30');
INSERT INTO `t_download_message` VALUES (29, 10, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:35');
INSERT INTO `t_download_message` VALUES (30, 11, 15, '下载了：黑马JavaEE 57期', '2024-01-11 02:10:54');
INSERT INTO `t_download_message` VALUES (31, 15, 14, '下载了：mybatis教程pdf合集', '2024-01-11 02:11:03');
INSERT INTO `t_download_message` VALUES (32, 16, 19, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message` VALUES (33, 7, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-11 01:51:23');
INSERT INTO `t_download_message` VALUES (34, 1, 34, '下载了：数据结构与算法分析', '2024-05-24 18:17:10');
INSERT INTO `t_download_message` VALUES (35, 1, 28, '下载了：Java并发编程', '2024-05-24 18:17:22');
INSERT INTO `t_download_message` VALUES (36, 1, 34, '下载了：数据结构与算法分析', '2024-05-24 18:32:24');
INSERT INTO `t_download_message` VALUES (37, 21, 34, '下载了：数据结构与算法分析', '2024-05-24 19:31:43');
INSERT INTO `t_download_message` VALUES (38, 9, 170, '下载了：Java程序员职业规划', '2024-05-10 05:23:57');
INSERT INTO `t_download_message` VALUES (39, 8, 40, '下载了：计算机网络原理', '2024-03-03 19:47:27');
INSERT INTO `t_download_message` VALUES (40, 19, 195, '下载了：移动端跨平台开发技术选型', '2024-05-25 03:15:44');
INSERT INTO `t_download_message` VALUES (41, 6, 111, '下载了：Java面向对象编程入门', '2024-03-30 05:58:03');
INSERT INTO `t_download_message` VALUES (42, 12, 26, '下载了：Java基础入门', '2024-04-11 20:41:15');
INSERT INTO `t_download_message` VALUES (43, 16, 94, '下载了：Python进阶指南', '2024-02-10 03:36:53');
INSERT INTO `t_download_message` VALUES (44, 16, 26, '下载了：Java基础入门', '2024-02-23 09:44:30');
INSERT INTO `t_download_message` VALUES (45, 19, 206, '下载了：微服务容器化部署实践指南', '2024-02-10 23:31:16');
INSERT INTO `t_download_message` VALUES (46, 8, 50, '下载了：JavaEE JMS', '2024-01-21 05:10:42');
INSERT INTO `t_download_message` VALUES (47, 13, 12, '下载了：高级架构师进阶24天视频教程', '2024-01-07 19:56:48');
INSERT INTO `t_download_message` VALUES (48, 19, 52, '下载了：JavaEE Testing', '2024-04-12 03:45:48');
INSERT INTO `t_download_message` VALUES (49, 11, 44, '下载了：JavaEE Servlets', '2024-02-19 21:56:01');
INSERT INTO `t_download_message` VALUES (50, 21, 58, '下载了：NoSQL Databases', '2024-03-07 15:19:42');
INSERT INTO `t_download_message` VALUES (51, 12, 76, '下载了：Docker容器化技术在微服务中的应用', '2024-02-28 06:00:41');
INSERT INTO `t_download_message` VALUES (52, 9, 113, '下载了：Java并发编程实战', '2024-03-21 22:53:45');
INSERT INTO `t_download_message` VALUES (53, 15, 192, '下载了：Python深度学习实战指南', '2024-01-05 22:07:04');
INSERT INTO `t_download_message` VALUES (54, 1, 214, '下载了：C#进阶指南', '2024-04-23 11:13:18');
INSERT INTO `t_download_message` VALUES (55, 2, 223, '下载了：C++基础教程', '2024-02-15 06:19:32');
INSERT INTO `t_download_message` VALUES (56, 6, 219, '下载了：C#项目管理与团队协作指南', '2024-01-21 01:20:56');
INSERT INTO `t_download_message` VALUES (57, 12, 172, '下载了：数据库监控与性能调优实践', '2024-02-22 21:56:23');
INSERT INTO `t_download_message` VALUES (58, 3, 222, '下载了：Go语言并发编程实战', '2024-05-02 03:51:43');
INSERT INTO `t_download_message` VALUES (59, 16, 151, '下载了：Java网络框架实战', '2024-03-05 06:05:05');
INSERT INTO `t_download_message` VALUES (60, 13, 180, '下载了：Spring Security安全开发实践', '2024-02-09 06:14:52');
INSERT INTO `t_download_message` VALUES (61, 10, 25, '下载了：SQLServer数据库', '2024-05-08 01:03:17');
INSERT INTO `t_download_message` VALUES (62, 4, 72, '下载了：前端框架选型指南', '2024-03-07 14:34:34');
INSERT INTO `t_download_message` VALUES (63, 6, 184, '下载了：Python高级编程技巧', '2024-02-23 02:21:16');
INSERT INTO `t_download_message` VALUES (64, 15, 64, '下载了：JavaScript高级编程技巧', '2024-03-30 14:19:01');
INSERT INTO `t_download_message` VALUES (65, 13, 109, '下载了：Java基础教程', '2024-05-12 06:14:08');
INSERT INTO `t_download_message` VALUES (66, 9, 18, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-16 12:13:50');
INSERT INTO `t_download_message` VALUES (67, 7, 53, '下载了：Introduction to SQL', '2024-02-01 16:51:50');
INSERT INTO `t_download_message` VALUES (68, 9, 145, '下载了：数据库安全防护指南', '2024-03-11 16:14:38');
INSERT INTO `t_download_message` VALUES (69, 10, 166, '下载了：CSS3动画效果实践指南', '2024-03-06 07:36:22');
INSERT INTO `t_download_message` VALUES (70, 2, 210, '下载了：微服务架构中的安全防护', '2024-04-07 01:37:53');
INSERT INTO `t_download_message` VALUES (71, 2, 217, '下载了：C#服务器端开发实战', '2024-01-18 17:25:48');
INSERT INTO `t_download_message` VALUES (72, 3, 70, '下载了：前端安全指南', '2024-04-30 03:37:54');
INSERT INTO `t_download_message` VALUES (73, 1, 137, '下载了：Python数据分析实战', '2024-01-19 10:36:26');
INSERT INTO `t_download_message` VALUES (74, 13, 102, '下载了：Python开发工具与环境配置指南', '2024-04-17 12:32:25');
INSERT INTO `t_download_message` VALUES (75, 15, 216, '下载了：C#图形用户界面开发指南', '2024-01-12 18:13:23');
INSERT INTO `t_download_message` VALUES (76, 7, 4, '下载了：2024年java常见笔试面试题汇总(附答案)', '2024-02-02 08:47:15');
INSERT INTO `t_download_message` VALUES (77, 17, 118, '下载了：Java项目管理与团队协作指南', '2024-01-28 21:36:08');
INSERT INTO `t_download_message` VALUES (78, 18, 177, '下载了：JavaScript异步编程实践', '2024-02-08 04:44:37');
INSERT INTO `t_download_message` VALUES (79, 17, 97, '下载了：Python人工智能入门', '2024-03-20 20:39:27');
INSERT INTO `t_download_message` VALUES (80, 12, 21, '下载了：Web前端技术', '2024-01-10 22:40:46');
INSERT INTO `t_download_message` VALUES (81, 20, 12, '下载了：高级架构师进阶24天视频教程', '2024-05-18 18:30:32');
INSERT INTO `t_download_message` VALUES (82, 17, 62, '下载了：Optimizing Database Performance', '2024-01-15 18:23:10');
INSERT INTO `t_download_message` VALUES (83, 4, 174, '下载了：React.js实战指南', '2024-01-12 20:05:34');
INSERT INTO `t_download_message` VALUES (84, 20, 148, '下载了：前端性能优化实践指南', '2024-05-17 15:25:33');
INSERT INTO `t_download_message` VALUES (85, 7, 75, '下载了：分布式系统中的数据一致性问题', '2024-04-13 23:49:17');
INSERT INTO `t_download_message` VALUES (86, 7, 170, '下载了：Java程序员职业规划', '2024-05-08 19:49:30');
INSERT INTO `t_download_message` VALUES (87, 5, 182, '下载了：Vue.js前端开发指南', '2024-04-22 19:25:51');
INSERT INTO `t_download_message` VALUES (88, 13, 197, '下载了：移动端原生开发技术解析', '2024-04-06 08:21:05');
INSERT INTO `t_download_message` VALUES (89, 10, 206, '下载了：微服务容器化部署实践指南', '2024-01-27 06:33:21');
INSERT INTO `t_download_message` VALUES (90, 1, 98, '下载了：Python机器学习实战', '2024-03-12 14:00:10');
INSERT INTO `t_download_message` VALUES (91, 13, 181, '下载了：Java设计模式详解', '2024-03-14 23:31:09');
INSERT INTO `t_download_message` VALUES (92, 11, 30, '下载了：Spring框架入门', '2024-02-22 06:26:17');
INSERT INTO `t_download_message` VALUES (93, 4, 59, '下载了：Database Security', '2024-01-17 04:30:28');
INSERT INTO `t_download_message` VALUES (94, 12, 69, '下载了：Angular框架入门教程', '2024-04-27 12:31:14');
INSERT INTO `t_download_message` VALUES (95, 6, 123, '下载了：JavaEE安全开发实践', '2024-05-20 08:14:34');
INSERT INTO `t_download_message` VALUES (96, 8, 126, '下载了：JavaEE缓存技术应用指南', '2024-04-12 12:48:55');
INSERT INTO `t_download_message` VALUES (97, 13, 127, '下载了：JavaEE监控与管理实践指南', '2024-01-20 04:14:11');
INSERT INTO `t_download_message` VALUES (98, 17, 122, '下载了：JavaEE数据库编程指南', '2024-02-21 09:26:06');
INSERT INTO `t_download_message` VALUES (99, 11, 166, '下载了：CSS3动画效果实践指南', '2024-02-08 14:56:30');
INSERT INTO `t_download_message` VALUES (100, 14, 128, '下载了：JavaEE性能优化实践指南', '2024-04-05 13:15:06');
INSERT INTO `t_download_message` VALUES (101, 9, 197, '下载了：移动端原生开发技术解析', '2024-05-14 22:14:01');
INSERT INTO `t_download_message` VALUES (102, 20, 95, '下载了：Python数据分析入门', '2024-05-16 02:21:29');
INSERT INTO `t_download_message` VALUES (103, 19, 116, '下载了：Java框架与工具介绍', '2024-05-01 09:31:12');
INSERT INTO `t_download_message` VALUES (104, 18, 170, '下载了：Java程序员职业规划', '2024-05-27 14:59:23');
INSERT INTO `t_download_message` VALUES (105, 14, 160, '下载了：前端跨平台开发技术介绍', '2024-03-02 00:25:34');
INSERT INTO `t_download_message` VALUES (106, 3, 100, '下载了：Python Web开发入门', '2024-05-23 17:32:33');
INSERT INTO `t_download_message` VALUES (107, 6, 110, '下载了：Java进阶指南', '2024-04-08 15:54:17');
INSERT INTO `t_download_message` VALUES (108, 5, 201, '下载了：移动APP测试与发布流程', '2024-05-27 17:12:17');
INSERT INTO `t_download_message` VALUES (109, 21, 71, '下载了：TypeScript入门教程', '2024-03-10 06:03:29');
INSERT INTO `t_download_message` VALUES (110, 21, 121, '下载了：JavaEE企业应用开发实战', '2024-04-01 03:41:24');
INSERT INTO `t_download_message` VALUES (111, 11, 156, '下载了：NoSQL数据库介绍与应用', '2024-04-02 20:37:58');
INSERT INTO `t_download_message` VALUES (112, 4, 32, '下载了：Spring Boot入门', '2024-04-05 05:48:20');
INSERT INTO `t_download_message` VALUES (113, 4, 14, '下载了：mybatis教程pdf合集', '2024-04-28 02:24:35');
INSERT INTO `t_download_message` VALUES (114, 13, 169, '下载了：Java开源项目解析', '2024-03-29 19:22:35');
INSERT INTO `t_download_message` VALUES (115, 21, 184, '下载了：Python高级编程技巧', '2024-04-28 13:58:46');
INSERT INTO `t_download_message` VALUES (116, 14, 43, '下载了：JavaEE Overview', '2024-04-15 13:24:50');
INSERT INTO `t_download_message` VALUES (117, 19, 112, '下载了：Java集合框架详解', '2024-01-28 13:15:11');
INSERT INTO `t_download_message` VALUES (118, 3, 43, '下载了：JavaEE Overview', '2024-05-09 02:25:56');
INSERT INTO `t_download_message` VALUES (119, 21, 128, '下载了：JavaEE性能优化实践指南', '2024-03-26 04:25:35');
INSERT INTO `t_download_message` VALUES (120, 18, 184, '下载了：Python高级编程技巧', '2024-05-06 19:11:19');
INSERT INTO `t_download_message` VALUES (121, 1, 198, '下载了：移动APP性能优化实践指南', '2024-02-17 21:20:16');
INSERT INTO `t_download_message` VALUES (122, 3, 1, '下载了：JavaScript基础教程', '2024-02-22 19:15:11');
INSERT INTO `t_download_message` VALUES (123, 14, 105, '下载了：关系型数据库管理系统入门', '2024-02-24 16:53:50');
INSERT INTO `t_download_message` VALUES (124, 1, 154, '下载了：Java图像处理技术', '2024-01-20 10:55:42');
INSERT INTO `t_download_message` VALUES (125, 13, 5, '下载了：常用日期函数', '2024-05-16 18:01:06');
INSERT INTO `t_download_message` VALUES (126, 4, 198, '下载了：移动APP性能优化实践指南', '2024-03-18 04:07:08');
INSERT INTO `t_download_message` VALUES (127, 13, 210, '下载了：微服务架构中的安全防护', '2024-04-04 19:39:34');
INSERT INTO `t_download_message` VALUES (128, 6, 86, '下载了：Android应用开发入门指南', '2024-01-03 18:48:59');
INSERT INTO `t_download_message` VALUES (129, 6, 219, '下载了：C#项目管理与团队协作指南', '2024-02-20 08:28:56');
INSERT INTO `t_download_message` VALUES (130, 7, 152, '下载了：Java微服务架构设计与实践', '2024-04-30 23:45:25');
INSERT INTO `t_download_message` VALUES (131, 7, 220, '下载了：Go语言基础教程', '2024-02-27 15:59:24');
INSERT INTO `t_download_message` VALUES (132, 8, 185, '下载了：Python网络爬虫实战指南', '2024-05-03 20:25:08');
INSERT INTO `t_download_message` VALUES (133, 17, 172, '下载了：数据库监控与性能调优实践', '2024-02-20 07:00:15');
INSERT INTO `t_download_message` VALUES (134, 21, 196, '下载了：移动APP前端框架选型', '2024-04-08 05:41:56');
INSERT INTO `t_download_message` VALUES (135, 10, 54, '下载了：Advanced SQL Queries', '2024-03-16 09:49:52');
INSERT INTO `t_download_message` VALUES (136, 10, 64, '下载了：JavaScript高级编程技巧', '2024-01-08 02:49:56');
INSERT INTO `t_download_message` VALUES (137, 14, 120, '下载了：JavaEE Web开发指南', '2024-02-04 22:51:12');

-- ----------------------------
-- Table structure for t_information
-- ----------------------------
DROP TABLE IF EXISTS `t_information`;
CREATE TABLE `t_information`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int NULL DEFAULT NULL COMMENT '消息所属者id',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `t_information_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'int_formation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_information
-- ----------------------------
INSERT INTO `t_information` VALUES (1, 6, '你的资源(Java编程思想)的分享链接已经失效,请及时更新', '2024-01-13 03:40:59');
INSERT INTO `t_information` VALUES (2, 6, '已通过资源', '2024-01-16 16:21:27');
INSERT INTO `t_information` VALUES (3, 6, '已减少积分50', '2024-01-16 16:21:33');
INSERT INTO `t_information` VALUES (4, 14, '已增加积分50', '2024-05-12 11:44:25');
INSERT INTO `t_information` VALUES (5, 7, '你的资源的分享链接已经通过', '2024-05-13 12:00:00');
INSERT INTO `t_information` VALUES (6, 8, '你的资源的分享链接已经失效,请及时更新', '2024-05-13 13:00:00');
INSERT INTO `t_information` VALUES (7, 9, '你的资源的分享链接已经通过', '2024-05-13 14:00:00');
INSERT INTO `t_information` VALUES (8, 10, '你的资源的分享链接已经失效,请及时更新', '2024-05-13 15:00:00');
INSERT INTO `t_information` VALUES (9, 11, '你的资源的分享链接已经通过', '2024-05-13 16:00:00');
INSERT INTO `t_information` VALUES (10, 6, '你的资源的分享链接已经失效,请及时更新', '2024-01-13 03:40:59');
INSERT INTO `t_information` VALUES (11, 14, '你的资源的分享链接已经通过\r\n你的资源的分享链接已经失效,请及时更新', '2024-05-22 15:29:46');
INSERT INTO `t_information` VALUES (12, 6, '已通过资源', '2024-01-16 16:21:27');
INSERT INTO `t_information` VALUES (13, 6, '已减少积分50', '2024-01-16 16:21:33');
INSERT INTO `t_information` VALUES (14, 14, '已增加积分50', '2024-05-12 11:44:25');
INSERT INTO `t_information` VALUES (15, 6, '你有一条新消息，请查收', '2024-05-13 12:00:00');
INSERT INTO `t_information` VALUES (16, 7, '你的积分已增加100', '2024-05-13 13:00:00');
INSERT INTO `t_information` VALUES (17, 8, '请更新你的联系方式', '2024-05-13 14:00:00');
INSERT INTO `t_information` VALUES (18, 9, '有新的评论回复你', '2024-05-13 15:00:00');
INSERT INTO `t_information` VALUES (19, 15, '你的资源被下载', '2024-05-15 15:00:00');
INSERT INTO `t_information` VALUES (20, 14, '每日签到提醒', '2024-05-15 14:00:00');
INSERT INTO `t_information` VALUES (21, 10, '你的文章被点赞', '2024-05-13 16:00:00');
INSERT INTO `t_information` VALUES (22, 11, '系统维护通知', '2024-05-14 09:00:00');
INSERT INTO `t_information` VALUES (23, 12, '账号安全提醒', '2024-05-14 10:00:00');
INSERT INTO `t_information` VALUES (24, 13, '新的登录地点', '2024-05-14 11:00:00');
INSERT INTO `t_information` VALUES (25, 14, '资料更新成功', '2024-05-14 12:00:00');
INSERT INTO `t_information` VALUES (26, 15, '密码修改提醒', '2024-05-14 13:00:00');
INSERT INTO `t_information` VALUES (27, 16, '新的关注者', '2024-05-14 14:00:00');
INSERT INTO `t_information` VALUES (28, 17, '积分减少50', '2024-05-14 15:00:00');
INSERT INTO `t_information` VALUES (29, 18, '有新的推荐文章', '2024-05-14 16:00:00');
INSERT INTO `t_information` VALUES (30, 9, '评论被回复', '2024-05-15 09:00:00');
INSERT INTO `t_information` VALUES (31, 10, '新的系统更新', '2024-05-15 10:00:00');
INSERT INTO `t_information` VALUES (32, 11, '你的文章被收藏', '2024-05-15 11:00:00');
INSERT INTO `t_information` VALUES (33, 12, '积分活动通知', '2024-05-15 12:00:00');
INSERT INTO `t_information` VALUES (34, 13, '新的好友请求', '2024-05-15 13:00:00');

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `sortNum` int NULL DEFAULT NULL COMMENT '排列序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_link' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES (1, '百度', 'https://www.baidu.com', 1);
INSERT INTO `t_link` VALUES (2, 'Bng', 'https://www.bing.com', 2);
INSERT INTO `t_link` VALUES (3, 'GitHub', 'https://www.github.com', 3);
INSERT INTO `t_link` VALUES (4, 'GitEE', 'https://gitee.com', 4);
INSERT INTO `t_link` VALUES (5, 'Google', 'https://www.google.com', 5);
INSERT INTO `t_link` VALUES (6, '学习通', 'https://www.https://www.chaoxing.com/', 6);
INSERT INTO `t_link` VALUES (7, '智慧树知到', 'https://lc.zhihuishu.com/', 7);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `time` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '系统维护通知', '系统将在本周六凌晨进行维护，预计持续时间为2小时。请各位用户提前保存工作。', '2024-05-20 17:52:08');
INSERT INTO `t_notice` VALUES (2, '新功能上线', '我们很高兴地宣布，新版本的系统已经上线，包含以下新功能...', '2024-05-05 10:00:00');
INSERT INTO `t_notice` VALUES (3, '假期安排', '根据公司安排，端午节期间放假3天，放假时间为...', '2024-05-10 09:00:00');
INSERT INTO `t_notice` VALUES (4, '重要通知', '由于政策变动，请大家尽快更新个人信息，以免影响正常使用。', '2024-05-12 15:00:00');
INSERT INTO `t_notice` VALUES (5, '内部培训', '本月公司将组织一次内部培训，主要内容为...', '2024-05-14 14:00:00');
INSERT INTO `t_notice` VALUES (6, '内部测试', '这是一条仅对内部公开的测试公告。', '2024-05-01 08:00:00');
INSERT INTO `t_notice` VALUES (7, '内部讨论', '请各部门提交下一季度的工作计划。', '2024-05-05 10:00:00');

-- ----------------------------
-- Table structure for t_recommended
-- ----------------------------
DROP TABLE IF EXISTS `t_recommended`;
CREATE TABLE `t_recommended`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `userId` int NULL DEFAULT NULL COMMENT '推荐用户ID',
  `time` datetime NOT NULL COMMENT '推荐时间',
  `recommendedArticleIds` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推荐资源',
  `similarUserIds` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相似用户',
  `articleId1` int NULL DEFAULT NULL COMMENT '推荐资源1ID',
  `articleId2` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId3` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId4` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId5` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId6` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId7` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId8` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId9` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId10` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_recommended
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `imageName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `points` int NULL DEFAULT NULL,
  `isVip` int NULL DEFAULT NULL,
  `isOff` int NULL DEFAULT NULL,
  `roleName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `registerDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', '银叶', '1203007469@qq.com', '20240114225430.jpg', 10000, 1, 0, '管理员', '2024-01-03 23:16:40');
INSERT INTO `t_user` VALUES (2, 'admin1', 'admin1', '管理员1', '3465466546@qq.com', '20240114225430.jpg', 134, 1, 0, '管理员', '2024-05-12 13:24:48');
INSERT INTO `t_user` VALUES (3, 'admin2', 'admin2', '管理员2', '2343211153@qq.com', '20240108235216.jpg', 100, 1, 0, '管理员', '2024-05-12 15:22:58');
INSERT INTO `t_user` VALUES (4, 'admin3', 'admin3', '管理员3', 'dsfds@qq.com', '20240108235216.jpg', 1000, 0, 0, '普通用户', '2024-05-12 15:58:22');
INSERT INTO `t_user` VALUES (5, 'admin4', 'admin4', '管理员4', 'dsakfjh@qq.com', '20240108235216.jpg', 1000, 1, 0, '管理员', '2024-05-13 09:29:12');
INSERT INTO `t_user` VALUES (6, '111', '111111', 'LiuYun', '3495197980@qq.com', '20240108235216.jpg', 103, 1, 0, 'VIP用户', '2024-01-07 02:06:22');
INSERT INTO `t_user` VALUES (7, '222', '222222', '222', '12030074169@qq.com', '20240107021707.PNG', 100, 0, 0, '普通用户', '2024-01-07 02:17:07');
INSERT INTO `t_user` VALUES (8, '333', '333333', '尔玛', '12030074619@qq.com', '20240109172637.jfif', 103, 0, 0, '普通用户', '2024-01-09 17:26:37');
INSERT INTO `t_user` VALUES (9, '444', '444444', '444', '12031007469@qq.com', '20240111025503.jpg', 0, 0, 0, '普通用户', '2024-01-11 02:55:03');
INSERT INTO `t_user` VALUES (10, '555', '555555', '555', 'f1203007469@gmail.com', '20240111025655.jpg', 0, 1, 0, 'VIP用户', '2024-01-11 02:56:55');
INSERT INTO `t_user` VALUES (11, '666', '666666', '666', 'zou66786961@163.com', '20240111025751.jpg', 100, 0, 0, '普通用户', '2024-01-11 02:57:51');
INSERT INTO `t_user` VALUES (12, '777', '777777', '777', 'f12030074691@gmail.com', '20240113053514.png', 50, 0, 0, '普通用户', '2024-01-13 05:35:14');
INSERT INTO `t_user` VALUES (13, '888', '888888', '888', 'zou667869611@163.com', '20240108235216.jpg', 100, 0, 1, '普通用户', '2024-01-14 04:35:24');
INSERT INTO `t_user` VALUES (14, 'user11', 'user123', '用户11', '3582311515@qq.com', '20240524191213.jpg', 43, 1, 0, 'VIP用户', '2024-05-11 08:13:35');
INSERT INTO `t_user` VALUES (15, 'ghgf', '123111', 'trt', 'rddrtd11111@qq.com', '20240108235216.jpg', 153, 0, 0, '普通用户', '2024-05-12 15:28:23');
INSERT INTO `t_user` VALUES (16, 'gfhdfg', '123456', 'yhg ', '234523@qq.com', '20240513093313.jpg', 100, 0, 0, '普通用户', '2024-05-13 09:33:13');
INSERT INTO `t_user` VALUES (17, 'user1', 'user123', '用户1', '1234abc@qq.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-16 16:30:34');
INSERT INTO `t_user` VALUES (18, 'rtrty', '123456', 'gfhfgh', 'sdfgsdg@qq.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-16 20:41:18');
INSERT INTO `t_user` VALUES (19, 'user2', 'user2', 'user2', 'dfgdfg@qq.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-24 17:51:48');
INSERT INTO `t_user` VALUES (20, 'user3', 'user123', 'user3', 'gfhfh@qq.com', '20240111025655.jpg', 100, 0, 0, '普通用户', '2024-05-24 18:46:10');
INSERT INTO `t_user` VALUES (21, 'user4', 'user123', 'user4', 'tgryhtr@qq.com', NULL, 98, 0, 0, '普通用户', '2024-05-24 19:29:14');

SET FOREIGN_KEY_CHECKS = 1;
