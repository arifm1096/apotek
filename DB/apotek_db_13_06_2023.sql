/*
 Navicat Premium Data Transfer

 Source Server         : Server 192.168.71.6(Staff)
 Source Server Type    : MySQL
 Source Server Version : 100338
 Source Host           : 192.168.71.6:3306
 Source Schema         : apotek_db

 Target Server Type    : MySQL
 Target Server Version : 100338
 File Encoding         : 65001

 Date: 13/06/2023 16:56:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tm_hak_akses
-- ----------------------------
DROP TABLE IF EXISTS `tm_hak_akses`;
CREATE TABLE `tm_hak_akses`  (
  `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_hak_akses`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_hak_akses
-- ----------------------------
INSERT INTO `tm_hak_akses` VALUES (1, 'FULL', NULL, NULL, NULL, NULL, '2023-06-13 14:34:51', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (2, 'GUDANG', NULL, NULL, NULL, NULL, '2023-06-13 14:32:10', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (3, 'KASIR', NULL, NULL, NULL, NULL, '2023-06-13 14:34:55', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_user
-- ----------------------------
DROP TABLE IF EXISTS `tm_user`;
CREATE TABLE `tm_user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hak_akses` int(11) NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_user
-- ----------------------------
INSERT INTO `tm_user` VALUES (1, NULL, 'admin', 'e65b553ec1ba6b20de79', 1, 'y', NULL, NULL, NULL, NULL, '2023-06-13 16:54:36', NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
