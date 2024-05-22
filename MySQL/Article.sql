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

 Date: 22/05/2024 15:47:02
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
  `isUseful` int NULL DEFAULT NULL COMMENT '链接是否失效 0代表未失效 1代表已经失效',
  `click` int NULL DEFAULT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `articleTypeId`(`articleTypeId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `t_article_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 't_article' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
