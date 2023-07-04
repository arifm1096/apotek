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

 Date: 04/07/2023 17:00:49
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
-- Table structure for tm_gudang
-- ----------------------------
DROP TABLE IF EXISTS `tm_gudang`;
CREATE TABLE `tm_gudang`  (
  `id_gudang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_gudang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_gudang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_jenis_harga
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_harga`;
CREATE TABLE `tm_jenis_harga`  (
  `id_jenis_harga` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_harga` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jenis_harga`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `id_jenis_produk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_produk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jenis_produk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `is_delete` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_jual
-- ----------------------------
INSERT INTO `tm_jual` VALUES ('y', 'TIDAK DIJUAL', 'y', 0);
INSERT INTO `tm_jual` VALUES ('n', 'JUAL', 'y', 0);

-- ----------------------------
-- Table structure for tm_pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `tm_pelanggan`;
CREATE TABLE `tm_pelanggan`  (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for tm_produk_by
-- ----------------------------
DROP TABLE IF EXISTS `tm_produk_by`;
CREATE TABLE `tm_produk_by`  (
  `id_produk_by` int(11) NOT NULL AUTO_INCREMENT,
  `nama_produk_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_rak
-- ----------------------------
DROP TABLE IF EXISTS `tm_rak`;
CREATE TABLE `tm_rak`  (
  `id_rak` int(11) NOT NULL AUTO_INCREMENT,
  `nama_rak` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_rak`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tm_supplier` VALUES (1, 'sol1023', 'Solo Medical', '-', NULL, 'n', NULL, NULL, NULL, '2023-07-04 14:21:25', 1, '2023-06-15 14:44:03', 1);
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
INSERT INTO `tm_user` VALUES (1, 'Admin Gudang', 'admin', 'e65b553ec1ba6b20de79', 1, 1, 'y', NULL, NULL, NULL, '2023-06-27 22:26:10', NULL, NULL, 0);
INSERT INTO `tm_user` VALUES (2, 'Kasir', 'kasir', '446a5cf1593ddb78a2bf', 3, 2, 'y', NULL, NULL, NULL, '2023-06-14 16:10:50', 1, '2023-06-14 16:09:05', 0);
INSERT INTO `tm_user` VALUES (3, 'asdas', 'asdas', '60d6f293ae3b847177c2', 3, 1, 'y', NULL, NULL, NULL, '2023-06-14 14:04:08', NULL, NULL, 0);

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
  `total` int(11) NULL DEFAULT NULL,
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
-- Table structure for tx_kasir
-- ----------------------------
DROP TABLE IF EXISTS `tx_kasir`;
CREATE TABLE `tx_kasir`  (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_transaksi` int(11) NULL DEFAULT NULL,
  `total` int(11) NULL DEFAULT NULL,
  `jumlah_uang` int(11) NULL DEFAULT NULL,
  `kembalian` int(11) NULL DEFAULT NULL,
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
-- Table structure for tx_produk
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk`;
CREATE TABLE `tx_produk`  (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `sku_kode_produk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `barcode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_produk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `satuan_utama` int(11) NULL DEFAULT NULL,
  `jumlah_minimal` int(11) NULL DEFAULT NULL,
  `id_rak` int(11) NULL DEFAULT NULL,
  `id_jenis_produk` int(11) NULL DEFAULT NULL,
  `produk_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_beli` int(11) NULL DEFAULT NULL,
  `status_jual` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for tx_produk_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_detail`;
CREATE TABLE `tx_produk_detail`  (
  `id_produk_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `jumlah_produk` int(11) NULL DEFAULT NULL,
  `jumlah_produk_p` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produk_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for tx_produk_harga
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_harga`;
CREATE TABLE `tx_produk_harga`  (
  `id_harga` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_jenis_harga` int(11) NULL DEFAULT NULL,
  `harga_jual` int(11) NULL DEFAULT NULL,
  `jumlah_per_satuan` int(11) NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_harga`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tx_produk_harga` VALUES (24, NULL, 5, 1000, NULL, NULL, NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (25, 25, 1, 850, NULL, 'nakes', NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (26, 25, 2, 850, 0, NULL, NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (27, 25, 3, 850, NULL, 'n', NULL, 2, '2023-07-02 22:52:18', NULL, '2023-07-02 22:52:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (28, NULL, 5, 1000, NULL, NULL, NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (29, 26, 1, 850, NULL, 'nakes', NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (30, 26, 2, 850, 0, NULL, NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (31, 26, 3, 850, NULL, 'y', NULL, 2, '2023-07-02 22:54:36', NULL, '2023-07-02 22:54:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (32, 27, 5, 2500, NULL, NULL, NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-04 14:18:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (33, 27, 1, 2300, NULL, 'Nakes', NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (34, 27, 2, 2100, 500, NULL, NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (35, 27, 3, 2100, NULL, 'y', NULL, 2, '2023-07-03 07:10:46', NULL, '2023-07-03 07:10:46', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok`;
CREATE TABLE `tx_produk_stok`  (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_gudang` int(11) NULL DEFAULT NULL,
  `id_supplier` int(11) NULL DEFAULT NULL,
  `id_konsinyasi` int(11) NULL DEFAULT NULL,
  `jumlah_stok` int(11) NULL DEFAULT NULL,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exp_date` date NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk_stok
-- ----------------------------
INSERT INTO `tx_produk_stok` VALUES (1, 27, 1, 1, NULL, 2, NULL, '2023-07-08', NULL, NULL, NULL, '2023-07-04 14:26:20', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok_his
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_his`;
CREATE TABLE `tx_produk_stok_his`  (
  `id_stok_his` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok` int(11) NOT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_gudang` int(11) NULL DEFAULT NULL,
  `id_supplier` int(11) NULL DEFAULT NULL,
  `id_status_stok` int(11) NULL DEFAULT NULL,
  `jumlah_stok` int(11) NULL DEFAULT NULL,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exp_date` date NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_his`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_produk_stok_mutasi
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_mutasi`;
CREATE TABLE `tx_produk_stok_mutasi`  (
  `id_stok_mutasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_gudang_asal` int(11) NULL DEFAULT NULL,
  `id_gudang_tujuan` int(11) NULL DEFAULT NULL,
  `tgl_mutasi` date NULL DEFAULT NULL,
  `kode_faktur` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_mutasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_produk_stok_mutasi_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_mutasi_detail`;
CREATE TABLE `tx_produk_stok_mutasi_detail`  (
  `id_detail_stok_mutasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok_mutasi` int(11) NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `jumlah_stok` int(11) NULL DEFAULT NULL,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_detail_stok_mutasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_produk_stok_opname
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_opname`;
CREATE TABLE `tx_produk_stok_opname`  (
  `id_stok_opname` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok` int(11) NULL DEFAULT NULL,
  `stok_fisik` int(11) NULL DEFAULT NULL,
  `penyesuaian` int(11) NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `verifikasi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_opname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
