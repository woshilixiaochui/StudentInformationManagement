/*
 Navicat Premium Data Transfer

 Source Server         : SIM
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : studentinformationmanagement

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 24/07/2023 15:20:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `hobby` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '周星驰', 20, '男', '看书', 'woshilixiaochui');
INSERT INTO `student` VALUES (2, '吴孟达', 22, '男', '打球', '2555151@gmail.com');
INSERT INTO `student` VALUES (3, '张曼玉', 21, '女', '游泳', '9595694@qq.com');
INSERT INTO `student` VALUES (4, '林青霞', 34, '女', '听歌', '959584841@gmail.com');
INSERT INTO `student` VALUES (5, '刘德华', 25, '男', '骑马', '5851354@qq.com');
INSERT INTO `student` VALUES (6, '周华健', 26, '男', '唱歌', '99948484@qq.com');
INSERT INTO `student` VALUES (7, '郭富城', 23, '男', '跳舞', '985661412@qq.com');
INSERT INTO `student` VALUES (8, '方文山', 26, '男', '写词', '96321475@qq.com');
INSERT INTO `student` VALUES (11, '李小锤', 21, '男', '篮球', 'sjdfjklsjdflj@gmail.com');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
