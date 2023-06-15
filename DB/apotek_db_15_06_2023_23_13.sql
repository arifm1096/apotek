/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : apotek_db

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 15/06/2023 23:13:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tm_dokter
-- ----------------------------
DROP TABLE IF EXISTS `tm_dokter`;
CREATE TABLE `tm_dokter`  (
  `id_dokter` int(11) NULL DEFAULT NULL,
  `kode_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_dokter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `klinik_rs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_dokter
-- ----------------------------

-- ----------------------------
-- Table structure for tm_hak_akses
-- ----------------------------
DROP TABLE IF EXISTS `tm_hak_akses`;
CREATE TABLE `tm_hak_akses`  (
  `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_hak_akses`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_hak_akses
-- ----------------------------
INSERT INTO `tm_hak_akses` VALUES (1, 'FULL', '-', 'y', NULL, NULL, NULL, '2023-06-15 08:35:48', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (2, 'GUDANG', NULL, 'y', NULL, NULL, NULL, '2023-06-14 23:16:02', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (3, 'KASIR', '-', 'y', NULL, NULL, NULL, '2023-06-15 08:35:56', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (4, 'sadsd', 'sadsda', 'y', NULL, NULL, NULL, '2023-06-14 23:23:58', 2, '2023-06-14 23:23:58', 1);
INSERT INTO `tm_hak_akses` VALUES (5, 'zxczxc', 'zxczxc', 'y', NULL, NULL, NULL, '2023-06-14 23:25:49', 2, '2023-06-14 23:25:49', 1);

-- ----------------------------
-- Table structure for tm_pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `tm_pelanggan`;
CREATE TABLE `tm_pelanggan`  (
  `id_pelanggan` int(255) NOT NULL AUTO_INCREMENT,
  `kode_pelanggan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_pelanggan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_pelanggan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_pelanggan
-- ----------------------------
INSERT INTO `tm_pelanggan` VALUES (1, 'sdfds23', 'dsfsdf35435', 'sdfsdf123213', '43545345', 'n', NULL, NULL, NULL, '2023-06-15 22:41:41', 2, '2023-06-15 22:41:41', 1);

-- ----------------------------
-- Table structure for tm_satuan
-- ----------------------------
DROP TABLE IF EXISTS `tm_satuan`;
CREATE TABLE `tm_satuan`  (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `kd_statuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_satuan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_satuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_satuan
-- ----------------------------

-- ----------------------------
-- Table structure for tm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tm_supplier`;
CREATE TABLE `tm_supplier`  (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_supplier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_tlpn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_supplier
-- ----------------------------
INSERT INTO `tm_supplier` VALUES (1, '-df45', '-', '-', NULL, 'n', NULL, NULL, NULL, '2023-06-15 14:44:02', 1, '2023-06-15 14:44:03', 1);
INSERT INTO `tm_supplier` VALUES (2, 'dsfdsf', 'dsfdsf', 'dsfdsf', NULL, 'n', NULL, NULL, NULL, '2023-06-15 14:53:10', NULL, NULL, 0);

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
  `wilayah` int(11) NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_user
-- ----------------------------
INSERT INTO `tm_user` VALUES (1, 'Admin Gudang', 'admin', '', 1, 1, 'y', NULL, NULL, NULL, '2023-06-14 14:03:23', NULL, NULL, 0);
INSERT INTO `tm_user` VALUES (2, 'Kasir', 'kasir', '446a5cf1593ddb78a2bf', 3, 2, 'y', NULL, NULL, NULL, '2023-06-14 16:10:50', 1, '2023-06-14 16:09:05', 0);
INSERT INTO `tm_user` VALUES (3, 'asdas', 'asdas', '60d6f293ae3b847177c2', 3, 1, 'y', NULL, NULL, NULL, '2023-06-14 14:04:08', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_wilayah
-- ----------------------------
DROP TABLE IF EXISTS `tm_wilayah`;
CREATE TABLE `tm_wilayah`  (
  `id_wilayah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_wilayah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_wilayah`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_wilayah
-- ----------------------------
INSERT INTO `tm_wilayah` VALUES (1, 'Gudang Pusat ', 'Karanganyar ', 'y', NULL, NULL, NULL, '2023-06-14 16:08:59', NULL, NULL, 0);
INSERT INTO `tm_wilayah` VALUES (2, 'Apotek Karanganyar', 'Karanganyar', 'y', NULL, NULL, NULL, '2023-06-14 16:11:32', 1, '2023-06-14 16:10:57', 0);

-- ----------------------------
-- Table structure for tx_jual
-- ----------------------------
DROP TABLE IF EXISTS `tx_jual`;
CREATE TABLE `tx_jual`  (
  `id_jual` int(11) NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_pokok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_jual` int(11) NULL DEFAULT NULL,
  `diskon` double NULL DEFAULT NULL,
  `total` int(255) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jual`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_jual
-- ----------------------------

-- ----------------------------
-- Table structure for tx_kasir
-- ----------------------------
DROP TABLE IF EXISTS `tx_kasir`;
CREATE TABLE `tx_kasir`  (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_transaksi` int(11) NULL DEFAULT NULL,
  `total` int(11) NULL DEFAULT NULL,
  `jumlah_uang` int(255) NULL DEFAULT NULL,
  `kembalian` int(255) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_kasir`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_kasir
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
