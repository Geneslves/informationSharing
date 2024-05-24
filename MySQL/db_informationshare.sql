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

 Date: 22/05/2024 15:44:33
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`
(
    `id`            int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章名称',
    `publishDate`   datetime NULL DEFAULT NULL COMMENT '发布日期',
    `userId`        int NULL DEFAULT NULL COMMENT '发布人id',
    `articleTypeId` int NULL DEFAULT NULL COMMENT '文章类型id',
    `points`        int NULL DEFAULT NULL COMMENT '下载所需积分',
    `summary`       text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '摘要',
    `content`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
    `downloadLink`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '百度云链接',
    `password`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接密码',
    `isHot`         int NULL DEFAULT NULL COMMENT '是否热门 0代表不是 1代表是',
    `state`         int NULL DEFAULT NULL COMMENT '状态 1代表未审核 2代表审核通过 3代表审核未通过',
    `reason`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核未通过理由',
    `checkDate`     datetime NULL DEFAULT NULL COMMENT '审核时间',
    `isUseful`      int NULL DEFAULT NULL COMMENT '链接是否失效 0代表未失效 1代表已经失效',
    `click`         int NULL DEFAULT NULL COMMENT '点击次数',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX           `id`(`id` ASC) USING BTREE,
    INDEX           `articleTypeId`(`articleTypeId` ASC) USING BTREE,
    INDEX           `userId`(`userId` ASC) USING BTREE,
    CONSTRAINT `t_article_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article`
VALUES (1, 'java编程思想', '2024-01-10 22:58:56', 6, 1, 2, 'java编程思想\n',
        '<p><a href=\"http://localhost:8080/article/23\" title=\"java编程思想\">java编程思想</a></p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 3, '链接失效', '2024-01-17 21:42:54', 0, 19);
INSERT INTO `t_article`
VALUES (2, '拳皇版超级玛丽13可执行文件', '2024-01-10 23:00:53', 6, 1, 4, '拳皇版超级玛丽13可执行文件\n',
        '<p>拳皇版超级玛丽13可执行文件</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2,
        NULL, NULL, 1, 12);
INSERT INTO `t_article`
VALUES (3, '2020年java常见笔试面试题汇总(附答案)', '2024-05-10 23:01:14', 6, 1, 5,
        '2020年java常见笔试面试题汇总(附答案)\n', '<p>2020年java常见笔试面试题汇总(附答案)</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-01-13 19:49:35', 1, 28);
INSERT INTO `t_article`
VALUES (4, '常用日期函数', '2024-05-10 23:01:36', 6, 2, 5, '常用日期函数\n', '<p>常用日期函数</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-16 11:25:29', 1, 15);
INSERT INTO `t_article`
VALUES (5, '王二暖Oracle视频教程 下载', '2024-05-10 23:02:24', 6, 2, 3, '王二暖Oracle视频教程 下载\n',
        '<p>王二暖Oracle视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2,
        NULL, NULL, 1, 22);
INSERT INTO `t_article`
VALUES (6, 'Mysql从入门到精通视频教程（共29集）下载', '2024-05-10 23:02:56', 6, 2, 5,
        'Mysql从入门到精通视频教程（共29集）下载\n', '<p>Mysql从入门到精通视频教程（共29集）下载</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-16 16:42:42', 1, 30);
INSERT INTO `t_article`
VALUES (7, 'Postgresql数据库优化视频教程 下载', '2024-05-10 23:03:13', 6, 2, 5, 'Postgresql数据库优化视频教程 下载\n',
        '<p>Postgresql数据库优化视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234',
        1, 2, '无', '2024-01-13 19:49:25', 1, 21);
INSERT INTO `t_article`
VALUES (8, 'Oracle Rachel操作手册', '2024-05-10 23:03:46', 6, 2, 4, 'Oracle Rachel操作手册\n',
        '<p>Oracle Rachel操作手册</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无',
        '2024-05-20 19:33:38', 1, 5);
INSERT INTO `t_article`
VALUES (9, 'mysql高级mycat集群视频&redis视频视频教程 下载', '2024-05-10 23:04:06', 6, 2, 3,
        'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n',
        '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, '无', '2024-05-22 09:49:35', 1, 11);
INSERT INTO `t_article`
VALUES (10, '50份优秀Java求职者简历', '2024-05-10 23:04:53', 7, 1, 4, '50份优秀Java求职者简历\n',
        '<p>50份优秀Java求职者简历</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL,
        NULL, 1, 29);
INSERT INTO `t_article`
VALUES (11, '高级架构师进阶24天视频教程', '2024-05-10 23:05:07', 7, 1, 4, '高级架构师进阶24天视频教程\n',
        '<p>高级架构师进阶24天视频教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1,
        NULL, NULL, 1, 31);
INSERT INTO `t_article`
VALUES (12, '从零开始学java', '2024-05-10 23:05:19', 7, 1, 5, '从零开始学java\n', '<p>从零开始学java</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 1, 43);
INSERT INTO `t_article`
VALUES (13, '刘道成MySQL系列教程', '2024-05-10 23:05:34', 7, 2, 4, '刘道成MySQL系列教程\n',
        '<p>刘道成MySQL系列教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL,
        NULL, 1, 33);
INSERT INTO `t_article`
VALUES (14, 'mybatis教程pdf合集', '2024-05-10 23:05:51', 7, 2, 3, 'mybatis教程pdf合集\n',
        '<p>mybatis教程pdf合集</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL,
        NULL, 1, 44);
INSERT INTO `t_article`
VALUES (15, '黑马JavaEE 57期', '2024-05-10 23:06:15', 7, 4, 4, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 1, 39);
INSERT INTO `t_article`
VALUES (16, 'SSM整合案例【企业权限管理系统】视频教程', '2024-05-10 23:06:30', 7, 4, 4,
        'SSM整合案例【企业权限管理系统】视频教程\n',
        '<p><a href=\"http://download.java1234.com/article/1942\" target=\"_blank\" title=\"SSM整合案例【企业权限管理系统】视频教程\">SSM整合案例【企业权限管理系统】视频教程</a></p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 1, 55);
INSERT INTO `t_article`
VALUES (17, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-05-10 23:07:29', 7, 3, 2,
        'Vue2.0+Node.js+MongoDB全栈打造商城系统视\n', '<p>Vue2.0+Node.js+MongoDB全栈打造商城系统视</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 1, 44);
INSERT INTO `t_article`
VALUES (18, 'Vue项目实战教程', '2024-05-10 23:07:42', 7, 3, 5, 'Vue项目实战教程\n', '<p>Vue项目实战教程</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 1, 53);
INSERT INTO `t_article`
VALUES (19, 'MUI全接触', '2024-01-10 23:07:55', 7, 3, 7, 'MUI全接触\n', '<p>MUI全接触</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-22 09:46:30', 1, 125);
INSERT INTO `t_article`
VALUES (20, 'web打印分页设置', '2024-01-10 23:12:11', 8, 3, 5, 'web打印分页设置\n',
        '<p><a href=\"http://download.java1234.com/article/1845\" target=\"_blank\" title=\"web打印分页设置\">web打印分页设置</a></p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-20 19:32:25', 1, 8);
INSERT INTO `t_article`
VALUES (21, 'Web前端技术', '2024-01-17 22:49:01', 6, 3, 4,
        'Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术\n\n\n\n\n\n&nbsp;\n',
        '<p>Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术</p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240117224856.jpg\" style=\"height:457px; width:700px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240118141517.jpg\" style=\"height:62px; width:700px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-20 20:48:12', 1, 221);
INSERT INTO `t_article`
VALUES (22, 'Java技术全解', '2024-05-12 11:31:29', 14, 1, 1, '大华股份&nbsp;\n', '<p>大华股份&nbsp;</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-20 20:58:29', 1, 38);
INSERT INTO `t_article`
VALUES (23, 'MySQL数据库', '2024-05-12 11:31:52', 14, 2, 6, '会尽快\n', '<p>会尽快</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-20 19:32:21', 1, 6);
INSERT INTO `t_article`
VALUES (24, 'SQLServer数据库', '2024-05-16 17:08:35', 14, 2, 4, '数据库\n',
        '<p><img alt=\"\" src=\"/static/images/articleImage/20240516170806.jpg\" />数据库</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, '无', '2024-05-22 13:10:45', 1, 15);
INSERT INTO `t_article`
VALUES (25, 'Java基础入门', '2024-05-22 08:00:00', 6, 1, 5, 'Java基础知识概览', 'Java基础入门内容……',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 0, 19);
INSERT INTO `t_article`
VALUES (26, 'Java高级编程', '2024-05-22 09:00:00', 7, 2, 8, '深入了解Java高级特性', 'Java高级编程内容……',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, NULL, NULL, 0, 12);
INSERT INTO `t_article`
VALUES (27, 'Java并发编程', '2024-05-22 10:00:00', 8, 3, 10, '学习Java并发编程', 'Java并发编程内容……',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 0, 28);
INSERT INTO `t_article`
VALUES (28, 'Java设计模式', '2024-05-22 11:00:00', 9, 4, 6, '深入理解常用的Java设计模式', 'Java设计模式内容……',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 0, 15);
INSERT INTO `t_article`
VALUES (29, 'Spring框架入门', '2024-05-22 12:00:00', 10, 5, 7, '学习Spring框架的基础知识', 'Spring框架入门内容……',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 2, NULL, NULL, 0, 22);
INSERT INTO `t_article`
VALUES (30, 'Hibernate框架入门', '2024-05-23 10:00:00', 14, 5, 7, '学习Hibernate框架的基础知识',
        'Hibernate框架入门内容……', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 0,
        30);
INSERT INTO `t_article`
VALUES (31, 'Spring Boot入门', '2024-05-23 11:00:00', 14, 5, 7, '学习Spring Boot的基础知识', 'Spring Boot入门内容……',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 2, NULL, NULL, 0, 21);
INSERT INTO `t_article`
VALUES (32, 'java编程思想', '2024-01-10 22:58:56', 14, 1, 2, 'java编程思想\n',
        '<p><a href=\"http://localhost:8080/article/23\" title=\"java编程思想\">java编程思想</a></p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 3, '链接失效', '2024-01-17 21:42:54', 1, 5);
INSERT INTO `t_article`
VALUES (33, '数据结构与算法分析', '2023-12-15 14:30:00', 15, 1, 2, '拳皇版超级玛丽13可执行文件\n',
        '<p>拳皇版超级玛丽13可执行文件</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1,
        NULL, NULL, 0, 11);
INSERT INTO `t_article`
VALUES (34, 'Python编程', '2024-01-02 10:00:00', 18, 2, 3, '2020年java常见笔试面试题汇总(附答案)\n',
        '<p>2020年java常见笔试面试题汇总(附答案)</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=',
        '1234', 0, 1, NULL, NULL, 1, 29);
INSERT INTO `t_article`
VALUES (35, '机器学习实战', '2023-11-20 09:15:00', 13, 3, 4, '常用日期函数\n', '<p>常用日期函数</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 0, 31);
INSERT INTO `t_article`
VALUES (36, '深度学习入门', '2023-10-05 16:45:00', 11, 3, 4, '王二暖Oracle视频教程 下载\n',
        '<p>王二暖Oracle视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1,
        NULL, NULL, 1, 43);
INSERT INTO `t_article`
VALUES (37, '编程艺术', '2024-04-18 11:20:00', 17, 1, 2, 'Mysql从入门到精通视频教程（共29集）下载\n',
        '<p>Mysql从入门到精通视频教程（共29集）下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=',
        '1234', 1, 1, NULL, NULL, 0, 33);
INSERT INTO `t_article`
VALUES (38, 'Java编程实践', '2024-05-01 08:30:00', 13, 1, 2, 'Postgresql数据库优化视频教程 下载\n',
        '<p>Postgresql数据库优化视频教程 下载</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234',
        0, 1, NULL, NULL, 1, 44);
INSERT INTO `t_article`
VALUES (39, '数据挖掘基础', '2024-03-29 15:55:00', 13, 3, 4, 'Oracle Rachel操作手册\n',
        '<p>Oracle Rachel操作手册</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL,
        NULL, 0, 39);
INSERT INTO `t_article`
VALUES (40, '计算机网络原理', '2024-02-14 17:10:00', 13, 1, 2, 'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n',
        '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 55);
INSERT INTO `t_article`
VALUES (41, '操作系统导论', '2024-04-05 13:25:00', 13, 1, 2, '50份优秀Java求职者简历\n',
        '<p>50份优秀Java求职者简历</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL,
        NULL, 0, 44);
INSERT INTO `t_article`
VALUES (42, '编程艺术', '2024-01-03 11:20:00', 17, 1, 4, '高级架构师进阶24天视频教程\n',
        '<p>高级架构师进阶24天视频教程</p>\r\n', 'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1,
        NULL, NULL, 0, 53);
INSERT INTO `t_article`
VALUES (43, 'Java编程实践', '2024-02-15 08:30:00', 15, 5, 2, '从零开始学java\n', '<p>从零开始学java</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 125);
INSERT INTO `t_article`
VALUES (44, '数据挖掘基础', '2024-03-16 15:55:00', 15, 6, 4, '刘道成MySQL系列教程\n', '<p>刘道成MySQL系列教程</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 0, 8);
INSERT INTO `t_article`
VALUES (45, '计算机网络原理', '2024-04-27 17:10:00', 15, 7, 2, 'mybatis教程pdf合集\n', '<p>mybatis教程pdf合集</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 0, 1, NULL, NULL, 1, 221);
INSERT INTO `t_article`
VALUES (46, '操作系统导论', '2024-05-14 13:25:00', 16, 7, 2, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n',
        'https://pan.baidu.com/s/1xyjEHhI9NGidf6crR5NYOg?pwd=', '1234', 1, 1, NULL, NULL, 0, 38);

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type`
(
    `id`      int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
    `remark`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    `sortNum` int NULL DEFAULT NULL COMMENT '排列顺序',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article_type' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type`
VALUES (1, 'Java技术', 'Java技术', 1);
INSERT INTO `t_article_type`
VALUES (2, '数据库技术', '数据库技术', 3);
INSERT INTO `t_article_type`
VALUES (3, 'Web前端技术', 'Web前端技术', 4);
INSERT INTO `t_article_type`
VALUES (4, 'J2EE技术', 'J2EE技术', 2);
INSERT INTO `t_article_type`
VALUES (5, '分布式微服技术', '分布式微服技术', 5);
INSERT INTO `t_article_type`
VALUES (6, '移动APP开发技术', '移动APP开发技术', 6);
INSERT INTO `t_article_type`
VALUES (7, 'Python', 'Python', 7);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`
(
    `id`              int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `userId`          int NULL DEFAULT NULL COMMENT '评论人id',
    `articleId`       int NULL DEFAULT NULL COMMENT '被评论的文章id',
    `commentContent`  varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
    `date`            datetime NULL DEFAULT NULL COMMENT '评论时间',
    `articleAuthorId` int NULL DEFAULT NULL COMMENT '资源作者id',
    `state`           int NULL DEFAULT NULL COMMENT '状态',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX             `id`(`id` ASC) USING BTREE,
    INDEX             `userId`(`userId` ASC) USING BTREE,
    INDEX             `articleId`(`articleId` ASC) USING BTREE,
    CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`articleId`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_comment' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment`
VALUES (1, 6, 19, '非常有帮助', '2024-01-10 23:10:12', 7, 1);
INSERT INTO `t_comment`
VALUES (2, 6, 19, '不错的文章', '2024-01-10 23:10:14', 7, 1);
INSERT INTO `t_comment`
VALUES (3, 7, 6, '非常详细', '2024-01-10 23:10:50', 6, 1);
INSERT INTO `t_comment`
VALUES (4, 6, 11, '信息量很大', '2024-01-11 22:34:39', 7, 1);
INSERT INTO `t_comment`
VALUES (5, 6, 11, '值得阅读', '2024-01-17 20:32:18', 7, 2);
INSERT INTO `t_comment`
VALUES (6, 1, 21, '有用', '2024-05-12 11:20:47', 6, 1);
INSERT INTO `t_comment`
VALUES (7, 14, 21, '很好', '2024-05-12 11:22:19', 6, 1);
INSERT INTO `t_comment`
VALUES (8, 14, 20, '有压力的一天', '2024-05-12 11:30:45', 6, 1);
INSERT INTO `t_comment`
VALUES (9, 6, 22, '资源不错', '2024-05-12 11:40:17', 14, 1);
INSERT INTO `t_comment`
VALUES (10, 7, 25, '非常有帮助', '2024-05-13 12:00:00', 8, 1);
INSERT INTO `t_comment`
VALUES (11, 8, 26, '不错的文章', '2024-05-13 13:00:00', 9, 1);
INSERT INTO `t_comment`
VALUES (12, 9, 27, '非常详细', '2024-05-13 14:00:00', 10, 1);
INSERT INTO `t_comment`
VALUES (13, 10, 28, '信息量很大', '2024-05-13 15:00:00', 11, 1);
INSERT INTO `t_comment`
VALUES (14, 11, 29, '值得阅读', '2024-05-13 16:00:00', 12, 1);
INSERT INTO `t_comment`
VALUES (30, 7, 25, '非常有帮助', '2024-05-13 12:00:00', 8, 1);
INSERT INTO `t_comment`
VALUES (31, 8, 26, '不错的文章', '2024-05-13 13:00:00', 9, 1);
INSERT INTO `t_comment`
VALUES (32, 9, 27, '非常详细', '2024-05-13 14:00:00', 10, 1);
INSERT INTO `t_comment`
VALUES (33, 10, 28, '信息量很大', '2024-05-13 15:00:00', 11, 1);
INSERT INTO `t_comment`
VALUES (34, 11, 29, '值得阅读', '2024-05-13 16:00:00', 12, 1);

-- ----------------------------
-- Table structure for t_download_message
-- ----------------------------
DROP TABLE IF EXISTS `t_download_message`;
CREATE TABLE `t_download_message`
(
    `id`           int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `userId`       int NULL DEFAULT NULL COMMENT '下载者id',
    `articleId`    int NULL DEFAULT NULL COMMENT '资源id',
    `message`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下载信息',
    `downloadDate` datetime NULL DEFAULT NULL COMMENT '下载时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `id`(`id` ASC) USING BTREE,
    INDEX          `userId`(`userId` ASC) USING BTREE,
    INDEX          `articleId`(`articleId` ASC) USING BTREE,
    CONSTRAINT `t_download_message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_download_message' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_download_message
-- ----------------------------
INSERT INTO `t_download_message`
VALUES (1, 14, 19, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message`
VALUES (2, 14, 10, '下载了：50份优秀Java求职者简历', '2024-01-10 23:15:17');
INSERT INTO `t_download_message`
VALUES (3, 14, 7, '下载了：Postgresql数据库优化视频教程 下载', '2024-01-10 23:24:35');
INSERT INTO `t_download_message`
VALUES (4, 14, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-11 01:51:23');
INSERT INTO `t_download_message`
VALUES (5, 14, 19, '下载了：MUI全接触', '2024-01-11 01:58:11');
INSERT INTO `t_download_message`
VALUES (6, 6, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:30');
INSERT INTO `t_download_message`
VALUES (7, 6, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:35');
INSERT INTO `t_download_message`
VALUES (8, 6, 15, '下载了：黑马JavaEE 57期', '2024-01-11 02:10:54');
INSERT INTO `t_download_message`
VALUES (9, 6, 14, '下载了：mybatis教程pdf合集', '2024-01-11 02:11:03');
INSERT INTO `t_download_message`
VALUES (10, 6, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-17 13:01:21');
INSERT INTO `t_download_message`
VALUES (11, 6, 19, '下载了：MUI全接触', '2024-01-17 21:45:12');
INSERT INTO `t_download_message`
VALUES (12, 6, 9, '下载了：mysql高级mycat集群视频&redis视频视频教程 下载', '2024-03-16 09:29:23');
INSERT INTO `t_download_message`
VALUES (13, 14, 21, '下载了：Web前端技术', '2024-05-11 08:17:40');
INSERT INTO `t_download_message`
VALUES (14, 14, 22, '下载了：Java技术全解', '2024-05-12 12:41:50');
INSERT INTO `t_download_message`
VALUES (15, 14, 22, '下载了：Java技术全解', '2024-05-12 12:43:45');
INSERT INTO `t_download_message`
VALUES (16, 14, 22, '下载了：Java技术全解', '2024-05-12 12:43:46');
INSERT INTO `t_download_message`
VALUES (17, 14, 22, '下载了：Java技术全解', '2024-05-12 12:44:54');
INSERT INTO `t_download_message`
VALUES (18, 14, 22, '下载了：Java技术全解', '2024-05-12 12:44:55');
INSERT INTO `t_download_message`
VALUES (19, 14, 22, '下载了：Java技术全解', '2024-05-12 12:45:18');
INSERT INTO `t_download_message`
VALUES (20, 14, 23, '下载了：MySQL数据库', '2024-05-19 21:32:48');
INSERT INTO `t_download_message`
VALUES (21, 14, 24, '下载了：SQLServer数据库', '2024-05-21 14:52:48');
INSERT INTO `t_download_message`
VALUES (22, 14, 24, '下载了：SQLServer数据库', '2024-05-21 15:03:15');
INSERT INTO `t_download_message`
VALUES (23, 14, 24, '下载了：SQLServer数据库', '2024-05-21 15:05:04');
INSERT INTO `t_download_message`
VALUES (24, 7, 19, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message`
VALUES (25, 8, 10, '下载了：50份优秀Java求职者简历', '2024-01-10 23:15:17');
INSERT INTO `t_download_message`
VALUES (26, 8, 7, '下载了：Postgresql数据库优化视频教程 下载', '2024-01-10 23:24:35');
INSERT INTO `t_download_message`
VALUES (27, 6, 19, '下载了：MUI全接触', '2024-01-11 01:58:11');
INSERT INTO `t_download_message`
VALUES (28, 9, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:30');
INSERT INTO `t_download_message`
VALUES (29, 10, 16, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:35');
INSERT INTO `t_download_message`
VALUES (30, 11, 15, '下载了：黑马JavaEE 57期', '2024-01-11 02:10:54');
INSERT INTO `t_download_message`
VALUES (31, 15, 14, '下载了：mybatis教程pdf合集', '2024-01-11 02:11:03');
INSERT INTO `t_download_message`
VALUES (32, 16, 19, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message`
VALUES (33, 7, 17, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-11 01:51:23');

-- ----------------------------
-- Table structure for t_information
-- ----------------------------
DROP TABLE IF EXISTS `t_information`;
CREATE TABLE `t_information`
(
    `id`      int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `userId`  int NULL DEFAULT NULL COMMENT '消息所属者id',
    `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
    `date`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX     `id`(`id` ASC) USING BTREE,
    INDEX     `userId`(`userId` ASC) USING BTREE,
    CONSTRAINT `t_information_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'int_formation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_information
-- ----------------------------
INSERT INTO `t_information`
VALUES (1, 6, '你的资源(Java编程思想)的分享链接已经失效,请及时更新', '2024-01-13 03:40:59');
INSERT INTO `t_information`
VALUES (2, 6, '已通过资源', '2024-01-16 16:21:27');
INSERT INTO `t_information`
VALUES (3, 6, '已减少积分50', '2024-01-16 16:21:33');
INSERT INTO `t_information`
VALUES (4, 14, '已增加积分50', '2024-05-12 11:44:25');
INSERT INTO `t_information`
VALUES (5, 7, '你的资源的分享链接已经通过', '2024-05-13 12:00:00');
INSERT INTO `t_information`
VALUES (6, 8, '你的资源的分享链接已经失效,请及时更新', '2024-05-13 13:00:00');
INSERT INTO `t_information`
VALUES (7, 9, '你的资源的分享链接已经通过', '2024-05-13 14:00:00');
INSERT INTO `t_information`
VALUES (8, 10, '你的资源的分享链接已经失效,请及时更新', '2024-05-13 15:00:00');
INSERT INTO `t_information`
VALUES (9, 11, '你的资源的分享链接已经通过', '2024-05-13 16:00:00');
INSERT INTO `t_information`
VALUES (10, 6, '你的资源的分享链接已经失效,请及时更新', '2024-01-13 03:40:59');
INSERT INTO `t_information`
VALUES (11, 14, '你的资源的分享链接已经通过\r\n你的资源的分享链接已经失效,请及时更新', '2024-05-22 15:29:46');
INSERT INTO `t_information`
VALUES (12, 6, '已通过资源', '2024-01-16 16:21:27');
INSERT INTO `t_information`
VALUES (13, 6, '已减少积分50', '2024-01-16 16:21:33');
INSERT INTO `t_information`
VALUES (14, 14, '已增加积分50', '2024-05-12 11:44:25');
INSERT INTO `t_information`
VALUES (15, 6, '你有一条新消息，请查收', '2024-05-13 12:00:00');
INSERT INTO `t_information`
VALUES (16, 7, '你的积分已增加100', '2024-05-13 13:00:00');
INSERT INTO `t_information`
VALUES (17, 8, '请更新你的联系方式', '2024-05-13 14:00:00');
INSERT INTO `t_information`
VALUES (18, 9, '有新的评论回复你', '2024-05-13 15:00:00');
INSERT INTO `t_information`
VALUES (19, 15, '你的资源被下载', '2024-05-15 15:00:00');
INSERT INTO `t_information`
VALUES (20, 14, '每日签到提醒', '2024-05-15 14:00:00');
INSERT INTO `t_information`
VALUES (21, 10, '你的文章被点赞', '2024-05-13 16:00:00');
INSERT INTO `t_information`
VALUES (22, 11, '系统维护通知', '2024-05-14 09:00:00');
INSERT INTO `t_information`
VALUES (23, 12, '账号安全提醒', '2024-05-14 10:00:00');
INSERT INTO `t_information`
VALUES (24, 13, '新的登录地点', '2024-05-14 11:00:00');
INSERT INTO `t_information`
VALUES (25, 14, '资料更新成功', '2024-05-14 12:00:00');
INSERT INTO `t_information`
VALUES (26, 15, '密码修改提醒', '2024-05-14 13:00:00');
INSERT INTO `t_information`
VALUES (27, 16, '新的关注者', '2024-05-14 14:00:00');
INSERT INTO `t_information`
VALUES (28, 17, '积分减少50', '2024-05-14 15:00:00');
INSERT INTO `t_information`
VALUES (29, 18, '有新的推荐文章', '2024-05-14 16:00:00');
INSERT INTO `t_information`
VALUES (30, 9, '评论被回复', '2024-05-15 09:00:00');
INSERT INTO `t_information`
VALUES (31, 10, '新的系统更新', '2024-05-15 10:00:00');
INSERT INTO `t_information`
VALUES (32, 11, '你的文章被收藏', '2024-05-15 11:00:00');
INSERT INTO `t_information`
VALUES (33, 12, '积分活动通知', '2024-05-15 12:00:00');
INSERT INTO `t_information`
VALUES (34, 13, '新的好友请求', '2024-05-15 13:00:00');

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link`
(
    `id`      int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
    `url`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
    `sortNum` int NULL DEFAULT NULL COMMENT '排列序号',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX     `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_link' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link`
VALUES (1, '百度', 'https://www.baidu.com', 1);
INSERT INTO `t_link`
VALUES (2, 'bing', 'https://www.bing.com', 2);
INSERT INTO `t_link`
VALUES (3, 'GitHub', 'https://www.github.com', 3);
INSERT INTO `t_link`
VALUES (4, 'GitEE', 'https://gitee.com', 4);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`
(
    `id`      int NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `title`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
    `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
    `time`    datetime NULL DEFAULT NULL COMMENT '时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice`
VALUES (1, '系统维护通知', '系统将在本周六凌晨进行维护，预计持续时间为2小时。请各位用户提前保存工作。',
        '2024-05-20 17:52:08');
INSERT INTO `t_notice`
VALUES (2, '新功能上线', '我们很高兴地宣布，新版本的系统已经上线，包含以下新功能...', '2024-05-05 10:00:00');
INSERT INTO `t_notice`
VALUES (3, '假期安排', '根据公司安排，端午节期间放假3天，放假时间为...', '2024-05-10 09:00:00');
INSERT INTO `t_notice`
VALUES (4, '重要通知', '由于政策变动，请大家尽快更新个人信息，以免影响正常使用。', '2024-05-12 15:00:00');
INSERT INTO `t_notice`
VALUES (5, '内部培训', '本月公司将组织一次内部培训，主要内容为...', '2024-05-14 14:00:00');
INSERT INTO `t_notice`
VALUES (6, '内部测试', '这是一条仅对内部公开的测试公告。', '2024-05-01 08:00:00');
INSERT INTO `t_notice`
VALUES (7, '内部讨论', '请各部门提交下一季度的工作计划。', '2024-05-05 10:00:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`
(
    `id`           int NOT NULL AUTO_INCREMENT COMMENT '编号',
    `userName`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
    `password`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
    `nickName`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
    `email`        varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
    `imageName`    varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像地址',
    `points`       int NULL DEFAULT NULL,
    `isVip`        int NULL DEFAULT NULL,
    `isOff`        int NULL DEFAULT NULL,
    `roleName`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
    `registerDate` datetime NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user`
VALUES (1, 'admin', 'admin', '银叶', '1203007469@qq.com', '20240114225430.jpg', 10000, 0, 0, '管理员',
        '2024-01-03 23:16:40');
INSERT INTO `t_user`
VALUES (2, 'admin1', 'admin1', '管理员1', '3465466546@qq.com', '20240114225430.jpg', 134, 1, 0, '管理员',
        '2024-05-12 13:24:48');
INSERT INTO `t_user`
VALUES (3, 'admin2', 'admin2', '管理员2', '2343211153@qq.com', '20240108235216.jpg', 100, 0, 0, '管理员',
        '2024-05-12 15:22:58');
INSERT INTO `t_user`
VALUES (4, 'admin3', 'admin3', '管理员3', 'dsfds@qq.com', '20240108235216.jpg', 1000, 1, 0, '普通用户',
        '2024-05-12 15:58:22');
INSERT INTO `t_user`
VALUES (5, 'admin4', 'admin4', '管理员4', 'dsakfjh@qq.com', '20240108235216.jpg', 1000, 1, 0, '管理员',
        '2024-05-13 09:29:12');
INSERT INTO `t_user`
VALUES (6, '111', '111111', 'LiuYun', '3495197980@qq.com', '20240108235216.jpg', 103, 0, 0, 'VIP用户',
        '2024-01-07 02:06:22');
INSERT INTO `t_user`
VALUES (7, '222', '222222', '222', '12030074169@qq.com', '20240107021707.PNG', 100, 0, 0, '普通用户',
        '2024-01-07 02:17:07');
INSERT INTO `t_user`
VALUES (8, '333', '333333', '尔玛', '12030074619@qq.com', '20240109172637.jfif', 100, 0, 0, '普通用户',
        '2024-01-09 17:26:37');
INSERT INTO `t_user`
VALUES (9, '444', '444444', '444', '12031007469@qq.com', '20240111025503.jpg', 0, 0, 0, '普通用户',
        '2024-01-11 02:55:03');
INSERT INTO `t_user`
VALUES (10, '555', '555555', '555', 'f1203007469@gmail.com', '20240111025655.jpg', 0, 1, 0, 'VIP用户',
        '2024-01-11 02:56:55');
INSERT INTO `t_user`
VALUES (11, '666', '666666', '666', 'zou66786961@163.com', '20240111025751.jpg', 100, 0, 0, '普通用户',
        '2024-01-11 02:57:51');
INSERT INTO `t_user`
VALUES (12, '777', '777777', '777', 'f12030074691@gmail.com', '20240113053514.png', 50, 0, 0, '普通用户',
        '2024-01-13 05:35:14');
INSERT INTO `t_user`
VALUES (13, '888', '888888', '888', 'zou667869611@163.com', '20240108235216.jpg', 100, 0, 1, '普通用户',
        '2024-01-14 04:35:24');
INSERT INTO `t_user`
VALUES (14, 'user11', '111111', 'ghg', '3582311515@qq.com', '20240111025655.jpg', 43, 0, 0, '普通用户',
        '2024-05-11 08:13:35');
INSERT INTO `t_user`
VALUES (15, 'ghgf', '123111', 'trt', 'rddrtd11111@qq.com', '20240108235216.jpg', 150, 0, 0, '普通用户',
        '2024-05-12 15:28:23');
INSERT INTO `t_user`
VALUES (16, 'gfhdfg', '123456', 'yhg ', '234523@qq.com', '20240513093313.jpg', 100, 0, 0, '普通用户',
        '2024-05-13 09:33:13');
INSERT INTO `t_user`
VALUES (17, 'user1', 'user123', '用户1', '1234abc@qq.com', '20240108235216.jpg', 100, 0, 0, '普通用户',
        '2024-05-16 16:30:34');
INSERT INTO `t_user`
VALUES (18, 'rtrty', '123456', 'gfhfgh', 'sdfgsdg@qq.com', '20240108235216.jpg', 100, 0, 0, '普通用户',
        '2024-05-16 20:41:18');

SET
FOREIGN_KEY_CHECKS = 1;
