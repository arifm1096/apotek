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

 Date: 20/07/2023 07:50:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tm_bulan
-- ----------------------------
DROP TABLE IF EXISTS `tm_bulan`;
CREATE TABLE `tm_bulan`  (
  `id_bulan` int NOT NULL AUTO_INCREMENT,
  `nama_bulan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_bulan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_bulan
-- ----------------------------
INSERT INTO `tm_bulan` VALUES (1, 'Januari');
INSERT INTO `tm_bulan` VALUES (2, 'Februari');
INSERT INTO `tm_bulan` VALUES (3, 'Maret');
INSERT INTO `tm_bulan` VALUES (4, 'April');
INSERT INTO `tm_bulan` VALUES (5, 'Mei');
INSERT INTO `tm_bulan` VALUES (6, 'Juni');
INSERT INTO `tm_bulan` VALUES (7, 'Juli');
INSERT INTO `tm_bulan` VALUES (8, 'Agustus');
INSERT INTO `tm_bulan` VALUES (9, 'September');
INSERT INTO `tm_bulan` VALUES (10, 'Oktober');
INSERT INTO `tm_bulan` VALUES (11, 'November');
INSERT INTO `tm_bulan` VALUES (12, 'Desember');

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
-- Table structure for tm_gudang
-- ----------------------------
DROP TABLE IF EXISTS `tm_gudang`;
CREATE TABLE `tm_gudang`  (
  `id_gudang` int NOT NULL AUTO_INCREMENT,
  `nama_gudang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_gudang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_gudang
-- ----------------------------
INSERT INTO `tm_gudang` VALUES (1, 'Gudang Pusat ', 'Karanganyar ', 'y', NULL, NULL, NULL, '2023-06-14 16:08:59', NULL, NULL, 0);
INSERT INTO `tm_gudang` VALUES (2, 'Apotek Karanganyar', 'Karanganyar', 'y', NULL, NULL, NULL, '2023-06-14 16:11:32', 1, '2023-06-14 16:10:57', 0);

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
INSERT INTO `tm_hak_akses` VALUES (1, 'ADMIN', '-', 'y', NULL, NULL, NULL, '2023-07-19 11:44:57', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (2, 'GUDANG', NULL, 'y', NULL, NULL, NULL, '2023-06-14 23:16:02', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (3, 'KASIR', '-', 'y', NULL, NULL, NULL, '2023-06-15 08:35:56', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_jenis_harga
-- ----------------------------
INSERT INTO `tm_jenis_harga` VALUES (1, 'Fleksibel', NULL, NULL, NULL, '2023-06-21 10:27:16', NULL, NULL, 0);
INSERT INTO `tm_jenis_harga` VALUES (2, 'Grosir', NULL, NULL, NULL, '2023-06-21 10:28:39', NULL, NULL, 0);
INSERT INTO `tm_jenis_harga` VALUES (3, 'Memebership', NULL, NULL, NULL, '2023-06-21 10:28:55', NULL, NULL, 0);
INSERT INTO `tm_jenis_harga` VALUES (4, 'Harga Utama', NULL, NULL, NULL, '2023-07-01 23:43:00', NULL, NULL, 0);

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
-- Table structure for tm_jual
-- ----------------------------
DROP TABLE IF EXISTS `tm_jual`;
CREATE TABLE `tm_jual`  (
  `id_jual` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_jual` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_jual
-- ----------------------------
INSERT INTO `tm_jual` VALUES ('y', 'TIDAK DIJUAL', 'y', 0);
INSERT INTO `tm_jual` VALUES ('n', 'JUAL', 'y', 0);

-- ----------------------------
-- Table structure for tm_kadaluarsa
-- ----------------------------
DROP TABLE IF EXISTS `tm_kadaluarsa`;
CREATE TABLE `tm_kadaluarsa`  (
  `id_kadaluarsa` int NOT NULL AUTO_INCREMENT,
  `nama_kadaluarsa` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kadaluarsa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_kadaluarsa
-- ----------------------------
INSERT INTO `tm_kadaluarsa` VALUES (1, 'Expired Dalam 1 Bulan');
INSERT INTO `tm_kadaluarsa` VALUES (2, 'Expired Dalam 2 Bulan');
INSERT INTO `tm_kadaluarsa` VALUES (3, 'Expired Dalam 3 Bulan');

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
-- Table structure for tm_satus_stok
-- ----------------------------
DROP TABLE IF EXISTS `tm_satus_stok`;
CREATE TABLE `tm_satus_stok`  (
  `id_status_stok` int NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tm_satus_stok
-- ----------------------------
INSERT INTO `tm_satus_stok` VALUES (1, 'Masuk');
INSERT INTO `tm_satus_stok` VALUES (2, 'Keluar');

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
INSERT INTO `tm_supplier` VALUES (1, 'sol1023', 'Solo Medical', '-', NULL, 'y', NULL, NULL, NULL, '2023-07-05 13:46:39', NULL, '2023-07-05 13:46:38', 0);
INSERT INTO `tm_supplier` VALUES (2, 'medika', 'Subur Medical', '-', NULL, 'y', NULL, NULL, NULL, '2023-07-05 13:46:07', NULL, NULL, 0);

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
  `gudang` int NULL DEFAULT NULL,
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
INSERT INTO `tm_user` VALUES (2, 'Indra', 'kasir', '446a5cf1593ddb78a2bf', 3, 1, 'y', NULL, NULL, NULL, '2023-07-19 17:41:06', 1, '2023-06-14 16:09:05', 0);
INSERT INTO `tm_user` VALUES (3, 'asdas', 'asdas', '60d6f293ae3b847177c2', 3, 1, 'y', NULL, NULL, NULL, '2023-06-14 14:04:08', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_wilayah
-- ----------------------------
DROP TABLE IF EXISTS `tm_wilayah`;
CREATE TABLE `tm_wilayah`  (
  `id_wilayah` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_wilayah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_print` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
INSERT INTO `tm_wilayah` VALUES (1, 'GDP', 'Gudang Pusat ', 'Karanganyar ', NULL, NULL, 'y', NULL, NULL, NULL, '2023-07-17 12:44:54', NULL, NULL, 0);
INSERT INTO `tm_wilayah` VALUES (2, 'ANK', 'Apotek Nawasena Karanganyar', 'Karanganyar', '0271-0998121', 'Blueprint_M80', 'y', NULL, NULL, NULL, '2023-07-17 12:44:43', 1, '2023-06-14 16:10:57', 0);

-- ----------------------------
-- Table structure for tx_jual
-- ----------------------------
DROP TABLE IF EXISTS `tx_jual`;
CREATE TABLE `tx_jual`  (
  `id_jual` int NOT NULL AUTO_INCREMENT,
  `no_nota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_kasir` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_beli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_jual` int NULL DEFAULT NULL,
  `id_jenis_harga` int NULL DEFAULT NULL,
  `id_satuan_utama` int NULL DEFAULT NULL,
  `id_satuan` int NULL DEFAULT NULL,
  `jumlah_produk` int NULL DEFAULT NULL,
  `diskon` double NULL DEFAULT NULL,
  `total_harga` int NULL DEFAULT NULL,
  `is_selesai` int NOT NULL DEFAULT 0,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jual`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_jual
-- ----------------------------
INSERT INTO `tx_jual` VALUES (1, NULL, NULL, 27, 'Suntik', '2000', 7500, 4, 2, 2, 4, NULL, 10000, 0, 2, NULL, NULL, '2023-07-16 21:40:18', 2, '2023-07-16 16:40:18', 1);
INSERT INTO `tx_jual` VALUES (2, NULL, NULL, 13, 'Parasetamol 100 Mg', '400', 500, 3, 1, 1, 1, NULL, 500, 0, 2, '2023-07-16 10:48:28', NULL, '2023-07-17 01:22:21', 2, '2023-07-16 20:22:21', 1);
INSERT INTO `tx_jual` VALUES (3, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 12, NULL, 30000, 0, 2, '2023-07-16 16:40:53', NULL, '2023-07-16 21:53:25', 2, '2023-07-16 16:53:25', 1);
INSERT INTO `tx_jual` VALUES (4, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 2, NULL, 5000, 0, 2, '2023-07-16 16:53:33', NULL, '2023-07-16 21:54:27', 2, '2023-07-16 16:54:27', 1);
INSERT INTO `tx_jual` VALUES (5, 'ANK02180723001', 3, 27, 'Suntik', '2000', 2100, 2, 2, 2, 1, NULL, 2100, 1, 2, '2023-07-16 16:54:31', 2, '2023-07-18 13:42:13', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (6, 'ANK02180723001', 3, 28, 'Panadol', '400', 420, 1, 1, 3, 2, NULL, 84000, 1, 2, '2023-07-16 17:39:18', 2, '2023-07-18 13:42:13', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (7, 'ANK02180723001', 4, 27, 'Suntik', '2000', 2500, 4, 2, 2, 2, NULL, 5000, 1, 2, '2023-07-18 08:43:30', 2, '2023-07-18 13:44:22', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (8, 'ANK02180723001', 4, 28, 'Panadol', '400', 450, 4, 1, 2, 1, NULL, 4500, 1, 2, '2023-07-18 08:43:37', 2, '2023-07-18 13:44:22', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (9, 'ANK02180723003', 8, 28, 'Panadol', '400', 450, 4, 1, 3, 1, NULL, 45000, 1, 2, '2023-07-18 08:55:09', 2, '2023-07-18 13:55:54', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (10, NULL, NULL, 28, 'Panadol', '400', 450, 4, 1, 1, 1, NULL, 450, 0, 2, '2023-07-18 14:42:30', NULL, '2023-07-18 14:45:53', 2, '2023-07-18 14:45:53', 1);
INSERT INTO `tx_jual` VALUES (11, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 0, 2, '2023-07-18 14:44:37', NULL, '2023-07-18 14:45:01', 2, '2023-07-18 09:45:02', 1);
INSERT INTO `tx_jual` VALUES (12, NULL, NULL, 28, 'Panadol', '400', 450, 4, 1, 2, 1, NULL, 4500, 0, 2, '2023-07-19 09:55:04', 2, '2023-07-19 10:03:31', 2, '2023-07-19 10:03:31', 1);
INSERT INTO `tx_jual` VALUES (13, 'ANK02190723001', 9, 27, 'Suntik', '2000', 2500, 4, 2, 2, 4, NULL, 10000, 1, 2, '2023-07-19 10:06:39', 2, '2023-07-19 10:13:53', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (14, 'ANK02190723001', 9, 29, 'Paramex', '400', 500, 4, 1, 2, 1, NULL, 5000, 1, 2, '2023-07-19 10:12:40', 2, '2023-07-19 10:13:53', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (15, NULL, NULL, 29, 'Paramex', '400', 500, 4, 1, 2, 1, NULL, 5000, 0, 2, '2023-07-19 10:41:40', 2, '2023-07-19 10:42:30', 2, '2023-07-19 10:42:30', 1);
INSERT INTO `tx_jual` VALUES (16, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 0, 2, '2023-07-19 10:42:28', NULL, '2023-07-19 10:42:31', 2, '2023-07-19 10:42:31', 1);
INSERT INTO `tx_jual` VALUES (17, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 6, NULL, 15000, 0, 2, '2023-07-19 10:42:39', 2, '2023-07-19 10:45:49', 2, '2023-07-19 10:45:49', 1);
INSERT INTO `tx_jual` VALUES (18, 'GDP02190723002', 10, 29, 'Paramex', '400', 500, 4, 1, 1, 3, NULL, 1500, 1, 2, '2023-07-19 10:45:42', 2, '2023-07-19 17:43:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (19, 'GDP02190723002', 10, 28, 'Panadol', '400', 450, 4, 1, 1, 2, NULL, 900, 1, 2, '2023-07-19 10:45:48', 2, '2023-07-19 17:43:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (20, 'GDP01190723001', 11, 29, 'Paramex', '400', 43000, 1, 1, 3, 3, NULL, 129000, 1, 1, '2023-07-19 20:54:40', 1, '2023-07-19 23:42:26', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_kasir
-- ----------------------------
DROP TABLE IF EXISTS `tx_kasir`;
CREATE TABLE `tx_kasir`  (
  `id_kasir` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int NULL DEFAULT NULL,
  `no_nota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_transaksi` datetime NULL DEFAULT NULL,
  `sub_tot` int NULL DEFAULT NULL,
  `service` int NULL DEFAULT NULL,
  `embalase` int NULL DEFAULT NULL,
  `lain` int NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_kasir
-- ----------------------------
INSERT INTO `tx_kasir` VALUES (1, NULL, 'ANK02170723001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2023-07-17 14:14:53', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (2, NULL, 'ANK02180723001', NULL, 86100, 0, 0, 0, 86100, 100000, 0, 2, '2023-07-18 08:41:41', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (3, NULL, 'ANK02180723001', NULL, 86100, 0, 0, 0, 86100, 100000, 0, 2, '2023-07-18 08:42:14', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (4, NULL, 'ANK02180723001', NULL, 9500, 0, 0, 0, 9500, 10000, 0, 2, '2023-07-18 08:44:23', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (5, NULL, 'ANK02180723001', NULL, 9500, 0, 0, 0, 9500, 10000, 0, 2, '2023-07-18 08:50:18', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (6, NULL, 'ANK02180723001', '2023-07-18 08:53:55', 9500, 0, 0, 0, 9500, 10000, 0, 2, '2023-07-18 08:53:55', NULL, '2023-07-18 13:53:53', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (7, NULL, 'ANK02180723002', '2023-07-18 08:54:08', 9500, 0, 0, 0, 9500, 10000, 0, 2, '2023-07-18 08:54:08', NULL, '2023-07-18 13:54:07', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (8, NULL, 'ANK02180723003', '2023-07-18 08:55:55', 45000, 1000, 1000, 1000, 48000, 50000, 2000, 2, '2023-07-18 08:55:55', NULL, '2023-07-18 13:55:54', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (9, NULL, 'ANK02190723001', '2023-07-19 10:13:53', 15000, 0, 0, 0, 15000, 20000, 5000, 2, '2023-07-19 10:13:53', NULL, '2023-07-19 10:13:53', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (10, NULL, 'GDP02190723002', '2023-07-19 17:43:32', 2400, 0, 0, 0, 2400, 3000, 600, 2, '2023-07-19 17:43:32', NULL, '2023-07-19 17:43:32', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (11, NULL, 'GDP01190723001', '2023-07-19 23:42:26', 129000, 0, 0, 0, 129000, 130000, 1000, 1, '2023-07-19 23:42:26', NULL, '2023-07-19 23:42:26', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_persediaan
-- ----------------------------
DROP TABLE IF EXISTS `tx_persediaan`;
CREATE TABLE `tx_persediaan`  (
  `id_pesediaan` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_pesediaan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_persediaan
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
  `harga_beli` int NULL DEFAULT NULL,
  `status_jual` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk
-- ----------------------------
INSERT INTO `tx_produk` VALUES (13, 'OBPA10MG', '32423412', 'Parasetamol 100 Mg', 1, 12, 1, 0, 'Kalbe', 400, '1', NULL, NULL, NULL, '2023-07-02 20:47:36', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (14, 'OBPA10MG', '32423412', 'Parasetamol 100 Mg', 1, 12, 1, 0, 'Kalbe', 400, '1', NULL, NULL, NULL, '2023-07-02 20:50:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (15, 'OBPA10MG', '32423412', 'Parasetamol 100 Mg', 1, 12, 1, 0, 'Kalbe', 400, '1', NULL, NULL, NULL, '2023-07-02 21:05:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (16, '', '', '', 0, 0, 0, 0, '', 0, '1', NULL, NULL, NULL, '2023-07-02 21:05:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (17, 'OBAM10MG', '324234', 'amoxilin 10 mg', 1, 1, 1, 0, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-07-02 21:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (18, 'OBAS', '324234', 'assad', 1, 1, 1, 0, 'asdsad', 400, '1', NULL, NULL, NULL, '2023-07-02 21:48:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (19, 'OBAS', '324234', 'assad', 1, 1, 1, 0, 'asdsad', 400, '1', NULL, NULL, NULL, '2023-07-02 21:49:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (20, 'OBAS', '324234', 'assad', 1, 1, 1, 0, 'asdsad', 400, '1', NULL, NULL, NULL, '2023-07-02 21:53:18', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (21, 'OBAS', '324234', 'assad', 1, 1, 1, 0, 'asdsad', 400, '1', NULL, NULL, NULL, '2023-07-02 21:54:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (22, 'OBAS', '324234', 'assad', 1, 1, 1, 0, 'asdsad', 400, '1', NULL, NULL, NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (23, 'ALSU10MM', '324234', 'Suntik 10 mm', 2, 1, 1, 0, 'kalbe', 800, '1', NULL, NULL, NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (24, 'ALSU10MM', '324234', 'Suntik 10 mm', 2, 1, 1, 0, 'kalbe', 800, '1', NULL, NULL, NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (25, 'ALSU10MM', '324234', 'Suntik 10 mm', 2, 1, 1, 0, 'kalbe', 800, '1', NULL, NULL, NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (26, 'ALSU10MM', '324234', 'Suntik 10 mm', 2, 1, 1, 0, 'kalbe', 800, '1', NULL, NULL, NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (27, 'ALSU', '1231334', 'Suntik', 2, 1, 2, 0, 'kalbe', 2000, '1', NULL, NULL, NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (28, 'OBPA160723', '167098342', 'Panadol', 1, 10, 1, 0, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (29, 'OBPA989012', '09894823', 'Paramex', 1, 10, 1, 0, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-07-19 10:10:54', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_detail
-- ----------------------------
INSERT INTO `tx_produk_detail` VALUES (69, 14, 2, 1, 12, 2, '2023-07-02 20:50:24', NULL, '2023-07-02 20:50:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (70, 14, 3, 1, 40, 2, '2023-07-02 20:50:24', NULL, '2023-07-02 20:50:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (71, 15, 2, 1, 12, 2, '2023-07-02 21:05:07', NULL, '2023-07-02 21:05:07', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (72, 15, 3, 1, 40, 2, '2023-07-02 21:05:07', NULL, '2023-07-02 21:05:07', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (73, 17, 2, 1, 10, 2, '2023-07-02 21:17:04', NULL, '2023-07-02 21:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (74, 17, 3, 1, 100, 2, '2023-07-02 21:17:04', NULL, '2023-07-02 21:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (75, 18, 2, 1, 10, 2, '2023-07-02 21:48:24', NULL, '2023-07-02 21:48:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (76, 18, 3, 2, 100, 2, '2023-07-02 21:48:24', NULL, '2023-07-02 21:48:24', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (77, 19, 2, 1, 10, 2, '2023-07-02 21:49:49', NULL, '2023-07-02 21:49:49', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (78, 19, 3, 2, 100, 2, '2023-07-02 21:49:49', NULL, '2023-07-02 21:49:49', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (79, 20, 2, 1, 10, 2, '2023-07-02 21:53:18', NULL, '2023-07-02 21:53:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (80, 20, 3, 2, 100, 2, '2023-07-02 21:53:18', NULL, '2023-07-02 21:53:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (81, 21, 2, 1, 10, 2, '2023-07-02 21:54:20', NULL, '2023-07-02 21:54:20', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (82, 21, 3, 2, 100, 2, '2023-07-02 21:54:20', NULL, '2023-07-02 21:54:20', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (83, 22, 2, 1, 10, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (84, 22, 3, 2, 100, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (85, 23, 2, 1, 1, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (86, 23, 3, 1, 12, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (87, 24, 2, 1, 1, 2, '2023-07-02 22:24:23', NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (88, 24, 3, 1, 12, 2, '2023-07-02 22:24:23', NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (89, 25, 2, 1, 1, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (90, 25, 3, 1, 12, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (91, 26, 2, 1, 1, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (92, 26, 3, 1, 12, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (93, 27, 3, 1, 12, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (95, 28, 2, 1, 10, 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (96, 28, 3, 1, 100, 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (97, 29, 2, 1, 10, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_detail` VALUES (98, 29, 3, 1, 100, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_harga
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_harga`;
CREATE TABLE `tx_produk_harga`  (
  `id_harga` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NULL DEFAULT NULL,
  `id_jenis_harga` int NULL DEFAULT NULL,
  `harga_jual` int NULL DEFAULT NULL,
  `jumlah_per_satuan` int NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_harga
-- ----------------------------
INSERT INTO `tx_produk_harga` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-07-02 20:47:36', NULL, '2023-07-02 20:47:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (2, NULL, 5, NULL, NULL, NULL, NULL, 2, '2023-07-02 21:53:18', NULL, '2023-07-02 21:53:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (3, NULL, 5, NULL, NULL, NULL, NULL, 2, '2023-07-02 21:54:20', NULL, '2023-07-02 21:54:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (4, 21, 1, 450, NULL, 'Nakes', NULL, 2, '2023-07-02 21:54:20', NULL, '2023-07-02 21:54:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (5, 21, 1, 0, NULL, '', NULL, 2, '2023-07-02 21:54:20', NULL, '2023-07-02 21:54:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (6, NULL, 5, NULL, NULL, NULL, NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (7, 22, 1, 450, NULL, 'Nakes', NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (8, 22, 1, 0, NULL, '', NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (9, 22, 2, 450, 0, NULL, NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (10, 22, 2, 0, 0, NULL, NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (11, 22, 3, 450, NULL, '', NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (12, 22, 3, 0, NULL, '', NULL, 2, '2023-07-02 21:55:52', NULL, '2023-07-02 21:55:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (13, NULL, 5, 1000, NULL, NULL, NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (14, 23, 1, 850, NULL, 'nakes', NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (15, 23, 1, 0, NULL, '', NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (16, 23, 2, 850, 0, NULL, NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (17, 23, 2, 0, 0, NULL, NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (18, 23, 3, 850, NULL, '', NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (19, 23, 3, 0, NULL, '', NULL, 2, '2023-07-02 22:19:02', NULL, '2023-07-02 22:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (20, NULL, 5, 1000, NULL, NULL, NULL, 2, '2023-07-02 22:24:23', NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (21, 24, 1, 850, NULL, 'nakes', NULL, 2, '2023-07-02 22:24:23', NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (22, 24, 2, 850, 0, NULL, NULL, 2, '2023-07-02 22:24:23', NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (23, 24, 3, 850, NULL, '', NULL, 2, '2023-07-02 22:24:23', NULL, '2023-07-02 22:24:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (24, 24, 4, 1000, NULL, NULL, NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-14 10:56:26', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (25, 25, 1, 850, NULL, 'nakes', NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (26, 25, 2, 850, 0, NULL, NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (27, 25, 3, 850, NULL, 'n', NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (28, 25, 4, 1000, NULL, NULL, NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-14 10:56:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (29, 26, 1, 850, NULL, 'nakes', NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (30, 26, 2, 850, 0, NULL, NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (31, 26, 3, 850, NULL, 'y', NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (32, 27, 4, 2500, NULL, NULL, NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-14 10:56:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (33, 27, 1, 2300, NULL, 'Nakes', NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (34, 27, 2, 2100, 500, NULL, NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (35, 27, 3, 2100, NULL, 'y', NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (36, 28, 4, 450, NULL, NULL, NULL, 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (37, 28, 1, 420, NULL, 'dokter', NULL, 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (38, 28, 2, 430, 100, NULL, NULL, 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (39, 28, 3, 420, NULL, NULL, 'y', 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (40, 29, 4, 500, NULL, NULL, NULL, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (41, 29, 1, 430, NULL, '-', NULL, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (42, 29, 2, 420, 1000, NULL, NULL, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (43, 29, 3, 450, NULL, NULL, 'y', 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok`;
CREATE TABLE `tx_produk_stok`  (
  `id_stok` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NULL DEFAULT NULL,
  `id_gudang` int NULL DEFAULT NULL,
  `id_supplier` int NULL DEFAULT NULL,
  `id_konsinyasi` int NULL DEFAULT NULL,
  `jumlah_stok` int NOT NULL DEFAULT 0,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exp_date` date NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_stok
-- ----------------------------
INSERT INTO `tx_produk_stok` VALUES (1, 27, 1, 1, NULL, 2, NULL, '2023-07-08', NULL, NULL, NULL, '2023-07-04 14:26:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (2, 14, 2, 0, NULL, 144, NULL, '2023-07-20', 2, '2023-07-10 10:05:07', NULL, '2023-07-10 15:05:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (3, 13, 2, 1, NULL, 10, NULL, '2023-07-22', 2, '2023-07-10 11:02:11', NULL, '2023-07-10 16:02:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (4, 15, 2, 1, NULL, 13, NULL, '2023-07-19', 2, '2023-07-10 11:02:39', NULL, '2023-07-10 16:02:33', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_detail`;
CREATE TABLE `tx_produk_stok_detail`  (
  `id_stok_detail` int NOT NULL AUTO_INCREMENT,
  `id_stok` int NOT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `id_gudang` int NULL DEFAULT NULL,
  `id_supplier` int NULL DEFAULT NULL,
  `id_status_stok` int NULL DEFAULT NULL,
  `id_satuan` int NULL DEFAULT NULL,
  `jumlah_stok` int NULL DEFAULT NULL,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_beli` int NULL DEFAULT NULL,
  `exp_date` date NULL DEFAULT NULL,
  `flag_ver` int NOT NULL DEFAULT 0,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_stok_detail
-- ----------------------------
INSERT INTO `tx_produk_stok_detail` VALUES (1, 0, 14, 2, 1, 1, 2, 120, NULL, 0, '2023-07-15', 0, 2, '0000-00-00 00:00:00', NULL, '2023-07-06 10:07:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (2, 0, 14, 2, 1, 1, 2, 120, NULL, 0, '2023-07-15', 0, 2, '0000-00-00 00:00:00', NULL, '2023-07-06 10:08:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (3, 0, 14, 2, 1, 1, 2, 12, NULL, 0, '2023-07-06', 0, 2, '0000-00-00 00:00:00', NULL, '2023-07-06 10:14:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (4, 0, 14, 2, 1, 1, 2, 132, NULL, 0, '2023-07-30', 0, 2, '0000-00-00 00:00:00', NULL, '2023-07-06 10:25:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (5, 0, 13, 2, 1, 1, 1, 0, NULL, 500, '2023-07-29', 0, 2, '2023-07-10 09:59:40', NULL, '2023-07-10 14:59:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (6, 0, 13, 2, 0, 1, 1, 0, NULL, 500, '2023-07-29', 0, 2, '2023-07-10 10:01:15', NULL, '2023-07-10 15:01:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (7, 0, 13, 2, 0, 1, 1, 0, NULL, 500, '2023-07-29', 0, 2, '2023-07-10 10:01:45', NULL, '2023-07-10 15:01:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (8, 0, 13, 2, 2, 1, 1, 0, NULL, 0, '2023-07-20', 0, 2, '2023-07-10 10:03:10', NULL, '2023-07-10 15:03:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (9, 0, 14, 2, 0, 1, 2, 144, NULL, 0, '2023-07-20', 0, 2, '2023-07-10 10:05:07', NULL, '2023-07-10 15:05:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (10, 0, 15, 2, 0, 1, 1, 1, NULL, 0, '2023-07-20', 0, 2, '2023-07-10 10:09:55', NULL, '2023-07-10 15:09:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (11, 0, 13, 2, 0, 1, 1, 0, NULL, 500, '2023-07-29', 0, 2, '2023-07-10 10:10:20', NULL, '2023-07-10 15:10:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (12, 0, 17, 2, 1, 1, 1, 10, NULL, 100, '2023-07-29', 0, 2, '2023-07-10 10:10:58', NULL, '2023-07-10 15:10:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (13, 0, 13, 2, 1, 1, 1, 0, NULL, 100, '2023-07-22', 0, 2, '2023-07-10 10:12:46', NULL, '2023-07-10 15:12:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (14, 0, 15, 2, 0, 1, 1, 5, NULL, 100, '2023-07-22', 0, 2, '2023-07-10 10:14:30', NULL, '2023-07-10 15:14:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (15, 0, 13, 2, 0, 1, 1, 0, NULL, 0, '2023-07-20', 0, 2, '2023-07-10 10:14:48', NULL, '2023-07-10 15:14:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (16, 0, 13, 2, 1, 1, 1, 0, NULL, 100, '2023-07-20', 0, 2, '2023-07-10 10:19:17', NULL, '2023-07-10 15:19:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (17, 0, 13, 2, 1, 1, 1, 0, NULL, 200, '2023-07-22', 0, 2, '2023-07-10 10:53:23', NULL, '2023-07-10 15:53:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (18, 0, 13, 2, 1, 1, 1, 0, NULL, 200, '2023-07-22', 0, 2, '2023-07-10 10:56:28', NULL, '2023-07-10 15:56:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (19, 0, 13, 2, 1, 1, 1, 0, NULL, 200, '2023-07-22', 0, 2, '2023-07-10 10:57:03', NULL, '2023-07-10 15:56:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (20, 0, 13, 2, 1, 1, 1, 0, NULL, 200, '2023-07-22', 0, 2, '2023-07-10 10:58:27', NULL, '2023-07-10 15:58:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (21, 0, 13, 2, 1, 1, 1, 10, NULL, 200, '2023-07-22', 0, 2, '2023-07-10 11:02:11', NULL, '2023-07-10 16:02:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (22, 0, 15, 2, 1, 1, 2, 13, NULL, 200, '2023-07-19', 0, 2, '2023-07-10 11:02:39', NULL, '2023-07-10 16:02:33', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok_mutasi
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_mutasi`;
CREATE TABLE `tx_produk_stok_mutasi`  (
  `id_stok_mutasi` int NOT NULL AUTO_INCREMENT,
  `id_gudang_asal` int NULL DEFAULT NULL,
  `id_gudang_tujuan` int NULL DEFAULT NULL,
  `tgl_mutasi` date NULL DEFAULT NULL,
  `kode_faktur` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_mutasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_stok_mutasi
-- ----------------------------

-- ----------------------------
-- Table structure for tx_produk_stok_mutasi_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_mutasi_detail`;
CREATE TABLE `tx_produk_stok_mutasi_detail`  (
  `id_detail_stok_mutasi` int NOT NULL AUTO_INCREMENT,
  `id_stok_mutasi` int NULL DEFAULT NULL,
  `id_produk` int NULL DEFAULT NULL,
  `id_satuan` int NULL DEFAULT NULL,
  `jumlah_stok` int NULL DEFAULT NULL,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_detail_stok_mutasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_stok_mutasi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tx_produk_stok_opname
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_opname`;
CREATE TABLE `tx_produk_stok_opname`  (
  `id_stok_opname` int NOT NULL AUTO_INCREMENT,
  `id_stok` int NULL DEFAULT NULL,
  `tgl_so` datetime NULL DEFAULT NULL,
  `stok_fisik` int NULL DEFAULT NULL,
  `penyesuaian` int NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `verifikasi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_stok_opname
-- ----------------------------

-- ----------------------------
-- Table structure for tx_produk_stok_opname_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_opname_detail`;
CREATE TABLE `tx_produk_stok_opname_detail`  (
  `id_stok_opname` int NOT NULL AUTO_INCREMENT,
  `id_stok` int NULL DEFAULT NULL,
  `tgl_stok_opname` date NULL DEFAULT NULL,
  `stok_fisik` int NULL DEFAULT NULL,
  `penyesuaian` int NULL DEFAULT NULL,
  `selisih` int NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `verifikasi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int NULL DEFAULT NULL,
  `insert_date` datetime NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `delete_by` int NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tx_produk_stok_opname_detail
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
