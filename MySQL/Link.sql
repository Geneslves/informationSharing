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

 Date: 22/05/2024 15:48:02
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

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

SET
FOREIGN_KEY_CHECKS = 1;
