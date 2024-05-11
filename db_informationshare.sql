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

 Date: 11/05/2024 20:46:38
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
  `downloadLink` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '百度云链接',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接密码',
  `isHot` int NULL DEFAULT NULL COMMENT '是否热门 0代表不是 1代表是',
  `state` int NULL DEFAULT NULL COMMENT '状态 1代表未审核 2代表审核通过 3代表审核未通过',
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核未通过理由',
  `checkDate` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `isUseful` int NULL DEFAULT NULL COMMENT '链接是否失效 0代表未失效 1代表已经失效',
  `click` int NULL DEFAULT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `articleTypeId`(`articleTypeId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `t_article_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (57, 'java编程思想', '2024-01-10 22:58:56', 34, 1, 2, 'java编程思想\n', '<p><a href=\"http://localhost:8080/article/23\" title=\"java编程思想\">java编程思想</a></p>\r\n', '111', '111', 1, 3, '链接失效', '2024-01-17 21:42:54', 0, 19);
INSERT INTO `t_article` VALUES (58, '拳皇版超级玛丽13可执行文件', '2024-01-10 23:00:53', 34, 1, 4, '拳皇版超级玛丽13可执行文件\n', '<p>拳皇版超级玛丽13可执行文件</p>\r\n', '11', '11', 1, 2, NULL, NULL, 0, 11);
INSERT INTO `t_article` VALUES (59, '2020年java常见笔试面试题汇总(附答案)', '2024-01-10 23:01:14', 34, 1, 5, '2020年java常见笔试面试题汇总(附答案)\n', '<p>2020年java常见笔试面试题汇总(附答案)</p>\r\n', '111', '11', 1, 2, '无', '2024-01-13 19:49:35', 1, 28);
INSERT INTO `t_article` VALUES (60, '常用日期函数', '2024-01-10 23:01:36', 34, 2, 5, '常用日期函数\n', '<p>常用日期函数</p>\r\n', '11', '11', 1, 2, '无', '2024-01-13 19:49:32', 1, 14);
INSERT INTO `t_article` VALUES (61, '王二暖Oracle视频教程 下载', '2024-01-10 23:02:24', 34, 2, 3, '王二暖Oracle视频教程 下载\n', '<p>王二暖Oracle视频教程 下载</p>\r\n', '11', '11', 1, 2, NULL, NULL, 0, 20);
INSERT INTO `t_article` VALUES (62, 'Mysql从入门到精通视频教程（共29集）下载', '2024-01-10 23:02:56', 34, 2, 5, 'Mysql从入门到精通视频教程（共29集）下载\n', '<p>Mysql从入门到精通视频教程（共29集）下载</p>\r\n', '11', '11', 1, 2, '无', '2024-01-13 19:49:29', 1, 29);
INSERT INTO `t_article` VALUES (63, 'Postgresql数据库优化视频教程 下载', '2024-01-10 23:03:13', 34, 2, 5, 'Postgresql数据库优化视频教程 下载\n', '<p>Postgresql数据库优化视频教程 下载</p>\r\n', '1', '1', 1, 2, '无', '2024-01-13 19:49:25', 1, 21);
INSERT INTO `t_article` VALUES (64, 'Oracle Rachel操作手册', '2024-01-10 23:03:46', 34, 2, 4, 'Oracle Rachel操作手册\n', '<p>Oracle Rachel操作手册</p>\r\n', '1', '1', 1, 2, '无', '2024-03-16 09:29:52', 1, 3);
INSERT INTO `t_article` VALUES (65, 'mysql高级mycat集群视频&redis视频视频教程 下载', '2024-01-10 23:04:06', 34, 2, 3, 'mysql高级mycat集群视频&amp;redis视频视频教程 下载\n', '<p>mysql高级mycat集群视频&amp;redis视频视频教程 下载</p>\r\n', '1', '1', 1, 2, '无', '2024-03-16 09:29:19', 1, 3);
INSERT INTO `t_article` VALUES (66, '50份优秀Java求职者简历', '2024-01-10 23:04:53', 35, 1, 4, '50份优秀Java求职者简历\n', '<p>50份优秀Java求职者简历</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 29);
INSERT INTO `t_article` VALUES (67, '高级架构师进阶24天视频教程', '2024-01-10 23:05:07', 35, 1, 4, '高级架构师进阶24天视频教程\n', '<p>高级架构师进阶24天视频教程</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 31);
INSERT INTO `t_article` VALUES (68, '从零开始学java', '2024-01-10 23:05:19', 35, 1, 5, '从零开始学java\n', '<p>从零开始学java</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 43);
INSERT INTO `t_article` VALUES (69, '刘道成MySQL系列教程', '2024-01-10 23:05:34', 35, 2, 4, '刘道成MySQL系列教程\n', '<p>刘道成MySQL系列教程</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 33);
INSERT INTO `t_article` VALUES (70, 'mybatis教程pdf合集', '2024-01-10 23:05:51', 35, 2, 3, 'mybatis教程pdf合集\n', '<p>mybatis教程pdf合集</p>\r\n', '11', '1', 1, 1, NULL, NULL, 1, 44);
INSERT INTO `t_article` VALUES (71, '黑马JavaEE 57期', '2024-01-10 23:06:15', 35, 4, 4, '黑马JavaEE 57期\n', '<p>黑马JavaEE 57期</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 39);
INSERT INTO `t_article` VALUES (72, 'SSM整合案例【企业权限管理系统】视频教程', '2024-01-10 23:06:30', 35, 4, 4, 'SSM整合案例【企业权限管理系统】视频教程\n', '<p><a href=\"http://download.java1234.com/article/1942\" target=\"_blank\" title=\"SSM整合案例【企业权限管理系统】视频教程\">SSM整合案例【企业权限管理系统】视频教程</a></p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 55);
INSERT INTO `t_article` VALUES (73, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-10 23:07:29', 35, 3, 2, 'Vue2.0+Node.js+MongoDB全栈打造商城系统视\n', '<p>Vue2.0+Node.js+MongoDB全栈打造商城系统视</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 44);
INSERT INTO `t_article` VALUES (74, 'Vue项目实战教程', '2024-01-10 23:07:42', 35, 3, 5, 'Vue项目实战教程\n', '<p>Vue项目实战教程</p>\r\n', '1', '1', 1, 1, NULL, NULL, 1, 53);
INSERT INTO `t_article` VALUES (75, 'MUI全接触', '2024-01-10 23:07:55', 35, 3, 7, 'MUI全接触\n', '<p>MUI全接触</p>\r\n', '1', '1', 1, 2, '无', '2024-05-11 08:14:39', 1, 120);
INSERT INTO `t_article` VALUES (76, 'web打印分页设置', '2024-01-10 23:12:11', 34, 3, 5, 'web打印分页设置\n', '<p><a href=\"http://download.java1234.com/article/1845\" target=\"_blank\" title=\"web打印分页设置\">web打印分页设置</a></p>\r\n', '1', '1', 0, 2, '无', '2024-01-13 19:49:17', 1, 3);
INSERT INTO `t_article` VALUES (92, 'Web前端技术', '2024-01-17 22:49:01', 34, 3, 4, 'Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术\n\n\n\n\n\n&nbsp;\n', '<p>Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术Web前端技术</p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240117224856.jpg\" style=\"height:457px; width:700px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/static/images/articleImage/20240118141517.jpg\" style=\"height:62px; width:700px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', '1', 0, 2, '无', '2024-05-11 08:22:16', 1, 210);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article_type' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES (1, 'Java技术', 'Java技术', 1);
INSERT INTO `t_article_type` VALUES (2, '数据库技术', '数据库技术', 3);
INSERT INTO `t_article_type` VALUES (3, 'Web前端技术', 'Web前端技术', 4);
INSERT INTO `t_article_type` VALUES (4, 'J2EE技术', 'J2EE技术', 2);
INSERT INTO `t_article_type` VALUES (9, '分布式微服技术', '分布式微服技术', 5);
INSERT INTO `t_article_type` VALUES (10, '移动APP开发技术', '移动APP开发技术', 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_comment' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (33, 34, 75, '11', '2024-01-10 23:10:12', 35, 1);
INSERT INTO `t_comment` VALUES (34, 34, 75, '22', '2024-01-10 23:10:14', 35, 1);
INSERT INTO `t_comment` VALUES (35, 35, 62, '111', '2024-01-10 23:10:50', 34, 1);
INSERT INTO `t_comment` VALUES (39, 34, 67, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2024-01-11 22:34:39', 35, 1);
INSERT INTO `t_comment` VALUES (57, 34, 67, '666', '2024-01-17 20:32:18', 35, 2);

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
  CONSTRAINT `t_download_message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_download_message' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_download_message
-- ----------------------------
INSERT INTO `t_download_message` VALUES (48, 35, 68, '下载了：从零开始学java', '2024-01-10 23:09:32');
INSERT INTO `t_download_message` VALUES (49, 34, 75, '下载了：MUI全接触', '2024-01-10 23:10:20');
INSERT INTO `t_download_message` VALUES (50, 34, 66, '下载了：50份优秀Java求职者简历', '2024-01-10 23:15:17');
INSERT INTO `t_download_message` VALUES (51, 34, 63, '下载了：Postgresql数据库优化视频教程 下载', '2024-01-10 23:24:35');
INSERT INTO `t_download_message` VALUES (52, 34, 73, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-11 01:51:23');
INSERT INTO `t_download_message` VALUES (53, 34, 75, '下载了：MUI全接触', '2024-01-11 01:58:11');
INSERT INTO `t_download_message` VALUES (54, 34, 72, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:30');
INSERT INTO `t_download_message` VALUES (55, 34, 72, '下载了：SSM整合案例【企业权限管理系统】视频教程', '2024-01-11 02:10:35');
INSERT INTO `t_download_message` VALUES (56, 34, 71, '下载了：黑马JavaEE 57期', '2024-01-11 02:10:54');
INSERT INTO `t_download_message` VALUES (57, 34, 70, '下载了：mybatis教程pdf合集', '2024-01-11 02:11:03');
INSERT INTO `t_download_message` VALUES (76, 34, 73, '下载了：Vue2.0+Node.js+MongoDB全栈打造商城系统视', '2024-01-17 13:01:21');
INSERT INTO `t_download_message` VALUES (77, 34, 75, '下载了：MUI全接触', '2024-01-17 21:45:12');
INSERT INTO `t_download_message` VALUES (78, 34, 65, '下载了：mysql高级mycat集群视频&redis视频视频教程 下载', '2024-03-16 09:29:23');
INSERT INTO `t_download_message` VALUES (79, 42, 92, '下载了：Web前端技术', '2024-05-11 08:17:40');

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'int_formation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_information
-- ----------------------------
INSERT INTO `t_information` VALUES (1, 34, '你的资源(Java编程思想)的分享链接已经失效,请及时更新', '2024-01-13 03:40:59');
INSERT INTO `t_information` VALUES (12, 34, 'qqqqqqqqq', '2024-01-16 16:21:27');
INSERT INTO `t_information` VALUES (13, 34, 'wwwwww', '2024-01-16 16:21:33');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_link' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES (4, '百度', 'https://www.baidu.com', 1);
INSERT INTO `t_link` VALUES (5, 'bing', 'https://www.bing.com', 2);
INSERT INTO `t_link` VALUES (6, 'GitHub', 'https://www.github.com', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', '乐道', '1203007469@qq.com', '20240114225430.jpg', 10000, 1, 0, '管理员', '2024-01-03 23:16:40');
INSERT INTO `t_user` VALUES (34, '111', '111111', 'LeDao', '3495197980@qq.com', '20240108235216.jpg', 105, 0, 0, 'VIP用户', '2024-01-07 02:06:22');
INSERT INTO `t_user` VALUES (35, '222', '222222', '222', '12030074169@qq.com', '20240107021707.PNG', 102, 0, 0, 'VIP用户', '2024-01-07 02:17:07');
INSERT INTO `t_user` VALUES (36, '333', '333333', '乐道乐', '12030074619@qq.com', '20240109172637.jfif', 100, 0, 0, '普通用户', '2024-01-09 17:26:37');
INSERT INTO `t_user` VALUES (37, '444', '444444', '444', '12031007469@qq.com', '20240111025503.jpg', 100, 0, 0, '普通用户', '2024-01-11 02:55:03');
INSERT INTO `t_user` VALUES (38, '555', '555555', '555', 'f1203007469@gmail.com', '20240111025655.jpg', 100, 0, 0, '普通用户', '2024-01-11 02:56:55');
INSERT INTO `t_user` VALUES (39, '666', '666666', '666', 'zou66786961@163.com', '20240111025751.jpg', 100, 0, 0, '普通用户', '2024-01-11 02:57:51');
INSERT INTO `t_user` VALUES (40, '777', '777777', '777', 'f12030074691@gmail.com', '20240113053514.png', 100, 0, 0, '普通用户', '2024-01-13 05:35:14');
INSERT INTO `t_user` VALUES (41, '888', '888888', '888', 'zou667869611@163.com', NULL, 100, 0, 1, '普通用户', '2024-01-14 04:35:24');
INSERT INTO `t_user` VALUES (42, 'user11', '123456', 'gh', '123456@qq.com', '20240511081335.jpg', 96, 0, 0, '普通用户', '2024-05-11 08:13:35');

SET FOREIGN_KEY_CHECKS = 1;
