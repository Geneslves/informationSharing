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

 Date: 22/05/2024 15:47:25
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

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

SET
FOREIGN_KEY_CHECKS = 1;
