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

 Date: 22/05/2024 15:47:14
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

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

SET
FOREIGN_KEY_CHECKS = 1;
