/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : apotek_db

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 28/06/2023 08:00:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tm_dokter
-- ----------------------------
DROP TABLE IF EXISTS `tm_dokter`;
CREATE TABLE `tm_dokter`  (
  `id_dokter` int NULL DEFAULT NULL,
  `kode_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_dokter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `klinik_rs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_dokter
-- ----------------------------

-- ----------------------------
-- Table structure for tm_hak_akses
-- ----------------------------
DROP TABLE IF EXISTS `tm_hak_akses`;
CREATE TABLE `tm_hak_akses`  (
  `id_hak_akses` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_hak_akses`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_hak_akses
-- ----------------------------
INSERT INTO `tm_hak_akses` VALUES (1, 'FULL', '-', 'y', NULL, NULL, NULL, '2023-06-15 08:35:48', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (2, 'GUDANG', NULL, 'y', NULL, NULL, NULL, '2023-06-14 23:16:02', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (3, 'KASIR', '-', 'y', NULL, NULL, NULL, '2023-06-15 08:35:56', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (4, 'sadsd', 'sadsda', 'y', NULL, NULL, NULL, '2023-06-14 23:23:58', 2, '2023-06-14 23:23:58', 1);
INSERT INTO `tm_hak_akses` VALUES (5, 'zxczxc', 'zxczxc', 'y', NULL, NULL, NULL, '2023-06-14 23:25:49', 2, '2023-06-14 23:25:49', 1);

-- ----------------------------
-- Table structure for tm_jenis_harga
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_harga`;
CREATE TABLE `tm_jenis_harga`  (
  `id_jenis_harga` int NOT NULL AUTO_INCREMENT,
  `nama_jenis_harga` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jenis_harga`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_jenis_harga
-- ----------------------------
INSERT INTO `tm_jenis_harga` VALUES (1, 'Fleksibel', NULL, NULL, NULL, '2023-06-21 10:27:16', NULL, NULL, 0);
INSERT INTO `tm_jenis_harga` VALUES (2, 'Grosir', NULL, NULL, NULL, '2023-06-21 10:28:39', NULL, NULL, 0);
INSERT INTO `tm_jenis_harga` VALUES (3, 'Memebership', NULL, NULL, NULL, '2023-06-21 10:28:55', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_jenis_produk
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_produk`;
CREATE TABLE `tm_jenis_produk`  (
  `id_jenis_produk` int NOT NULL AUTO_INCREMENT,
  `nama_jenis_produk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jenis_produk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_jenis_produk
-- ----------------------------
INSERT INTO `tm_jenis_produk` VALUES (1, 'Alat Medis', NULL, 'y', NULL, NULL, NULL, '2023-06-24 22:28:54', NULL, NULL, 0);
INSERT INTO `tm_jenis_produk` VALUES (2, 'Obat', NULL, 'y', NULL, NULL, NULL, '2023-06-24 22:28:54', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `tm_pelanggan`;
CREATE TABLE `tm_pelanggan`  (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `kode_pelanggan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_pelanggan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_pelanggan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_pelanggan
-- ----------------------------
INSERT INTO `tm_pelanggan` VALUES (1, 'sdfds23', 'dsfsdf35435', 'sdfsdf123213', '43545345', 'n', NULL, NULL, NULL, '2023-06-15 22:41:41', 2, '2023-06-15 22:41:41', 1);

-- ----------------------------
-- Table structure for tm_produk_by
-- ----------------------------
DROP TABLE IF EXISTS `tm_produk_by`;
CREATE TABLE `tm_produk_by`  (
  `id_produk_by` int NOT NULL AUTO_INCREMENT,
  `nama_produk_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_produk_by
-- ----------------------------

-- ----------------------------
-- Table structure for tm_rak
-- ----------------------------
DROP TABLE IF EXISTS `tm_rak`;
CREATE TABLE `tm_rak`  (
  `id_rak` int NOT NULL AUTO_INCREMENT,
  `nama_rak` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_rak`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_rak
-- ----------------------------
INSERT INTO `tm_rak` VALUES (1, 'Obat 1', 'y', NULL, NULL, NULL, '2023-06-25 14:44:39', NULL, NULL, 0);
INSERT INTO `tm_rak` VALUES (2, 'Alkes 1', 'y', NULL, NULL, NULL, '2023-06-25 14:45:01', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_satuan
-- ----------------------------
DROP TABLE IF EXISTS `tm_satuan`;
CREATE TABLE `tm_satuan`  (
  `id_satuan` int NOT NULL AUTO_INCREMENT,
  `kd_statuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_satuan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_satuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_satuan
-- ----------------------------
INSERT INTO `tm_satuan` VALUES (1, 'Tbt', 'Tablet', NULL, 'y', NULL, NULL, NULL, '2023-06-21 10:24:46', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (2, 'Strp', 'Strip', NULL, 'y', NULL, NULL, NULL, '2023-06-21 10:25:12', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (3, 'Box', 'Boks', NULL, 'y', NULL, NULL, NULL, '2023-06-21 10:25:34', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tm_supplier`;
CREATE TABLE `tm_supplier`  (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_supplier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_tlpn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hak_akses` int NULL DEFAULT NULL,
  `wilayah` int NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_user
-- ----------------------------
INSERT INTO `tm_user` VALUES (1, 'Admin Gudang', 'admin', 'e65b553ec1ba6b20de79', 1, 1, 'y', NULL, NULL, NULL, '2023-06-27 22:26:10', NULL, NULL, 0);
INSERT INTO `tm_user` VALUES (2, 'Kasir', 'kasir', '446a5cf1593ddb78a2bf', 3, 2, 'y', NULL, NULL, NULL, '2023-06-14 16:10:50', 1, '2023-06-14 16:09:05', 0);
INSERT INTO `tm_user` VALUES (3, 'asdas', 'asdas', '60d6f293ae3b847177c2', 3, 1, 'y', NULL, NULL, NULL, '2023-06-14 14:04:08', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_wilayah
-- ----------------------------
DROP TABLE IF EXISTS `tm_wilayah`;
CREATE TABLE `tm_wilayah`  (
  `id_wilayah` int NOT NULL AUTO_INCREMENT,
  `nama_wilayah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_wilayah`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id_jual` int NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_pokok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_jual` int NULL DEFAULT NULL,
  `diskon` double NULL DEFAULT NULL,
  `total` int NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jual`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_jual
-- ----------------------------

-- ----------------------------
-- Table structure for tx_kasir
-- ----------------------------
DROP TABLE IF EXISTS `tx_kasir`;
CREATE TABLE `tx_kasir`  (
  `id_kasir` int NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_transaksi` int NULL DEFAULT NULL,
  `total` int NULL DEFAULT NULL,
  `jumlah_uang` int NULL DEFAULT NULL,
  `kembalian` int NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_kasir`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_kasir
-- ----------------------------

-- ----------------------------
-- Table structure for tx_produk
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk`;
CREATE TABLE `tx_produk`  (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `sku_kode_produk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `barcode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_produk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `satuan_utama` int NULL DEFAULT NULL,
  `jumlah_minimal` int NULL DEFAULT NULL,
  `id_rak` int NULL DEFAULT NULL,
  `id_jenis_produk` int NULL DEFAULT NULL,
  `produk_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_jual` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk
-- ----------------------------
INSERT INTO `tx_produk` VALUES (3, 'sdsd', '32434', 'dsfsdf', 3, 3, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (4, 'sdsd', '32434', 'dsfsdf', 3, 3, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (5, 'sdsd', '32434', 'dsfsdf', 3, 3, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (6, 'sdsd', '32434', 'dsfsdf', 3, 3, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (7, 'hjhasd', '234324', 'dsfdsdsf', 1, 2, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (8, 'kjkj2312', '324234', 'Suntik', 1, 10, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (9, 'kjkj2312', '324234', 'Suntik', 1, 1, 1, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (10, 'kjkj2312', '324234', 'Suntik', 1, 1, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (11, 'kjkj2312', '324234', 'Suntik', 1, 50, 2, 1, NULL, 'y', 2, '2023-06-26 20:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (12, 'sr121232', '1231334', 'Parasetamol', 1, 10, 1, 2, NULL, 'y', 2, '2023-06-27 16:06:00', NULL, '2023-06-27 23:08:33', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_detail`;
CREATE TABLE `tx_produk_detail`  (
  `id_produk_detail` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NULL DEFAULT NULL,
  `id_satuan` int NULL DEFAULT NULL,
  `jumlah_produk` int NULL DEFAULT NULL,
  `jumlah_produk_p` int NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_detail
-- ----------------------------
INSERT INTO `tx_produk_detail` VALUES (1, 11, 1, 1, 1, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:19:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (2, 11, 1, 1, 1, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:21:53', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (3, 11, 2, 1, 10, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:21:53', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (4, 11, 3, 1, 20, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:21:53', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (5, 11, NULL, NULL, NULL, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:21:53', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (6, 11, NULL, NULL, NULL, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:30:22', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (7, 11, NULL, NULL, NULL, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:30:53', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (8, 11, 1, 1, 1, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:48:44', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (9, 11, 2, 1, 10, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:48:44', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (10, 11, 3, 1, 20, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:48:44', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (11, 11, NULL, NULL, NULL, 2, '2023-06-26 21:06:00', NULL, '2023-06-27 02:48:44', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-27 03:13:38', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (13, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:18:57', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (14, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:18:57', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (15, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:18:57', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (16, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:18:57', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (17, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:19:36', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (18, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:19:36', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (19, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:19:36', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (20, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:19:36', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (21, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:24:12', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (22, 11, 2, 1, 10, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:24:12', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (23, 11, 3, 1, 20, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:24:12', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (24, 11, 0, 0, 0, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:24:12', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (25, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:29', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (26, 11, 2, 1, 10, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:29', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (27, 11, 3, 1, 20, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:29', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (28, 11, 0, 0, 0, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:29', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (29, 11, 1, 1, 1, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (30, 11, 2, 1, 10, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (31, 11, 3, 1, 20, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (32, 11, 0, 0, 0, 2, '2023-06-26 22:06:00', NULL, '2023-06-27 03:25:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (33, 11, 1, 1, 1, 2, '2023-06-26 22:28:18', NULL, '2023-06-27 03:28:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (34, 11, 2, 1, 10, 2, '2023-06-26 22:28:18', NULL, '2023-06-27 03:28:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (35, 11, 3, 1, 20, 2, '2023-06-26 22:28:18', NULL, '2023-06-27 03:28:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (36, 11, 0, 0, 0, 2, '2023-06-26 22:28:18', NULL, '2023-06-27 03:28:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (37, 11, 1, 1, 1, 2, '0000-00-00 00:00:00', NULL, '2023-06-27 03:29:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (38, 11, 2, 1, 10, 2, '0000-00-00 00:00:00', NULL, '2023-06-27 03:29:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (39, 11, 3, 1, 20, 2, '0000-00-00 00:00:00', NULL, '2023-06-27 03:29:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (40, 11, 0, 0, 0, 2, '0000-00-00 00:00:00', NULL, '2023-06-27 03:29:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (41, 11, 1, 1, 1, 2, '2023-06-27 03:32:07', NULL, '2023-06-27 03:32:07', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (42, 11, 2, 1, 10, 2, '2023-06-27 03:32:07', NULL, '2023-06-27 03:32:07', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (43, 11, 3, 1, 20, 2, '2023-06-27 03:32:07', NULL, '2023-06-27 03:32:07', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (44, 11, 0, 0, 0, 2, '2023-06-27 03:32:07', NULL, '2023-06-27 03:32:07', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (45, 11, 1, 1, 1, 2, '2023-06-27 03:34:28', NULL, '2023-06-27 03:34:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (46, 11, 2, 1, 10, 2, '2023-06-27 03:34:28', NULL, '2023-06-27 03:34:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (47, 11, 3, 1, 20, 2, '2023-06-27 03:34:28', NULL, '2023-06-27 03:34:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (48, 11, 0, 0, 0, 2, '2023-06-27 03:34:28', NULL, '2023-06-27 03:34:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (49, 11, 1, 1, 1, 2, '2023-06-27 04:26:28', NULL, '2023-06-27 04:26:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (50, 11, 2, 1, 10, 2, '2023-06-27 04:26:28', NULL, '2023-06-27 04:26:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (51, 11, 3, 1, 20, 2, '2023-06-27 04:26:28', NULL, '2023-06-27 04:26:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (52, 11, 0, 0, 0, 2, '2023-06-27 04:26:28', NULL, '2023-06-27 04:26:28', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (53, 11, 1, 1, 1, 2, '2023-06-27 04:28:33', NULL, '2023-06-27 04:28:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (54, 11, 2, 1, 10, 2, '2023-06-27 04:28:33', NULL, '2023-06-27 04:28:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (55, 11, 3, 1, 20, 2, '2023-06-27 04:28:33', NULL, '2023-06-27 04:28:33', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (56, 11, 1, 1, 1, 2, '2023-06-27 04:29:02', NULL, '2023-06-27 04:29:02', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (57, 11, 2, 1, 10, 2, '2023-06-27 04:29:02', NULL, '2023-06-27 04:29:02', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (58, 11, 3, 1, 20, 2, '2023-06-27 04:29:02', NULL, '2023-06-27 04:29:02', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (59, 11, 1, 1, 1, 2, '2023-06-27 04:29:24', NULL, '2023-06-27 04:29:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (60, 11, 2, 1, 10, 2, '2023-06-27 04:29:24', NULL, '2023-06-27 04:29:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (61, 11, 3, 1, 20, 2, '2023-06-27 04:29:24', NULL, '2023-06-27 04:29:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (62, 6, 1, 1, 1, 2, '2023-06-27 15:16:30', NULL, '2023-06-27 15:16:30', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (63, 6, 3, 1, 100, 2, '2023-06-27 15:16:30', NULL, '2023-06-27 15:16:30', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (64, 6, 2, 1, 10, 2, '2023-06-27 15:16:30', NULL, '2023-06-27 15:16:30', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (65, 12, 2, 1, 10, 2, '2023-06-27 21:20:42', NULL, '2023-06-27 21:20:42', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (66, 12, 1, 1, 1, 2, '2023-06-27 21:20:42', NULL, '2023-06-27 21:20:42', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_harga
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_harga`;
CREATE TABLE `tx_produk_harga`  (
  `id_harga` int NOT NULL,
  `id_produk_detail` int NULL DEFAULT NULL,
  `id_jenis_harga` int NULL DEFAULT NULL,
  `haraga_jual` int NULL DEFAULT NULL,
  `param_grosir` int NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_harga`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_harga
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
