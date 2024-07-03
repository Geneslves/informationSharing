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

 Date: 02/07/2024 14:52:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admuser
-- ----------------------------
DROP TABLE IF EXISTS `t_admuser`;
CREATE TABLE `t_admuser`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `isOff` int NULL DEFAULT NULL COMMENT '是否封禁',
  `roleName` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `registerDate` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admuser
-- ----------------------------
INSERT INTO `t_admuser` VALUES (1, 'admin', 'Pg7AD32V', '银叶', '1203007469@qq.com', 0, '管理员', '2024-01-03 23:16:40');
INSERT INTO `t_admuser` VALUES (2, '邱嘉伦', 'oLP8tjOS6T', '岚风', 'qiujial@gmail.com', 0, '管理员', '2024-05-12 13:24:48');
INSERT INTO `t_admuser` VALUES (3, '范璐', 'VodXWWJykm', '云风', 'lu9bj@outlook.com', 0, '管理员', '2024-05-12 15:22:58');
INSERT INTO `t_admuser` VALUES (4, '董璐', 'Xgy2zPIXsK', '子异', 'dlujhg@gmail.com', 0, '管理员', '2024-05-12 15:58:22');

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
  `downloadLink` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '百度云链接',
  `password` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接密码',
  `isHot` int NULL DEFAULT NULL COMMENT '是否热门 0代表不是 1代表是',
  `state` int NULL DEFAULT NULL COMMENT '状态 1代表未审核 2代表审核通过 3代表审核未通过',
  `reason` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核未通过理由',
  `checkDate` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `isUseful` int NULL DEFAULT NULL COMMENT '链接是否失效 1代表未失效 0代表已经失效',
  `click` int NULL DEFAULT NULL COMMENT '点击次数',
  `filePath` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件上传路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `articleTypeId`(`articleTypeId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `name`(`name` ASC) USING BTREE,
  CONSTRAINT `t_article_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (1, 'Java技术全解', '2024-03-29 19:26:21', 14, 1, 1, '本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。&nbsp;\n', '<p>本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。&nbsp;</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-06-29 09:47:12', 0, 41, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (2, 'MySQL数据库', '2024-04-11 05:21:42', 14, 2, 6, '本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。', '<p>本指南介绍了使用方法、常用功能和实际案例，适合开发者学习。</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-06-29 10:08:49', 1, 9, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (3, 'SQLServer数据库', '2024-04-01 07:25:19', 14, 2, 4, '数据库\n', '<p><img alt=\"\" src=\"/static/images/articleImage/20240516170806.jpg\" />数据库</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-06-29 09:47:28', 1, 18, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (4, 'Java基础入门', '2024-04-10 01:47:46', 6, 1, 5, 'Java基础知识概览', 'Java基础入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 20, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (5, 'Java高级编程', '2024-04-05 02:53:04', 7, 1, 8, '深入了解Java高级特性', 'Java高级编程内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 12, '');
INSERT INTO `t_article` VALUES (6, 'Java并发编程', '2024-04-06 13:29:33', 8, 1, 7, '学习Java并发编程', 'Java并发编程内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 31, '');
INSERT INTO `t_article` VALUES (7, 'Java设计模式', '2024-03-31 04:10:42', 9, 1, 6, '深入理解常用的Java设计模式', 'Java设计模式内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 15, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (8, 'Spring框架入门', '2024-04-01 15:00:52', 10, 5, 7, '学习Spring框架的基础知识', 'Spring框架入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 22, '');
INSERT INTO `t_article` VALUES (9, 'Hibernate框架入门', '2024-03-16 19:19:16', 14, 5, 7, '学习Hibernate框架的基础知识', 'Hibernate框架入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 30, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (10, 'Spring Boot入门', '2024-04-18 14:06:05', 14, 5, 7, '学习Spring Boot的基础知识', 'Spring Boot入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 3, '无', '2024-05-07 17:29:19', 1, 21, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (11, 'java编程思想', '2024-03-16 21:44:09', 14, 1, 2, 'java编程思想\n', '<p><a href=\"http://localhost:8080/article/23\" title=\"java编程思想\">java编程思想</a></p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 3, '链接失效', '2024-05-16 12:14:45', 1, 5, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (12, '数据结构与算法分析', '2024-04-10 10:53:21', 15, 1, 2, '拳皇版超级玛丽13可执行文件\n', '<p>拳皇版超级玛丽13可执行文件</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 23, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (13, 'Python编程', '2024-03-09 23:34:19', 18, 2, 3, '2020年java常见笔试面试题汇总(附答案)\n', '<p>2020年java常见笔试面试题汇总(附答案)</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 29, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (14, '机器学习实战', '2024-04-22 20:49:46', 13, 3, 4, '常用日期函数\n', '<p>常用日期函数</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 31, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (15, '深度学习入门', '2024-03-10 06:14:31', 11, 3, 4, '王二暖Oracle视频教程 下载\n', '<p>王二暖Oracle视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (16, 'Java编程实践', '2024-03-23 11:26:33', 13, 1, 2, 'Postgresql数据库优化视频教程 下载\n', '<p>Postgresql数据库优化视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (17, '数据挖掘基础', '2024-03-21 06:52:10', 13, 3, 4, 'Oracle Rachel操作手册\n', '<p>Oracle Rachel操作手册</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 39, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (18, '计算机网络原理', '2024-04-13 18:14:41', 13, 1, 2, 'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n', '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 55, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (19, '编程艺术', '2024-03-14 20:50:33', 17, 1, 4, '高级架构师进阶24天视频教程\n', '<p>高级架构师进阶24天视频教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 53, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (20, '操作系统导论', '2024-04-10 11:25:32', 16, 7, 2, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 38, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (21, 'JavaEE Overview', '2024-03-09 00:00:26', 1, 4, 0, 'An overview of JavaEE', 'Detailed content about JavaEE overview.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc123', 0, 2, NULL, '2024-05-07 15:04:22', 1, 106, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (22, 'JavaEE Servlets', '2024-04-11 08:18:15', 1, 4, 4, 'Introduction to JavaEE Servlets', 'Detailed content about JavaEE Servlets.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'def456', 1, 2, NULL, '2024-04-28 20:10:28', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (23, 'JavaScript基础教程', '2024-03-25 03:07:23', 3, 8, 2, '适合初学者的JavaScript基础教程', '本教程详细介绍了JavaScript的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 1, 2, NULL, '2024-05-21 13:49:33', 1, 111, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (24, 'JavaScript进阶指南', '2024-04-16 22:57:09', 4, 8, 3, '深入学习JavaScript进阶知识和技巧', '本指南介绍了JavaScript的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 0, 0, NULL, '2024-05-11 09:10:50', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (25, '拳皇版超级玛丽13可执行文件', '2024-03-25 11:46:41', 6, 1, 4, '拳皇版超级玛丽13可执行文件\n', '<p>拳皇版超级玛丽13可执行文件</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 12, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (26, '2024年java常见笔试面试题汇总(附答案)', '2024-03-27 01:05:43', 6, 1, 5, '2024年java常见笔试面试题汇总(附答案)\n', '<p>2024年java常见笔试面试题汇总(附答案)</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-06-29 10:29:13', 1, 32, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (27, '常用日期函数', '2024-04-12 13:30:06', 6, 2, 5, '常用日期函数\n', '<p>常用日期函数</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-04-30 07:17:22', 1, 15, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (28, '王二暖Oracle视频教程 下载', '2024-03-24 00:10:51', 6, 2, 3, '王二暖Oracle视频教程 下载\n', '<p>王二暖Oracle视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 1, 22, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (29, 'Mysql从入门到精通视频教程（共29集）下载', '2024-03-17 12:08:48', 6, 2, 5, 'Mysql从入门到精通视频教程（共29集）下载\n', '<p>Mysql从入门到精通视频教程（共29集）下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-10 11:45:29', 1, 30, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (30, 'Postgresql数据库优化视频教程 下载', '2024-04-21 14:53:22', 6, 2, 5, 'Postgresql数据库优化视频教程 下载\n', '<p>Postgresql数据库优化视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-15 22:00:48', 1, 21, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (31, 'Oracle Rachel操作手册', '2024-04-14 21:42:25', 6, 2, 4, 'Oracle Rachel操作手册\n', '<p>Oracle Rachel操作手册</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-04-28 06:30:10', 1, 5, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (32, 'mysql高级mycat集群视频&redis视频视频教程 下载', '2024-03-07 22:18:48', 6, 2, 3, 'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n', '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-04 22:23:38', 1, 11, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (33, '50份优秀Java求职者简历', '2024-04-17 14:45:34', 7, 1, 4, '50份优秀Java求职者简历\n', '<p>50份优秀Java求职者简历</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 29, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (34, '高级架构师进阶24天视频教程', '2024-03-01 23:51:33', 7, 1, 4, '高级架构师进阶24天视频教程\n', '<p>高级架构师进阶24天视频教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 31, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (35, '从零开始学java', '2024-04-01 19:18:17', 7, 1, 5, '从零开始学java\n', '<p>从零开始学java</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 43, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (36, '刘道成MySQL系列教程', '2024-03-05 18:54:09', 7, 2, 4, '刘道成MySQL系列教程\n', '<p>刘道成MySQL系列教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 33, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (37, 'mybatis教程pdf合集', '2024-04-19 02:23:42', 7, 2, 3, 'mybatis教程pdf合集\n', '<p>mybatis教程pdf合集</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (38, '黑马JavaEE 57期', '2024-04-17 12:48:03', 7, 2, 4, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 39, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (39, 'SSM整合案例【企业权限管理系统】视频教程', '2024-03-03 14:47:19', 7, 4, 4, 'SSM整合案例【企业权限管理系统】视频教程\n', '<p><a href=\"http://download.java1234.com/article/1942\" target=\"_blank\" title=\"SSM整合案例【企业权限管理系统】视频教程\">SSM整合案例【企业权限管理系统】视频教程</a></p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 55, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (40, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-03-29 06:00:18', 7, 3, 2, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视\n', '<p>Vue2.0+Node.js+MongoDB全栈打造商城系统视</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 44, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (41, 'Vue项目实战教程', '2024-04-15 22:18:00', 7, 3, 5, 'Vue项目实战教程\n', '<p>Vue项目实战教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 53, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (42, 'MUI全接触', '2024-04-19 10:07:21', 7, 3, 7, 'MUI全接触\n', '<p>MUI全接触</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-15 09:15:12', 1, 125, '');
INSERT INTO `t_article` VALUES (43, 'web打印分页设置', '2024-03-22 11:13:24', 8, 3, 5, 'web打印分页设置\n', '<p><a href=\"http://download.java1234.com/article/1845\" target=\"_blank\" title=\"web打印分页设置\">web打印分页设置</a></p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-21 01:37:48', 1, 8, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (44, 'Web前端技术', '2024-03-03 10:37:49', 6, 3, 4, 'Web前端技术Web前端技术\n&nbsp;\n', '<p>Web前端技术Web前端技术</p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240117224856.jpg\" style=\"height:457px; width:700px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240118141517.jpg\" style=\"height:62px; width:700px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-18 21:15:47', 1, 221, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (45, 'JavaEE JSP', '2024-03-06 03:08:30', 2, 4, 4, 'Understanding JSP in JavaEE', 'Detailed content about JSP in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'ghi789', 1, 2, NULL, '2024-05-04 20:36:40', 1, 201, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (46, 'JavaEE EJB', '2024-04-19 09:19:46', 2, 4, 5, 'Enterprise JavaBeans in JavaEE', 'Detailed content about EJB in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'jkl012', 1, 2, NULL, '2024-05-03 06:25:51', 1, 250, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (47, 'JavaEE JPA', '2024-04-14 17:43:15', 3, 4, 5, 'Java Persistence API in JavaEE', 'Detailed content about JPA in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'mno345', 1, 2, NULL, '2024-05-07 12:55:58', 1, 300, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (48, 'JavaEE CDI', '2024-04-11 17:42:24', 3, 4, 3, 'Contexts and Dependency Injection in JavaEE', 'Detailed content about CDI in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'pqr678', 1, 2, NULL, '2024-05-07 22:29:51', 1, 350, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (49, 'JavaEE JAX-RS', '2024-04-19 23:10:30', 4, 4, 5, 'Java API for RESTful Web Services in JavaEE', 'Detailed content about JAX-RS in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'stu901', 1, 2, NULL, '2024-05-09 01:28:54', 1, 400, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (50, 'JavaEE JMS', '2024-03-03 18:24:31', 4, 4, 5, 'Java Message Service in JavaEE', 'Detailed content about JMS in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'vwx234', 1, 2, NULL, '2024-05-01 23:36:33', 1, 450, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (51, 'JavaEE Security', '2024-04-11 02:04:57', 5, 4, 4, 'Security in JavaEE Applications', 'Detailed content about security in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'yz567', 1, 2, NULL, '2024-05-01 23:00:19', 1, 500, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (52, 'JavaEE Testing', '2024-04-03 08:37:35', 5, 4, 3, 'Testing JavaEE Applications', 'Detailed content about testing in JavaEE.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc890', 1, 2, NULL, '2024-05-03 17:21:01', 1, 550, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (53, 'Introduction to SQL', '2024-03-16 18:37:58', 1, 2, 4, 'Introduction to SQL for beginners', 'Detailed content about SQL.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc123', 0, 2, NULL, '2024-06-24 21:57:27', 1, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (54, 'Advanced SQL Queries', '2024-03-02 10:57:59', 1, 2, 4, 'Advanced SQL query techniques', 'Detailed content about advanced SQL queries.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'def456', 1, 2, NULL, '2024-05-03 23:22:07', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (55, 'Database Normalization', '2024-04-12 11:31:42', 2, 2, 5, 'Understanding database normalization', 'Detailed content about database normalization.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'ghi789', 1, 2, NULL, '2024-06-24 22:00:52', 1, 201, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (56, 'Indexing in Databases', '2024-03-28 20:29:25', 2, 2, 4, 'How to use indexing in databases', 'Detailed content about indexing.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'jkl012', 1, 2, NULL, '2024-06-24 22:00:41', 1, 251, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (57, 'Database Transactions', '2024-03-22 10:59:53', 3, 2, 3, 'Understanding database transactions', 'Detailed content about transactions.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'mno345', 1, 2, NULL, '2024-06-24 22:00:25', 0, 301, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (58, 'NoSQL Databases', '2024-03-21 01:32:50', 3, 2, 4, 'Introduction to NoSQL databases', 'Detailed content about NoSQL.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'pqr678', 1, 2, NULL, '2024-04-23 17:40:04', 1, 350, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (59, 'Database Security', '2024-03-14 12:03:38', 4, 2, 4, 'Best practices for database security', 'Detailed content about database security.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'stu901', 1, 2, NULL, '2024-06-24 22:01:04', 1, 401, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (60, 'Data Warehousing', '2024-03-27 01:01:14', 4, 2, 2, 'Introduction to data warehousing', 'Detailed content about data warehousing.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'vwx234', 1, 2, NULL, '2024-05-10 20:58:04', 1, 451, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (61, 'Database Backup and Recovery', '2024-03-29 04:29:34', 5, 2, 5, 'Techniques for database backup and recovery', 'Detailed content about backup and recovery.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'yz567', 1, 2, NULL, '2024-05-04 21:36:52', 1, 500, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (62, 'Optimizing Database Performance', '2024-04-13 08:18:42', 5, 2, 7, 'Tips for optimizing database performance', 'Detailed content about performance optimization.', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', 'abc890', 1, 2, NULL, '2024-06-24 22:01:14', 1, 551, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (63, '前端开发入门指南', '2024-03-31 06:12:39', 1, 3, 5, '本指南适合初学者入门', '这是一篇关于前端开发入门的指南。', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '123456', 0, 2, NULL, '2024-05-09 09:35:47', 1, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (64, 'JavaScript高级编程技巧', '2024-03-21 12:24:14', 2, 3, 4, '深入探讨JavaScript高级特性', '本文介绍了一些JavaScript高级编程技巧。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-01 22:10:14', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (65, 'Vue.js实战教程', '2024-04-07 07:19:42', 3, 3, 1, '学习Vue.js的最佳实践', '本教程详细介绍了Vue.js的实战应用。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-23 11:16:50', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (66, 'React入门指南(一)', '2024-03-11 11:49:57', 4, 3, 6, '适合新手学习React的入门指南', '这是一份React入门指南，适合初学者阅读。', 'https://pan.baidu.com/s/xyz', '1234', 0, 2, NULL, '2024-05-13 05:06:58', 1, 90, '');
INSERT INTO `t_article` VALUES (67, 'CSS布局技巧', '2024-04-14 01:02:04', 5, 3, 4, '学习实用的CSS布局技巧', '本文介绍了一些实用的CSS布局技巧，适合前端开发者阅读。', 'https://pan.baidu.com/s/abc', 'security', 0, 2, NULL, '2024-05-05 13:46:01', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (68, 'Web前端性能优化指南', '2024-04-21 10:15:17', 6, 3, 5, '提升网页性能的最佳实践', '本指南总结了一些Web前端性能优化的方法。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-21 06:53:50', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (69, 'Angular框架入门教程', '2024-03-06 06:27:12', 7, 3, 8, '学习Angular框架的基础知识', '本教程适合初学者学习Angular框架。', 'https://pan.baidu.com/s/ghi', '123456', 1, 2, NULL, '2024-05-01 11:28:52', 1, 110, '');
INSERT INTO `t_article` VALUES (70, '前端安全指南', '2024-03-21 20:06:22', 8, 3, 7, '保护Web应用的安全性', '本指南介绍了一些保护Web应用安全的方法。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-07 13:54:09', 0, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (71, 'TypeScript入门教程', '2024-03-16 09:51:22', 9, 3, 6, '学习TypeScript的基础知识', '本教程适合初学者学习TypeScript。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-05-03 20:46:15', 1, 95, '');
INSERT INTO `t_article` VALUES (72, '前端框架选型指南', '2024-03-30 02:52:27', 10, 3, 7, '选择适合项目的前端框架', '本指南帮助你选择适合项目的前端框架。', 'https://pan.baidu.com/s/pqr', '123456', 0, 2, NULL, '2024-04-26 14:23:59', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (73, '微服务架构设计原则', '2024-03-25 01:52:49', 1, 5, 7, '介绍微服务架构设计的基本原则', '本文详细介绍了微服务架构设计的一些基本原则和最佳实践。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-04-29 11:35:27', 0, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (74, 'Spring Cloud入门指南', '2024-04-10 23:08:26', 2, 5, 7, '学习使用Spring Cloud构建分布式微服务应用', '本指南适合初学者学习如何使用Spring Cloud构建分布式微服务应用。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-22 05:59:11', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (75, '分布式系统中的数据一致性问题', '2024-03-07 10:25:06', 3, 5, 2, '探讨分布式系统中的数据一致性保障方法', '本文分析了分布式系统中常见的数据一致性问题，并介绍了一些解决方案。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-04-26 23:49:23', 1, 151, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (76, 'Docker容器化技术在微服务中的应用', '2024-03-27 21:07:02', 4, 5, 2, '使用Docker容器化技术部署和管理微服务应用', '本文介绍了如何使用Docker容器化技术来构建、部署和管理微服务应用。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-04-26 06:08:14', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (77, '服务发现与注册技术在微服务中的应用', '2024-04-05 06:35:22', 5, 5, 3, '介绍服务发现与注册技术在微服务架构中的重要性和应用', '本文详细介绍了服务发现与注册技术在微服务架构中的原理、实现方式以及应用场景。', 'https://pan.baidu.com/s/abc', '123456', 0, 2, NULL, '2024-05-16 05:57:56', 0, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (78, '分布式系统中的负载均衡策略', '2024-03-30 23:03:38', 6, 5, 4, '探讨分布式系统中常见的负载均衡策略', '本文分析了分布式系统中常用的负载均衡策略，并比较了它们的优缺点。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-04-29 21:48:51', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (79, '容错与故障恢复在分布式系统中的应用', '2024-04-08 10:56:01', 7, 5, 4, '介绍在分布式系统中实现容错与故障恢复的方法和技术', '本文介绍了在分布式系统中实现容错与故障恢复的一些常见方法和技术。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-22 11:30:26', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (80, '微服务安全架构设计指南', '2024-04-08 20:19:36', 8, 5, 2, '保障微服务架构的安全性', '本指南介绍了如何设计和实现安全的微服务架构，以保障系统的安全性。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-04-26 19:47:58', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (81, '微服务性能调优指南', '2024-03-07 10:34:41', 9, 5, 4, '优化微服务架构的性能', '本指南总结了一些优化微服务架构性能的常用方法和技巧。', 'https://pan.baidu.com/s/mno', 'abcdef', 0, 2, NULL, '2024-05-18 16:26:58', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (82, '微服务与容器编排技术选型指南', '2024-03-08 00:25:21', 10, 5, 2, '选择适合项目的微服务与容器编排技术', '本指南帮助你选择适合项目的微服务与容器编排技术，并提供了选型指南。', 'https://pan.baidu.com/s/pqr', 'abcdef', 0, 2, NULL, '2024-05-09 17:49:07', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (83, 'Flutter入门指南', '2024-03-23 09:31:51', 1, 6, 4, '学习使用Flutter构建跨平台移动应用', '本指南适合初学者学习如何使用Flutter构建跨平台移动应用。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-04-28 20:56:24', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (84, 'React Native实战教程', '2024-03-16 00:16:15', 2, 6, 2, '学习使用React Native开发移动应用的实战教程', '本教程详细介绍了如何使用React Native开发移动应用的实践经验。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-04-26 10:53:28', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (85, 'iOS应用开发入门指南', '2024-03-17 15:08:16', 3, 6, 0, '适合新手学习iOS应用开发的入门指南', '本指南适合初学者学习如何使用Swift或Objective-C开发iOS应用。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-03 06:32:20', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (86, 'Android应用开发入门指南', '2024-03-27 03:27:13', 4, 6, 0, '适合新手学习Android应用开发的入门指南', '本指南适合初学者学习如何使用Java或Kotlin开发Android应用。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-04 03:45:57', 0, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (87, '移动UI设计入门教程', '2024-03-08 06:53:24', 5, 6, 0, '学习移动应用UI设计的基础知识', '本教程介绍了移动应用UI设计的基本原理和常见实践。', 'https://pan.baidu.com/s/abc', '1234', 0, 2, NULL, '2024-05-15 04:21:22', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (88, '移动应用性能优化指南', '2024-03-08 12:34:40', 6, 6, 0, '提升移动应用性能的最佳实践', '本指南总结了一些提升移动应用性能的常用方法和技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-03 09:36:55', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (89, '移动应用安全架构设计指南', '2024-04-09 19:04:46', 7, 6, 0, '保障移动应用架构的安全性', '本指南介绍了如何设计和实现安全的移动应用架构，以保障系统的安全性。', 'https://pan.baidu.com/s/ghi', '1234', 1, 2, NULL, '2024-05-16 15:22:14', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (90, '移动应用测试实践指南', '2024-03-22 21:27:42', 8, 6, 0, '介绍移动应用测试的常用方法和技巧', '本指南详细介绍了移动应用测试的各种方法和实践经验。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-21 03:50:31', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (91, '移动应用用户体验设计指南', '2024-04-13 19:31:25', 9, 6, 0, '优化移动应用用户体验的最佳实践', '本指南总结了一些优化移动应用用户体验的常用方法和技巧。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-04-24 07:09:18', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (92, '跨平台移动应用开发选型指南', '2024-03-21 12:11:18', 10, 6, 0, '选择适合项目的跨平台移动应用开发技术', '本指南帮助你选择适合项目的跨平台移动应用开发技术，并提供了选型指南。', 'https://pan.baidu.com/s/pqr', '1234', 0, 2, NULL, '2024-05-07 03:18:41', 1, 86, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (93, 'Python基础教程', '2024-03-06 20:25:36', 1, 7, 0, '适合初学者的Python基础教程', '本教程详细介绍了Python的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-04-23 19:23:02', 0, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (94, 'Python进阶指南', '2024-03-11 04:41:31', 2, 7, 0, '深入学习Python进阶知识和技巧', '本指南介绍了Python的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-11 05:30:56', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (95, 'Python数据分析入门', '2024-03-02 02:19:29', 3, 7, 0, '学习使用Python进行数据分析的基础知识', '本指南介绍了使用Python进行数据分析的基本原理和常用工具，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-01 17:20:08', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (96, 'Python网络爬虫实战', '2024-04-21 14:27:41', 4, 7, 0, '学习使用Python实战开发网络爬虫', '本教程介绍了使用Python开发网络爬虫的实践经验和技巧，适合对网络爬虫感兴趣的开发者阅读。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-20 10:59:19', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (97, 'Python人工智能入门', '2024-03-01 18:57:20', 5, 7, 0, '学习使用Python进行人工智能开发的基础知识', '本指南介绍了使用Python进行人工智能开发的基本原理和常用工具，适合初学者入门。', 'https://pan.baidu.com/s/abc', 'pqr678', 0, 2, NULL, '2024-04-30 20:30:53', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (98, 'Python机器学习实战', '2024-03-26 21:19:11', 6, 7, 0, '学习使用Python实战开发机器学习应用', '本教程介绍了使用Python进行机器学习开发的实践经验和技巧，适合对机器学习感兴趣的开发者阅读。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-04 04:06:13', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (99, 'Python自然语言处理入门', '2024-03-09 15:43:17', 7, 7, 0, '学习使用Python进行自然语言处理的基础知识', '本指南介绍了使用Python进行自然语言处理的基本原理和常用工具，适合初学者入门。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-04-28 22:10:49', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (100, 'Python Web开发入门', '2024-03-23 04:23:31', 8, 7, 4, '学习使用Python进行Web开发的基础知识', '本指南介绍了使用Python进行Web开发的基本原理和常用框架，适合初学者入门。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-08 09:04:14', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (101, 'Python游戏开发入门', '2024-04-20 22:58:39', 9, 7, 0, '学习使用Python进行游戏开发的基础知识', '本指南介绍了使用Python进行游戏开发的基本原理和常用库，适合初学者入门。', 'https://pan.baidu.com/s/mno', 'security', 0, 2, NULL, '2024-05-08 23:43:01', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (102, 'Python开发工具与环境配置指南', '2024-03-16 05:40:26', 10, 7, 0, '介绍Python开发常用工具和环境配置方法', '本指南介绍了Python开发常用的编辑器、调试器和环境配置方法，适合开发者参考。', 'https://pan.baidu.com/s/pqr', '1234', 0, 2, NULL, '2024-05-01 17:05:53', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (103, '数据库设计基础教程', '2024-04-17 20:35:27', 1, 2, 0, '适合初学者的数据库设计基础教程', '本教程详细介绍了数据库设计的基本原理和常用技巧，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-21 03:14:06', 1, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (104, 'SQL基础教程', '2024-04-10 13:03:01', 2, 2, 3, '学习SQL语言基础知识和常用操作', '本教程介绍了SQL语言的基本语法和常见操作，适合初学者入门。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-20 06:27:16', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (105, '关系型数据库管理系统入门', '2024-04-14 16:18:19', 3, 2, 2, '学习关系型数据库管理系统的基础知识', '本指南介绍了关系型数据库管理系统的基本原理、常见操作和管理技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-15 06:14:02', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (106, '数据库优化与性能调优指南', '2024-04-09 18:36:02', 5, 2, 2, '学习数据库优化和性能调优的方法和技巧', '本指南介绍了数据库优化和性能调优的常见方法和技巧，适合数据库管理员和开发者参考。', 'https://pan.baidu.com/s/abc', 'abcdef', 0, 2, NULL, '2024-05-22 11:37:59', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (107, 'Spring Data JPA实战指南', '2024-03-09 18:20:08', 6, 8, 4, '学习Spring Data JPA的实战经验和技巧', '本指南介绍了Spring Data JPA的实际项目开发经验、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-19 13:47:36', 0, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (108, '数据库与大数据技术融合实践', '2024-03-17 05:06:54', 10, 2, 7, '学习数据库与大数据技术融合的实践方法', '本指南介绍了数据库与大数据技术融合的实际应用场景和操作方法，适合数据工程师和开发人员参考。', 'https://pan.baidu.com/s/pqr', 'abcdef', 0, 2, NULL, '2024-04-25 19:20:56', 1, 85, '');
INSERT INTO `t_article` VALUES (109, 'Java基础教程', '2024-04-08 12:17:09', 1, 1, 0, '适合初学者的Java基础教程', '本教程详细介绍了Java的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 1, 2, NULL, '2024-05-13 16:48:17', 1, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (110, 'Java进阶指南', '2024-03-25 09:43:47', 2, 1, 1, '深入学习Java进阶知识和技巧', '本指南介绍了Java的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-20 12:04:17', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (111, 'Java面向对象编程入门', '2024-03-03 16:56:40', 3, 1, 0, '学习Java面向对象编程的基础知识', '本指南介绍了Java面向对象编程的基本原理和常用技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-10 12:22:07', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (112, 'Java集合框架详解', '2024-04-10 21:33:50', 4, 1, 2, '学习Java集合框架的基本用法和常见操作', '本指南介绍了Java集合框架的基本概念、常见类型和使用方法，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'security', 0, 2, NULL, '2024-05-08 23:50:46', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (113, 'Java并发编程实战', '2024-03-02 19:02:40', 5, 1, 5, '学习Java并发编程的实践经验和技巧', '本指南介绍了Java并发编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'abcdef', 0, 2, NULL, '2024-04-28 23:29:18', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (114, 'Java网络编程入门', '2024-04-07 19:33:58', 6, 1, 4, '学习Java网络编程的基础知识和实践经验', '本指南介绍了Java网络编程的基本原理、常用技术和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-14 07:00:21', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (115, 'Java图形用户界面开发指南', '2024-03-01 09:39:47', 7, 1, 7, '学习Java图形用户界面开发的基础知识和实践经验', '本指南介绍了Java图形用户界面开发的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-06 22:30:23', 1, 114, '');
INSERT INTO `t_article` VALUES (116, 'Java框架与工具介绍', '2024-04-09 09:13:15', 8, 1, 10, '了解Java常用框架和开发工具', '本指南介绍了Java常用框架（如Spring、Hibernate等）和开发工具（如IDE、构建工具等），适合开发者了解。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-15 14:59:21', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (117, 'Java服务器端开发实战', '2024-03-07 19:18:29', 9, 1, 4, '学习Java服务器端开发的实践经验和技巧', '本指南介绍了Java服务器端开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/mno', '123456', 0, 2, NULL, '2024-04-30 14:40:38', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (118, 'Java项目管理与团队协作指南', '2024-04-20 02:11:58', 10, 1, 0, '学习Java项目管理和团队协作的方法和工具', '本指南介绍了Java项目管理和团队协作的常用方法、工具和实践经验，适合开发团队参考。', 'https://pan.baidu.com/s/pqr', 'security', 0, 2, NULL, '2024-05-08 20:49:12', 1, 87, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (119, 'JavaEE基础教程', '2024-03-14 17:36:38', 1, 4, 4, '适合初学者的JavaEE基础教程', '本教程详细介绍了JavaEE的基本概念、体系结构和常用组件，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-04-25 18:45:37', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (120, 'JavaEE Web开发指南', '2024-04-22 21:51:08', 2, 4, 3, '学习JavaEE Web应用开发的基础知识和实践经验', '本指南介绍了JavaEE Web应用开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-20 17:18:48', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (121, 'JavaEE企业应用开发实战', '2024-03-16 12:22:24', 3, 4, 7, '学习JavaEE企业应用开发的实践经验和技巧', '本指南介绍了JavaEE企业应用开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-14 19:41:00', 0, 150, '');
INSERT INTO `t_article` VALUES (122, 'JavaEE数据库编程指南', '2024-03-30 05:25:24', 4, 4, 10, '学习JavaEE数据库编程的基础知识和实践经验', '本指南介绍了JavaEE数据库编程的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-13 04:56:49', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (123, 'JavaEE安全开发实践', '2024-04-02 08:51:12', 5, 4, 5, '学习JavaEE安全开发的实践经验和技巧', '本指南介绍了JavaEE安全开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'password', 0, 2, NULL, '2024-05-20 14:30:15', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (124, 'JavaEE微服务架构实践', '2024-04-03 08:44:22', 6, 4, 6, '学习JavaEE微服务架构的实践经验和技巧', '本指南介绍了JavaEE微服务架构的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-02 20:10:10', 1, 200, '');
INSERT INTO `t_article` VALUES (125, 'JavaEE消息队列应用指南', '2024-03-19 05:26:10', 7, 4, 0, '学习JavaEE消息队列应用的基础知识和实践经验', '本指南介绍了JavaEE消息队列应用的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-11 12:39:31', 1, 111, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (126, 'JavaEE缓存技术应用指南', '2024-03-16 09:30:26', 8, 4, 3, '学习JavaEE缓存技术的基础知识和实践经验', '本指南介绍了JavaEE缓存技术的基本原理、常用技术和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-12 00:19:51', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (127, 'JavaEE监控与管理实践指南', '2024-04-05 16:49:14', 9, 4, 0, '学习JavaEE监控与管理的实践经验和技巧', '本指南介绍了JavaEE监控与管理的基本原理、常用技术和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-05-01 09:22:38', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (128, 'JavaEE性能优化实践指南', '2024-04-10 12:08:42', 10, 4, 0, '学习JavaEE性能优化的实践经验和技巧', '本指南介绍了JavaEE性能优化的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-05-07 01:08:37', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (129, 'Java技术入门指南', '2024-03-27 05:07:58', 11, 1, 5, 'Java初学者的入门指南', '介绍Java基础知识和常用功能，适合初学者阅读。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-19 17:23:17', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (130, '分布式微服务架构设计', '2024-03-13 04:39:52', 15, 5, 1, '分布式微服务架构设计的基本原理', '介绍分布式微服务架构设计的基本概念、优势和实践经验。', 'https://pan.baidu.com/s/abc', 'security', 0, 2, NULL, '2024-05-15 03:48:00', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (131, '移动APP界面设计指南(一)', '2024-03-23 16:13:27', 16, 6, 5, '移动APP界面设计的基本原则和实践技巧', '介绍移动APP界面设计的基本原则、常用工具和实践技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-13 10:02:33', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (132, 'Java多线程编程指南', '2024-04-07 10:35:36', 18, 1, 3, 'Java多线程编程的基本原理和实践技巧', '介绍Java多线程编程的基本原理、常见问题和解决方案。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-04-23 17:37:20', 1, 145, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (133, 'Java网络编程实战', '2024-03-26 05:04:25', 13, 4, 5, 'Java网络编程的实际应用案例', '介绍Java网络编程在实际项目开发中的应用场景和操作方法。', 'https://pan.baidu.com/s/stu', 'security', 0, 2, NULL, '2024-05-12 04:30:51', 1, 75, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (134, '数据库技术概述', '2024-04-08 03:03:37', 12, 2, 2, '数据库技术的基本概念和发展历程', '介绍数据库的基本概念、分类和应用领域，适合初学者了解。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-04-27 15:24:02', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (135, 'Web前端开发实践', '2024-03-02 16:16:09', 13, 3, 5, 'Web前端开发的实际操作和技巧', '介绍Web前端开发的基本原理、常用技术和实际操作，适合开发者学习。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-10 07:44:19', 0, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (136, '移动APP界面设计指南(二)', '2024-04-16 20:58:16', 16, 6, 4, '移动APP界面设计的基本原则和实践技巧', '介绍移动APP界面设计的基本原则、常用工具和实践技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-14 11:39:36', 1, 201, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (137, 'Python数据分析实战', '2024-04-18 01:17:14', 17, 7, 2, 'Python数据分析的实际应用案例', '介绍使用Python进行数据分析的常见方法、工具和实践经验。', 'https://pan.baidu.com/s/ghi', '123456', 1, 2, NULL, '2024-05-03 00:34:24', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (138, '数据库管理与优化实践', '2024-03-31 19:10:02', 11, 2, 2, '数据库管理与性能优化的实践经验', '介绍数据库管理与性能优化的常用方法和实践技巧。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-05-15 13:13:03', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (139, 'JavaEE高级技术应用', '2024-03-09 11:45:58', 14, 4, 5, 'JavaEE高级技术的实践应用', '介绍JavaEE高级技术如消息队列、缓存等的应用场景和操作方法。', 'https://pan.baidu.com/s/xyz', 'security', 0, 2, NULL, '2024-05-01 04:29:03', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (140, '移动APP界面设计指南(三)', '2024-04-09 22:15:15', 16, 6, 6, '移动APP界面设计的基本原则和实践技巧', '介绍移动APP界面设计的基本原则、常用工具和实践技巧。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-21 03:30:48', 1, 200, '');
INSERT INTO `t_article` VALUES (141, '前端框架与组件应用', '2024-03-23 23:36:37', 12, 3, 2, '前端框架与组件在实际项目中的应用', '介绍前端框架与组件在实际项目开发中的应用场景和操作方法。', 'https://pan.baidu.com/s/pqr', 'security', 0, 2, NULL, '2024-05-05 10:28:20', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (142, '微服务架构设计与实现', '2024-03-04 00:56:33', 14, 5, 4, '微服务架构设计与实现的基本原理', '介绍微服务架构设计与实现的基本概念、优势和实践经验。', 'https://pan.baidu.com/s/vwx', 'password', 0, 2, NULL, '2024-04-26 23:03:15', 1, 67, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (143, 'Java并发编程高级技巧', '2024-04-13 04:33:16', 12, 1, 2, '探讨Java并发编程中的高级应用场景和技巧', '本文介绍了Java并发编程的高级技巧和常见问题解决方案，适合有一定经验的开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-01 16:37:21', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (144, 'Node.js基础教程', '2024-03-03 19:49:39', 16, 8, 4, '适合初学者的Node.js基础教程', '本教程详细介绍了Node.js的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-02 12:09:25', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (145, '数据库安全防护指南', '2024-04-16 01:37:49', 8, 2, 1, '保障数据库系统的安全性', '本文介绍了如何设计和实施安全的数据库系统，以保障数据的安全性和完整性。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-08 17:06:08', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (146, '数据仓库设计与实践指南', '2024-03-02 17:53:46', 9, 2, 8, '介绍数据仓库设计的基本原理和实践经验', '本文介绍了数据仓库设计的基本概念、架构和实践经验，适合数据工程师和分析师学习。', 'https://pan.baidu.com/s/ghi', 'security', 1, 2, NULL, '2024-04-27 13:48:01', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (147, '数据库迁移与同步实践指南', '2024-04-10 10:15:21', 11, 2, 5, '介绍数据库迁移与同步的实践方法和工具', '本文详细介绍了数据库迁移与同步的实际操作步骤和常用工具，适合数据库管理员和开发人员参考。', 'https://pan.baidu.com/s/mno', 'abcdef', 0, 2, NULL, '2024-05-17 00:46:24', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (148, '前端性能优化实践指南', '2024-03-24 01:32:59', 18, 3, 5, '介绍前端性能优化的常见方法和实践技巧', '本文详细介绍了前端性能优化的常用方法和实践经验，涵盖了页面加载优化、资源压缩等方面，适合前端开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-04-26 19:28:16', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (149, '前端安全防护指南', '2024-03-15 15:53:08', 1, 3, 4, '保障前端应用的安全性和可靠性', '本文介绍了前端开发中常见的安全漏洞和攻击手法，并提供了相应的防护策略和实践经验，适合前端开发者阅读。', 'https://pan.baidu.com/s/ghi', 'security', 1, 2, NULL, '2024-05-08 17:21:35', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (150, 'Web前端工程化实践指南', '2024-03-24 22:02:10', 2, 3, 4, '介绍Web前端工程化的基本原理和实践经验', '本文详细介绍了Web前端工程化的概念、工具和最佳实践，适合前端开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-04 07:54:03', 0, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (151, 'Java网络框架实战', '2024-04-03 03:46:44', 13, 1, 4, '介绍常用的Java网络框架及其实战应用', '本文详细介绍了Java中常用的网络框架及其在实际项目中的应用场景，适合网络开发人员阅读。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-04-28 23:48:22', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (152, 'Java微服务架构设计与实践', '2024-04-07 18:22:26', 15, 1, 8, '深入探讨Java微服务架构的设计和实践', '本文介绍了Java微服务架构的设计原则、常用技术和实际项目经验，适合架构师和开发人员学习。', 'https://pan.baidu.com/s/abc', '1234', 0, 2, NULL, '2024-05-07 11:10:54', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (153, 'Java大数据处理技术', '2024-03-08 22:12:44', 16, 1, 4, '介绍Java在大数据处理方面的应用和技术', '本文介绍了Java在大数据处理领域的常见应用场景、技术选型和实践经验，适合数据工程师学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-11 18:37:50', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (154, 'Java图像处理技术', '2024-04-06 20:14:26', 17, 1, 5, '介绍Java图像处理库及其在实际项目中的应用', '本文详细介绍了Java图像处理的常用库、技术和实际应用场景，适合图像处理领域的开发人员阅读。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-04-27 06:58:41', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (155, '数据库索引优化技巧', '2024-04-15 18:28:55', 3, 2, 7, '介绍数据库索引优化的常见方法和技巧', '本文详细介绍了数据库索引优化的常用方法和实践经验，适合数据库管理员和开发人员学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-18 12:58:47', 1, 100, '');
INSERT INTO `t_article` VALUES (156, 'NoSQL数据库介绍与应用', '2024-04-18 21:05:08', 6, 2, 1, '介绍NoSQL数据库的基本概念和应用场景', '本文介绍了NoSQL数据库的基本原理、分类和应用场景，适合初学者了解。', 'https://pan.baidu.com/s/xyz', '1234', 0, 2, NULL, '2024-05-07 05:58:16', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (157, 'Spring Boot入门教程', '2024-03-21 14:20:36', 8, 8, 4, '学习Spring Boot框架的基础知识和实践经验', '本指南介绍了Spring Boot框架的基本原理、常用组件和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 3, NULL, '2024-05-23 06:31:06', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (158, '数据库性能优化实践指南', '2024-03-13 22:06:49', 10, 2, 2, '介绍数据库性能优化的实践方法和技巧', '本文详细介绍了数据库性能优化的常见方法和实践经验，适合数据库管理员和开发人员学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-23 07:24:06', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (159, 'Docker基础入门', '2024-03-09 01:17:36', 18, 8, 4, '学习Docker容器化技术的基础知识和实践经验', '本指南介绍了Docker容器化技术的基本原理、常用命令和实际应用，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-16 06:40:26', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (160, '前端跨平台开发技术介绍', '2024-04-09 06:15:29', 3, 3, 2, '介绍前端跨平台开发的基本概念和实践技巧', '本文介绍了前端跨平台开发的常见技术和实现方法，包括React Native、Flutter等，适合前端开发者了解。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-05-10 04:35:59', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (161, 'Web前端趋势与展望', '2024-03-04 01:28:25', 4, 3, 0, '探讨Web前端技术的发展趋势和未来展望', '本文分析了当前Web前端技术的发展状况和未来趋势，适合前端从业者了解行业动向。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-05-13 08:12:20', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (162, 'Angular实战教程', '2024-04-06 05:12:17', 16, 8, 0, '学习Angular框架的实战经验和技巧', '本指南介绍了Angular框架的实际项目开发经验、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-21 18:23:19', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (163, 'Java面试题精选', '2024-03-08 07:13:35', 18, 1, 0, '汇总常见的Java面试题及详细解答', '本文收集了常见的Java面试题，并提供了详细的解答和思路分析，适合求职者准备面试。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-13 00:46:38', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (164, 'Spring Cloud微服务架构实践', '2024-04-16 23:53:06', 8, 8, 0, '学习Spring Cloud微服务架构的实践经验和技巧', '本指南介绍了Spring Cloud微服务架构的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-04-26 12:50:51', 0, 201, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (165, 'HTML5新特性详解', '2024-03-21 14:36:05', 13, 3, 0, '介绍HTML5新特性及其在Web前端开发中的应用', '本文详细介绍了HTML5的新特性和改进，以及在Web前端开发中的实际应用场景，适合前端开发者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-04-30 14:01:20', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (166, 'CSS3动画效果实践指南', '2024-03-30 03:49:42', 14, 3, 6, '介绍CSS3动画效果的实际应用和实现技巧', '本文详细介绍了CSS3动画效果的常见应用场景、实现方法和实践经验，适合前端开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-20 18:04:41', 1, 120, '');
INSERT INTO `t_article` VALUES (167, 'Kubernetes实践指南', '2024-04-02 09:00:29', 18, 8, 0, '学习Kubernetes容器编排的实践经验和技巧', '本指南介绍了Kubernetes容器编排的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-09 20:41:35', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (168, 'React入门指南(二)', '2024-03-09 02:29:10', 16, 8, 0, '学习React框架的基础知识和实践经验', '本指南介绍了React框架的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-08 05:11:40', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (169, 'Java开源项目解析', '2024-04-20 08:24:35', 1, 1, 0, '深入解析Java开源项目的源码和设计思路', '本文深入解析了常见的Java开源项目的源码结构、设计思路和实现细节，适合Java开发者学习。', 'https://pan.baidu.com/s/mno', 'security', 0, 2, NULL, '2024-05-02 04:25:30', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (170, 'Java程序员职业规划', '2024-03-16 23:58:58', 2, 1, 0, '提供Java程序员的职业规划建议和发展路径', '本文介绍了Java程序员的职业规划和发展路径，包括技术提升、职业规划和个人发展，适合Java从业者参考。', 'https://pan.baidu.com/s/pqr', '123456', 0, 2, NULL, '2024-04-30 17:15:02', 1, 86, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (171, 'Spring Boot与Redis实践指南', '2024-04-14 15:16:29', 8, 8, 5, '学习Spring Boot与Redis的实践经验和技巧', '本指南介绍了Spring Boot与Redis的结合使用方法、常用功能和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-22 09:30:35', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (172, '数据库监控与性能调优实践', '2024-03-09 02:18:02', 12, 2, 4, '介绍数据库监控与性能调优的实践方法', '本文介绍了数据库监控与性能调优的常见方法和实际案例，适合数据库管理员和开发人员学习。', 'https://pan.baidu.com/s/pqr', '123456', 0, 2, NULL, '2024-05-05 20:38:16', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (173, '前端框架Vue.js入门与实践', '2024-04-05 08:11:03', 16, 3, 1, '学习Vue.js前端框架的基础知识和实践经验', '本文介绍了Vue.js前端框架的基本原理、常用功能和实际项目实践，适合前端开发者学习。', 'https://pan.baidu.com/s/xyz', 'security', 0, 2, NULL, '2024-04-30 05:44:40', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (174, 'React.js实战指南', '2024-03-24 10:08:51', 17, 3, 2, '介绍React.js前端框架的实践应用和开发技巧', '本文详细介绍了React.js前端框架的实际应用场景、开发技巧和最佳实践，适合前端开发者学习。', 'https://pan.baidu.com/s/abc', 'abcdef', 0, 2, NULL, '2024-05-06 02:50:24', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (175, 'Express.js实战指南', '2024-03-14 16:37:04', 18, 8, 2, '学习Express.js框架的实战经验和技巧', '本指南介绍了Express.js框架的实际项目开发经验、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-14 07:29:50', 1, 201, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (176, 'Java性能调优指南', '2024-04-02 01:52:50', 14, 1, 3, '本文介绍了Java性能调优的基本原理、常用工具和实际操作经验，适合Java开发者阅读。\n', '<p>本文介绍了Java性能调优的基本原理、常用工具和实际操作经验，适合Java开发者阅读。</p>\r\n', 'https://pan.baidu.com/s/xyz', '1234', 0, 1, NULL, '2024-04-24 04:34:04', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (177, 'JavaScript异步编程实践', '2024-04-03 08:24:23', 16, 8, 7, '学习JavaScript异步编程的实践经验和技巧', '本指南介绍了JavaScript异步编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-04-28 14:54:50', 1, 201, '');
INSERT INTO `t_article` VALUES (178, '数据库事务处理实践指南', '2024-03-20 10:26:19', 4, 2, 9, '介绍数据库事务处理的实践经验和技巧', '本文介绍了数据库事务处理的基本原理、ACID特性和实际应用场景，适合开发人员学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-04-23 10:56:49', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (179, '数据库备份与恢复实践指南', '2024-03-18 10:45:08', 5, 2, 2, '介绍数据库备份与恢复的实践方法', '本文详细介绍了数据库备份与恢复的实际操作步骤和常见问题解决方案，适合数据库管理员参考。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-04-30 14:51:17', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (180, 'Spring Security安全开发实践', '2024-04-02 02:18:25', 8, 8, 6, '学习Spring Security安全开发的实践经验和技巧', '本指南介绍了Spring Security安全开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-06 16:18:08', 1, 200, '');
INSERT INTO `t_article` VALUES (181, 'Java设计模式详解', '2024-04-03 18:20:56', 11, 1, 0, '介绍常见的Java设计模式及应用场景', '本文深入讲解了Java中的设计模式，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-14 12:38:39', 0, 101, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (182, 'Vue.js前端开发指南', '2024-03-28 05:03:30', 16, 8, 7, '学习Vue.js框架的前端开发经验和技巧', '学习Vue.js框架的前端开发经验和技巧\', \'本指南介绍了Vue.js框架的前端开发实践、常见组件和实际案例，适合前端开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-20 16:18:48', 1, 200, '');
INSERT INTO `t_article` VALUES (183, 'Python基础入门教程', '2024-03-05 11:15:59', 17, 7, 2, '从零开始学习Python编程基础知识', '本文详细介绍了Python编程语言的基础语法、数据类型、流程控制等知识点，并通过实例演示帮助读者快速入门。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-04 15:30:32', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (184, 'Python高级编程技巧', '2024-04-18 10:46:20', 18, 7, 1, '深入学习Python编程的高级特性和技巧', '本文介绍了Python编程语言的高级特性、函数式编程和面向对象编程的技巧，以及常用的第三方库，适合有一定Python基础的读者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-17 00:29:26', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (185, 'Python网络爬虫实战指南', '2024-04-18 12:07:30', 1, 7, 6, '学习使用Python编写网络爬虫的实际操作方法', '本文详细介绍了使用Python编写网络爬虫的基本原理、常用库和实战经验，帮助读者快速上手爬虫开发。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-06 20:00:16', 1, 150, '');
INSERT INTO `t_article` VALUES (186, 'Python数据分析实践指南', '2024-04-04 23:02:50', 2, 7, 1, '介绍使用Python进行数据分析的常用工具和技巧', '本文介绍了Python数据分析常用的库、数据处理技巧和可视化方法，帮助读者快速掌握数据分析的基本流程。', 'https://pan.baidu.com/s/xyz', 'password', 0, 2, NULL, '2024-05-23 20:21:36', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (187, 'Python人工智能实践指南', '2024-03-30 17:35:59', 3, 7, 9, '介绍使用Python进行人工智能开发的常用方法和工具', '本文详细介绍了使用Python进行人工智能开发的基本原理、常用库和实践经验，适合有一定Python基础的读者学习。', 'https://pan.baidu.com/s/abc', 'abc890', 0, 2, NULL, '2024-05-01 09:25:22', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (188, 'Python Web开发实战指南', '2024-03-31 20:45:53', 4, 7, 3, '学习使用Python进行Web开发的实际操作方法', '本文详细介绍了使用Python进行Web开发的常用框架、开发流程和实战经验，适合想要学习Web开发的Python初学者。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-04-25 13:04:03', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (189, 'Python图像处理与计算机视觉实践', '2024-03-06 11:29:55', 5, 7, 4, '学习使用Python进行图像处理和计算机视觉的实际操作方法', '本文详细介绍了使用Python进行图像处理和计算机视觉的基本原理、常用库和实践经验，帮助读者快速掌握图像处理和计算机视觉的基本技能。', 'https://pan.baidu.com/s/ghi', '1234', 1, 2, NULL, '2024-04-26 22:51:22', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (190, 'Python自然语言处理实战指南', '2024-04-21 01:05:38', 6, 7, 1, '学习使用Python进行自然语言处理的实际操作方法', '本文详细介绍了使用Python进行自然语言处理的基本原理、常用库和实践经验，帮助读者快速上手自然语言处理开发。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-13 10:59:06', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (191, 'Python机器学习实战指南', '2024-03-23 11:58:24', 7, 7, 2, '学习使用Python进行机器学习的实际操作方法', '本文详细介绍了使用Python进行机器学习的基本原理、常用库和实践经验，适合有一定Python基础的读者学习。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-05-18 09:16:31', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (192, 'Python深度学习实战指南', '2024-03-30 13:12:00', 8, 7, 1, '学习使用Python进行深度学习的实际操作方法', '本文详细介绍了使用Python进行深度学习的基本原理、常用库和实践经验，适合有一定机器学习基础的读者学习。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-05-03 19:42:15', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (193, '移动APP开发趋势与展望', '2024-03-28 03:56:54', 7, 6, 2, '探讨移动APP开发技术的发展趋势和未来展望', '本文分析了当前移动APP开发技术的发展状况和未来趋势，涵盖了移动前端、后端服务、人工智能等方面，适合移动开发者了解行业动向。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-05 11:13:04', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (194, '移动APP设计与用户体验指南', '2024-03-03 05:55:48', 8, 6, 2, '介绍移动APP设计与用户体验的基本原则和实践方法', '本文详细介绍了移动APP设计的基本原则、用户体验规范和实践方法，适合移动开发者和设计师学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-21 13:28:12', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (195, '移动端跨平台开发技术选型', '2024-03-11 10:35:28', 9, 6, 1, '比较常见的移动端跨平台开发技术及其特点', '本文介绍了移动端跨平台开发技术的种类、特点和适用场景，并对比了它们的优缺点，适合移动开发者选择合适的技术方案。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-10 20:45:49', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (196, '移动APP前端框架选型', '2024-03-22 08:23:28', 10, 6, 2, '介绍移动APP前端框架的选择和比较', '本文详细介绍了移动APP前端开发中常用的框架，包括React Native、Flutter等，以及它们的优劣比较，适合移动开发者学习。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-04-26 19:10:35', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (197, '移动端原生开发技术解析', '2024-04-01 00:03:42', 11, 6, 5, '深入解析移动端原生开发技术及其应用场景', '本文介绍了移动端原生开发技术的基本原理、常用工具和实际应用场景，适合移动开发者学习。', 'https://pan.baidu.com/s/abc', '1234', 0, 2, NULL, '2024-04-29 02:10:05', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (198, '移动APP性能优化实践指南', '2024-03-08 06:05:46', 12, 6, 3, '介绍移动APP性能优化的常见方法和实践技巧', '本文详细介绍了移动APP性能优化的常用方法和实践经验，涵盖了界面渲染、网络请求、内存管理等方面，适合移动开发者学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-15 10:00:57', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (199, '移动APP安全防护指南', '2024-03-24 10:24:51', 13, 6, 9, '保障移动APP的安全性和可靠性', '本文介绍了移动APP开发中常见的安全漏洞和攻击手法，并提供了相应的防护策略和实践经验，适合移动开发者阅读。', 'https://pan.baidu.com/s/ghi', 'security', 1, 2, NULL, '2024-04-24 07:10:48', 1, 110, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (200, '移动APP后端服务架构设计', '2024-04-15 21:58:24', 14, 6, 4, '介绍移动APP后端服务架构的设计原则和技术选型', '本文详细介绍了移动APP后端服务架构的设计原则、技术组成和实际应用经验，适合移动开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 0, 3, '不符合规范', '2024-06-24 21:55:18', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (201, '移动APP测试与发布流程', '2024-04-22 07:36:08', 15, 6, 7, '介绍移动APP测试和发布的流程和注意事项', '本文详细介绍了移动APP测试和发布的流程、常用工具和注意事项，帮助移动开发者更高效地进行测试和发布工作。', 'https://pan.baidu.com/s/mno', '1234', 0, 2, NULL, '2024-04-30 01:27:19', 0, 95, '');
INSERT INTO `t_article` VALUES (202, '移动APP数据分析与用户行为监控', '2024-04-01 18:44:26', 16, 6, 2, '介绍移动APP数据分析和用户行为监控的方法和工具', '本文详细介绍了移动APP数据分析的方法、常用工具和用户行为监控技术，帮助移动开发者更好地了解用户需求和行为特征。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-05-23 04:25:36', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (203, '微服务架构设计原则与实践', '2024-03-22 09:32:17', 15, 5, 4, '介绍微服务架构设计的基本原则和实践经验', '本文详细介绍了微服务架构的设计原则、组件划分和实际应用经验，适合架构师和开发者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-07 05:10:55', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (204, '服务注册与发现技术详解', '2024-04-21 04:24:49', 16, 5, 1, '深入解析服务注册与发现技术及其实现方式', '本文介绍了微服务架构中的服务注册与发现的基本原理、常用工具和实现方式，适合微服务开发者学习。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-07 17:40:27', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (205, '微服务通信协议比较', '2024-03-07 20:23:37', 17, 5, 5, '比较常见的微服务通信协议及其特点', '本文详细比较了微服务架构中常见的通信协议，包括HTTP、gRPC等，适合微服务开发者了解和选择。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-04 12:38:07', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (206, '微服务容器化部署实践指南', '2024-03-23 03:35:46', 18, 5, 4, '介绍微服务容器化部署的实践方法和工具', '本文详细介绍了微服务容器化部署的流程、工具和最佳实践，适合微服务开发者学习。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-03 08:39:45', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (207, '微服务监控与治理实践', '2024-04-03 15:58:36', 1, 5, 0, '介绍微服务架构中的监控和治理方案', '本文介绍了微服务架构中常用的监控工具、治理策略和实践经验，适合微服务开发者学习。', 'https://pan.baidu.com/s/abc', 'password', 0, 2, NULL, '2024-04-28 17:36:32', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (208, '服务网格技术在微服务中的应用', '2024-04-15 22:49:16', 2, 5, 0, '介绍服务网格技术在微服务架构中的应用场景', '本文详细介绍了服务网格技术的基本原理、实现方式和微服务中的应用场景，适合微服务架构师学习。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-17 16:55:35', 1, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (209, '容器编排技术在微服务中的应用', '2024-03-06 08:01:43', 3, 5, 6, '介绍容器编排技术在微服务架构中的应用', '本文详细介绍了常见的容器编排技术，如Kubernetes、Docker Swarm等，在微服务架构中的实践应用，适合微服务开发者学习。', 'https://pan.baidu.com/s/ghi', 'abcdef', 1, 2, NULL, '2024-05-20 03:47:13', 1, 110, '');
INSERT INTO `t_article` VALUES (210, '微服务架构中的安全防护', '2024-04-16 04:40:59', 4, 5, 0, '介绍微服务架构中的安全防护措施和策略', '本文详细介绍了微服务架构中的常见安全威胁和相应的防护策略，适合微服务开发者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-15 20:43:53', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (211, '微服务架构中的数据管理与一致性', '2024-04-21 13:45:53', 5, 5, 7, '介绍微服务架构中的数据管理和一致性保障方法', '本文详细介绍了微服务架构中的数据管理技术和保障一致性的方法，适合微服务开发者学习。', 'https://pan.baidu.com/s/mno', 'password', 0, 2, NULL, '2024-05-07 06:04:06', 1, 95, '');
INSERT INTO `t_article` VALUES (212, 'Serverless架构在微服务中的应用', '2024-03-16 06:35:06', 6, 5, 10, '介绍Serverless架构在微服务中的实践应用', '本文详细介绍了Serverless架构的基本概念、优势以及在微服务架构中的应用场景和实践经验，适合微服务架构师和开发者学习。', 'https://pan.baidu.com/s/pqr', 'abcdef', 0, 2, NULL, '2024-05-05 19:27:51', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (213, 'C#基础教程', '2024-03-31 13:48:05', 1, 8, 1, '适合初学者的C#基础教程', '本教程详细介绍了C#的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-19 00:04:58', 1, 100, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (214, 'C#进阶指南', '2024-04-17 22:42:53', 2, 8, 2, '深入学习C#进阶知识和技巧', '本指南介绍了C#的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-20 03:50:34', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (215, 'C#面向对象编程入门', '2024-03-17 15:38:16', 3, 8, 2, '学习C#面向对象编程的基础知识', '本指南介绍了C#面向对象编程的基本原理和常用技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-01 01:02:36', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (216, 'C#图形用户界面开发指南', '2024-03-21 07:40:45', 4, 8, 7, '学习C#图形用户界面开发的基础知识和实践经验', '本指南介绍了C#图形用户界面开发的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'abcdef', 0, 2, NULL, '2024-05-11 03:46:24', 1, 90, '');
INSERT INTO `t_article` VALUES (217, 'C#服务器端开发实战', '2024-04-09 17:59:48', 5, 8, 3, '学习C#服务器端开发的实践经验和技巧', '本指南介绍了C#服务器端开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'security', 0, 2, NULL, '2024-05-12 18:03:51', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (218, 'C#框架与工具介绍', '2024-04-13 12:07:32', 6, 8, 4, '了解C#常用框架和开发工具', '本指南介绍了C#常用框架（如.NET Framework、ASP.NET等）和开发工具（如Visual Studio、NuGet等），适合开发者了解。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-06-24 21:56:34', 1, 202, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (219, 'C#项目管理与团队协作指南', '2024-04-20 18:08:33', 7, 8, 6, '学习C#项目管理和团队协作的方法和工具', '本指南介绍了C#项目管理和团队协作的常用方法、工具和实践经验，适合开发团队参考。', 'https://pan.baidu.com/s/ghi', 'vwx234', 1, 2, NULL, '2024-05-06 07:35:08', 1, 110, '');
INSERT INTO `t_article` VALUES (220, 'Go语言基础教程', '2024-03-29 21:10:32', 8, 8, 5, '适合初学者的Go语言基础教程', '本教程详细介绍了Go语言的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-14 12:19:19', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (221, 'Go语言进阶指南', '2024-03-26 17:42:40', 9, 8, 4, '深入学习Go语言进阶知识和技巧', '本指南介绍了Go语言的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/mno', 'webperf', 0, 2, NULL, '2024-04-24 01:50:14', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (222, 'Go语言并发编程实战', '2024-04-02 11:34:31', 10, 8, 2, '学习Go语言并发编程的实践经验和技巧', '本指南介绍了Go语言并发编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/pqr', 'mno345', 0, 2, NULL, '2024-05-04 19:59:46', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (223, 'C++基础教程', '2024-03-28 09:38:49', 11, 8, 7, '适合初学者的C++基础教程', '本教程详细介绍了C++的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/xxx', '123456', 0, 2, NULL, '2024-05-08 22:32:38', 1, 100, '');
INSERT INTO `t_article` VALUES (224, 'C++进阶指南', '2024-03-10 14:05:13', 12, 8, 5, '深入学习C++进阶知识和技巧', '本指南介绍了C++的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/yyy', 'abcdef', 1, 2, NULL, '2024-05-02 03:24:52', 1, 120, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (225, 'C++面向对象编程入门', '2024-04-01 19:25:41', 13, 8, 5, '学习C++面向对象编程的基础知识', '本指南介绍了C++面向对象编程的基本原理和常用技巧，适合初学者入门。', 'https://pan.baidu.com/s/zzz', 'password', 1, 2, NULL, '2024-05-16 05:47:07', 1, 150, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (226, 'C++图形用户界面开发指南', '2024-03-09 03:16:10', 14, 8, 4, '学习C++图形用户界面开发的基础知识和实践经验', '本指南介绍了C++图形用户界面开发的基本原理、常用组件和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/xyz', 'yz567', 0, 2, NULL, '2024-05-18 08:50:50', 1, 90, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (227, 'C++服务器端开发实战', '2024-03-28 01:09:29', 15, 8, 4, '学习C++服务器端开发的实践经验和技巧', '本指南介绍了C++服务器端开发的基本原理、常用技术和实际案例，适合开发者学习。', 'https://pan.baidu.com/s/abc', 'ghi789', 0, 2, NULL, '2024-05-06 12:44:47', 1, 80, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (228, 'C++框架与工具介绍', '2024-03-25 02:32:09', 16, 8, 4, '了解C++常用框架和开发工具', '本指南介绍了C++常用框架（如Qt、Boost等）和开发工具（如Visual Studio、CMake等），适合开发者了解。', 'https://pan.baidu.com/s/def', 'webperf', 1, 2, NULL, '2024-05-09 06:01:34', 0, 200, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (229, 'C++项目管理与团队协作指南', '2024-04-22 22:59:35', 17, 8, 5, '学习C++项目管理和团队协作的方法和工具', '本指南介绍了C++项目管理和团队协作的常用方法、工具和实践经验，适合开发团队参考。', 'https://pan.baidu.com/s/ghi', 'stu901', 1, 2, NULL, '2024-06-24 21:56:22', 0, 111, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (230, 'Swift基础教程', '2024-03-05 12:41:22', 18, 8, 4, '适合初学者的Swift基础教程', '本教程详细介绍了Swift的基本语法和常用功能，适合初学者学习。', 'https://pan.baidu.com/s/jkl', 'security', 1, 2, NULL, '2024-05-13 03:37:13', 1, 130, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (231, 'Swift进阶指南', '2024-04-10 17:07:47', 1, 8, 3, '深入学习Swift进阶知识和技巧', '本指南介绍了Swift的一些进阶用法和技巧，适合有一定基础的开发者阅读。', 'https://pan.baidu.com/s/mno', 'webperf', 0, 2, NULL, '2024-04-29 17:41:28', 1, 95, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (232, 'Swift并发编程实战', '2024-03-03 14:22:56', 2, 8, 2, '学习Swift并发编程的实践经验和技巧', '本指南介绍了Swift并发编程的基本概念、常见问题和解决方案，适合开发者学习。', 'https://pan.baidu.com/s/pqr', 'password', 0, 2, NULL, '2024-05-11 20:15:49', 1, 85, './src/main/webapp/static/files/20240529102904.mp3');
INSERT INTO `t_article` VALUES (233, 'Java', '2024-06-29 09:40:50', 14, 1, 3, 'Java\n', '<p>Java</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 0, './src/main/webapp/static/files/20240629094050.mp4');
INSERT INTO `t_article` VALUES (234, 'JAVA语言', '2024-06-29 09:48:20', 14, 1, 3, 'Java语言\n', '<p>Java语言</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 0, './src/main/webapp/static/files/20240629094820.mp4');
INSERT INTO `t_article` VALUES (235, 'JavaEE技术介绍', '2024-06-29 10:10:07', 14, 4, 4, 'JavaEE技术介绍\n', '<p>JavaEE技术介绍</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1123', 0, 1, NULL, NULL, 1, 0, './src/main/webapp/static/files/20240629101007.mp4');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
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
  `commentContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `date` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `articleAuthorId` int NULL DEFAULT NULL COMMENT '资源作者id',
  `state` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `articleId`(`articleId` ASC) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_comment' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 5, 1, '有帮助', '2024-05-24 21:11:11', 14, 1);
INSERT INTO `t_comment` VALUES (2, 6, 2, '文章写的很好', '2024-05-25 19:28:42', 14, 1);
INSERT INTO `t_comment` VALUES (3, 7, 3, '内容详细', '2024-05-25 09:09:18', 14, 1);
INSERT INTO `t_comment` VALUES (4, 8, 9, '信息量很大', '2024-05-27 17:18:06', 14, 1);
INSERT INTO `t_comment` VALUES (5, 6, 11, '是值得阅读的', '2024-05-27 22:51:55', 7, 2);
INSERT INTO `t_comment` VALUES (6, 1, 21, '有用', '2024-05-26 15:21:26', 6, 1);
INSERT INTO `t_comment` VALUES (7, 14, 21, '很好', '2024-05-26 18:54:34', 6, 1);
INSERT INTO `t_comment` VALUES (8, 14, 20, '有压力的一天', '2024-05-27 07:31:35', 6, 1);
INSERT INTO `t_comment` VALUES (9, 6, 22, '资源不错', '2024-05-27 08:06:34', 1, 1);
INSERT INTO `t_comment` VALUES (10, 7, 25, '非常有用', '2024-05-25 05:34:49', 8, 1);
INSERT INTO `t_comment` VALUES (11, 8, 26, '不错的文章', '2024-05-25 03:27:45', 9, 1);
INSERT INTO `t_comment` VALUES (12, 9, 27, '资源详细', '2024-05-25 06:48:47', 10, 1);
INSERT INTO `t_comment` VALUES (13, 10, 28, '信息丰富', '2024-05-24 16:55:22', 11, 1);
INSERT INTO `t_comment` VALUES (14, 11, 29, '值得阅读的一个资源', '2024-05-26 07:10:37', 12, 2);
INSERT INTO `t_comment` VALUES (15, 7, 25, '非常有帮助', '2024-05-25 09:49:54', 8, 1);
INSERT INTO `t_comment` VALUES (16, 8, 26, '不错的资源', '2024-05-27 15:15:42', 9, 1);
INSERT INTO `t_comment` VALUES (17, 9, 27, '非常详细', '2024-05-25 09:11:51', 10, 2);
INSERT INTO `t_comment` VALUES (18, 10, 28, '资源清晰具体', '2024-05-27 22:24:40', 11, 1);
INSERT INTO `t_comment` VALUES (19, 11, 29, '值得使用', '2024-05-25 21:12:10', 12, 1);

-- ----------------------------
-- Table structure for t_download_message
-- ----------------------------
DROP TABLE IF EXISTS `t_download_message`;
CREATE TABLE `t_download_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int NULL DEFAULT NULL COMMENT '下载者id',
  `articleId` int NULL DEFAULT NULL COMMENT '资源id',
  `message` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下载记录',
  `downloadDate` datetime NULL DEFAULT NULL COMMENT '下载时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `articleId`(`articleId` ASC) USING BTREE,
  CONSTRAINT `t_download_message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_download_message_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_download_message' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_download_message
-- ----------------------------
INSERT INTO `t_download_message` VALUES (1, 5, 19, '下载了：MUI全接触', '2024-05-28 21:06:06');
INSERT INTO `t_download_message` VALUES (2, 5, 10, '下载了：50份优秀Java求职者简历', '2024-06-06 09:11:32');
INSERT INTO `t_download_message` VALUES (3, 5, 7, '下载了：Postgresql数据库优化视频教程 下载', '2024-06-07 22:05:33');
INSERT INTO `t_download_message` VALUES (4, 5, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-05-26 18:13:37');
INSERT INTO `t_download_message` VALUES (5, 5, 19, '下载了：MUI全接触', '2024-05-29 08:31:19');
INSERT INTO `t_download_message` VALUES (6, 6, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-05-27 19:28:02');
INSERT INTO `t_download_message` VALUES (7, 6, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-06-05 22:39:13');
INSERT INTO `t_download_message` VALUES (8, 6, 15, '下载了：黑马JavaEE 57期', '2024-05-30 22:06:25');
INSERT INTO `t_download_message` VALUES (9, 6, 14, '下载了：mybatis教程pdf合集', '2024-05-31 02:28:31');
INSERT INTO `t_download_message` VALUES (10, 6, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-05-28 05:29:55');
INSERT INTO `t_download_message` VALUES (11, 6, 19, '下载了：MUI全接触', '2024-05-25 14:06:47');
INSERT INTO `t_download_message` VALUES (12, 6, 9, '下载了：mysql高级mycat集群视频&redis视频视频教程 下载', '2024-06-02 00:24:13');
INSERT INTO `t_download_message` VALUES (13, 5, 21, '下载了：Web前端技术', '2024-06-09 04:46:18');
INSERT INTO `t_download_message` VALUES (14, 5, 22, '下载了：Java技术全解', '2024-05-25 05:35:19');
INSERT INTO `t_download_message` VALUES (15, 5, 22, '下载了：Java技术全解', '2024-05-28 03:56:50');
INSERT INTO `t_download_message` VALUES (16, 5, 22, '下载了：Java技术全解', '2024-06-06 18:50:57');
INSERT INTO `t_download_message` VALUES (17, 5, 22, '下载了：Java技术全解', '2024-06-07 13:09:33');
INSERT INTO `t_download_message` VALUES (18, 5, 22, '下载了：Java技术全解', '2024-06-06 12:08:34');
INSERT INTO `t_download_message` VALUES (19, 5, 22, '下载了：Java技术全解', '2024-06-01 12:49:46');
INSERT INTO `t_download_message` VALUES (20, 5, 23, '下载了：MySQL数据库', '2024-06-05 11:10:28');
INSERT INTO `t_download_message` VALUES (21, 5, 24, '下载了：SQLServer数据库', '2024-05-30 09:19:27');
INSERT INTO `t_download_message` VALUES (22, 5, 24, '下载了：SQLServer数据库', '2024-06-07 03:50:32');
INSERT INTO `t_download_message` VALUES (23, 5, 24, '下载了：SQLServer数据库', '2024-05-27 21:23:13');
INSERT INTO `t_download_message` VALUES (24, 7, 19, '下载了：MUI全接触', '2024-05-28 06:52:39');
INSERT INTO `t_download_message` VALUES (25, 8, 10, '下载了：50份优秀Java求职者简历', '2024-06-07 17:55:57');
INSERT INTO `t_download_message` VALUES (26, 8, 7, '下载了：Postgresql数据库优化视频教程 下载', '2024-05-31 00:45:53');
INSERT INTO `t_download_message` VALUES (27, 6, 19, '下载了：MUI全接触', '2024-06-06 17:50:50');
INSERT INTO `t_download_message` VALUES (28, 9, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-05-25 14:31:21');
INSERT INTO `t_download_message` VALUES (29, 10, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-06-02 09:11:28');
INSERT INTO `t_download_message` VALUES (30, 11, 15, '下载了：黑马JavaEE 57期', '2024-06-01 05:42:34');
INSERT INTO `t_download_message` VALUES (31, 15, 14, '下载了：mybatis教程pdf合集', '2024-05-25 15:04:13');
INSERT INTO `t_download_message` VALUES (32, 16, 19, '下载了：MUI全接触', '2024-05-28 06:09:23');
INSERT INTO `t_download_message` VALUES (33, 7, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-06-02 03:02:01');
INSERT INTO `t_download_message` VALUES (34, 1, 34, '下载了：数据结构与算法分析', '2024-05-31 05:41:34');
INSERT INTO `t_download_message` VALUES (35, 1, 28, '下载了：Java并发编程', '2024-06-07 13:50:27');
INSERT INTO `t_download_message` VALUES (36, 1, 34, '下载了：数据结构与算法分析', '2024-06-09 17:55:08');
INSERT INTO `t_download_message` VALUES (37, 21, 34, '下载了：数据结构与算法分析', '2024-06-03 20:57:26');
INSERT INTO `t_download_message` VALUES (38, 9, 170, '下载了：Java程序员职业规划', '2024-06-04 10:17:28');
INSERT INTO `t_download_message` VALUES (39, 8, 40, '下载了：计算机网络原理', '2024-06-03 23:25:22');
INSERT INTO `t_download_message` VALUES (40, 19, 195, '下载了：移动端跨平台开发技术选型', '2024-06-04 16:55:37');
INSERT INTO `t_download_message` VALUES (41, 6, 111, '下载了：Java面向对象编程入门', '2024-06-06 07:01:45');
INSERT INTO `t_download_message` VALUES (42, 12, 26, '下载了：Java基础入门', '2024-06-02 17:51:36');
INSERT INTO `t_download_message` VALUES (43, 16, 94, '下载了：Python进阶指南', '2024-06-02 11:55:13');
INSERT INTO `t_download_message` VALUES (44, 16, 26, '下载了：Java基础入门', '2024-06-05 00:11:16');
INSERT INTO `t_download_message` VALUES (45, 19, 206, '下载了：微服务容器化部署实践指南', '2024-06-01 11:13:12');
INSERT INTO `t_download_message` VALUES (46, 8, 50, '下载了：JavaEE JMS', '2024-05-28 17:59:25');
INSERT INTO `t_download_message` VALUES (47, 13, 12, '下载了：高级架构师进阶24天视频教程', '2024-05-26 06:18:01');
INSERT INTO `t_download_message` VALUES (48, 19, 52, '下载了：JavaEE Testing', '2024-05-28 00:16:32');
INSERT INTO `t_download_message` VALUES (49, 11, 44, '下载了：JavaEE Servlets', '2024-06-06 08:43:27');
INSERT INTO `t_download_message` VALUES (50, 21, 58, '下载了：NoSQL Databases', '2024-05-31 07:21:51');
INSERT INTO `t_download_message` VALUES (51, 12, 76, '下载了：Docker容器化技术在微服务中的应用', '2024-06-08 10:37:46');
INSERT INTO `t_download_message` VALUES (52, 9, 113, '下载了：Java并发编程实战', '2024-05-28 00:14:25');
INSERT INTO `t_download_message` VALUES (53, 15, 192, '下载了：Python深度学习实战指南', '2024-06-06 04:24:54');
INSERT INTO `t_download_message` VALUES (54, 1, 214, '下载了：C#进阶指南', '2024-06-01 14:02:11');
INSERT INTO `t_download_message` VALUES (55, 2, 223, '下载了：C++基础教程', '2024-06-02 20:15:55');
INSERT INTO `t_download_message` VALUES (56, 6, 219, '下载了：C#项目管理与团队协作指南', '2024-06-01 13:26:44');
INSERT INTO `t_download_message` VALUES (57, 12, 172, '下载了：数据库监控与性能调优实践', '2024-05-26 10:52:50');
INSERT INTO `t_download_message` VALUES (58, 3, 222, '下载了：Go语言并发编程实战', '2024-05-25 21:41:10');
INSERT INTO `t_download_message` VALUES (59, 16, 151, '下载了：Java网络框架实战', '2024-06-04 06:40:00');
INSERT INTO `t_download_message` VALUES (60, 13, 180, '下载了：Spring Security安全开发实践', '2024-06-06 18:35:45');
INSERT INTO `t_download_message` VALUES (61, 10, 25, '下载了：SQLServer数据库', '2024-06-01 12:14:33');
INSERT INTO `t_download_message` VALUES (62, 4, 72, '下载了：前端框架选型指南', '2024-06-04 18:49:52');
INSERT INTO `t_download_message` VALUES (63, 6, 184, '下载了：Python高级编程技巧', '2024-06-02 01:29:17');
INSERT INTO `t_download_message` VALUES (64, 15, 64, '下载了：JavaScript高级编程技巧', '2024-05-29 11:48:13');
INSERT INTO `t_download_message` VALUES (65, 13, 109, '下载了：Java基础教程', '2024-06-08 05:46:49');
INSERT INTO `t_download_message` VALUES (66, 9, 18, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-06-08 07:06:50');
INSERT INTO `t_download_message` VALUES (67, 7, 53, '下载了：Introduction to SQL', '2024-06-04 14:32:37');
INSERT INTO `t_download_message` VALUES (68, 9, 145, '下载了：数据库安全防护指南', '2024-05-29 02:01:58');
INSERT INTO `t_download_message` VALUES (69, 10, 166, '下载了：CSS3动画效果实践指南', '2024-06-03 13:33:47');
INSERT INTO `t_download_message` VALUES (70, 2, 210, '下载了：微服务架构中的安全防护', '2024-05-29 20:30:18');
INSERT INTO `t_download_message` VALUES (72, 3, 70, '下载了：前端安全指南', '2024-06-09 10:31:43');
INSERT INTO `t_download_message` VALUES (73, 1, 137, '下载了：Python数据分析实战', '2024-05-30 12:56:13');
INSERT INTO `t_download_message` VALUES (74, 13, 102, '下载了：Python开发工具与环境配置指南', '2024-05-28 12:16:08');
INSERT INTO `t_download_message` VALUES (75, 15, 216, '下载了：C#图形用户界面开发指南', '2024-06-04 08:48:00');
INSERT INTO `t_download_message` VALUES (76, 7, 4, '下载了：2024年java常见笔试面试题汇总(附答案)', '2024-05-28 12:08:39');
INSERT INTO `t_download_message` VALUES (77, 17, 118, '下载了：Java项目管理与团队协作指南', '2024-06-04 11:35:01');
INSERT INTO `t_download_message` VALUES (78, 18, 177, '下载了：JavaScript异步编程实践', '2024-06-02 05:36:51');
INSERT INTO `t_download_message` VALUES (79, 17, 97, '下载了：Python人工智能入门', '2024-05-25 03:44:11');
INSERT INTO `t_download_message` VALUES (80, 12, 21, '下载了：Web前端技术', '2024-06-07 19:28:32');
INSERT INTO `t_download_message` VALUES (81, 20, 12, '下载了：高级架构师进阶24天视频教程', '2024-06-07 23:15:37');
INSERT INTO `t_download_message` VALUES (82, 17, 62, '下载了：Optimizing Database Performance', '2024-05-25 15:21:44');
INSERT INTO `t_download_message` VALUES (83, 4, 174, '下载了：React.js实战指南', '2024-06-02 16:45:50');
INSERT INTO `t_download_message` VALUES (84, 20, 148, '下载了：前端性能优化实践指南', '2024-06-06 06:37:01');
INSERT INTO `t_download_message` VALUES (85, 7, 75, '下载了：分布式系统中的数据一致性问题', '2024-06-04 00:09:49');
INSERT INTO `t_download_message` VALUES (86, 7, 170, '下载了：Java程序员职业规划', '2024-06-02 00:33:52');
INSERT INTO `t_download_message` VALUES (87, 5, 182, '下载了：Vue.js前端开发指南', '2024-06-09 17:02:02');
INSERT INTO `t_download_message` VALUES (88, 13, 197, '下载了：移动端原生开发技术解析', '2024-06-05 01:01:18');
INSERT INTO `t_download_message` VALUES (89, 10, 206, '下载了：微服务容器化部署实践指南', '2024-06-03 04:51:27');
INSERT INTO `t_download_message` VALUES (90, 1, 98, '下载了：Python机器学习实战', '2024-06-04 09:56:42');
INSERT INTO `t_download_message` VALUES (91, 13, 181, '下载了：Java设计模式详解', '2024-06-08 11:43:43');
INSERT INTO `t_download_message` VALUES (92, 11, 30, '下载了：Spring框架入门', '2024-05-31 22:51:52');
INSERT INTO `t_download_message` VALUES (93, 4, 59, '下载了：Database Security', '2024-06-01 19:48:58');
INSERT INTO `t_download_message` VALUES (94, 12, 69, '下载了：Angular框架入门教程', '2024-06-07 04:02:54');
INSERT INTO `t_download_message` VALUES (95, 6, 123, '下载了：JavaEE安全开发实践', '2024-05-28 08:10:49');
INSERT INTO `t_download_message` VALUES (96, 8, 126, '下载了：JavaEE缓存技术应用指南', '2024-05-31 20:32:34');
INSERT INTO `t_download_message` VALUES (97, 13, 127, '下载了：JavaEE监控与管理实践指南', '2024-06-07 09:11:08');
INSERT INTO `t_download_message` VALUES (98, 17, 122, '下载了：JavaEE数据库编程指南', '2024-06-02 11:12:46');
INSERT INTO `t_download_message` VALUES (99, 11, 166, '下载了：CSS3动画效果实践指南', '2024-05-29 11:58:28');
INSERT INTO `t_download_message` VALUES (100, 5, 128, '下载了：JavaEE性能优化实践指南', '2024-05-28 14:11:15');
INSERT INTO `t_download_message` VALUES (101, 9, 197, '下载了：移动端原生开发技术解析', '2024-06-06 09:58:21');
INSERT INTO `t_download_message` VALUES (102, 20, 95, '下载了：Python数据分析入门', '2024-05-25 16:44:18');
INSERT INTO `t_download_message` VALUES (103, 19, 116, '下载了：Java框架与工具介绍', '2024-06-08 07:25:01');
INSERT INTO `t_download_message` VALUES (104, 18, 170, '下载了：Java程序员职业规划', '2024-06-04 19:19:40');
INSERT INTO `t_download_message` VALUES (105, 5, 160, '下载了：前端跨平台开发技术介绍', '2024-05-31 06:42:52');
INSERT INTO `t_download_message` VALUES (106, 3, 100, '下载了：Python Web开发入门', '2024-05-25 02:19:54');
INSERT INTO `t_download_message` VALUES (107, 6, 110, '下载了：Java进阶指南', '2024-06-06 08:34:51');
INSERT INTO `t_download_message` VALUES (108, 5, 201, '下载了：移动APP测试与发布流程', '2024-05-26 08:48:33');
INSERT INTO `t_download_message` VALUES (109, 21, 71, '下载了：TypeScript入门教程', '2024-05-26 17:22:50');
INSERT INTO `t_download_message` VALUES (110, 21, 121, '下载了：JavaEE企业应用开发实战', '2024-06-09 04:21:51');
INSERT INTO `t_download_message` VALUES (111, 11, 156, '下载了：NoSQL数据库介绍与应用', '2024-05-31 21:10:18');
INSERT INTO `t_download_message` VALUES (112, 4, 32, '下载了：Spring Boot入门', '2024-06-09 03:44:56');
INSERT INTO `t_download_message` VALUES (113, 4, 14, '下载了：mybatis教程pdf合集', '2024-06-09 23:11:36');
INSERT INTO `t_download_message` VALUES (114, 13, 169, '下载了：Java开源项目解析', '2024-06-04 11:55:13');
INSERT INTO `t_download_message` VALUES (115, 21, 184, '下载了：Python高级编程技巧', '2024-06-07 19:15:08');
INSERT INTO `t_download_message` VALUES (116, 5, 43, '下载了：JavaEE Overview', '2024-06-01 19:07:07');
INSERT INTO `t_download_message` VALUES (117, 19, 112, '下载了：Java集合框架详解', '2024-06-04 04:41:45');
INSERT INTO `t_download_message` VALUES (118, 3, 43, '下载了：JavaEE Overview', '2024-06-06 21:20:53');
INSERT INTO `t_download_message` VALUES (119, 21, 128, '下载了：JavaEE性能优化实践指南', '2024-06-08 13:14:20');
INSERT INTO `t_download_message` VALUES (120, 18, 184, '下载了：Python高级编程技巧', '2024-06-01 22:43:54');
INSERT INTO `t_download_message` VALUES (121, 1, 198, '下载了：移动APP性能优化实践指南', '2024-06-05 17:53:25');
INSERT INTO `t_download_message` VALUES (122, 3, 1, '下载了：JavaScript基础教程', '2024-06-09 20:13:33');
INSERT INTO `t_download_message` VALUES (123, 5, 105, '下载了：关系型数据库管理系统入门', '2024-05-25 07:13:29');
INSERT INTO `t_download_message` VALUES (124, 1, 154, '下载了：Java图像处理技术', '2024-05-27 06:20:58');
INSERT INTO `t_download_message` VALUES (125, 13, 5, '下载了：常用日期函数', '2024-06-08 11:00:00');
INSERT INTO `t_download_message` VALUES (126, 4, 198, '下载了：移动APP性能优化实践指南', '2024-05-28 17:43:33');
INSERT INTO `t_download_message` VALUES (127, 13, 210, '下载了：微服务架构中的安全防护', '2024-05-26 19:12:08');
INSERT INTO `t_download_message` VALUES (128, 6, 86, '下载了：Android应用开发入门指南', '2024-05-31 15:45:31');
INSERT INTO `t_download_message` VALUES (129, 6, 219, '下载了：C#项目管理与团队协作指南', '2024-05-29 11:28:24');
INSERT INTO `t_download_message` VALUES (130, 7, 152, '下载了：Java微服务架构设计与实践', '2024-06-08 16:54:38');
INSERT INTO `t_download_message` VALUES (131, 7, 220, '下载了：Go语言基础教程', '2024-05-27 05:26:27');
INSERT INTO `t_download_message` VALUES (132, 8, 185, '下载了：Python网络爬虫实战指南', '2024-05-25 17:54:22');
INSERT INTO `t_download_message` VALUES (133, 17, 172, '下载了：数据库监控与性能调优实践', '2024-05-28 13:29:38');
INSERT INTO `t_download_message` VALUES (134, 21, 196, '下载了：移动APP前端框架选型', '2024-05-31 20:33:35');
INSERT INTO `t_download_message` VALUES (135, 10, 54, '下载了：Advanced SQL Queries', '2024-06-09 10:58:17');
INSERT INTO `t_download_message` VALUES (136, 10, 64, '下载了：JavaScript高级编程技巧', '2024-05-28 16:51:56');
INSERT INTO `t_download_message` VALUES (137, 5, 120, '下载了：JavaEE Web开发指南', '2024-06-01 08:01:08');
INSERT INTO `t_download_message` VALUES (138, 5, 3, '下载了：SQLServer数据库', '2024-06-24 21:53:03');
INSERT INTO `t_download_message` VALUES (139, 5, 218, '下载了：C#框架与工具介绍', '2024-06-24 21:56:36');
INSERT INTO `t_download_message` VALUES (140, 5, 53, '下载了：Introduction to SQL', '2024-06-24 21:57:31');
INSERT INTO `t_download_message` VALUES (141, 14, 56, '下载了：Indexing in Databases', '2024-06-24 22:00:44');
INSERT INTO `t_download_message` VALUES (142, 14, 55, '下载了：Database Normalization', '2024-06-24 22:00:55');
INSERT INTO `t_download_message` VALUES (143, 14, 59, '下载了：Database Security', '2024-06-24 22:01:07');
INSERT INTO `t_download_message` VALUES (144, 14, 62, '下载了：Optimizing Database Performance', '2024-06-24 22:01:17');
INSERT INTO `t_download_message` VALUES (145, 14, 6, '下载了：Java并发编程', '2024-06-29 09:42:03');
INSERT INTO `t_download_message` VALUES (146, 14, 6, '下载了：Java并发编程', '2024-06-29 09:42:05');
INSERT INTO `t_download_message` VALUES (147, 14, 3, '下载了：SQLServer数据库', '2024-06-29 09:47:20');
INSERT INTO `t_download_message` VALUES (148, 26, 2, '下载了：MySQL数据库', '2024-06-29 10:08:40');

-- ----------------------------
-- Table structure for t_information
-- ----------------------------
DROP TABLE IF EXISTS `t_information`;
CREATE TABLE `t_information`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int NULL DEFAULT NULL COMMENT '消息所属者id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `t_information_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'int_formation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_information
-- ----------------------------
INSERT INTO `t_information` VALUES (1, 6, '你的资源(Java编程思想)的分享链接已经失效,请及时更新', '2024-04-12 08:03:54');
INSERT INTO `t_information` VALUES (2, 6, '已通过资源', '2024-05-17 17:58:18');
INSERT INTO `t_information` VALUES (3, 6, '已减少积分50', '2024-04-02 21:29:20');
INSERT INTO `t_information` VALUES (4, 14, '已增加积分50', '2024-06-07 23:25:35');
INSERT INTO `t_information` VALUES (5, 7, '你的资源的分享链接已经通过', '2024-05-30 00:22:11');
INSERT INTO `t_information` VALUES (6, 8, '你的资源的分享链接已经失效,请及时更新', '2024-04-13 23:15:25');
INSERT INTO `t_information` VALUES (7, 9, '你的资源的分享链接已经通过', '2024-05-11 21:17:31');
INSERT INTO `t_information` VALUES (8, 10, '你的资源的分享链接已经失效,请及时更新', '2024-05-12 04:10:43');
INSERT INTO `t_information` VALUES (9, 11, '你的资源的分享链接已经通过', '2024-05-03 12:02:16');
INSERT INTO `t_information` VALUES (10, 6, '你的资源的分享链接已经失效,请及时更新', '2024-06-03 07:57:26');
INSERT INTO `t_information` VALUES (11, 14, '你的资源的分享链接已经通过\r\n你的资源的分享链接已经失效,请及时更新', '2024-04-08 20:01:45');
INSERT INTO `t_information` VALUES (12, 6, '已通过资源', '2024-05-25 06:00:02');
INSERT INTO `t_information` VALUES (13, 6, '已减少积分50', '2024-05-06 19:46:03');
INSERT INTO `t_information` VALUES (14, 14, '已增加积分50', '2024-05-21 17:28:20');
INSERT INTO `t_information` VALUES (15, 6, '你有一条新消息，请查收', '2024-05-15 13:10:07');
INSERT INTO `t_information` VALUES (16, 7, '你的积分已增加100', '2024-06-03 06:23:29');
INSERT INTO `t_information` VALUES (17, 8, '请更新你的联系方式', '2024-06-14 09:34:31');
INSERT INTO `t_information` VALUES (18, 9, '有新的评论回复你', '2024-06-08 21:14:35');
INSERT INTO `t_information` VALUES (19, 15, '你的资源被下载', '2024-05-24 00:44:14');
INSERT INTO `t_information` VALUES (20, 14, '每日签到提醒', '2024-04-05 01:07:54');
INSERT INTO `t_information` VALUES (21, 10, '你的文章被点赞', '2024-05-11 19:28:52');
INSERT INTO `t_information` VALUES (22, 11, '系统维护通知', '2024-04-27 18:53:42');
INSERT INTO `t_information` VALUES (23, 12, '账号安全提醒', '2024-04-17 19:15:25');
INSERT INTO `t_information` VALUES (24, 13, '新的登录地点', '2024-04-20 19:40:56');
INSERT INTO `t_information` VALUES (25, 14, '资料更新成功', '2024-04-20 09:26:03');
INSERT INTO `t_information` VALUES (26, 15, '密码修改提醒', '2024-04-13 20:11:28');
INSERT INTO `t_information` VALUES (27, 16, '新的关注者', '2024-04-04 19:26:33');
INSERT INTO `t_information` VALUES (28, 17, '积分减少50', '2024-04-20 23:55:12');
INSERT INTO `t_information` VALUES (29, 18, '有新的推荐文章', '2024-05-29 08:09:02');
INSERT INTO `t_information` VALUES (30, 9, '评论被回复', '2024-06-09 02:14:12');
INSERT INTO `t_information` VALUES (31, 10, '新的系统更新', '2024-05-08 06:53:03');
INSERT INTO `t_information` VALUES (32, 11, '你的文章被收藏', '2024-04-20 06:21:51');
INSERT INTO `t_information` VALUES (33, 12, '积分活动通知', '2024-04-16 04:42:10');
INSERT INTO `t_information` VALUES (34, 13, '新的好友请求', '2024-05-14 04:20:19');
INSERT INTO `t_information` VALUES (35, 8, '已添加积分', '2024-06-29 09:52:56');
INSERT INTO `t_information` VALUES (36, 8, '已减少积分', '2024-06-29 10:17:07');

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
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
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `time` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '系统维护的通知', '系统将在本周六凌晨进行维护，预计持续时间为2小时。请各位用户提前保存工作。', '2024-06-29 10:16:18');
INSERT INTO `t_notice` VALUES (2, '新功能上线啦', '我们很高兴地宣布，新版本的系统已经上线，包含以下新功能...', '2024-06-29 09:52:19');
INSERT INTO `t_notice` VALUES (3, '假期安排', '根据公司安排，节期间放假3天，放假时间为...', '2024-06-05 06:24:04');
INSERT INTO `t_notice` VALUES (4, '重要通知', '由于政策变动，请大家尽快更新个人信息，以免影响正常使用。', '2024-05-20 20:56:10');
INSERT INTO `t_notice` VALUES (5, '内部培训', '本月公司将组织一次内部培训，主要内容为...', '2024-05-07 04:45:33');
INSERT INTO `t_notice` VALUES (6, '内部测试', '这是一条仅对内部公开的测试公告。', '2024-05-04 00:27:01');
INSERT INTO `t_notice` VALUES (7, '内部讨论', '请各部门提交下一季度的工作计划。', '2024-05-01 14:12:43');

-- ----------------------------
-- Table structure for t_recommended
-- ----------------------------
DROP TABLE IF EXISTS `t_recommended`;
CREATE TABLE `t_recommended`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `userId` int NULL DEFAULT NULL COMMENT '推荐用户ID',
  `time` datetime NOT NULL COMMENT '推荐时间',
  `allRecommendedIds` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '全部推荐资源集合',
  `similarUserIds` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相似用户集合',
  `articleId1` int NULL DEFAULT NULL COMMENT '推荐资源1ID',
  `articleId2` int NULL DEFAULT NULL COMMENT '推荐资源2ID',
  `articleId3` int NULL DEFAULT NULL COMMENT '推荐资源3ID',
  `articleId4` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId5` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId6` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId7` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId8` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId9` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  `articleId10` int NULL DEFAULT NULL COMMENT '推荐资源ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_recommended
-- ----------------------------
INSERT INTO `t_recommended` VALUES (1, 14, '2024-06-02 20:31:46', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 16, 70, 75, 151, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (2, 14, '2024-06-02 20:32:02', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 15, 94, 126, 152, 170, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (3, 14, '2024-06-02 20:32:47', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 53, 70, 94, 110, 111, 123, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (4, 14, '2024-06-02 20:33:03', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 14, 16, 123, 170, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (5, 14, '2024-06-02 20:33:04', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 75, 94, 100, 111, 123, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (6, 14, '2024-06-02 20:33:04', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 70, 100, 111, 126, 170, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (7, 14, '2024-06-02 20:33:05', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 53, 86, 94, 110, 170, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (8, 14, '2024-06-02 20:43:39', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 86, 100, 123, 126, 151, 184, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (9, 14, '2024-06-02 20:43:39', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 50, 111, 151, 170, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (10, 14, '2024-06-02 20:55:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 16, 26, 110, 111, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (11, 14, '2024-06-02 20:57:58', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 15, 16, 40, 53, 70, 86, NULL, NULL);
INSERT INTO `t_recommended` VALUES (12, 14, '2024-06-02 21:00:24', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 15, 26, 50, 94, 152, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (13, 14, '2024-06-02 21:00:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 53, 86, 123, 151, 170, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (14, 14, '2024-06-02 21:00:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 16, 40, 53, 123, 151, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (15, 14, '2024-06-02 21:00:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 16, 26, 40, 70, 111, 123, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (16, 14, '2024-06-02 21:00:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 16, 75, 86, 100, 152, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (17, 14, '2024-06-02 21:00:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 15, 53, 70, 75, 123, 152, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (18, 14, '2024-06-02 21:00:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 53, 100, 110, 126, 152, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (19, 14, '2024-06-02 21:00:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 16, 40, 50, 75, 86, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (20, 14, '2024-06-02 21:00:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 16, 26, 100, 111, 123, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (21, 14, '2024-06-02 21:00:29', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 14, 26, 53, 70, 86, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (22, 14, '2024-06-02 21:00:29', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 26, 53, 70, 86, 111, 151, NULL, NULL);
INSERT INTO `t_recommended` VALUES (23, 14, '2024-06-02 21:00:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 15, 40, 86, 111, 123, 151, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (24, 14, '2024-06-02 21:00:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 75, 126, 184, 185, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (25, 14, '2024-06-02 21:00:31', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 16, 94, 126, 170, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (26, 14, '2024-06-02 21:00:31', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 86, 94, 126, 152, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (27, 14, '2024-06-02 21:00:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 50, 86, 100, 110, 151, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (28, 14, '2024-06-02 21:00:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 40, 53, 110, 123, 151, 152, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (29, 14, '2024-06-02 21:00:33', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 15, 53, 86, 111, 126, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (30, 14, '2024-06-02 21:00:33', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 16, 86, 100, 111, 170, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (31, 14, '2024-06-02 21:02:31', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 16, 40, 86, 94, 110, 126, 151, NULL, NULL);
INSERT INTO `t_recommended` VALUES (32, 14, '2024-06-02 21:02:34', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 15, 40, 70, 75, 110, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (33, 14, '2024-06-02 21:02:36', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 70, 86, 100, 110, 123, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (34, 14, '2024-06-02 21:02:37', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 40, 50, 75, 111, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (35, 14, '2024-06-02 21:02:37', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 16, 75, 94, 100, 111, 123, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (36, 14, '2024-06-02 21:02:38', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 26, 40, 86, 110, 111, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (37, 14, '2024-06-02 21:02:38', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 70, 86, 94, 126, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (38, 14, '2024-06-02 21:02:39', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 50, 70, 75, 126, 152, 184, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (39, 14, '2024-06-02 21:02:41', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 16, 53, 75, 110, 123, 151, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (40, 14, '2024-06-02 21:02:42', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 16, 50, 75, 86, 151, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (41, 14, '2024-06-02 21:02:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 16, 53, 100, 110, 123, 126, NULL, NULL);
INSERT INTO `t_recommended` VALUES (42, 14, '2024-06-02 21:02:45', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 16, 50, 123, 126, 170, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (43, 14, '2024-06-02 21:02:46', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 53, 70, 110, 111, 126, 151, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (44, 14, '2024-06-02 21:02:47', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 75, 86, 94, 100, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (45, 14, '2024-06-02 21:03:21', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 26, 100, 151, 152, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (46, 14, '2024-06-02 21:07:20', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 16, 53, 110, 111, 170, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (47, 14, '2024-06-02 21:07:21', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 14, 15, 40, 50, 111, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (48, 14, '2024-06-02 21:07:22', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 26, 40, 50, 70, 94, 111, NULL, NULL);
INSERT INTO `t_recommended` VALUES (49, 14, '2024-06-02 21:07:22', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 53, 75, 94, 110, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (50, 14, '2024-06-02 21:07:25', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 26, 40, 86, 123, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (51, 14, '2024-06-02 21:07:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 16, 50, 86, 110, 152, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (52, 14, '2024-06-02 21:07:29', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 50, 110, 111, 123, 126, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (53, 14, '2024-06-02 21:07:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 26, 70, 75, 111, 123, 126, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (54, 14, '2024-06-02 21:07:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 75, 86, 94, 100, 110, 111, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (55, 14, '2024-06-02 21:09:17', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 15, 94, 110, 111, 123, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (56, 14, '2024-06-02 21:09:18', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 26, 53, 86, 100, 110, 151, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (57, 14, '2024-06-02 21:09:18', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 15, 50, 94, 110, 111, 152, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (58, 14, '2024-06-02 21:09:19', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 26, 70, 86, 94, 100, 110, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (59, 14, '2024-06-02 21:09:22', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 40, 50, 70, 86, 100, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (60, 14, '2024-06-02 21:09:23', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 53, 86, 152, 170, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (61, 14, '2024-06-02 21:09:25', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 26, 40, 53, 70, 75, 94, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (62, 14, '2024-06-02 21:09:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 14, 15, 94, 123, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (63, 14, '2024-06-02 21:09:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 86, 111, 126, 152, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (64, 14, '2024-06-02 21:09:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 16, 53, 70, 86, 110, 126, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (65, 14, '2024-06-02 21:09:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 26, 50, 111, 123, 152, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (66, 14, '2024-06-02 21:09:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 70, 75, 100, 111, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (67, 14, '2024-06-02 21:09:31', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 15, 53, 86, 126, 185, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (68, 14, '2024-06-02 21:09:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 50, 70, 110, 123, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (69, 14, '2024-06-02 21:09:33', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 16, 26, 86, 100, 184, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (70, 14, '2024-06-02 21:09:34', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 40, 100, 126, 184, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (71, 14, '2024-06-02 21:09:35', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 15, 26, 111, 123, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (72, 14, '2024-06-02 21:09:36', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 15, 86, 100, 111, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (73, 14, '2024-06-02 21:09:37', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 40, 53, 94, 110, 111, 126, 152, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (74, 14, '2024-06-02 21:16:55', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 15, 50, 53, 86, 151, 184, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (75, 14, '2024-06-02 21:16:57', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 40, 53, 86, 152, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (76, 14, '2024-06-02 21:16:59', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 26, 53, 94, 110, 126, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (77, 14, '2024-06-02 21:17:01', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 53, 86, 110, 111, 123, 126, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (78, 14, '2024-06-02 21:17:02', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 15, 16, 53, 86, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (79, 14, '2024-06-02 21:17:04', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 53, 75, 110, 111, 123, 126, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (80, 14, '2024-06-02 21:18:18', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 15, 16, 50, 86, 151, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (81, 14, '2024-06-02 21:18:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 40, 53, 111, 126, 170, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (82, 14, '2024-06-02 21:18:35', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 16, 53, 70, 94, 123, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (83, 14, '2024-06-02 21:18:36', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 70, 111, 123, 151, 170, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (84, 14, '2024-06-02 21:18:37', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 50, 75, 86, 111, 126, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (85, 14, '2024-06-02 21:18:38', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 15, 16, 94, 111, 123, 126, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (86, 14, '2024-06-02 21:18:41', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 9, 14, 16, 86, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (87, 14, '2024-06-02 21:18:42', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 15, 40, 53, 100, 126, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (88, 14, '2024-06-02 21:18:43', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 40, 70, 100, 123, 152, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (89, 14, '2024-06-02 21:18:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 40, 50, 86, 100, 111, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (90, 14, '2024-06-02 21:18:45', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 75, 86, 100, 170, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (91, 14, '2024-06-02 21:18:47', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 50, 86, 110, 126, 151, 152, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (92, 14, '2024-06-02 21:18:48', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 70, 110, 123, 126, 152, 170, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (93, 14, '2024-06-02 21:18:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 16, 26, 40, 123, 151, 152, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (94, 14, '2024-06-02 21:18:53', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 50, 53, 94, 110, 123, 126, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (95, 14, '2024-06-02 21:18:54', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 26, 86, 100, 126, 152, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (96, 14, '2024-06-02 21:18:55', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 16, 53, 94, 100, 151, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (97, 14, '2024-06-02 21:19:41', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 26, 100, 110, 151, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (98, 14, '2024-06-02 21:19:43', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 86, 111, 126, 151, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (99, 14, '2024-06-02 21:19:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 75, 86, 110, 111, 123, 126, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (100, 14, '2024-06-02 21:19:45', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 40, 70, 86, 123, 126, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (101, 14, '2024-06-02 21:19:58', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 50, 53, 75, 151, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (102, 14, '2024-06-02 21:21:05', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 75, 94, 100, 110, 123, 126, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (103, 14, '2024-06-02 21:21:09', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 50, 53, 86, 100, 126, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (104, 14, '2024-06-02 21:21:10', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 50, 86, 100, 111, 152, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (105, 1, '2024-06-03 11:23:05', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 43, 59, 70, 72, 100, 196, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (106, 1, '2024-06-05 16:18:38', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 71, 121, 174, 182, 196, 201, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (107, 1, '2024-06-05 16:18:40', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 14, 43, 59, 71, 72, 121, 201, NULL, NULL);
INSERT INTO `t_recommended` VALUES (108, 1, '2024-06-05 16:18:42', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 32, 58, 71, 100, 121, 182, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (109, 1, '2024-06-05 16:18:45', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 43, 70, 121, 128, 196, 201, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (110, 1, '2024-06-05 16:18:46', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 72, 100, 128, 182, 184, 201, 217, NULL, NULL);
INSERT INTO `t_recommended` VALUES (111, 1, '2024-06-05 16:18:50', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 32, 43, 58, 72, 100, 210, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (112, 1, '2024-06-05 16:24:25', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 43, 59, 71, 72, 128, 210, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (113, 1, '2024-06-05 16:24:44', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 32, 43, 59, 72, 100, 196, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (114, 1, '2024-06-05 16:24:47', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 70, 121, 128, 174, 196, 210, 217, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (115, 1, '2024-06-05 16:24:49', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 32, 43, 70, 71, 128, 174, 196, 201, NULL, NULL);
INSERT INTO `t_recommended` VALUES (116, 1, '2024-06-05 16:24:50', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 70, 71, 121, 174, 182, 196, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (117, 1, '2024-06-05 16:24:52', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 100, 121, 174, 201, 210, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (118, 1, '2024-06-05 16:24:53', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 58, 72, 100, 174, 210, 217, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (119, 1, '2024-06-05 16:24:53', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 32, 59, 100, 174, 182, 184, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (120, 1, '2024-06-05 16:24:54', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 72, 128, 201, 210, 217, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (121, 1, '2024-06-05 16:24:54', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 43, 58, 72, 100, 196, 201, 210, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (122, 1, '2024-06-05 16:24:56', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 58, 59, 71, 128, 184, 201, 217, NULL, NULL);
INSERT INTO `t_recommended` VALUES (123, 1, '2024-06-05 16:24:57', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 14, 70, 100, 121, 174, 182, 210, NULL, NULL);
INSERT INTO `t_recommended` VALUES (124, 1, '2024-06-05 16:24:58', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 32, 43, 58, 59, 182, 196, 217, NULL, NULL);
INSERT INTO `t_recommended` VALUES (125, 1, '2024-06-05 16:24:58', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 72, 121, 184, 196, 210, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (126, 1, '2024-06-05 16:24:59', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 59, 72, 100, 174, 201, 210, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (127, 1, '2024-06-05 16:25:01', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 58, 70, 100, 128, 201, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (128, 1, '2024-06-05 16:25:02', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 32, 43, 71, 182, 184, 196, 210, NULL, NULL);
INSERT INTO `t_recommended` VALUES (129, 1, '2024-06-05 16:25:02', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 72, 100, 121, 128, 182, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (130, 1, '2024-06-05 16:25:05', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 32, 71, 100, 121, 174, 196, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (131, 1, '2024-06-05 16:25:08', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 14, 43, 58, 128, 196, 201, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (132, 14, '2024-06-05 16:36:21', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 14, 15, 40, 50, 100, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (133, 14, '2024-06-05 16:36:24', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 26, 40, 50, 126, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (134, 14, '2024-06-05 16:36:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 53, 70, 75, 94, 110, 170, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (135, 14, '2024-06-05 16:36:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 40, 111, 123, 151, 152, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (136, 14, '2024-06-05 16:36:38', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 50, 53, 100, 152, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (137, 14, '2024-06-05 16:36:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 40, 53, 70, 86, 94, 100, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (138, 14, '2024-06-05 16:36:55', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 26, 40, 126, 184, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (139, 14, '2024-06-05 16:36:56', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 15, 53, 75, 123, 152, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (140, 14, '2024-06-05 16:36:58', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 26, 50, 53, 123, 184, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (141, 14, '2024-06-05 16:37:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 53, 75, 86, 94, 126, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (142, 14, '2024-06-05 16:40:48', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 14, 16, 40, 86, 123, 126, NULL, NULL);
INSERT INTO `t_recommended` VALUES (143, 14, '2024-06-05 16:40:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 16, 26, 86, 94, 123, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (144, 14, '2024-06-05 16:40:54', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 53, 100, 110, 111, 151, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (145, 14, '2024-06-05 16:47:50', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 53, 86, 94, 111, 126, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (146, 14, '2024-06-05 16:47:51', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 53, 70, 75, 170, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (147, 14, '2024-06-05 16:47:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 53, 94, 110, 123, 151, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (148, 14, '2024-06-05 16:47:53', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 110, 170, 184, 185, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (149, 14, '2024-06-05 16:48:07', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 15, 53, 86, 111, 126, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (150, 14, '2024-06-05 16:48:11', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 26, 53, 100, 110, 123, 126, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (151, 14, '2024-06-05 16:48:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 40, 152, 170, 184, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (152, 14, '2024-06-05 16:48:36', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 40, 50, 86, 110, 151, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (153, 14, '2024-06-05 16:48:37', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 26, 75, 126, 151, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (154, 14, '2024-06-05 16:48:39', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 75, 86, 111, 151, 185, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (155, 14, '2024-06-05 16:53:55', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 40, 50, 100, 111, 151, 152, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (156, 14, '2024-06-05 16:53:56', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 70, 75, 86, 110, 170, 184, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (157, 14, '2024-06-05 16:53:57', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 50, 75, 94, 126, 151, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (158, 14, '2024-06-05 16:53:58', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 16, 26, 53, 86, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (159, 14, '2024-06-05 16:54:02', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 16, 40, 100, 110, 111, 170, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (160, 14, '2024-06-05 16:54:05', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 40, 86, 110, 123, 126, 151, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (161, 14, '2024-06-05 16:54:15', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 15, 40, 53, 111, 152, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (162, 14, '2024-06-05 16:54:16', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 15, 40, 53, 94, 151, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (163, 14, '2024-06-05 16:54:17', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 15, 40, 70, 75, 94, 123, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (164, 14, '2024-06-05 16:54:48', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 16, 53, 86, 100, 111, 170, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (165, 14, '2024-06-05 16:57:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 75, 86, 100, 110, 151, 184, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (166, 14, '2024-06-05 16:57:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 26, 53, 86, 123, 151, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (167, 14, '2024-06-05 16:57:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 16, 75, 111, 123, 126, 151, NULL, NULL);
INSERT INTO `t_recommended` VALUES (168, 14, '2024-06-05 16:57:33', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 26, 75, 111, 126, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (169, 14, '2024-06-05 16:57:35', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 15, 75, 94, 100, 126, 152, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (170, 14, '2024-06-05 16:57:41', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 15, 26, 94, 100, 126, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (171, 14, '2024-06-05 16:57:42', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 15, 16, 50, 70, 110, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (172, 14, '2024-06-05 16:57:43', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 50, 70, 75, 86, 110, 152, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (173, 14, '2024-06-05 16:57:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 50, 75, 111, 185, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (174, 14, '2024-06-05 16:57:49', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 53, 70, 110, 151, 184, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (175, 14, '2024-06-05 16:57:51', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 15, 16, 50, 70, 86, 111, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (176, 14, '2024-06-05 16:57:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 15, 53, 70, 86, 111, 126, 152, NULL, NULL);
INSERT INTO `t_recommended` VALUES (177, 14, '2024-06-05 16:57:54', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 15, 50, 75, 126, 151, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (178, 14, '2024-06-05 16:58:02', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 16, 40, 50, 53, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (179, 14, '2024-06-05 16:58:03', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 40, 70, 94, 123, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (180, 14, '2024-06-05 16:58:47', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 16, 53, 94, 111, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (181, 14, '2024-06-05 16:58:49', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 53, 86, 100, 110, 123, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (182, 14, '2024-06-05 16:58:50', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 40, 53, 111, 123, 151, 152, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (183, 14, '2024-06-05 16:58:51', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 70, 86, 110, 126, 170, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (184, 14, '2024-06-05 17:00:00', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 15, 70, 86, 111, 123, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (185, 14, '2024-06-05 17:00:02', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 26, 100, 110, 123, 170, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (186, 14, '2024-06-05 17:00:05', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 50, 86, 94, 110, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (187, 14, '2024-06-05 17:00:06', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 50, 53, 70, 75, 94, 111, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (188, 14, '2024-06-05 17:01:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 53, 75, 94, 170, 184, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (189, 14, '2024-06-05 17:01:45', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 16, 26, 111, 152, 170, 184, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (190, 14, '2024-06-05 17:01:46', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 26, 94, 110, 126, 151, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (191, 14, '2024-06-05 17:01:47', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 26, 70, 75, 126, 152, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (192, 14, '2024-06-05 17:01:47', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 26, 50, 70, 111, 170, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (193, 14, '2024-06-05 17:02:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 15, 40, 53, 94, 110, 184, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (194, 14, '2024-06-05 17:02:53', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 26, 53, 94, 100, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (195, 14, '2024-06-05 17:02:53', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 70, 86, 94, 110, 126, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (196, 14, '2024-06-05 17:03:13', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 50, 53, 110, 123, 126, 152, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (197, 14, '2024-06-05 17:03:14', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 40, 75, 110, 152, 170, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (198, 14, '2024-06-05 17:03:14', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 53, 75, 86, 94, 100, 110, NULL, NULL);
INSERT INTO `t_recommended` VALUES (199, 14, '2024-06-05 17:03:15', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 26, 53, 70, 94, 184, 185, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (200, 14, '2024-06-05 17:06:39', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 50, 100, 110, 123, 151, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (201, 14, '2024-06-05 17:06:40', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 50, 53, 100, 123, 126, 151, NULL, NULL);
INSERT INTO `t_recommended` VALUES (202, 14, '2024-06-05 17:06:41', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 70, 100, 123, 126, 185, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (203, 14, '2024-06-05 17:06:41', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 26, 70, 123, 184, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (204, 14, '2024-06-05 17:06:42', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 40, 50, 75, 86, 110, 111, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (205, 14, '2024-06-05 17:06:43', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 15, 26, 40, 53, 152, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (206, 14, '2024-06-05 17:06:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 75, 86, 94, 100, 123, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (207, 14, '2024-06-05 17:06:44', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 53, 70, 86, 100, 111, 123, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (208, 14, '2024-06-05 17:06:45', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 94, 152, 170, 184, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (209, 14, '2024-06-05 17:06:46', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 75, 86, 170, 185, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (210, 14, '2024-06-05 17:06:48', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 26, 70, 100, 110, 111, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (211, 14, '2024-06-05 17:06:49', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 16, 50, 53, 70, 75, 123, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (212, 14, '2024-06-05 17:06:52', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 26, 50, 75, 100, 123, 184, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (213, 14, '2024-06-05 17:06:53', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 40, 126, 152, 170, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (214, 14, '2024-06-05 17:13:23', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 16, 70, 75, 126, 152, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (215, 14, '2024-06-05 17:13:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 53, 94, 100, 110, 111, 151, NULL, NULL);
INSERT INTO `t_recommended` VALUES (216, 14, '2024-06-05 17:13:28', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 9, 40, 70, 94, 123, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (217, 14, '2024-06-05 17:13:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 26, 75, 94, 123, 126, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (218, 14, '2024-06-05 17:14:02', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 50, 53, 100, 111, 123, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (219, 14, '2024-06-05 17:14:04', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 16, 26, 40, 70, 75, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (220, 14, '2024-06-05 17:14:25', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 50, 86, 123, 151, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (221, 14, '2024-06-05 17:14:26', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 50, 53, 100, 110, 152, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (222, 14, '2024-06-05 17:14:29', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 50, 86, 111, 123, 152, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (223, 14, '2024-06-05 17:14:30', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 53, 70, 75, 86, 110, 152, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (224, 14, '2024-06-05 17:14:31', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 50, 53, 100, 111, 170, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (225, 14, '2024-06-05 17:14:31', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 70, 100, 111, 123, 152, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (226, 14, '2024-06-05 17:14:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 50, 86, 100, 123, 152, 170, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (227, 14, '2024-06-05 17:14:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 40, 70, 100, 123, 126, 152, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (228, 14, '2024-06-05 17:14:33', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 50, 70, 75, 86, 151, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (229, 14, '2024-06-05 17:14:33', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 53, 75, 100, 170, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (230, 14, '2024-06-05 17:14:34', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 14, 53, 70, 75, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (231, 14, '2024-06-05 17:14:42', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 70, 100, 123, 151, 152, 185, NULL, NULL);
INSERT INTO `t_recommended` VALUES (232, 14, '2024-06-05 17:19:43', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 26, 50, 75, 126, 152, 170, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (233, 6, '2024-06-05 17:59:42', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 4, 21, 22, 23, 24, 64, 94, 105, NULL, NULL);
INSERT INTO `t_recommended` VALUES (234, 6, '2024-06-05 17:59:47', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 23, 24, 53, 75, 105, 128, 170, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (235, 6, '2024-06-05 17:59:47', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 7, 26, 75, 151, 152, 170, 192, 216, NULL, NULL);
INSERT INTO `t_recommended` VALUES (236, 6, '2024-06-05 18:00:11', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 7, 21, 24, 43, 75, 160, 177, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (237, 6, '2024-06-05 18:00:23', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 21, 75, 94, 105, 120, 152, 192, 216, NULL, NULL);
INSERT INTO `t_recommended` VALUES (238, 6, '2024-06-05 18:00:38', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 43, 53, 94, 105, 120, 160, 216, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (239, 6, '2024-06-05 18:00:52', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 4, 53, 94, 160, 170, 177, 192, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (240, 6, '2024-06-05 18:00:55', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 7, 10, 23, 24, 26, 128, 192, 216, NULL, NULL);
INSERT INTO `t_recommended` VALUES (241, 6, '2024-06-05 18:00:58', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 10, 24, 43, 75, 120, 151, 160, 170, NULL, NULL);
INSERT INTO `t_recommended` VALUES (242, 6, '2024-06-05 18:01:14', '[192, 64, 128, 160, 4, 7, 105, 10, 170, 75, 43, 177, 21, 53, 22, 23, 151, 24, 216, 152, 120, 26, 220, 94]', '[7, 18, 14, 15, 16]', 21, 24, 26, 53, 64, 120, 151, 160, NULL, NULL);
INSERT INTO `t_recommended` VALUES (243, 14, '2024-06-06 10:23:09', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 15, 70, 126, 152, 170, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (244, 14, '2024-06-06 10:26:35', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 50, 75, 94, 126, 151, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (245, 14, '2024-06-06 10:27:04', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 50, 53, 75, 111, 126, 152, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (246, 14, '2024-06-06 10:27:05', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 14, 15, 26, 53, 75, 94, NULL, NULL);
INSERT INTO `t_recommended` VALUES (247, 14, '2024-06-06 10:27:06', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 14, 50, 70, 75, 94, 100, 126, NULL, NULL);
INSERT INTO `t_recommended` VALUES (248, 14, '2024-06-06 10:27:07', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 26, 75, 86, 110, 123, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (249, 14, '2024-06-06 10:27:08', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 16, 26, 53, 100, 123, 126, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (250, 14, '2024-06-06 10:27:16', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 15, 16, 70, 86, 100, 152, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (251, 14, '2024-06-06 10:27:17', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 26, 94, 151, 152, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (252, 14, '2024-06-06 10:27:18', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 53, 70, 94, 123, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (253, 14, '2024-06-06 10:27:20', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 14, 40, 110, 123, 184, 185, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (254, 14, '2024-06-06 10:27:21', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 53, 70, 110, 126, 151, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (255, 14, '2024-06-06 10:27:27', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 40, 50, 53, 100, 151, 152, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (256, 14, '2024-06-06 10:32:13', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 75, 86, 110, 151, 152, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (257, 14, '2024-06-06 11:54:48', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 50, 94, 110, 152, 184, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (258, 1, '2024-06-06 14:01:31', '[32, 128, 1, 100, 196, 70, 71, 72, 201, 43, 174, 14, 210, 182, 184, 217, 121, 58, 59, 222, 223]', '[4, 21, 2, 3, 5]', 1, 32, 70, 128, 174, 201, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (259, 11, '2024-06-24 20:18:15', '[64, 1, 70, 198, 9, 137, 14, 206, 16, 17, 210, 19, 214, 86, 25, 217, 154, 219, 28, 222, 223, 34, 98, 100, 43, 110, 111, 54, 184, 123]', '[10, 6, 1, 2, 3]', 9, 43, 86, 98, 123, 217, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (260, 14, '2024-06-24 21:09:08', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 70, 100, 110, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (261, 14, '2024-06-24 21:45:22', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 16, 26, 151, 152, 184, 219, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (262, 14, '2024-06-24 21:52:08', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 26, 40, 50, 75, 100, 123, 126, NULL, NULL);
INSERT INTO `t_recommended` VALUES (263, 14, '2024-06-24 21:52:16', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 14, 15, 50, 53, 126, 151, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (264, 14, '2024-06-24 21:56:16', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 4, 16, 50, 70, 110, 126, 184, NULL, NULL);
INSERT INTO `t_recommended` VALUES (265, 14, '2024-06-24 21:56:19', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 14, 70, 111, 123, 126, 170, 184, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (266, 14, '2024-06-24 21:56:32', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 40, 53, 110, 111, 126, 152, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (267, 14, '2024-06-24 21:57:07', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 15, 16, 75, 94, 100, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (268, 14, '2024-06-24 21:57:09', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 16, 26, 40, 75, 152, 219, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (269, 14, '2024-06-24 21:57:12', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 26, 70, 75, 86, 170, 219, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (270, 14, '2024-06-24 21:57:14', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 15, 40, 50, 123, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (271, 14, '2024-06-24 21:57:15', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 9, 26, 75, 86, 110, 151, 185, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (272, 14, '2024-06-24 21:57:18', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 1, 9, 16, 70, 86, 151, 170, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (273, 14, '2024-06-24 21:57:19', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 16, 26, 70, 86, 123, 152, 170, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (274, 14, '2024-06-24 21:57:21', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 40, 94, 110, 151, 152, 170, 184, 220, NULL, NULL);
INSERT INTO `t_recommended` VALUES (275, 14, '2024-06-24 21:57:23', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 15, 75, 111, 151, 220, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (276, 14, '2024-06-24 21:57:25', '[1, 4, 70, 9, 75, 14, 15, 16, 86, 151, 152, 26, 219, 220, 94, 222, 100, 40, 170, 110, 111, 50, 53, 184, 185, 123, 126]', '[8, 7, 6, 16, 3]', 4, 9, 70, 86, 94, 110, 111, 219, NULL, NULL);
INSERT INTO `t_recommended` VALUES (277, 14, '2024-06-24 22:00:15', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 23, 34, 72, 98, 154, 182, 201, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (278, 14, '2024-06-24 22:00:17', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 14, 32, 34, 128, 160, 198, 210, 218, NULL, NULL);
INSERT INTO `t_recommended` VALUES (279, 14, '2024-06-24 22:00:18', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 23, 34, 43, 70, 105, 214, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (280, 14, '2024-06-24 22:00:21', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 19, 21, 22, 23, 28, 43, 105, 160, NULL, NULL);
INSERT INTO `t_recommended` VALUES (281, 14, '2024-06-24 22:00:27', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 3, 17, 23, 59, 210, 214, 218, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (282, 14, '2024-06-24 22:00:34', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 7, 17, 19, 100, 105, 201, 214, 218, NULL, NULL);
INSERT INTO `t_recommended` VALUES (283, 14, '2024-06-24 22:00:37', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 14, 21, 22, 120, 198, 201, 214, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (284, 14, '2024-06-24 22:00:39', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 7, 19, 21, 23, 128, 137, 154, 217, NULL, NULL);
INSERT INTO `t_recommended` VALUES (285, 14, '2024-06-26 10:29:31', '[32, 97, 1, 34, 98, 100, 70, 198, 72, 137, 43, 172, 174, 14, 210, 214, 118, 217, 122, 154, 28, 222, 223]', '[17, 4, 1, 2, 3]', 28, 34, 72, 100, 172, 210, 217, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (286, 11, '2024-06-27 21:15:00', '[64, 1, 70, 198, 9, 137, 14, 206, 16, 17, 210, 19, 214, 86, 25, 217, 154, 219, 28, 222, 223, 34, 98, 100, 43, 110, 111, 54, 184, 123]', '[10, 6, 1, 2, 3]', 17, 19, 34, 98, 154, 210, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (287, 11, '2024-06-27 21:15:02', '[64, 1, 70, 198, 9, 137, 14, 206, 16, 17, 210, 19, 214, 86, 25, 217, 154, 219, 28, 222, 223, 34, 98, 100, 43, 110, 111, 54, 184, 123]', '[10, 6, 1, 2, 3]', 16, 17, 25, 43, 98, 100, 123, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (288, NULL, '2024-06-29 09:28:35', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 17, 21, 100, 137, 182, 201, 217, 218, NULL, NULL);
INSERT INTO `t_recommended` VALUES (289, 11, '2024-06-29 09:28:51', '[64, 1, 70, 198, 9, 137, 14, 206, 16, 17, 210, 19, 214, 86, 25, 217, 154, 219, 28, 222, 223, 34, 98, 100, 43, 110, 111, 54, 184, 123]', '[10, 6, 1, 2, 3]', 43, 54, 86, 110, 111, 123, 198, 214, NULL, NULL);
INSERT INTO `t_recommended` VALUES (290, NULL, '2024-06-29 09:33:09', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 3, 105, 120, 128, 154, 182, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (291, NULL, '2024-06-29 09:34:15', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 10, 22, 32, 53, 59, 137, 160, 210, NULL, NULL);
INSERT INTO `t_recommended` VALUES (292, NULL, '2024-06-29 09:34:29', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 14, 17, 23, 24, 43, 98, 137, 174, NULL, NULL);
INSERT INTO `t_recommended` VALUES (293, NULL, '2024-06-29 09:39:53', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 1, 17, 19, 22, 72, 105, 217, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (294, 14, '2024-06-29 09:40:03', '[32, 97, 1, 34, 98, 100, 70, 198, 72, 137, 43, 172, 174, 14, 210, 214, 118, 217, 122, 154, 28, 222, 223]', '[17, 4, 1, 2, 3]', 28, 100, 118, 137, 154, 174, 198, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (295, 14, '2024-06-29 09:41:56', '[32, 97, 1, 34, 98, 100, 70, 198, 72, 137, 43, 172, 174, 14, 210, 214, 118, 217, 122, 154, 28, 222, 223]', '[17, 4, 1, 2, 3]', 1, 14, 43, 70, 98, 100, 172, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (296, NULL, '2024-06-29 09:46:24', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 1, 7, 10, 23, 100, 105, 137, 201, NULL, NULL);
INSERT INTO `t_recommended` VALUES (297, 14, '2024-06-29 09:47:09', '[32, 97, 1, 34, 98, 100, 70, 198, 72, 137, 43, 172, 174, 14, 210, 214, 118, 217, 122, 154, 28, 222, 223]', '[17, 4, 1, 2, 3]', 1, 28, 34, 122, 198, 214, 222, 223, NULL, NULL);
INSERT INTO `t_recommended` VALUES (298, 14, '2024-06-29 09:47:30', '[128, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 223, 160, 32, 97, 34, 98, 105, 43, 172, 174, 53, 118, 182, 120, 122]', '[17, 4, 5, 1, 2]', 10, 14, 24, 34, 43, 72, 137, 214, NULL, NULL);
INSERT INTO `t_recommended` VALUES (299, 26, '2024-06-29 10:08:14', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 21, 22, 59, 98, 120, 154, 210, 218, NULL, NULL);
INSERT INTO `t_recommended` VALUES (300, 26, '2024-06-29 10:08:50', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 1, 22, 28, 43, 70, 137, 198, 217, NULL, NULL);
INSERT INTO `t_recommended` VALUES (301, 26, '2024-06-29 10:08:59', '[128, 1, 3, 70, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 222, 223, 160, 32, 34, 98, 100, 105, 43, 174, 53, 182, 120, 59]', '[1, 2, 3, 4, 5]', 17, 22, 24, 70, 128, 182, 210, 222, NULL, NULL);
INSERT INTO `t_recommended` VALUES (302, 14, '2024-06-29 10:09:10', '[128, 198, 7, 72, 137, 201, 10, 14, 17, 210, 19, 21, 22, 214, 23, 24, 217, 154, 218, 28, 223, 160, 32, 97, 34, 98, 105, 43, 172, 174, 53, 118, 182, 120, 122]', '[17, 4, 5, 1, 2]', 28, 97, 98, 118, 120, 154, 201, 214, NULL, NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `imageName` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `points` int NULL DEFAULT NULL COMMENT '积分',
  `isVip` int NULL DEFAULT NULL COMMENT '是否VIP',
  `isOff` int NULL DEFAULT NULL COMMENT '是否封禁',
  `roleName` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `registerDate` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '潘涛', 'Afg7AD32V', '云叶', '12030069@qq.com', '20240114225430.jpg', 100, 0, 0, '普通用户', '2024-01-03 23:16:40');
INSERT INTO `t_user` VALUES (2, '邱伦', 'oLP8TgOS6T', '岚叶', 'qiujhgial@gmail.com', '20240114225430.jpg', 138, 0, 0, '普通用户', '2024-05-12 13:24:48');
INSERT INTO `t_user` VALUES (3, '李璐', 'VodXWtbckm', '风云', 'lu9bghj@outlook.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-12 15:22:58');
INSERT INTO `t_user` VALUES (4, '颜璐', 'Xgy2zPfghRE', '子颜', 'dlujhghg@gmail.com', '20240108235216.jpg', 102, 0, 0, '普通用户', '2024-05-12 15:58:22');
INSERT INTO `t_user` VALUES (5, '蒋宇宁', 'oOaDpbtazr', '詩涵', '3652628245@qq.com', '20240108235216.jpg', 103, 0, 0, '普通用户', '2024-05-13 09:29:12');
INSERT INTO `t_user` VALUES (6, '戴震南', 'PLhhw5Q1m2', '子', '1524844115@qq.com', '20240108235216.jpg', 110, 0, 1, '普通用户', '2024-01-07 02:06:22');
INSERT INTO `t_user` VALUES (7, '武詩涵', 'sGPwC0R8MP', '震南', '452471515@qq.com', '20240107021707.PNG', 100, 0, 0, '普通用户', '2024-01-07 02:17:07');
INSERT INTO `t_user` VALUES (8, '江秀英', 'K73GBYxISv', '璐', 'jxiuyi@gmail.com', '20240109172637.jfif', 106, 0, 0, '普通用户', '2024-01-09 17:26:37');
INSERT INTO `t_user` VALUES (9, '贾睿', 'IK3to3MW4W', '云熙', 'jia69@gmail.com', '20240111025503.jpg', 0, 0, 1, '普通用户', '2024-01-11 02:55:03');
INSERT INTO `t_user` VALUES (10, '龙晓明', 'cXxZ21UgaO', '致远', 'xiaoming64@outlook.com', '20240111025655.jpg', 0, 1, 0, 'VIP用户', '2024-01-11 02:56:55');
INSERT INTO `t_user` VALUES (11, '潘睿', 'XhTHG6uA1d', '安岚', 'ruipan@gmail.com', '20240629092907.jpg', 100, 0, 0, '普通用户', '2024-01-11 02:57:51');
INSERT INTO `t_user` VALUES (12, '毛宇宁', 'UtI2YTJSnb', '睿', 'yumao@gmail.com', '20240113053514.png', 50, 0, 0, '普通用户', '2024-01-13 05:35:14');
INSERT INTO `t_user` VALUES (13, '陆云熙', 'XBZ5HnNgI1', '子韬', 'lu10@outlook.com', '20240108235216.jpg', 100, 0, 1, '普通用户', '2024-01-14 04:35:24');
INSERT INTO `t_user` VALUES (14, '顾云熙', 'E3LmwZEnZk', '云熙', '2581593533@qq.com', '20240629100920.jpg', 59, 1, 0, 'VIP用户', '2024-05-11 08:13:35');
INSERT INTO `t_user` VALUES (15, '江睿', 'Jt2D3KXMoi', '秀英', 'rui73@gmail.com', '20240108235216.jpg', 153, 0, 0, '普通用户', '2024-05-12 15:28:23');
INSERT INTO `t_user` VALUES (16, '贺云熙', 'blGsXiq8HK', '震南', 'hyunxi@qq.com', '20240513093313.jpg', 100, 0, 0, '普通用户', '2024-05-13 09:33:13');
INSERT INTO `t_user` VALUES (17, '蔡詩涵', 'jmdfdKTcXq', '秀芹', 'shihan1980@outlook.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-16 16:30:34');
INSERT INTO `t_user` VALUES (18, '严杰宏', 'CItblMVAWs', '岚', 'jiehongya@gmail.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-16 20:41:18');
INSERT INTO `t_user` VALUES (19, '林安琪', 'IGPuVHs2lf', '安琪', '3258159151@qq.com', '20240108235216.jpg', 100, 0, 0, '普通用户', '2024-05-24 17:51:48');
INSERT INTO `t_user` VALUES (20, '石子韬', '8A2ya1FriV', '杰宏', 'zitaoshi808@gmail.com', '20240111025655.jpg', 100, 0, 0, '普通用户', '2024-05-24 18:46:10');
INSERT INTO `t_user` VALUES (21, '傅嘉伦', 'E2aMMq0lKo', '秀英', 'fujialun@gmail.com', NULL, 98, 0, 0, '普通用户', '2024-05-24 19:29:14');
INSERT INTO `t_user` VALUES (22, '陈一', 'kfd123', '陈一', '3582311515@qq.com', '20240629100730.jpg', 94, 0, 0, '普通用户', '2024-06-29 10:07:30');

SET FOREIGN_KEY_CHECKS = 1;
