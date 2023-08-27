/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : apotek_db_db

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 27/08/2023 23:52:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tm_bulan
-- ----------------------------
DROP TABLE IF EXISTS `tm_bulan`;
CREATE TABLE `tm_bulan`  (
  `id_bulan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bulan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_bulan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tm_hak_akses` VALUES (1, 'ADMIN', '-', 'y', NULL, NULL, NULL, '2023-07-19 11:44:57', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (2, 'GUDANG', NULL, 'y', NULL, NULL, NULL, '2023-06-14 23:16:02', NULL, NULL, 0);
INSERT INTO `tm_hak_akses` VALUES (3, 'KASIR', '-', 'y', NULL, NULL, NULL, '2023-06-15 08:35:56', NULL, NULL, 0);

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
-- Table structure for tm_jenis_pesanan
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_pesanan`;
CREATE TABLE `tm_jenis_pesanan`  (
  `id_jenis_pesanan` int(255) NOT NULL,
  `nama_jenis_pesanan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_pesanan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_jenis_pesanan
-- ----------------------------
INSERT INTO `tm_jenis_pesanan` VALUES (1, 'Biasa');
INSERT INTO `tm_jenis_pesanan` VALUES (2, 'Pisikotropika');
INSERT INTO `tm_jenis_pesanan` VALUES (3, 'Narkotika');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_jenis_produk
-- ----------------------------
INSERT INTO `tm_jenis_produk` VALUES (1, 'Alat Kesehatan', NULL, 'y', NULL, NULL, NULL, '2023-07-22 14:43:27', NULL, NULL, 0);
INSERT INTO `tm_jenis_produk` VALUES (2, 'Obat', NULL, 'y', NULL, NULL, NULL, '2023-06-24 22:28:54', NULL, NULL, 0);
INSERT INTO `tm_jenis_produk` VALUES (3, 'Umum', NULL, NULL, NULL, NULL, NULL, '2023-07-22 14:40:41', NULL, NULL, 0);

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
INSERT INTO `tm_jual` VALUES ('2', 'TIDAK DIJUAL', 'y', 0);
INSERT INTO `tm_jual` VALUES ('1', 'JUAL', 'y', 0);

-- ----------------------------
-- Table structure for tm_kadaluarsa
-- ----------------------------
DROP TABLE IF EXISTS `tm_kadaluarsa`;
CREATE TABLE `tm_kadaluarsa`  (
  `id_kadaluarsa` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kadaluarsa` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kadaluarsa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_kadaluarsa
-- ----------------------------
INSERT INTO `tm_kadaluarsa` VALUES (1, 'Expired Dalam 1 Bulan');
INSERT INTO `tm_kadaluarsa` VALUES (2, 'Expired Dalam 2 Bulan');
INSERT INTO `tm_kadaluarsa` VALUES (3, 'Expired Dalam 3 Bulan');

-- ----------------------------
-- Table structure for tm_kas
-- ----------------------------
DROP TABLE IF EXISTS `tm_kas`;
CREATE TABLE `tm_kas`  (
  `id_kas` int(11) NOT NULL,
  `kode_kas` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_kas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kas`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_kas
-- ----------------------------
INSERT INTO `tm_kas` VALUES (1, '11.11', 'KAS');
INSERT INTO `tm_kas` VALUES (2, '22.22', 'HUTANG');

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
-- Table structure for tm_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `tm_pembayaran`;
CREATE TABLE `tm_pembayaran`  (
  `id_pembayaran` int(255) NOT NULL AUTO_INCREMENT,
  `nama_pembayaran` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_pembayaran
-- ----------------------------
INSERT INTO `tm_pembayaran` VALUES (1, 'Tunai');
INSERT INTO `tm_pembayaran` VALUES (2, 'Transfer');

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
-- Records of tm_produk_by
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_rak
-- ----------------------------
INSERT INTO `tm_rak` VALUES (1, 'Obat 1', 'y', NULL, NULL, NULL, '2023-06-25 14:44:39', NULL, NULL, 0);
INSERT INTO `tm_rak` VALUES (2, 'Alkes 1', 'y', NULL, NULL, NULL, '2023-06-25 14:45:01', NULL, NULL, 0);
INSERT INTO `tm_rak` VALUES (3, 'Etalase 1', 'y', NULL, NULL, NULL, '2023-08-09 15:55:37', NULL, NULL, 0);
INSERT INTO `tm_rak` VALUES (4, 'Etalase 2', 'y', NULL, NULL, NULL, '2023-08-19 11:00:06', NULL, NULL, 0);
INSERT INTO `tm_rak` VALUES (5, 'Etalase 4', 'y', NULL, NULL, NULL, '2023-08-19 12:59:39', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_satuan
-- ----------------------------
INSERT INTO `tm_satuan` VALUES (1, 'Tbt', 'Tablet', NULL, 'y', NULL, NULL, NULL, '2023-06-21 10:24:46', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (2, 'Strp', 'Strip', NULL, 'y', NULL, NULL, NULL, '2023-06-21 10:25:12', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (3, 'Box', 'Boks', NULL, 'y', NULL, NULL, NULL, '2023-06-21 10:25:34', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (4, 'Sch', 'Sachet', '-', 'y', NULL, NULL, NULL, '2023-08-09 15:49:50', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (5, 'Pcs', 'Pcs', '.', 'y', NULL, NULL, NULL, '2023-08-09 15:49:02', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (6, 'Btl', 'Botol', '.', 'y', NULL, NULL, NULL, '2023-08-09 15:49:29', NULL, NULL, 0);
INSERT INTO `tm_satuan` VALUES (7, 'Tube', 'Tube', '-', 'y', NULL, NULL, NULL, '2023-08-10 13:41:53', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_satus_stok
-- ----------------------------
DROP TABLE IF EXISTS `tm_satus_stok`;
CREATE TABLE `tm_satus_stok`  (
  `id_status_stok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_in_out` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_satus_stok
-- ----------------------------
INSERT INTO `tm_satus_stok` VALUES (1, 'Masuk', 1);
INSERT INTO `tm_satus_stok` VALUES (2, 'Keluar', 0);
INSERT INTO `tm_satus_stok` VALUES (3, 'Terjual', 0);
INSERT INTO `tm_satus_stok` VALUES (4, 'Retur', 0);
INSERT INTO `tm_satus_stok` VALUES (5, 'Konsinyasi Masuk', 1);
INSERT INTO `tm_satus_stok` VALUES (6, 'Konsinyasi Retur', 0);

-- ----------------------------
-- Table structure for tm_satus_stok_lama
-- ----------------------------
DROP TABLE IF EXISTS `tm_satus_stok_lama`;
CREATE TABLE `tm_satus_stok_lama`  (
  `id_status_stok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_satus_stok_lama
-- ----------------------------
INSERT INTO `tm_satus_stok_lama` VALUES (1, 'Masuk');
INSERT INTO `tm_satus_stok_lama` VALUES (2, 'Keluar');

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
INSERT INTO `tm_supplier` VALUES (1, 'sol1023', 'Solo Medical', '-', NULL, 'y', NULL, NULL, NULL, '2023-07-05 13:46:39', NULL, '2023-07-05 13:46:38', 0);
INSERT INTO `tm_supplier` VALUES (2, 'medika', 'Subur Medical', '-', NULL, 'y', NULL, NULL, NULL, '2023-07-05 13:46:07', NULL, NULL, 0);

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
  `gudang` int(11) NULL DEFAULT NULL,
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
INSERT INTO `tm_user` VALUES (2, 'Indra', 'kasir', '446a5cf1593ddb78a2bf', 3, 1, 'y', NULL, NULL, NULL, '2023-07-19 17:41:06', 1, '2023-06-14 16:09:05', 0);
INSERT INTO `tm_user` VALUES (3, 'asdas', 'asdas', '60d6f293ae3b847177c2', 3, 1, 'y', NULL, NULL, NULL, '2023-06-14 14:04:08', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tm_wilayah
-- ----------------------------
DROP TABLE IF EXISTS `tm_wilayah`;
CREATE TABLE `tm_wilayah`  (
  `id_wilayah` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_wilayah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_print` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
INSERT INTO `tm_wilayah` VALUES (1, 'GDP', 'Apotek Nawasena 24 Jam ', 'Colomadu', '02717855263', 'ZJ-58', 'y', NULL, NULL, NULL, '2023-08-09 14:54:56', NULL, NULL, 0);
INSERT INTO `tm_wilayah` VALUES (2, 'ANK', 'Apotek Nawasena Karanganyar', 'Karanganyar, Solo', '0271-0998121', 'Blueprint_M801', 'y', NULL, NULL, NULL, '2023-08-09 14:55:03', 1, '2023-08-09 14:55:03', 1);

-- ----------------------------
-- Table structure for tx_beli_pesan
-- ----------------------------
DROP TABLE IF EXISTS `tx_beli_pesan`;
CREATE TABLE `tx_beli_pesan`  (
  `id_pesan_beli` int(11) NOT NULL AUTO_INCREMENT,
  `no_sp` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_pesan` date NULL DEFAULT NULL,
  `id_supplier` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_pesan_beli`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_beli_pesan
-- ----------------------------
INSERT INTO `tx_beli_pesan` VALUES (1, NULL, '2023-08-20', 1, 0, 1, '2023-08-16 16:56:04', NULL, '2023-08-16 16:56:04', NULL, NULL, 0);
INSERT INTO `tx_beli_pesan` VALUES (2, NULL, '2023-08-20', 1, 0, 1, '2023-08-20 10:37:02', NULL, '2023-08-20 10:37:02', NULL, NULL, 0);
INSERT INTO `tx_beli_pesan` VALUES (3, 'PO-01200823001', '2023-08-21', 1, 0, 1, '2023-08-20 10:59:07', NULL, '2023-08-20 10:59:07', NULL, NULL, 0);
INSERT INTO `tx_beli_pesan` VALUES (4, 'PO-01200823001', '2023-08-22', 1, 0, 1, '2023-08-20 11:02:12', NULL, '2023-08-20 11:02:12', NULL, NULL, 0);
INSERT INTO `tx_beli_pesan` VALUES (5, 'PO-01200823002', '2023-08-21', 1, 0, 1, '2023-08-20 13:38:08', NULL, '2023-08-20 13:38:08', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_beli_rencana
-- ----------------------------
DROP TABLE IF EXISTS `tx_beli_rencana`;
CREATE TABLE `tx_beli_rencana`  (
  `id_rencana_beli` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesan_beli` int(11) NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `jumlah_produk` int(11) NULL DEFAULT NULL,
  `harga_beli` int(11) NULL DEFAULT NULL,
  `jenis_pesanan` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status_terima` int(11) NOT NULL DEFAULT 0,
  `is_selesai` int(11) NOT NULL DEFAULT 0,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_rencana_beli`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_beli_rencana
-- ----------------------------
INSERT INTO `tx_beli_rencana` VALUES (11, NULL, 28, 1, 20, 100, 1, '-', 0, 1, 1, '2023-08-27 09:59:41', NULL, '2023-08-27 20:26:58', 1, '2023-08-27 20:26:58', 1);

-- ----------------------------
-- Table structure for tx_jual
-- ----------------------------
DROP TABLE IF EXISTS `tx_jual`;
CREATE TABLE `tx_jual`  (
  `id_jual` int(11) NOT NULL AUTO_INCREMENT,
  `no_nota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_kasir` int(11) NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `nama_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_beli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_jual` int(11) NULL DEFAULT NULL,
  `id_jenis_harga` int(11) NULL DEFAULT NULL,
  `id_satuan_utama` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `jumlah_produk` int(11) NULL DEFAULT NULL,
  `diskon` double NULL DEFAULT NULL,
  `total_harga` int(11) NULL DEFAULT NULL,
  `is_selesai` int(11) NOT NULL DEFAULT 0,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jual`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_jual
-- ----------------------------
INSERT INTO `tx_jual` VALUES (1, NULL, NULL, 27, 'Suntik', '2000', 7500, 4, 2, 2, 4, NULL, 10000, 1, 2, NULL, NULL, '2023-07-26 15:09:53', 2, '2023-07-16 16:40:18', 1);
INSERT INTO `tx_jual` VALUES (2, NULL, NULL, 13, 'Parasetamol 100 Mg', '400', 500, 3, 1, 1, 1, NULL, 500, 1, 2, '2023-07-16 10:48:28', NULL, '2023-07-26 15:09:53', 2, '2023-07-16 20:22:21', 1);
INSERT INTO `tx_jual` VALUES (3, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 12, NULL, 30000, 1, 2, '2023-07-16 16:40:53', NULL, '2023-07-26 15:09:53', 2, '2023-07-16 16:53:25', 1);
INSERT INTO `tx_jual` VALUES (4, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 2, NULL, 5000, 1, 2, '2023-07-16 16:53:33', NULL, '2023-07-26 15:09:53', 2, '2023-07-16 16:54:27', 1);
INSERT INTO `tx_jual` VALUES (5, 'ANK02180723001', 3, 27, 'Suntik', '2000', 2100, 2, 2, 2, 1, NULL, 2100, 1, 2, '2023-07-16 16:54:31', 2, '2023-07-18 13:42:13', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (6, 'ANK02180723001', 3, 28, 'Panadol', '400', 420, 1, 1, 3, 2, NULL, 84000, 1, 2, '2023-07-16 17:39:18', 2, '2023-07-18 13:42:13', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (7, 'ANK02180723001', 4, 27, 'Suntik', '2000', 2500, 4, 2, 2, 2, NULL, 5000, 1, 2, '2023-07-18 08:43:30', 2, '2023-07-18 13:44:22', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (8, 'ANK02180723001', 4, 28, 'Panadol', '400', 450, 4, 1, 2, 1, NULL, 4500, 1, 2, '2023-07-18 08:43:37', 2, '2023-07-18 13:44:22', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (9, 'ANK02180723003', 8, 28, 'Panadol', '400', 450, 4, 1, 3, 1, NULL, 45000, 1, 2, '2023-07-18 08:55:09', 2, '2023-07-18 13:55:54', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (10, NULL, NULL, 28, 'Panadol', '400', 450, 4, 1, 1, 1, NULL, 450, 1, 2, '2023-07-18 14:42:30', NULL, '2023-07-26 15:09:22', 2, '2023-07-18 14:45:53', 1);
INSERT INTO `tx_jual` VALUES (11, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 1, 2, '2023-07-18 14:44:37', NULL, '2023-07-26 15:09:22', 2, '2023-07-18 09:45:02', 1);
INSERT INTO `tx_jual` VALUES (12, NULL, NULL, 28, 'Panadol', '400', 450, 4, 1, 2, 1, NULL, 4500, 1, 2, '2023-07-19 09:55:04', 2, '2023-07-26 15:09:22', 2, '2023-07-19 10:03:31', 1);
INSERT INTO `tx_jual` VALUES (13, 'ANK02190723001', 9, 27, 'Suntik', '2000', 2500, 4, 2, 2, 4, NULL, 10000, 1, 2, '2023-07-19 10:06:39', 2, '2023-07-19 10:13:53', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (14, 'ANK02190723001', 9, 29, 'Paramex', '400', 500, 4, 1, 2, 1, NULL, 5000, 1, 2, '2023-07-19 10:12:40', 2, '2023-07-19 10:13:53', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (15, NULL, NULL, 29, 'Paramex', '400', 500, 4, 1, 2, 1, NULL, 5000, 1, 2, '2023-07-19 10:41:40', 2, '2023-07-26 15:09:22', 2, '2023-07-19 10:42:30', 1);
INSERT INTO `tx_jual` VALUES (16, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 1, 2, '2023-07-19 10:42:28', NULL, '2023-07-26 15:09:22', 2, '2023-07-19 10:42:31', 1);
INSERT INTO `tx_jual` VALUES (17, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 6, NULL, 15000, 1, 2, '2023-07-19 10:42:39', 2, '2023-07-26 15:09:22', 2, '2023-07-19 10:45:49', 1);
INSERT INTO `tx_jual` VALUES (18, 'GDP02190723002', 10, 29, 'Paramex', '400', 500, 4, 1, 1, 3, NULL, 1500, 1, 2, '2023-07-19 10:45:42', 2, '2023-07-19 17:43:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (19, 'GDP02190723002', 10, 28, 'Panadol', '400', 450, 4, 1, 1, 2, NULL, 900, 1, 2, '2023-07-19 10:45:48', 2, '2023-07-19 17:43:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (20, 'GDP01190723001', 11, 29, 'Paramex', '400', 43000, 1, 1, 3, 3, NULL, 129000, 1, 1, '2023-07-19 20:54:40', 1, '2023-07-19 23:42:26', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (21, NULL, NULL, 28, 'Panadol', '400', 450, 4, 1, 1, 1, NULL, 450, 1, 2, '2023-07-21 14:08:16', NULL, '2023-07-26 15:09:22', 2, '2023-07-21 14:09:42', 1);
INSERT INTO `tx_jual` VALUES (22, 'GDP02210723001', 12, 28, 'Panadol', '400', 450, 4, 1, 1, 1, NULL, 450, 1, 2, '2023-07-21 14:12:29', NULL, '2023-07-21 14:29:46', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (23, 'GDP02210723001', 12, 27, 'Suntik', '2000', 2500, 4, 2, 2, 3, NULL, 7500, 1, 2, '2023-07-21 14:28:55', 2, '2023-07-21 14:29:46', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (24, 'GDP02210723002', 13, 29, 'Paramex', '400', 5000, 4, 1, 2, 2, NULL, 10000, 1, 2, '2023-07-21 14:53:48', 2, '2023-07-21 14:55:13', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (25, 'GDP02210723002', 13, 28, 'Panadol', '400', 4200, 1, 1, 2, 2, NULL, 8400, 1, 2, '2023-07-21 14:53:53', 2, '2023-07-21 14:55:13', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (26, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 5, NULL, 12500, 1, 2, '2023-07-21 15:01:08', 2, '2023-07-21 15:28:47', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (27, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 0, 2, '2023-07-21 15:30:54', NULL, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (28, 'GDP02210723005', 16, 29, 'Paramex', '400', 5000, 4, 1, 2, 5, NULL, 25000, 0, 2, '2023-07-21 15:33:42', 2, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (29, NULL, NULL, 835, 'Paracetamol Sirup 60 ml YEKATRIA', NULL, NULL, NULL, NULL, NULL, 8, NULL, 0, 0, 1, '2023-07-31 16:40:21', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (30, 'GDP01010823001', 17, 29, 'Paramex', '400', 500, 4, 1, 1, 2, NULL, 1000, 1, 1, '2023-07-31 16:53:38', NULL, '2023-08-01 09:30:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (31, 'GDP01010823001', 17, 27, 'Suntik', '2000', 2500, 4, 2, 2, 3, NULL, 7500, 1, 1, '2023-07-31 16:59:48', 1, '2023-08-01 09:30:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (32, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 1, 1, '2023-08-09 14:58:21', NULL, '2023-08-09 15:00:48', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (33, NULL, NULL, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 1, 1, '2023-08-09 15:14:10', NULL, '2023-08-09 15:14:18', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (34, NULL, NULL, 297, 'Antimo Anak Cair Strawberry Sachet 10 ml', '1000', 1500, 4, 4, 4, 1, NULL, 1500, 1, 1, '2023-08-09 15:24:29', NULL, '2023-08-09 15:28:38', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (35, NULL, NULL, 1945, 'Vital Tetes Telinga', '13500', 16500, 4, 6, 6, 1, NULL, 16500, 0, 1, '2023-08-09 16:00:13', 1, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (36, NULL, NULL, 1945, 'Vital Tetes Telinga', '13500', 16500, 4, 6, 6, 1, NULL, 16500, 0, 1, '2023-08-09 16:03:33', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (37, NULL, NULL, 1952, 'Insto Tetes Mata 7,5 ml', '12750', 15500, 4, 6, 6, 1, NULL, 15500, 0, 1, '2023-08-09 16:10:47', 1, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (38, NULL, NULL, 1506, 'Byebye Fever Anak Sachet', '9050', 11000, 4, 4, 4, 1, NULL, 11000, 0, 1, '2023-08-09 16:44:59', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (39, NULL, NULL, 1953, 'Rohto Tetes Mata', '10417', 12500, 4, 6, 6, 1, NULL, 12500, 0, 2, '2023-08-09 17:03:10', NULL, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (40, NULL, NULL, 654, 'Vicks Vaporub 10 Gram', '7083', 8500, 4, 5, 5, 1, NULL, 8500, 0, 2, '2023-08-10 15:30:08', NULL, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (41, NULL, NULL, 1958, 'Safecare', '13958', 16900, 4, 5, 5, 1, NULL, 16900, 1, 2, '2023-08-19 11:02:25', NULL, '2023-08-19 11:02:44', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (42, NULL, NULL, 294, 'Antangin Junior 10 ml', '2000', 2500, 4, 4, 4, 0, NULL, 0, 0, 1, '2023-08-21 15:16:09', 1, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (43, NULL, NULL, 1507, 'Byebye Fever Bayi Sachet', '6400', 7850, 4, 4, 4, 1, NULL, 7850, 0, 1, '2023-08-21 15:18:02', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (44, NULL, NULL, 1506, 'Byebye Fever Anak Sachet', '9050', 11000, 4, 4, 4, 1, NULL, 11000, 0, 1, '2023-08-21 15:19:43', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (45, NULL, NULL, 1964, 'Koyo Cabe', '10125', 12000, 4, 4, 4, 1, NULL, 12000, 0, 1, '2023-08-21 15:19:56', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (46, NULL, NULL, 1463, 'Komix Kid Strawberry Sachet 5 ml', '1000', 1200, 4, 4, 4, 1, NULL, 1200, 0, 2, '2023-08-22 08:37:22', NULL, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (47, NULL, NULL, 466, 'Sakatonik Active Sirup 100 ml', '11667', 14000, 4, 6, 6, 1, NULL, 14000, 0, 2, '2023-08-22 15:54:54', NULL, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (48, NULL, NULL, 1457, 'Ultraflu Tablet', '2900', 3500, 4, 2, 2, 1, NULL, 3500, 0, 1, '2023-08-25 19:10:48', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (49, NULL, NULL, 1456, 'Ultraflu Extra Tablet', '2900', 3500, 4, 2, 2, 1, NULL, 3500, 0, 1, '2023-08-25 19:11:42', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (50, NULL, NULL, 1170, 'Acyclovir Cream 5 Gram FM', '3632', 4500, 4, 7, 7, 1, NULL, 4500, 0, 1, '2023-08-25 19:34:00', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (51, NULL, NULL, 683, 'Allopurinol Tablet 300 mg HJ', '435', 522, 4, 1, 1, 10, NULL, 5220, 0, 1, '2023-08-25 19:37:01', 1, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (52, NULL, NULL, 2078, 'Acyclovir Tablet 400mg HJ', '643', 800, 4, 1, 1, 10, NULL, 8000, 0, 2, '2023-08-25 19:51:43', 2, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (53, NULL, NULL, 684, 'Ambroxol tablet 30 mg YARINDO', '1040', 2000, 4, 2, 2, 9, NULL, 18000, 0, 2, '2023-08-25 19:52:16', 2, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (54, NULL, NULL, 684, 'Ambroxol tablet 30 mg YARINDO', '104', 200, 4, 1, 1, 1, NULL, 200, 0, 2, '2023-08-25 19:56:20', 2, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (55, NULL, NULL, 687, 'Amoxicillin Tablet 500 mg ERRITA', '447', 600, 4, 1, 1, 99, NULL, 59400, 0, 2, '2023-08-25 20:04:59', 2, '2023-08-25 20:06:20', 2, '2023-08-25 20:06:20', 1);
INSERT INTO `tx_jual` VALUES (56, NULL, NULL, 2082, 'Betamethasone 0,1% Cream 5 gr', '2934', 3600, 4, 7, 7, 10, NULL, 36000, 0, 1, '2023-08-25 20:25:08', 1, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (57, NULL, NULL, 2088, 'Omeprazole Kapsul 20 mg HEX', '371', 500, 4, 1, 1, 1, NULL, 500, 0, 1, '2023-08-25 21:01:30', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (58, NULL, NULL, 509, 'Tolak Angin Cair 15 ml', '3300', 4000, 4, 4, 4, 1, NULL, 4000, 0, 2, '2023-08-25 21:29:19', NULL, '2023-08-25 22:48:39', 2, '2023-08-25 22:48:39', 1);
INSERT INTO `tx_jual` VALUES (59, NULL, NULL, 2021, 'Konicare Telon 30 ml', '11333', 13600, 4, 5, 5, 1, NULL, 13600, 0, 1, '2023-08-25 21:51:13', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (60, NULL, NULL, 76, 'Degirol Tablet Hisap 10', '11500', 13800, 4, 2, 2, 1, NULL, 13800, 0, 1, '2023-08-25 22:02:54', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (61, NULL, NULL, 93, 'Enervon C Tablet 4', '1150', 1400, 4, 2, 2, 1, NULL, 1400, 0, 1, '2023-08-25 22:03:30', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (62, NULL, NULL, 93, 'Enervon C Tablet 4', '4600', 6000, 4, 2, 2, 1, NULL, 6000, 0, 1, '2023-08-25 22:05:46', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (63, NULL, NULL, 508, 'Tolak Angin Anak 10 ml', '2400', 3000, 4, 4, 4, 1, NULL, 3000, 0, 1, '2023-08-25 22:26:53', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (64, NULL, NULL, 34, 'Antimo Tablet', '4167', 5500, 4, 2, 2, 1, NULL, 5500, 0, 1, '2023-08-25 22:27:10', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (65, NULL, NULL, 1428, 'PimTraKol Cherry Sirup 60 ml', '12917', 15600, 4, 6, 6, 1, NULL, 15600, 0, 1, '2023-08-25 22:30:57', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);
INSERT INTO `tx_jual` VALUES (66, NULL, NULL, 1377, 'Hufagrip Flu Batuk Sirup 60 ml', '19167', 23100, 4, 6, 6, 1, NULL, 23100, 0, 1, '2023-08-25 22:31:26', NULL, '2023-08-25 22:48:09', 1, '2023-08-25 22:48:09', 1);

-- ----------------------------
-- Table structure for tx_kasir
-- ----------------------------
DROP TABLE IF EXISTS `tx_kasir`;
CREATE TABLE `tx_kasir`  (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NULL DEFAULT NULL,
  `no_nota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_transaksi` datetime(0) NULL DEFAULT NULL,
  `sub_tot` int(11) NULL DEFAULT NULL,
  `service` int(11) NULL DEFAULT NULL,
  `embalase` int(11) NULL DEFAULT NULL,
  `lain` int(11) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tx_kasir` VALUES (12, NULL, 'GDP02210723001', '2023-07-21 14:29:46', 7950, 0, 0, 0, 7950, 10000, 2050, 2, '2023-07-21 14:29:46', NULL, '2023-07-21 14:29:46', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (13, NULL, 'GDP02210723002', '2023-07-21 14:55:13', 18400, 0, 0, 0, 18400, 20000, 1600, 2, '2023-07-21 14:55:13', NULL, '2023-07-21 14:55:13', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (14, NULL, 'GDP02210723003', '2023-07-21 15:01:32', 12500, 0, 0, 0, 12500, 13000, 500, 2, '2023-07-21 15:01:32', NULL, '2023-07-21 15:01:32', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (15, NULL, 'GDP02210723004', '2023-07-21 15:31:02', 2500, 0, 0, 0, 2500, 5000, 2500, 2, '2023-07-21 15:31:02', NULL, '2023-07-21 15:31:02', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (16, NULL, 'GDP02210723005', '2023-07-21 15:34:10', 25000, 0, 0, 0, 25000, 25000, 0, 2, '2023-07-21 15:34:10', NULL, '2023-07-21 15:34:10', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (17, NULL, 'GDP01010823001', '2023-08-01 09:27:15', 8500, 0, 0, 0, 8500, 10000, 1500, 1, '2023-08-01 09:27:15', NULL, '2023-08-01 09:27:15', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_konsinyasi
-- ----------------------------
DROP TABLE IF EXISTS `tx_konsinyasi`;
CREATE TABLE `tx_konsinyasi`  (
  `id_konsinyasi` int(11) NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_sp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_terima` date NULL DEFAULT NULL,
  `tgl_faktur` date NULL DEFAULT NULL,
  `jenis_pembayaran` int(11) NULL DEFAULT NULL,
  `id_kas` int(11) NULL DEFAULT NULL,
  `id_gudang` int(11) NULL DEFAULT NULL,
  `jatuh_tempo` date NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_konsinyasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_konsinyasi
-- ----------------------------
INSERT INTO `tx_konsinyasi` VALUES (1, 'REN-01260823001', 'PO-346376', '1', '2023-08-26', '2023-08-24', 1, 1, 2, '2023-08-31', NULL, 1, '2023-08-26 22:37:44', NULL, '2023-08-26 22:37:44', NULL, NULL, 0);
INSERT INTO `tx_konsinyasi` VALUES (2, 'FKN-01260823001', 'PO-346345', '1', '2023-08-26', '2023-08-24', 1, 2, 2, '2023-08-31', NULL, 1, '2023-08-26 23:03:21', NULL, '2023-08-26 23:03:21', NULL, NULL, 0);
INSERT INTO `tx_konsinyasi` VALUES (3, 'FKN-01260823002', 'PO-346341', '1', '2023-08-26', '2023-08-24', 1, 2, 2, '2023-08-25', NULL, 1, '2023-08-26 23:05:19', NULL, '2023-08-26 23:58:33', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_konsinyasi_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_konsinyasi_detail`;
CREATE TABLE `tx_konsinyasi_detail`  (
  `id_konsinyasi_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsinyasi` int(255) NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `kode_ksu` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_exp` date NULL DEFAULT NULL,
  `jumlah_konsinyasi` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `harga_beli` int(11) NULL DEFAULT NULL,
  `harga_pokok` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `is_selesai` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_konsinyasi_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_konsinyasi_detail
-- ----------------------------
INSERT INTO `tx_konsinyasi_detail` VALUES (1, NULL, 28, 'OBPA160723', '2023-08-31', 100, 0, 100, 150, NULL, 1, 1, '2023-08-26 21:49:15', NULL, '2023-08-26 21:54:59', 1, '2023-08-26 21:54:59', 1);
INSERT INTO `tx_konsinyasi_detail` VALUES (2, 1, 28, 'OBPA160723', '2023-08-31', 10, 1, 100, 150, NULL, 2, 1, '2023-08-26 21:55:22', NULL, '2023-08-26 22:37:44', NULL, NULL, 0);
INSERT INTO `tx_konsinyasi_detail` VALUES (3, 2, 28, 'OBPA160723', '2023-08-31', 10, 1, 100, 150, NULL, 2, 1, '2023-08-26 23:02:15', NULL, '2023-08-26 23:03:21', NULL, NULL, 0);
INSERT INTO `tx_konsinyasi_detail` VALUES (4, 3, 27, 'ALSU', '2023-08-31', 100, 1, 100, 150, NULL, 2, 1, '2023-08-26 23:04:10', NULL, '2023-08-26 23:05:19', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_persediaan
-- ----------------------------
DROP TABLE IF EXISTS `tx_persediaan`;
CREATE TABLE `tx_persediaan`  (
  `id_pesediaan` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_pesediaan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_persediaan
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk
-- ----------------------------
INSERT INTO `tx_produk` VALUES (27, 'ALSU', '1231334', 'Suntik', 2, 1, 2, 2, 'kalbe', 2000, '1', NULL, NULL, NULL, '2023-08-27 20:14:48', 1, '2023-08-27 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (28, 'OBPA160723', '167098342', 'Panadol', 1, 10, 1, 2, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-08-27 20:14:30', 1, '2023-08-27 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (29, 'OBPA989012', '09894823', 'Paramex', 1, 10, 1, 0, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-08-27 20:14:15', 1, '2023-08-27 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (30, 'OB - ADESARSAC', '8997239630103', 'Adem Sari Sachet', 4, 1, 0, 0, 'PT. Sari Enesis Indah', 1750, '1', NULL, NULL, NULL, '2023-08-22 08:39:54', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (31, 'OB - AMB', '8992828881782', 'Ambeven', 2, 1, 4, 0, 'PT. Medikon Prima Laboratories', 15600, '1', NULL, NULL, NULL, '2023-08-22 08:40:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (32, 'OB - ANTPER', '8992003783337', 'Antangin Permen', 0, 1, 0, 0, 'Deltomed Laboratories', 1866, '1', NULL, NULL, NULL, '2023-08-22 10:19:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (33, 'OB - ANTTAB', '8992003170403', 'Antangin Tablet', 2, 1, 4, 0, 'PT. Deltomed Laboratories', 3000, '1', NULL, NULL, NULL, '2023-08-22 08:41:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (34, 'OB - ANTTAB', '8993498210230', 'Antimo Tablet', 2, 1, 4, 0, 'PT. PHAPROS,Tbk', 4167, '1', NULL, NULL, NULL, '2023-08-19 13:19:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (35, NULL, NULL, 'Asifit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (36, NULL, NULL, 'Astria 4 Tablet mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (37, NULL, NULL, 'Biocalci Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (38, NULL, NULL, 'Biocalci Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (39, 'OB - BIOTAB', '8992112003012', 'Biogesic Tablet', 1, 1, 0, 0, 'PT. Medifarma', 1842, '1', NULL, NULL, NULL, '2023-08-21 07:31:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (40, NULL, NULL, 'Biolysin C 100 Strawberry 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (41, 'OB - BIOTABHISGRA30', '8992001082333', 'Biolysin Tablet Hisap Grape 30', 6, 1, 0, 0, 'PT. Bernofarm', 14333, '1', NULL, NULL, NULL, '2023-08-21 07:40:53', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (42, 'OB - BIOTABHISORA30', '8992001082319', 'Biolysin Tablet Hisap Orange 30', 6, 1, 0, 0, 'PT. Bernofarm', 14333, '1', NULL, NULL, NULL, '2023-08-21 07:41:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (43, 'OB - BIOTABHISSTR30', '8992001082326', 'Biolysin Tablet Hisap Strawberry 30', 6, 1, 0, 0, 'PT. Bernofarm', 14333, '1', NULL, NULL, NULL, '2023-08-21 07:39:17', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (44, NULL, NULL, 'Biolysin Tablet Kunyah Strawberry Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (45, NULL, NULL, 'Biovision Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (46, NULL, NULL, 'Bisolvon Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (47, NULL, NULL, 'Bisolvon Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (48, 'OB - BODEXTTAB', '8999908285003', 'Bodrex Extra Tablet', 2, 1, 0, 0, 'PT. Tempo Scan Pacific', 2000, '1', NULL, NULL, NULL, '2023-08-22 08:45:45', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (49, NULL, NULL, 'Bodrex Flu Batuk Tidak Berdahak PE Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (50, 'OB - BODFLUBATBERPETAB', '8999908057709', 'Bodrex Flu Batuk Berdahak PE Tablet', 2, 1, 0, 0, 'PT. Tempo Scan Pacific', 1780, '1', NULL, NULL, NULL, '2023-08-22 08:45:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (51, 'OB - BODMIGTAB', '8999908071903', 'Bodrex Migra Tablet', 0, 1, 0, 0, 'PT. Tempo Scan Pacific', 2000, '1', NULL, NULL, NULL, '2023-08-22 08:46:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (52, 'OB - BODTAB10', '8999908000200', 'Bodrex Tablet 10', 2, 1, 0, 0, 'PT. Tempo Scan Pacific', 3791, '1', NULL, NULL, NULL, '2023-08-21 07:47:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (53, 'OB - BODTAB6', '8999908000705', 'Bodrexin Tablet 6', 2, 1, 0, 0, 'PT. Supra Ferbindo Farma', 3625, '1', NULL, NULL, NULL, '2023-08-21 08:00:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (54, NULL, NULL, 'CDR Fortos Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (55, 'OB - CDRORAEFFTAB10', '8994591010017', 'CDR Orange Effervescent Tablet 10', 5, 1, 0, 0, 'PT. Bayer Indonesia', 42000, '1', NULL, NULL, NULL, '2023-08-21 08:31:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (56, NULL, NULL, 'CDR Orange Effervescent Tablet 15', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (57, NULL, NULL, 'CDR Fruit Punch Effervescent Tablet 10 ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (58, NULL, NULL, 'CDR Orange Effervescent Tablet 2', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (59, NULL, NULL, 'CDR Twin Orange Tablet 20', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (60, NULL, NULL, 'Cerebrofort Marine Gummy Grape Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (61, NULL, NULL, 'Cerebrofort Marine Gummy Mango Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (62, NULL, NULL, 'Cerebrofort Marine Gummy Mixed Fruit Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (63, NULL, NULL, 'Cerebrofort Marine Gummy Orange Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (64, NULL, NULL, 'Cerebrofort Marine Gummy Strawberry Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (65, NULL, NULL, 'Cerebrovit Ginkgo Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (66, NULL, NULL, 'Cerebrovit X Cel Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (67, NULL, NULL, 'Combantrin Tablet 125 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (68, 'OB - COMTAB250MG', '8993212111089', 'Combantrin Tablet 250 mg', 1, 1, 0, 0, 'PT. Plizer', 16333, '1', NULL, NULL, NULL, '2023-08-21 08:42:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (69, 'OB - CONTAB', '8999908039101', 'Contrexyn Tablet', 2, 1, 0, 0, 'PT. Supra Ferbindo Farma', 900, '1', NULL, NULL, NULL, '2023-08-23 16:03:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (70, NULL, NULL, 'Curcuma FCT Tablet 12', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (71, NULL, NULL, 'Curcuma Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (72, NULL, NULL, 'Curvit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (73, NULL, NULL, 'Custodiol Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (74, 'OB - DARKAP', '8992781220567', 'Darsi Kapsul', 3, 1, 0, 0, 'PT. Borobudur', 17500, '1', NULL, NULL, NULL, '2023-08-21 09:09:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (75, NULL, NULL, 'Darsi Pil', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (76, 'OB - DEGTABHIS10', '8999809503572', 'Degirol Tablet Hisap 10', 2, 1, 0, 0, 'PT. Darya Varia', 11500, '1', NULL, NULL, NULL, '2023-08-21 09:27:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (77, NULL, NULL, 'Degirol Tablet Hisap 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (78, NULL, NULL, 'Diagit Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (79, NULL, NULL, 'Diagit Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (80, 'OB - DIAKAP10', '8998777144060', 'Diapet Kapsul 10', 2, 1, 0, 0, 'PT. Soho Industri Pharmasi', 4333, '1', NULL, NULL, NULL, '2023-08-22 08:50:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (81, 'OB - DIAKAPNR4', '8998777144022', 'Diapet Kapsul NR 4', 2, 1, 0, 0, 'PT. Soho Industri Pharmasi', 2767, '1', NULL, NULL, NULL, '2023-08-21 09:37:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (82, NULL, NULL, 'Diapet Kapsul 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (83, NULL, NULL, 'Diarex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (84, NULL, NULL, 'Diatab Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (85, NULL, NULL, 'Dulcolax Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (86, NULL, NULL, 'Dulcolax Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (87, NULL, NULL, 'Dumin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (88, NULL, NULL, 'Efisol Lozenges', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (89, 'OB - EMKAP', '8992781220086', 'Em Kapsul', 3, 19600, 0, 0, 'PT. Borobudur', 16333, '1', NULL, NULL, NULL, '2023-08-21 09:52:46', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (90, NULL, NULL, 'Enervon Active Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (91, NULL, NULL, 'Enervon Active Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (92, 'OB - ENECTAB30', '8992112011031', 'Enervon C Tablet 30', 6, 1, 0, 0, 'PT. Medifarma', 34000, '1', NULL, NULL, NULL, '2023-08-21 10:00:23', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (93, 'OB - ENECTAB4', '8992112011017', 'Enervon C Tablet 4', 2, 1, 0, 0, 'PT. Medifarma', 4600, '1', NULL, NULL, NULL, '2023-08-25 22:05:18', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (94, 'OB - ENTTAB', '8992858658316', 'Entrostop Tablet', 2, 1, 0, 0, 'PT. Kalbe Farma', 6700, '1', NULL, NULL, NULL, '2023-08-22 08:52:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (95, NULL, NULL, 'Enzyplex Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (96, NULL, NULL, 'Ester C Kapsul 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (97, 'OB - ESTCKAP4', '8992863661035', 'Ester C Kapsul 4', 2, 1, 0, 0, 'PT. Pyridam Farma', 6291, '1', NULL, NULL, NULL, '2023-08-22 08:53:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (98, NULL, NULL, 'Ester C Kapsul 90', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (99, NULL, NULL, 'Ester C Plus D3 Kapsul 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (100, NULL, NULL, 'Ester C Tablet Effervescent Blackcurant 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (101, NULL, NULL, 'Ever E 250 mg 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (102, 'OB - EVEE250MG6', '8998667101715', 'Ever E 250 mg 6', 2, 1, 0, 0, 'PT. Konimex', 13000, '1', NULL, NULL, NULL, '2023-08-22 08:53:43', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (103, NULL, NULL, 'Eyevit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (104, 'OB - FATPUT6', '8993218627201', 'Fatigon Putih 6', 2, 1, 0, 0, 'PT. Kalbe Farma', 6100, '1', NULL, NULL, NULL, '2023-08-23 16:10:26', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (105, 'OB - FATSPI', '8993218627102', 'Fatigon Spirit ', 2, 1, 0, 0, 'PT. Kalbe Farma', 8550, '1', NULL, NULL, NULL, '2023-08-23 16:12:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (106, 'OB - FEMTAB', '8998667100046', 'Feminax Tablet', 2, 1, 0, 0, 'PT. Konimex', 2925, '1', NULL, NULL, NULL, '2023-08-21 10:20:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (107, 'OB - FISFRIORI', '50854004', 'Fishermans Friend Original', 5, 1, 0, 0, 'PT. Nirwana Lestari', 13333, '1', NULL, NULL, NULL, '2023-08-21 10:49:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (108, NULL, NULL, 'Fishermans Friend SF Aniseed', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (109, 'OB - FISFRISFBLA', '96068809', 'Fishermans Friend SF Blackcurant', 5, 1, 0, 0, 'PT. Nirwana Lestari', 13333, '1', NULL, NULL, NULL, '2023-08-21 10:43:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (110, NULL, NULL, 'Fishermans Friend SF Cheery', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (111, NULL, NULL, 'Fishermans Friend SF Citrus', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (112, NULL, NULL, 'Fishermans Friend SF Citrus', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (113, 'OB - FISFRISFHONLEM', '96091876', 'Fishermans Friend SF Honey Lemon', 5, 1, 0, 0, 'PT. Nirwana Lestari', 13333, '1', NULL, NULL, NULL, '2023-08-21 10:30:01', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (114, 'OB - FISFRISFLEM', '50604159', 'Fishermans Friend SF Lemon', 5, 1, 0, 0, 'PT. Nirwana Lestari', 13333, '1', NULL, NULL, NULL, '2023-08-21 10:32:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (115, NULL, NULL, 'Fishermans Friend SF Mandarin Ginger ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (116, 'OB - FISFRISFMINHIJPUT', '50357154', 'Fishermans Friend SF Mint Hijau Putih', 5, 1, 0, 0, 'PT. Nirwana Lestari', 13333, '1', NULL, NULL, NULL, '2023-08-21 10:46:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (117, NULL, NULL, 'Fishermans Friend SF Mint Raspberry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (118, 'OB - FISFRISFORI', '50854004', 'Fishermans Friend SF Original', 5, 1, 0, 0, 'PT. Nirwana Lestari', 13333, '1', NULL, NULL, NULL, '2023-08-21 10:40:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (119, NULL, NULL, 'Fishermans Friend SF Raspberry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (120, NULL, NULL, 'Fishermans Friend SF Spearmint', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (121, NULL, NULL, 'Fishermans Friend Strong Mint Hijau', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (122, NULL, NULL, 'Fishqua Kapsul 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (123, NULL, NULL, 'Fitkom Grape Tablet 21', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (124, 'OB - FITORATAB21', '8998777144145', 'Fitkom Orange Tablet 21', 6, 1, 0, 0, 'PT. Soho Industri Pharmasi', 14167, '1', NULL, NULL, NULL, '2023-08-21 10:55:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (125, 'OB - FITSTRTAB21', '8998777144152', 'Fitkom Strawberry Tablet 21', 6, 1, 0, 0, 'PT. Soho Industri Pharmasi', 14167, '1', NULL, NULL, NULL, '2023-08-21 10:53:17', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (126, 'OB - FITGUMBIRSAC12GRA', '8998777144138', 'Fitkom Gummy Biru Sachet 12 Gram', 6, 1, 0, 0, 'PT. Soho Industri Pharmasi', 14167, '1', NULL, NULL, NULL, '2023-08-21 10:56:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (127, NULL, NULL, 'Fitkom Gummy Biru Sachet 12 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (128, NULL, NULL, 'Fitkom Gummy Biru Sachet 21 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (129, NULL, NULL, 'Fitkom Gummy Calcium Kuning Sachet 21 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (130, NULL, NULL, 'Fitkom Gummy Calcium Kuning Sachet 21 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (131, NULL, NULL, 'Fitkom Gummy Fiber Merah Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (132, NULL, NULL, 'Fitkom Gummy Fruit And Veggie Hijau Sachet 21 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (133, NULL, NULL, 'Fitkom Gummy Fruit And Veggie Hijau Sachet 21 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (134, NULL, NULL, 'Fitkom Gummy Omega Ungu Sachet 21 Gram ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (135, NULL, NULL, 'Fitkom Gummy Omega Ungu Sachet 21 Gram ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (136, NULL, NULL, 'Fitkom Gummy Vit C And Zinc Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (137, NULL, NULL, 'Fituno Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (138, NULL, NULL, 'Fruit Blend 18 Jr Buah', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (139, NULL, NULL, 'Fruit Blend For Adults Buah', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (140, NULL, NULL, 'Hemaviton Cardio Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (141, 'OB - HEMACTKAP', '8999908056405', 'Hemaviton Action Kapsul', 2, 1, 0, 0, 'PT. Tempo Scan Pacific', 6200, '1', NULL, NULL, NULL, '2023-08-22 08:55:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (142, NULL, NULL, 'Hemaviton Joint Care Max Taplet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (143, NULL, NULL, 'Hemaviton Neuro Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (144, 'OB - HEMSTAPLUKAP', '8999908056207', 'Hemaviton Stamina Plus Kapsul', 2, 1, 0, 0, 'PT. Tempo Scan Pacific', 5975, '1', NULL, NULL, NULL, '2023-08-22 08:54:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (145, NULL, NULL, 'Hevit C Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (146, NULL, NULL, 'Imboost Effervescent Grape 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (147, NULL, NULL, 'Imboost Effervescent Orange 2', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (148, NULL, NULL, 'Imboost Effervescent Original 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (149, NULL, NULL, 'Imboost Effervescent Tropical Fruit 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (150, NULL, NULL, 'Imboost Lozenges Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (151, 'OB - INZTAB', '8998667100947', 'Inzana Tablet', 2, 1, 0, 0, 'PT. Konimex', 880, '1', NULL, NULL, NULL, '2023-08-22 08:56:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (152, NULL, NULL, 'Jaguar Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (153, 'OB - JESTABEFF', '8998667100763', 'Jesscool Tablet Effervescent', 5, 1, 0, 0, 'PT. Konimex', 1625, '1', NULL, NULL, NULL, '2023-08-23 16:16:40', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (154, NULL, NULL, 'Joint Herbal 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (155, NULL, NULL, 'Joint Herbal 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (156, 'OB - KAP', '8997011370449', 'Kapsida', 6, 1, 0, 0, 'PT. Kembang Bulan', 13417, '1', NULL, NULL, NULL, '2023-08-21 13:41:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (157, 'OB - KEJBOR', '8992781090306', 'Kejibeling Borobudur', 2, 1, 0, 0, 'PT. Borobudur', 9100, '1', NULL, NULL, NULL, '2023-08-22 08:56:58', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (158, NULL, NULL, 'Kejibeling PT Ikong', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (159, NULL, NULL, 'Kejibeling Balatif', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (160, NULL, NULL, 'Kenshin Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (161, 'OB - KULSARTAB', '8992003784037', 'Kuldon Sariawan Tablet ', 2, 1, 0, 0, 'PT. Deltomed ', 2400, '1', NULL, NULL, NULL, '2023-08-23 16:18:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (162, NULL, NULL, 'Lagesil Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (163, 'OB - LANASITAB', '8993079168011', 'Lancar Asi Tablet ', 2, 1, 0, 0, 'PT. MECOSIN INDONESIA', 7583, '1', NULL, NULL, NULL, '2023-08-23 16:21:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (164, 'OB - LAXKAP10', '8998777144084', 'Laxing Kapsul 10', 2, 1, 0, 0, 'PT. Soho Industri Pharmasi', 7850, '1', NULL, NULL, NULL, '2023-08-23 16:23:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (165, NULL, NULL, 'Laxing Kapsul 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (166, NULL, NULL, 'Lelap Kapsul 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (167, NULL, NULL, 'Lelap Kapsul 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (168, NULL, NULL, 'Livron B Plex Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (169, NULL, NULL, 'Lo Han Kuo 12', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (170, NULL, NULL, 'Magalat Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (171, NULL, NULL, 'Magtral Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (172, NULL, NULL, 'Maximus Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (173, NULL, NULL, 'Merit Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (174, NULL, NULL, 'Minyak Ikan 500', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (175, NULL, NULL, 'Minyak ikan PT Saras Subur ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (176, 'OB - MIXFLUTAB', '8995858999991', 'Mixagip Flu Tablet ', 2, 1, 0, 0, 'PT. Saka Farma Laboratories', 2300, '1', NULL, NULL, NULL, '2023-08-22 08:32:45', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (177, NULL, NULL, 'Mucohexin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (178, NULL, NULL, 'My Well D3 Tablet 1000 IU 20', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (179, 'OB - MYLTAB', '8992725051219', 'Mylanta Tablet', 2, 1, 0, 0, 'PT. Integrated Healthcare Indonesia', 7500, '1', NULL, NULL, NULL, '2023-08-22 09:13:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (180, 'OB - NASTAB', '8993034780012', 'Naspro Tablet', 2, 1, 0, 0, 'PT. Nicholas Laboratories Indonesia', 4800, '1', NULL, NULL, NULL, '2023-08-22 09:18:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (181, NULL, NULL, 'Natur Slim Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (182, NULL, NULL, 'Natur E Hijau 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (183, NULL, NULL, 'Natur E Orange 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (184, NULL, NULL, 'Natur E Advance Putih 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (185, NULL, NULL, 'Negatal Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (186, NULL, NULL, 'Neo Hormoviton Pasak Bumi Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (187, 'OB - NEORHETAB', '8999908000101', 'Neo Rheumacyl Tablet', 2, 1, 0, 0, '', 4375, '1', NULL, NULL, NULL, '2023-08-22 15:10:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (188, NULL, NULL, 'Neo Rheumacyl Neuro Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (189, NULL, NULL, 'Neosanmag Fast', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (190, NULL, NULL, 'Nitasan ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (191, 'OB - NOR', '8993176190014', 'Norit', 6, 1, 0, 0, 'PT. EAGLE INDO PHARMA', 14625, '1', NULL, NULL, NULL, '2023-08-22 09:29:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (192, NULL, NULL, 'Nourishkin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (193, NULL, NULL, 'Nourishkin Ultimate Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (194, NULL, NULL, 'Om3 Heart 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (195, NULL, NULL, 'Omepros Soft Kapsul 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (196, NULL, NULL, 'Omepros Mini Kapsul 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (197, NULL, NULL, 'Omepros Mini Kapsul 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (198, NULL, NULL, 'Omepros Soft Kapsul 100', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (199, NULL, NULL, 'Omepros Soft Kapsul 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (200, NULL, NULL, 'Omepros Soft Kapsul 60', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (201, NULL, NULL, 'Oskadon Extra Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (202, 'OB - OSKSAKKEPTAB', '8999908039309', 'Oskadon Sakit Kepala Tablet ', 2, 1, 0, 0, 'PT. Supra Ferbindo Farma', 1642, '1', NULL, NULL, NULL, '2023-08-22 09:50:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (203, NULL, NULL, 'Oskadon SP Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (204, NULL, NULL, 'Pamol Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (205, 'OB - PANBIRTAB', '8992695100207', 'Panadol Biru Tablet', 2, 1, 0, 0, 'PT. Glaxo Wellcome Indonesia', 10250, '1', NULL, NULL, NULL, '2023-08-22 09:53:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (206, NULL, NULL, 'Panadol Chewable Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (207, 'OB - PANEXTTAB', '8992695110206', 'Panadol Extra Tablet', 2, 1, 0, 0, 'PT. Glaxo  Wellcome Indonesia', 11750, '1', NULL, NULL, NULL, '2023-08-22 09:55:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (208, 'OB - PARNYEOTOTAB', '8998667101487', 'Paramex Nyeri Otot Tablet ', 2, 1, 0, 0, 'PT. Konimex', 1767, '1', NULL, NULL, NULL, '2023-08-22 10:02:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (209, 'OB - PARTAB(BI', '8998667100206', 'Paramex Tablet (Biru)', 2, 1, 0, 0, 'PT. Konimex', 2080, '1', NULL, NULL, NULL, '2023-08-22 09:58:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (210, NULL, NULL, 'Paramex SK Tablet (Merah)', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (211, 'OB - PILTUN', '8992003121207', 'Pil Tuntas', 3, 1, 0, 0, 'Deltomed', 10500, '1', NULL, NULL, NULL, '2023-08-22 10:27:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (212, 'OB - PILTAB', '8997013070019', 'Pilkita Tablet ', 2, 1, 0, 0, 'PT. Margina Tarulata Astagina Pilkita Farma', 1900, '1', NULL, NULL, NULL, '2023-08-22 10:25:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (213, 'OB - POLTAB', '8993008235043', 'Poldanmig Tablet ', 2, 1, 0, 0, 'PT. Sanbe', 3125, '1', NULL, NULL, NULL, '2023-08-22 10:29:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (214, NULL, NULL, 'Promag Double Action ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (215, 'OB - PROTAB', '8992858665000', 'Promag Tablet', 2, 1, 0, 0, 'PT. Kalbe Farma', 6708, '1', NULL, NULL, NULL, '2023-08-22 11:05:55', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (216, '', '', 'Protecal Defence Effervescent Sachet', 6, 0, 0, 0, 'PT. Konimex', 0, '1', NULL, NULL, NULL, '2023-08-23 16:34:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (217, 'OB - PRODEFEFFTUB', '8998667101234', 'Protecal Defence Effervescent Tube', 6, 1, 0, 0, 'PT. Konimex', 29750, '1', NULL, NULL, NULL, '2023-08-23 16:34:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (218, 'OB - PROSOLEFFSAC', '8998667101203', 'Protecal Solid Effervescent Sachet', 5, 1, 0, 0, 'PT. Konimex', 2975, '1', NULL, NULL, NULL, '2023-08-22 11:43:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (219, 'OB - PROSOLEFFTUB', '8998667100312', 'Protecal Solid Effervescent Tube', 6, 1, 0, 0, 'PT. Konimex', 29000, '1', NULL, NULL, NULL, '2023-08-23 16:35:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (220, 'OB - PUY16', '8993058000929', 'Puyer 16', 5, 1, 0, 0, 'PT. Bintang Toedjoe', 830, '1', NULL, NULL, NULL, '2023-08-22 12:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (221, 'OB - PUY19', '', 'Puyer 19 ', 5, 1, 0, 0, 'PT. Irawan Djaja Agung', 650, '1', NULL, NULL, NULL, '2023-08-22 12:08:37', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (222, NULL, NULL, 'Redoxon Blackcurrant Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (223, NULL, NULL, 'Redoxon Fortimun Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (224, NULL, NULL, 'Redoxon Orange Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (225, NULL, NULL, 'Redoxon Orange Effervescent Tablet 15', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (226, NULL, NULL, 'Redoxon Orange Effervescent Tablet 2', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (227, NULL, NULL, 'Renovit Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (228, NULL, NULL, 'Renovit Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (229, NULL, NULL, 'Renovit Gold Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (230, NULL, NULL, 'Renovit Gold Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (231, 'OB - SAKABCANTTAB30', '8993058500412', 'Sakatonik ABC Antariksa Tablet 30', 6, 1, 0, 0, 'PT. Kalbe Farma', 14750, '1', NULL, NULL, NULL, '2023-08-23 16:39:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (232, '', '', 'Sakatonik ABC Grape Tablet 30', 6, 0, 0, 0, 'PT. Kalbe Farma', 0, '1', NULL, NULL, NULL, '2023-08-23 16:39:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (233, 'OB - SAKABCORATAB30', '8993218320508', 'Sakatonik ABC Orange Tablet 30', 6, 1, 0, 0, 'PT. Kalbe Farma', 14708, '1', NULL, NULL, NULL, '2023-08-22 11:59:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (234, 'OB - SAKABCSTRTAB30', '8993218115012', 'Sakatonik ABC Strawberry Tablet 30', 6, 1, 0, 0, 'PT. Kalbe Farma', 14708, '1', NULL, NULL, NULL, '2023-08-22 12:01:23', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (235, NULL, NULL, 'Sakatonik Liver Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (236, 'OB - SANKAP', '8994573000807', 'Sangobion Kapsul', 2, 1, 0, 0, '', 16667, '1', NULL, NULL, NULL, '2023-08-22 15:06:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (237, NULL, NULL, 'Sanmol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (238, NULL, NULL, 'Saridon Extra Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (239, 'OB - SARTAB', '89991039', 'Saridon Tablet', 2, 1, 0, 0, 'PT. Bayer Indonesia', 3433, '1', NULL, NULL, NULL, '2023-08-23 16:43:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (240, NULL, NULL, 'SP Troches Melon 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (241, NULL, NULL, 'SP Troches Strawberry 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (242, 'OB - SROPASKAP', '8992003150245', 'Srong Pas Kapsul', 2, 1, 0, 0, 'PT. Deltomed Laboratories', 1875, '1', NULL, NULL, NULL, '2023-08-22 13:09:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (243, NULL, NULL, 'Stimuno Forte Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (244, 'OB - STRCOO6', '95506302', 'Strepsil Cool 6', 5, 1, 0, 0, 'PT. Reckitt Healthcare Manufacturing', 9583, '1', NULL, NULL, NULL, '2023-08-22 12:58:40', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (245, 'OB - STRCOOBOX24\'', '', 'Strepsil Cool Box 24\'s', 5, 1, 0, 0, 'PT. Reckitt Healthcare Manufacturing', 1020, '1', NULL, NULL, NULL, '2023-08-22 13:05:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (246, 'OB - STRLEM6', '95506319', 'Strepsil Lemon 6', 2, 1, 0, 0, 'PT. Reckitt Healthcare Manufacturing', 9583, '1', NULL, NULL, NULL, '2023-08-22 15:00:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (247, 'OB - STRORI6', '95506296', 'Strepsil Original 6', 5, 1, 0, 0, 'PT. Reckitt Healthcare Manufacturing', 9583, '1', NULL, NULL, NULL, '2023-08-22 13:02:18', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (248, NULL, NULL, 'Strepsil Original 8', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (249, NULL, NULL, 'Strepsil Vitamin C 8', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (250, NULL, NULL, 'Supertin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (251, NULL, NULL, 'Thermolyte Plus', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (252, 'OB - TOLANGPER', '8998898823905', 'Tolak Angin Permen', 5, 1, 0, 0, 'Sido Muncul', 1875, '1', NULL, NULL, NULL, '2023-08-22 10:08:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (253, NULL, NULL, 'Tolak Angin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (254, 'OB - ULTTAB', '8997014050058', 'Ultracap Tablet', 2, 1, 0, 0, 'PT. Henson Farma', 2642, '1', NULL, NULL, NULL, '2023-08-22 14:06:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (255, NULL, NULL, 'Vege Blend 21 Jr Sayur 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (256, NULL, NULL, 'Vege Blend 21 Jr Sayur 60', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (257, NULL, NULL, 'Vege Blend For Adult Sayur 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (258, NULL, NULL, 'Vicee Grape', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (259, NULL, NULL, 'Vicee Orange ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (260, NULL, NULL, 'Vicee Lemon ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (261, 'OB - VICSTR', '8999809700049', 'Vicee Strawberry', 2, 1, 0, 0, 'PT. Darya Varia', 1400, '1', NULL, NULL, NULL, '2023-08-22 14:21:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (262, 'OB - VIDSMATABORA30', '8999908034106', 'Vidorant Smart Tablet Orange 30', 6, 1, 0, 0, 'PT. Tempo Scan Pacific', 11467, '1', NULL, NULL, NULL, '2023-08-22 14:28:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (263, 'OB - VIDSMATABSTR30', '8999908258601', 'Vidorant Smart Tablet Strawberry 30', 6, 1, 0, 0, 'PT. Tempo Scan Pacific', 11467, '1', NULL, NULL, NULL, '2023-08-22 14:27:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (264, NULL, NULL, 'Viostin DS Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (265, NULL, NULL, 'Vipro G Tablet Effervescent', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (266, NULL, NULL, 'Vitamin A IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (267, NULL, NULL, 'Vitamin B 12 IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (268, 'OB - VITBCOMIPI', '8999908005106', 'Vitamin B Complex IPI', 0, 1, 0, 0, 'PT. Supra Ferbindo Farma', 5458, '1', NULL, NULL, NULL, '2023-08-22 14:35:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (269, NULL, NULL, 'Vitamin B1 IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (270, 'OB - VITCIPI', '8999908005205', 'Vitamin C IPI', 6, 1, 0, 0, 'PT. Supra Ferbindo Farma', 5458, '1', NULL, NULL, NULL, '2023-08-23 16:48:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (271, NULL, NULL, 'Vitamin C IPI 90', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (272, NULL, NULL, 'Vitacimin Blueberry ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (273, NULL, NULL, 'Vitacimin Fruit Punch ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (274, 'OB - VITLEM', '8991771200329', 'Vitacimin Lemon ', 2, 1, 0, 0, 'PT. Takeda Indonesia', 1600, '1', NULL, NULL, NULL, '2023-08-22 14:32:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (275, NULL, NULL, 'Vitacimin Nutriglow ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (276, NULL, NULL, 'Vitacimin Orange ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (277, NULL, NULL, 'Vitacimin White ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (278, NULL, NULL, 'Vitalong C Plus Zinc 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (279, NULL, NULL, 'Vitalong C Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (280, 'OB - VITCTAB4', '8992001033212', 'Vitalong C Tablet 4', 2, 1, 0, 0, 'PT. Bernofarm', 5360, '1', NULL, NULL, NULL, '2023-08-23 16:51:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (281, NULL, NULL, 'Vitalong C Plus Zinc 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (282, NULL, NULL, 'Vitamin C Tablet 50 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (283, NULL, NULL, 'Wellmove Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (284, NULL, NULL, 'Woods Lozenges Blackcurrant', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (285, NULL, NULL, 'Woods Lozenges Cherry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (286, NULL, NULL, 'Woods Lozenges Honey Lemon', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (287, NULL, NULL, 'Woods Lozenges Original', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (288, NULL, NULL, 'Woods Lozenges Sugar Free', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (289, 'OB - XON2', '8992858690200', 'Xonce 2', 2, 1, 0, 0, 'PT. Sejahtera Lestari Farma', 1500, '1', NULL, NULL, NULL, '2023-08-22 14:51:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (290, NULL, NULL, 'Xonce Tablet 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (291, NULL, NULL, 'Zegavit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (292, NULL, NULL, 'Acitral Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (293, NULL, NULL, 'Anacetine Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (294, 'OB - ANTJUN10ML', '8992003783665', 'Antangin Junior 10 ml', 4, 1, 4, 0, 'PT. Deltomed Laboratories', 2000, '1', NULL, NULL, NULL, '2023-08-22 08:41:59', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (295, 'OB - ANTJRGCAISAC15ML', '8992003782354', 'Antangin JRG Cair Sachet 15 ml', 4, 1, 4, 0, 'PT. Deltomed Laboratories', 2792, '1', NULL, NULL, NULL, '2023-08-22 08:41:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (296, 'OB - ANTANACAIORASAC10ML', '8993498210018', 'Antimo Anak Cair Orange Sachet 10 ml', 4, 1, 0, 0, 'PT. PHAPROS,Tbk', 1000, '1', NULL, NULL, NULL, '2023-08-22 15:48:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (297, 'OB - ANTANACAISTRSAC10ML', '8993498210285', 'Antimo Anak Cair Strawberry Sachet 10 ml', 4, 1, 1, 0, 'PT. PHAPROS,Tbk', 1000, '1', NULL, NULL, NULL, '2023-08-22 08:43:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (298, NULL, NULL, 'Apialys Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (299, NULL, NULL, 'Apialys Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (300, NULL, NULL, 'Atmacid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (301, NULL, NULL, 'Bejo Jahe Merah 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-08-22 08:44:39', 1, '2023-08-22 03:08:00', 1);
INSERT INTO `tx_produk` VALUES (302, NULL, NULL, 'Baby Cough Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (303, NULL, NULL, 'Batugin Elixir 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (304, NULL, NULL, 'Batugin Elixir 300 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (305, NULL, NULL, 'Benacol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (306, NULL, NULL, 'Benadryl Batuk Berdahak Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (307, NULL, NULL, 'Benadryl Original Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (308, NULL, NULL, 'Biolysin Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (309, 'OB - BIOSIR60ML', '8992001015119', 'Biolysin Sirup 60 ml', 6, 1, 0, 0, 'PT. Bernofarm', 11667, '1', NULL, NULL, NULL, '2023-08-21 07:34:37', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (310, NULL, NULL, 'Biolysin Smart Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (311, 'OB - BIOSMASIR60ML', '8992001095111', 'Biolysin Smart Sirup 60 ml', 6, 1, 0, 0, 'PT. Bernofarm', 12083, '1', NULL, NULL, NULL, '2023-08-21 07:43:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (312, NULL, NULL, 'Bisolvon Extra 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (313, NULL, NULL, 'Bisolvon Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (314, NULL, NULL, 'Bodrex Flu Batuk Berdahak PE Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (315, NULL, NULL, 'Bodrex Flu Batuk PE Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (316, 'OB - BODDEMORA60ML', '8999908304100', 'Bodrexin Demam Orange 60 ml', 6, 1, 0, 0, 'PT. Tempo Scan Pacific', 10625, '1', NULL, NULL, NULL, '2023-08-21 08:08:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (317, 'OB - BODFLUBATBERPESIR56ML', '8999908326805', 'Bodrexin Flu Batuk Berdahak PE Sirup 56 ml', 6, 1, 0, 0, 'PT. Tempo Scan Pacific', 10625, '1', NULL, NULL, NULL, '2023-08-21 08:06:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (318, NULL, NULL, 'Bodrexin Flu Batuk Tidak Berdahak PE Sirup 56 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (319, 'OB - BODPILALESIR56ML', '8999908304308', 'Bodrexin Pilek Alergi Sirup 56 ml', 6, 1, 0, 0, 'PT. Tempo Scan Pacific', 9750, '1', NULL, NULL, NULL, '2023-08-23 16:55:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (320, 'OB - BROSIR60ML', '8990999160019', 'Bronchitin Sirup 60 ml', 6, 1, 0, 0, 'PT. Nufarindo', 7250, '1', NULL, NULL, NULL, '2023-08-23 16:57:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (321, NULL, NULL, 'Bronkris Elixir 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (322, NULL, NULL, 'Caviplex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (323, 'OB - CERGOLORASIR100ML', '8992858518917', 'Cerebrofort Gold Orange Sirup 100 ml', 6, 1, 0, 0, 'PT. Kalbe Farma', 18000, '1', NULL, NULL, NULL, '2023-08-23 16:59:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (324, NULL, NULL, 'Cerebrofort Gold Orange Sirup 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (325, NULL, NULL, 'Cerebrofort Gold Strawberry Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (326, NULL, NULL, 'Cohistan Expectorant Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (327, NULL, NULL, 'Cohistan Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (328, NULL, NULL, 'Coldrexin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (329, NULL, NULL, 'Coparcetin Kids Cough Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (330, NULL, NULL, 'Coredryl Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (331, NULL, NULL, 'Crysantenum Seruni Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (332, NULL, NULL, 'Curcuma Plus Fruit Veggie Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (333, NULL, NULL, 'Curcuma Plus Gold Orange Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (334, NULL, NULL, 'Curcuma Plus Gold Strawberry Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (335, 'OB - CURPLUGROORASIR200ML', '8998777140062', 'Curcuma Plus Grow Orange Sirup 200 ml', 6, 1, 0, 0, 'PT. Soho Industri Pharmasi', 26500, '1', NULL, NULL, NULL, '2023-08-23 17:05:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (336, NULL, NULL, 'Curcuma Plus Grow Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (337, NULL, NULL, 'Curcuma Plus Imuns Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (338, NULL, NULL, 'Curcuma Plus Sharpy Blackcurrant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (339, 'OB - CURPLUSHAORASIR60ML', '8998777140581', 'Curcuma Plus Sharpy Orange Sirup 60 ml', 6, 1, 0, 0, 'PT. Soho Global Health', 14250, '1', NULL, NULL, NULL, '2023-08-23 17:36:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (340, 'OB - CURPLUSHASTRSIR60ML', '8998777140604', 'Curcuma Plus Sharpy Strawberry Sirup 60 ml', 6, 1, 0, 0, 'PT. Soho Global Health', 14250, '1', NULL, NULL, NULL, '2023-08-23 17:35:53', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (341, NULL, NULL, 'Curcuma Support Appetite 60 Sirup ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (342, NULL, NULL, 'Curvit CL Sirup  175 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (343, NULL, NULL, 'Curvit Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (344, NULL, NULL, 'Curvit Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (345, NULL, NULL, 'Decadryl Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (346, 'OB - DECSIR60ML', '8997011200050', 'Decadryl Sirup 60 ml', 6, 1, 0, 0, 'PT. Harsen', 44000, '1', NULL, NULL, NULL, '2023-08-21 09:12:44', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (347, NULL, NULL, 'De Cough Menthol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (348, NULL, NULL, 'De Cough Strawberry For Children Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (349, NULL, NULL, 'Dexanta Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (350, 'OB - DIAANACAISAC10ML', '8998777141625', 'Diapet Anak Cair Sachet 10 ml', 4, 1, 0, 0, 'PT. Saraka  Mandiri Semesta', 1700, '1', NULL, NULL, NULL, '2023-08-23 17:39:42', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (351, NULL, NULL, 'Diapet Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (352, NULL, NULL, 'Dulcolactol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (353, NULL, NULL, 'Dumin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (354, NULL, NULL, 'Durol Tonik Sirup 225 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (355, NULL, NULL, 'Elkana CL Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (356, NULL, NULL, 'Elkana Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (357, NULL, NULL, 'Eyevit Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (358, NULL, NULL, 'Enervonce Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (359, 'OB - ENTHERANACAISAC10ML', '8992858523201', 'Entrostop Herbal Anak Cair Sachet 10 ml', 4, 1, 0, 0, 'PT. Kalbe Farma', 2083, '1', NULL, NULL, NULL, '2023-08-22 08:52:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (360, 'OB - FASFORSIR60ML', '', 'Fasidol Forte Sirup 60 ml', 6, 1, 0, 0, '', 6564, '1', NULL, NULL, NULL, '2023-08-26 10:09:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (361, 'OB - FASSIR60ML', '', 'Fasidol Sirup 60 ml', 6, 1, 0, 0, '', 5495, '1', NULL, NULL, NULL, '2023-08-26 10:14:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (362, 'OB - FASDRO15ML', '', 'Fasidol Drops 15 ml', 6, 1, 0, 0, '', 10548, '1', NULL, NULL, NULL, '2023-08-26 10:08:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (363, NULL, NULL, 'Fitbes Force Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (364, NULL, NULL, 'Gastrucid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (365, NULL, NULL, 'Guanistrep Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (366, NULL, NULL, 'H Booster Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (367, NULL, NULL, 'Herbakof Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (368, 'OB - HERSIR60ML', '8994388103762', 'Herbakof Sirup 60 ml', 6, 1, 0, 0, 'PT. Dexa Medica', 12917, '1', NULL, NULL, NULL, '2023-08-21 11:41:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (369, NULL, NULL, 'Herbakof Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (370, 'OB - HUFTMPSIR60ML', '8994254001215', 'Hufagrip TMP Sirup 60 ml', 6, 1, 0, 0, 'PT. Gratia Husada Farma', 15000, '1', NULL, NULL, NULL, '2023-08-21 12:16:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (371, NULL, NULL, 'Igastrum Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (372, NULL, NULL, 'Igastrum New Formula Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (373, NULL, NULL, 'Igastrum Plus Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (374, NULL, NULL, 'Ikadryl Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (375, NULL, NULL, 'Ikadryl Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (376, NULL, NULL, 'Imboost Force Kids Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (377, NULL, NULL, 'Imboost Force Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (378, NULL, NULL, 'Imboost Kids Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (379, 'OB - IMBKIDSIR60ML', '8998777142417', 'Imboost Kids Sirup 60 ml', 6, 1, 0, 0, 'PT. Soho Industri Pharmasi', 36500, '1', NULL, NULL, NULL, '2023-08-21 12:55:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (380, NULL, NULL, 'Imunku Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (381, NULL, NULL, 'Imunos Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (382, NULL, NULL, 'Imunos Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (383, NULL, NULL, 'Inadryl Sirup 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (384, NULL, NULL, 'Inzana Cair Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (385, NULL, NULL, 'Itramol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (386, NULL, NULL, 'Komik Kids Madu Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (387, 'OB - KOMHER15ML', '8993058304416', 'Komix Herbal 15 ml', 7, 1, 0, 0, 'PT. Bintang Toedjoe', 2437, '1', NULL, NULL, NULL, '2023-08-21 14:00:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (388, 'OB - KOMHERLEM15ML', '8993058304515', 'Komix Herbal Lemon 15 ml', 5, 1, 0, 0, 'PT. Bintang Toedjoe', 2500, '1', NULL, NULL, NULL, '2023-08-23 17:42:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (389, NULL, NULL, 'Komix Herbal Cair Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (390, 'OB - KOMOBHPESAC7ML', '8993058301200', 'Komix OBH PE Sachet 7 ml', 4, 1, 0, 0, 'PT. Bintang Toedjoe', 1400, '1', NULL, NULL, NULL, '2023-08-22 09:08:44', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (391, 'OB - KOMSIR60ML', '', 'Kompolax  Sirup 60 ml', 6, 1, 0, 0, '', 8776, '1', NULL, NULL, NULL, '2023-08-26 10:26:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (392, NULL, NULL, 'Lactulax Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (393, NULL, NULL, 'Lactulax Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (394, NULL, NULL, 'Lagesil Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (395, NULL, NULL, 'Lagesil Sirup 170 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (396, 'OB - LASSIR110ML', '8993079183885', 'Laserin Sirup 110 ml', 6, 1, 0, 0, 'PT. MECOSIN INDONESIA', 20000, '1', NULL, NULL, NULL, '2023-08-23 17:44:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (397, 'OB - LASSIR30ML', '8993079831526', 'Laserin Sirup 30 ml', 6, 1, 0, 0, 'PT. MECOSIN INDONESIA', 5000, '1', NULL, NULL, NULL, '2023-08-22 07:40:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (398, 'OB - LASSIR60ML', '8993079831533', 'Laserin Sirup 60 ml', 6, 1, 0, 0, 'PT. MECOSIN INDONESIA', 10917, '1', NULL, NULL, NULL, '2023-08-22 07:50:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (399, NULL, NULL, 'Laserin Madu Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (400, 'OB - LASMADSIR30ML', '8993079831601', 'Laserin Madu Sirup 30 ml', 6, 1, 0, 0, 'PT. MECOSIN INDONESIA', 5750, '1', NULL, NULL, NULL, '2023-08-22 07:38:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (401, NULL, NULL, 'Laserin Madu Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (402, NULL, NULL, 'Laserin Plus Batuk Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (403, NULL, NULL, 'Laxadine Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (404, NULL, NULL, 'Laxadine Sirup 110 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (405, NULL, NULL, 'Laxadine Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (406, NULL, NULL, 'Magalat Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (407, NULL, NULL, 'Magtral Forte Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (408, NULL, NULL, 'Magtral Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (409, NULL, NULL, 'Mextril Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (410, 'OB - MINIKATUNHAIKAP500', '', 'Minyak Ikan Tung Hai Kapsul isi 10', 5, 1, 0, 0, 'PT. Intra Aries', 1000, '1', NULL, NULL, NULL, '2023-08-22 08:27:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (411, NULL, NULL, 'Mucohexin Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (412, 'OB - MYLSIR50ML', '8991111152059', 'Mylanta Sirup 50 ml', 6, 1, 0, 0, 'PT . Integrated Healthcare Indonesia', 13958, '1', NULL, NULL, NULL, '2023-08-22 09:15:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (413, 'OB - MYLSIR150ML', '8992725051226', 'Mylanta Sirup 150 ml', 6, 1, 0, 0, 'PT. Johnson', 37500, '1', NULL, NULL, NULL, '2023-08-23 17:07:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (414, NULL, NULL, 'Naprex Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (415, NULL, NULL, 'Naprex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (416, NULL, NULL, 'Neo Kaolana Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (417, NULL, NULL, 'Neo Kaominal Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (418, 'OB - OBHERSIR100ML', '8992003783429', 'OB Herbal Sirup 100 ml', 6, 1, 0, 0, 'PT. Deltomed ', 20500, '1', NULL, NULL, NULL, '2023-08-23 17:10:01', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (419, 'OB - OBHERSIR60ML', '8992003782453', 'OB Herbal Sirup 60 ml', 6, 1, 0, 0, 'PT. Deltomed ', 14083, '1', NULL, NULL, NULL, '2023-08-22 09:35:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (420, NULL, NULL, 'OB Herbal Junior Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (421, NULL, NULL, 'OB Herbal Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (422, NULL, NULL, 'Obat Batuk Ibu Dan Anak Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (423, NULL, NULL, 'Obat Batuk Ibu Dan Anak Sirup 300 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (424, NULL, NULL, 'OBH Combi Dahak Jahe Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (425, 'OB - OBHCOMDAHMENSIR100ML', '8993113011051', 'OBH Combi Dahak Menthol Sirup 100 ml', 6, 1, 0, 0, 'PT. Combiphar', 14167, '1', NULL, NULL, NULL, '2023-08-22 09:38:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (426, NULL, NULL, 'OBH IKA Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (427, NULL, NULL, 'OBH Itrasal Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (428, NULL, NULL, 'OBH Nellco Menthol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (429, NULL, NULL, 'OBH Nellco Menthol Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (430, NULL, NULL, 'OBH Nellco Menthol PE Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (431, NULL, NULL, 'OBH Tropica Berdahak Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (432, NULL, NULL, 'OBH Tropica Berdahak Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (433, NULL, NULL, 'OBP Itrasal Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (434, NULL, NULL, 'Oralit Sachet 4 1 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (435, NULL, NULL, 'Ottopan Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (436, NULL, NULL, 'Ottopan Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (437, NULL, NULL, 'Pacdin Cough Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (438, NULL, NULL, 'Pamol Oral Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (439, NULL, NULL, 'Pamol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (440, 'OB - PAN16YEASIR30ML', '8992695132031', 'Panadol 1 6 Years Sirup 30 ml', 6, 1, 0, 0, 'PT. Glaxo  Wellcome Indonesia', 26500, '1', NULL, NULL, NULL, '2023-08-23 17:18:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (441, NULL, NULL, 'Panadol 1 6 Years Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (442, NULL, NULL, 'Panadol 6 Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (443, NULL, NULL, 'Phenacold Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (444, NULL, NULL, 'Pharolite Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (445, NULL, NULL, 'Pilkita Cair Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (446, NULL, NULL, 'Plantacid Forte Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (447, NULL, NULL, 'Plantacid Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (448, NULL, NULL, 'Polycrol Forte Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (449, NULL, NULL, 'Polycrol Forte Sirup 180 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (450, NULL, NULL, 'Polycrol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (451, NULL, NULL, 'Polycrol Sirup 180 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (452, 'OB - POLSIR100ML', '8993347004904', 'Polysilane Sirup 100 ml', 6, 1, 0, 0, 'PT. Faratu', 21250, '1', NULL, NULL, NULL, '2023-08-22 10:51:53', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (453, NULL, NULL, 'Polysilane Sirup 180 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (454, NULL, NULL, 'Praxion Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (455, NULL, NULL, 'Praxion Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (456, NULL, NULL, 'Praxion Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (457, NULL, NULL, 'Promag Gazero Sirup10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (458, NULL, NULL, 'Promag Suspensi Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (459, NULL, NULL, 'Promag Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (460, NULL, NULL, 'Promedex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (461, NULL, NULL, 'Proris Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (462, 'OB - PROSIR60ML', '8993347003259', 'Proris Sirup 60 ml', 6, 1, 0, 0, 'PT. Faratu', 24167, '1', NULL, NULL, NULL, '2023-08-22 11:29:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (463, NULL, NULL, 'Prospan Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (464, NULL, NULL, 'Rexcof Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (465, NULL, NULL, 'Rexcof Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (466, 'OB - SAKACTSIR100ML', '8993218301002', 'Sakatonik Active Sirup 100 ml', 6, 1, 0, 0, 'PT. Saka Farma LAboratories', 11667, '1', NULL, NULL, NULL, '2023-08-22 15:52:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (467, 'OB - SAKACTSIR310ML', '8993218103309', 'Sakatonik Active Sirup 310 ml', 6, 1, 0, 0, 'PT. Nufarindo', 27500, '1', NULL, NULL, NULL, '2023-08-23 17:19:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (468, NULL, NULL, 'Sanadryl Expectorant Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (469, NULL, NULL, 'Sanadryl Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (470, NULL, NULL, 'Sangobion Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (471, NULL, NULL, 'Sangobion Kids Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (472, NULL, NULL, 'Sangobion Sirup 250 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (473, NULL, NULL, 'Sangobion Sirup 400 ml ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (474, NULL, NULL, 'Sanmag Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (475, NULL, NULL, 'Sanmol Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (476, NULL, NULL, 'Sanmol Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (477, 'OB - SANSIR60ML', '', 'Sanmol Sirup 60 ml', 6, 1, 0, 0, 'PT. Caprifarmindo', 17333, '1', NULL, NULL, NULL, '2023-08-22 12:34:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (478, NULL, NULL, 'Scotts Emulsion Orange Sirup 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (479, NULL, NULL, 'Scotts Emulsion Original Sirup 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (480, NULL, NULL, 'Scotts Emulsion Original Sirup 400 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (481, NULL, NULL, 'Scotts Emulsion Orange Sirup 400 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (482, NULL, NULL, 'Seven Seas Kids Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (483, NULL, NULL, 'Siladex Batuk Berdahak Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (484, 'OB - SILBATBERSIR30ML', '8998667300484', 'Siladex Batuk Berdahak Sirup 30 ml', 6, 1, 0, 0, 'PT. Konimex', 7667, '1', NULL, NULL, NULL, '2023-08-22 12:42:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (485, NULL, NULL, 'Siladex Batuk Berdahak Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (486, NULL, NULL, 'Silex Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (487, NULL, NULL, 'Sirplus Grape 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (488, NULL, NULL, 'Sirplus Orange 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (489, NULL, NULL, 'Sirplus Melon 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (490, NULL, NULL, 'Sirplus Strawberry 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (491, NULL, NULL, 'Stimuno Grape Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (492, 'OB - STIGRASIR60ML', '8994388113242', 'Stimuno Grape Sirup 60 ml', 6, 1, 0, 0, 'PT. Dexa Medica', 29000, '1', NULL, NULL, NULL, '2023-08-22 12:46:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (493, NULL, NULL, 'Stimuno Orange Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (494, NULL, NULL, 'Stimuno Orangeberry Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (495, NULL, NULL, 'Stimuno Orangeberry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (496, NULL, NULL, 'Stimuno Original Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (497, 'OB - STIORISIR60ML', '8994388130140', 'Stimuno Original Sirup 60 ml', 6, 1, 0, 0, 'PT. Dexa Medica', 29000, '1', NULL, NULL, NULL, '2023-08-22 12:53:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (498, NULL, NULL, 'Tahesta Cuka Apel 300 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (499, NULL, NULL, 'Tay Pin San Cair Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (500, NULL, NULL, 'Tay pin San Serbuk Sachet 2 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (501, NULL, NULL, 'Tempra Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (502, NULL, NULL, 'Tempra Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (503, NULL, NULL, 'Tempra Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (504, NULL, NULL, 'Tempra Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (505, 'OB - TERSIR30ML', '8998667300231', 'Termorex Sirup 30 ml', 6, 1, 0, 0, 'PT. Konimex', 8208, '1', NULL, NULL, NULL, '2023-08-22 13:39:15', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (506, NULL, NULL, 'Termorex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (507, NULL, NULL, 'TJ Joybee Emulsion Orange 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (508, 'OB - TOLANGANA10ML', '8998898151404', 'Tolak Angin Anak 10 ml', 4, 1, 0, 0, 'Sido Muncul', 2400, '1', NULL, NULL, NULL, '2023-08-22 13:48:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (509, 'OB - TOLANGCAI15ML', '8998898101409', 'Tolak Angin Cair 15 ml', 4, 1, 0, 0, 'Sido Muncul', 3300, '1', NULL, NULL, NULL, '2023-08-22 13:50:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (510, 'OB - TOLANGFLU15ML', '8998898280401', 'Tolak Angin Flu 15 ml', 4, 1, 0, 0, 'Sido Muncul', 3300, '1', NULL, NULL, NULL, '2023-08-22 13:52:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (511, 'OB - TOLANGBEBGUL15ML', '8998898336405', 'Tolak Angin Bebas Gula 15 ml', 4, 1, 0, 0, 'Sido Muncul', 3400, '1', NULL, NULL, NULL, '2023-08-22 13:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (512, 'OB - TOLLINJAH15ML', '8998898335408', 'Tolak Linu Jahe 15 ml', 4, 1, 0, 0, 'Sido Muncul', 2600, '1', NULL, NULL, NULL, '2023-08-22 13:58:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (513, 'OB - TOLLINMIN15ML', '8998898338409', 'Tolak Linu Mint 15 ml', 4, 1, 0, 0, 'Sido Muncul', 2600, '1', NULL, NULL, NULL, '2023-08-22 13:54:46', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (514, 'OB - TONBAYSIR100ML', '8994591007123', 'Tonikum Bayer Sirup 100 ml', 6, 1, 0, 0, 'PT. Genero Pharmaceuticals', 12750, '1', NULL, NULL, NULL, '2023-08-22 14:03:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (515, 'OB - TONBAYSIR330ML', '8994591007116', 'Tonikum Bayer Sirup 330 ml', 6, 1, 0, 0, 'PT. Genero Pharmaceuticals', 29917, '1', NULL, NULL, NULL, '2023-08-22 14:05:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (516, NULL, NULL, 'Trianta Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (517, NULL, NULL, 'Triocid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (518, NULL, NULL, 'Ultilox Forte Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (519, NULL, NULL, 'Ultilox Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (520, NULL, NULL, 'Upixon Sirup 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (521, 'OB - VEGHERSAC5GRA', '8992772401012', 'Vegeta Herbal Sachet 5 Gram', 4, 1, 0, 0, 'PT. Sari Enesis Indah', 2500, '1', NULL, NULL, NULL, '2023-08-22 14:15:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (522, NULL, NULL, 'Vegeta Orange Sachet 7 1 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (523, NULL, NULL, 'Vidoran Smart Orange Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (524, NULL, NULL, 'Vitabumin Sirup 130 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (525, 'OB - VITC100SIDMUNLEMSAC', '8998898842111', 'Vitamin C 1000 Sido Muncul Lemon Sachet', 4, 1, 0, 0, 'Sido Muncul', 1300, '1', NULL, NULL, NULL, '2023-08-22 14:48:45', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (526, 'OB - VITC100SIDMUNORASAC', '8998898842203', 'Vitamin C 1000 Sido Muncul Orange Sachet', 4, 1, 0, 0, 'Sido Muncul', 1300, '1', NULL, NULL, NULL, '2023-08-22 14:47:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (527, 'OB - WAINEWFORSAC', '8993058200107', 'Waisan New Formula Sachet', 4, 1, 0, 0, 'PT. Bintang Toedjoe', 600, '1', NULL, NULL, NULL, '2023-08-22 14:37:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (528, NULL, NULL, 'Woods Expectorant Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (529, 'OB - WOOEXPSIR60ML', '8992858589115', 'Woods Expectorant Sirup 60 ml', 6, 1, 0, 0, 'PT. Kalbe Farma', 18333, '1', NULL, NULL, NULL, '2023-08-22 14:42:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (530, NULL, NULL, 'Woods Herbal Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (531, NULL, NULL, 'Zamel Drops 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (532, NULL, NULL, 'Zamel Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (533, NULL, NULL, 'Zenirex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (534, NULL, NULL, 'Zevit Grow Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (535, NULL, NULL, 'Zinkid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (536, NULL, NULL, 'Ziplong Cair Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (537, NULL, NULL, 'Autan Active Protect Sachet 6 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (538, NULL, NULL, 'Autan Active Protect Tube 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (539, NULL, NULL, 'Autan Care Protect Sachet 6 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (540, NULL, NULL, 'Autan Care Protect Tube 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (541, NULL, NULL, 'Autan Floral Protect Sachet 6 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (542, NULL, NULL, 'Autan Floral Protect Tube 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (543, NULL, NULL, 'Autan Soft Scented Tube 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (544, NULL, NULL, 'Autan Tube Soft Scented Sachet 6 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (545, 'OB - BALHIJ20GRA', '8993060100204', 'Balpirik Hijau 20 Gram', 5, 1, 3, 0, 'PT. Arto', 10083, '1', NULL, NULL, NULL, '2023-08-10 14:06:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (546, NULL, NULL, 'Balpirik Kuning 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (547, NULL, NULL, 'Balpirik Lavender 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (548, 'OB - BALMER20GRA', '8993060100211', 'Balpirik Merah 20 Gram', 5, 1, 3, 0, 'PT. Arto', 10083, '1', NULL, NULL, NULL, '2023-08-10 14:04:54', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (549, 'OB - BALGEL10GRA', '8993176812039', 'Balsem Geliga 10 Gram', 5, 1, 3, 0, 'PT. Eagle', 4417, '1', NULL, NULL, NULL, '2023-08-10 14:13:01', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (550, 'OB - BALGEL20GRA', '8993176812022', 'Balsem Geliga 20 Gram', 5, 1, 3, 0, 'PT. Eagle', 7750, '1', NULL, NULL, NULL, '2023-08-10 14:13:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (551, NULL, NULL, 'Balsem Geliga 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (552, NULL, NULL, 'Balsem Kaki Tiga 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (553, NULL, NULL, 'Balsem Lang 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (554, 'OB - BALLAN20GRA', '8993176120028', 'Balsem Lang 20 Gram', 5, 1, 3, 0, 'PT. Eagle', 7750, '1', NULL, NULL, NULL, '2023-08-10 14:00:32', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (555, NULL, NULL, 'Balsem Lang 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (556, 'OB - BALLIOHEA13GRA', '8997011900080', 'Balsem Lion Head 13 Gram', 5, 1, 3, 0, 'PT. Selpasindo', 11500, '1', NULL, NULL, NULL, '2023-08-10 13:57:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (557, NULL, NULL, 'Balsem Lion Head 31 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (558, NULL, NULL, 'Balsem Telon TJ 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (559, NULL, NULL, 'Balsem Telon TJ 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (560, NULL, NULL, 'Balsem Tiger Red Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (561, NULL, NULL, 'Balsem Tiger White Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (562, 'OB - BALTJITJA20GRA', '8995154600027', 'Balsem Tjin Tjau 20 Gram', 5, 1, 3, 0, '-', 11875, '1', NULL, NULL, NULL, '2023-08-10 14:03:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (563, NULL, NULL, 'Balsem Tjin Tjau 36 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (564, NULL, NULL, 'Betadine Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (565, NULL, NULL, 'Betadine Ointment 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (566, 'OB - BET5ML', '8992843103050', 'Betadine 5 ml', 6, 1, 0, 0, 'PT. Mahakam', 5458, '1', NULL, NULL, NULL, '2023-08-19 13:30:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (567, NULL, NULL, 'Biocream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (568, NULL, NULL, 'Canesten 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (569, 'OB - CAN5GRA', '8994591007109', 'Canesten 5 Gram', 7, 1, 0, 0, 'PT. Genero Pharmaceuticals', 23000, '1', NULL, NULL, NULL, '2023-08-21 08:28:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (570, NULL, NULL, 'Copal Balsem 36 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (571, NULL, NULL, 'Copal Tube 25 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (572, NULL, NULL, 'Counterpain 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (573, 'OB - COU15GRA', '8995201800011', 'Counterpain 15 Gram', 5, 1, 3, 0, 'PT. Taisho', 25250, '1', NULL, NULL, NULL, '2023-08-10 15:19:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (574, NULL, NULL, 'Counterpain 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (575, 'OB - COU5GRA', '8995201800196', 'Counterpain 5 Gram', 5, 1, 3, 0, 'PT. Taisho', 8667, '1', NULL, NULL, NULL, '2023-08-10 15:17:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (576, NULL, NULL, 'Counterpain 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (577, NULL, NULL, 'Counterpain Cool 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (578, NULL, NULL, 'Counterpain Cool 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (579, 'OB - COUCOO5GRA', '8995201801124', 'Counterpain Cool 5 Gram', 5, 1, 3, 0, 'PT. Taisho', 8667, '1', NULL, NULL, NULL, '2023-08-10 15:20:53', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (580, NULL, NULL, 'Counterpain Cool 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (581, NULL, NULL, 'Cussons Baby Cream 50 Gram Fresh Nourish', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (582, NULL, NULL, 'Cussons Baby Cream 50 Gram Mild Gentle', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (583, NULL, NULL, 'Cussons Baby Cream 50 Gram Soft Smooth', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (584, NULL, NULL, 'Daktarin Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (585, 'OB - DAKCRE5GRA', '8991111151144', 'Daktarin Cream 5 Gram', 7, 1, 0, 0, 'PT. Taisho', 24583, '1', NULL, NULL, NULL, '2023-08-21 09:04:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (586, NULL, NULL, 'Daktarin Diaper Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (587, NULL, NULL, 'Fungiderm 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (588, 'OB - FUN5GRA', '8998667500020', 'Fungiderm 5 Gram', 7, 1, 0, 0, 'PT. Konimex', 12417, '1', NULL, NULL, NULL, '2023-08-21 10:59:51', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (589, 'OB - GELMIN30ML', '8993176120080', 'Geliga Minyak 30 ml', 6, 1, 3, 0, 'PT. Cap Lang', 13500, '1', NULL, NULL, NULL, '2023-08-10 14:37:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (590, 'OB - GELKRIOTO30GRA', '8993176812312', 'Geliga Krim Otot 30 Gram', 5, 1, 3, 0, 'PT. Eagle', 9333, '1', NULL, NULL, NULL, '2023-08-10 14:16:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (591, NULL, NULL, 'Geliga Krim Otot 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (592, NULL, NULL, 'Hot In Balsem Otot 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (593, NULL, NULL, 'Hot In Cream Aromatherapy Botol 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (594, 'OB - HOTINCREAROBOT60GRA', '8997021870557', 'Hot In Cream Aromatherapy Botol 60 Gram', 6, 1, 3, 0, 'PT. Ultra Sakti', 12300, '1', NULL, NULL, NULL, '2023-08-10 13:50:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (595, NULL, NULL, 'Hot In Cream Aromatherapy Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (596, 'OB - HOTINCREAROTUB60GRA', '8997021870595', 'Hot In Cream Aromatherapy Tube 60 Gram', 7, 1, 3, 0, 'PT. Ultra Sakti', 15500, '1', NULL, NULL, NULL, '2023-08-10 13:47:17', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (597, NULL, NULL, 'Hot In Cream Original Botol 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (598, 'OB - HOTINCREORIBOT60GRA', '8997021870540', 'Hot In Cream Original Botol 60 Gram', 6, 1, 3, 0, 'PT. Ultra Sakti', 12300, '1', NULL, NULL, NULL, '2023-08-10 13:48:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (599, NULL, NULL, 'Hot In Cream Original Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (600, 'OB - HOTINCREORITUB60GRA', '8997021870571', 'Hot In Cream Original Tube 60 Gram', 7, 1, 3, 0, 'PT. Ultra Sakti', 15500, '1', NULL, NULL, NULL, '2023-08-10 13:43:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (601, 'OB - HOTINCRESTRBOT60GRA', '8997021872230', 'Hot In Cream Strong Botol 60 Gram', 6, 1, 3, 0, 'PT. Ultra Sakti', 12300, '1', NULL, NULL, NULL, '2023-08-10 13:52:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (602, 'OB - HOTINCRESTRTUB120GRA', '8997021870908', 'Hot In Cream Strong Tube 120 Gram', 7, 1, 3, 0, 'PT. Ultra Sakti', 15500, '1', NULL, NULL, NULL, '2023-08-21 11:50:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (603, 'OB - HOTINCRESTRTUB60GRA', '8997021870908', 'Hot In Cream Strong Tube 60 Gram', 7, 1, 3, 0, 'PT. Ultra Sakti', 15500, '1', NULL, NULL, NULL, '2023-08-10 13:45:42', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (604, NULL, NULL, 'Hot In DCL Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (605, NULL, NULL, 'Hot In DCL Tube 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (606, NULL, NULL, 'Hot In DCL Tube 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (607, 'OB - ICHSAL15GRA', '8997009230199', 'Ichtyol Salep 15 Gram', 7, 1, 0, 0, 'PT. Ciubros Farma', 6042, '1', NULL, NULL, NULL, '2023-08-21 12:23:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (608, NULL, NULL, 'Kalpanax Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (609, 'OB - KALCRE5GRA', '8992858245516', 'Kalpanax Cream 5 Gram', 7, 1, 0, 0, 'PT. Kalbe Farma', 12883, '1', NULL, NULL, NULL, '2023-08-21 13:23:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (610, 'OB - KALSAL5GRA', '8992858245912', 'Kalpanax Salep 5 Gram', 7, 1, 0, 0, 'PT. Kalbe Farma', 6792, '1', NULL, NULL, NULL, '2023-08-21 13:28:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (611, NULL, NULL, 'Kanna Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (612, NULL, NULL, 'Kanna Cream 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (613, NULL, NULL, 'Krim Anti Jamur 88 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (614, NULL, NULL, 'Lafalos Ceam 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (615, NULL, NULL, 'Lafalos Plus Cream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (616, NULL, NULL, 'Lespain Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (617, NULL, NULL, 'Momilen Baby Care Diaper Rash Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (618, NULL, NULL, 'Momilen Baby Care Diaper Rash Cream 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (619, NULL, NULL, 'Momilen Maternity Care Nurshing Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (620, NULL, NULL, 'Momilen Maternity Care Nurshing Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (621, 'OB - NELRHEBAL15GRA', '8996838811500', 'Nellco Rheumason Balsem 15 Gram', 5, 1, 3, 0, 'PT. Nelco', 7250, '1', NULL, NULL, NULL, '2023-08-10 14:10:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (622, NULL, NULL, 'Nosib Salep 14 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (623, NULL, NULL, 'Nourish Beauty Care Acne Gel 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (624, 'OB - PAGSALEXT10GRA', '8993099996472', 'Pagoda Salep Extra 10 Gram', 5, 1, 0, 0, 'PT. Perseroan Dagang dan Industri Farmasi Afiat', 6000, '1', NULL, NULL, NULL, '2023-08-22 12:22:42', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (625, NULL, NULL, 'Painkila 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (626, 'OB - SAL24', '8997009230205', 'Salep 2 4', 7, 1, 0, 0, 'PT. Ciubros Farma', 4167, '1', NULL, NULL, NULL, '2023-08-22 12:18:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (627, NULL, NULL, 'Salep Kembang Bulan 7 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (628, NULL, NULL, 'Salep Kulit 88', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (629, NULL, NULL, 'Salep Levertran 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (630, NULL, NULL, 'Salonpas Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (631, NULL, NULL, 'Salonpas Cream 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (632, NULL, NULL, 'Salonpas Cream Hot 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (633, NULL, NULL, 'Salonpas Cream Hot 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (634, 'OB - SALGEL15GRA', '8992870110144', 'Salonpas Gel 15 Gram', 7, 1, 0, 0, 'PT. Hisamitsu Pharma Indonesia', 12000, '1', NULL, NULL, NULL, '2023-08-23 17:25:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (635, NULL, NULL, 'Salonpas Gel 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (636, NULL, NULL, 'Salonpas Linement 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (637, NULL, NULL, 'Skintex Ointment 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (638, NULL, NULL, 'Soffel Bengkoang Botol 80 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (639, NULL, NULL, 'Soffel Bunga Beranium Sachet 6 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (640, NULL, NULL, 'Soffel Kulit Jeruk Botol 80 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (641, NULL, NULL, 'Sriti 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (642, NULL, NULL, 'Stop X Cream 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (643, NULL, NULL, 'Thrombophob Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (644, NULL, NULL, 'Thrombophob Gel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (645, NULL, NULL, 'Thrombophob Ointment 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (646, 'OB - TRABAB10GRA', '8997018510046', 'Transpulmin Baby 10 Gram', 7, 1, 0, 0, 'PT. Menarini Indria Laboratories', 46250, '1', NULL, NULL, NULL, '2023-08-23 17:27:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (647, NULL, NULL, 'Transpulmin Kids 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (648, NULL, NULL, 'Ultraderma Gel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (649, 'OB - ULTCRE5GRA', '8997014050096', 'Ultrasiline Cream 5 Gram', 7, 1, 0, 0, 'PT. Henson Farma', 8250, '1', NULL, NULL, NULL, '2023-08-23 17:29:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (650, NULL, NULL, 'Vaseline Jelly 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (651, NULL, NULL, 'Vaseline Jelly Aloe 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (652, NULL, NULL, 'Vaseline Jelly Baby 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (653, NULL, NULL, 'Veril Acne Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-08-22 14:18:37', 1, '2023-08-22 09:08:00', 1);
INSERT INTO `tx_produk` VALUES (654, 'OB - VICVAP10GRA', '4987176600554', 'Vicks Vaporub 10 Gram', 5, 1, 3, 0, 'Vicks', 7083, '1', NULL, NULL, NULL, '2023-08-10 15:24:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (655, 'OB - VICVAP25GRA', '4987176008718', 'Vicks Vaporub 25 Gram', 5, 1, 0, 0, 'PT. Darya Varia', 18000, '1', NULL, NULL, NULL, '2023-08-23 17:32:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (656, 'OB - VICVAP50GRA', '4987176000552', 'Vicks Vaporub 50 Gram', 5, 1, 0, 0, 'PT. Darya Varia', 31500, '1', NULL, NULL, NULL, '2023-08-23 17:33:45', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (657, NULL, NULL, 'Virugon 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (658, NULL, NULL, 'Voltadex Gel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (659, NULL, NULL, 'Voltaren Balsem 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (660, NULL, NULL, 'Voltaren Emulgel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (661, NULL, NULL, 'Voltaren Emulgel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (662, NULL, NULL, 'Voltaren Emulgel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (663, 'OB - MADRASJERNIPSAC20GRA', '8993014730112', 'Madu Rasa Jeruk Nipis Sachet 20 Gram', 4, 1, 0, 0, 'PT. Madurasa Unggulan Nusantara', 800, '1', NULL, NULL, NULL, '2023-08-22 09:03:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (664, 'OB - MADRASORISAC20GRA', '8993014731317', 'Madu Rasa Original Sachet 20 Gram', 4, 1, 0, 0, 'PT. Madurasa Unggulan Nusantara', 800, '1', NULL, NULL, NULL, '2023-08-22 09:03:45', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (665, NULL, NULL, 'Madu TJ Extra 150 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (666, NULL, NULL, 'Madu TJ Extra 250 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (667, 'OB - MADTJJOYORA100ML', '8993365150010', 'Madu TJ Joybee Orange 100 ml', 6, 1, 0, 0, 'PT. Ultra Sakti', 11000, '1', NULL, NULL, NULL, '2023-08-22 08:06:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (668, 'OB - MADTJJOYORI100ML', '8993365150034', 'Madu TJ Joybee Original 100 ml', 6, 1, 0, 0, 'PT. Ultra Sakti', 11000, '1', NULL, NULL, NULL, '2023-08-22 08:05:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (669, 'OB - MADTJJOYSTR100ML', '8993365150058', 'Madu TJ Joybee Strawberry 100 ml', 6, 1, 0, 0, 'PT. Ultra Sakti', 11000, '1', NULL, NULL, NULL, '2023-08-22 08:07:44', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (670, 'OB - MADTJKUR150GRA', '8993365140356', 'Madu TJ Kurma 150 Gram', 6, 1, 0, 0, 'PT. Ultra Sakti', 15667, '1', NULL, NULL, NULL, '2023-08-22 08:03:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (671, NULL, NULL, 'Madu TJ Kurma 250 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (672, 'OB - MADTJMUR150GRA', '8993365131538', 'Madu Tj Murni 150 Gram', 6, 1, 0, 0, 'PT. Ultra Sakti', 15667, '1', NULL, NULL, NULL, '2023-08-22 08:01:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (673, NULL, NULL, 'Madu Tj Murni 250 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (674, NULL, NULL, 'Madu Tj Panas Dalam 150 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (675, 'OB - MADTJORASAC20GRA', '8993365120020', 'Madu TJ Orange Sachet 20 Gram', 4, 1, 0, 0, 'PT. Ultra Sakti', 700, '1', NULL, NULL, NULL, '2023-08-22 09:03:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (676, 'OB - MADTJSTRSAC20GRA', '8993365130029', 'Madu TJ Strawberry Sachet 20 Gram', 4, 1, 0, 0, 'PT. Ultra Sakti', 700, '1', NULL, NULL, NULL, '2023-08-22 09:02:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (677, NULL, NULL, 'Madu Tj Kurma 500 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (678, NULL, NULL, 'Acarbose Tablet 100 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (679, NULL, NULL, 'Acarbose Tablet 50 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (680, NULL, NULL, 'Acetylcistein Tablet 200 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (681, NULL, NULL, 'Acyclovir Tablet 200 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (682, NULL, NULL, 'Allopurinol Tablet 100 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (683, 'OB - ALLTAB300MGHJ', '', 'Allopurinol Tablet 300 mg HJ', 1, 0, 0, 0, 'HJ', 435, '1', NULL, NULL, NULL, '2023-08-25 19:35:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (684, 'OB - AMBTAB30MGYAR', '', 'Ambroxol tablet 30 mg YARINDO', 2, 1, 0, 0, 'NVA', 1040, '1', NULL, NULL, NULL, '2023-08-25 19:58:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (685, NULL, NULL, 'Amlodipine Tablet 10 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (686, NULL, NULL, 'Amlodipine Tablet 5 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (687, '', '', 'Amoxicillin Tablet 500 mg ERRITA', 1, 0, 0, 0, '', 0, '1', NULL, NULL, NULL, '2023-08-25 21:04:59', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (688, NULL, NULL, 'Ampicillin Tablet 500 mg MERSI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (689, 'OB - ANTDOETABERE', '', 'Antasida Doen Tablet ERELA', 1, 1, 0, 0, 'ELA', 124, '1', NULL, NULL, NULL, '2023-08-25 20:09:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (690, NULL, NULL, 'Asam Mefenamat Tablet 500 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (691, NULL, NULL, 'Asam Traneksamat Tablet 500 mg BERNOFARM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (692, NULL, NULL, 'Atorvastatin Tablet 10 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (693, NULL, NULL, 'Atorvastatin Tablet 20 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (694, NULL, NULL, 'Azithromycin Tablet 500 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (695, NULL, NULL, 'Betahistine Tablet 6 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (696, 'OB - BISTAB5MGDEX', '', 'Bisoprolol Tablet 5 mg DEXA', 1, 1, 0, 0, 'DEXA', 300, '1', NULL, NULL, NULL, '2023-08-25 20:27:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (697, NULL, NULL, 'Candesartan Tablet 16 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (698, NULL, NULL, 'Candesartan Tablet 8 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (699, NULL, NULL, 'Captopril Tablet 12 5 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (700, NULL, NULL, 'Captopril Tablet 25 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (701, NULL, NULL, 'Captopril Tablet 50 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (702, 'OB - CEFTAB500MGHJ', '', 'Cefadroxil Tablet 500 mg HJ', 1, 1, 0, 0, 'HEX', 734, '1', NULL, NULL, NULL, '2023-08-25 20:30:40', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (703, NULL, NULL, 'Cefixime Tablet 100 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (704, NULL, NULL, 'Cefixime Tablet 200 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (705, 'OB - CETTAB10MGHJ', '', 'Cetirizin Tablet 10 mg HJ', 1, 1, 0, 0, 'HEX', 171, '1', NULL, NULL, NULL, '2023-08-25 20:34:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (706, NULL, NULL, 'Chloramphenicol Tablet 250 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (707, NULL, NULL, 'Cimetidine Tablet 200 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (708, 'OB - CIPTAB500MGHJ', '', 'Ciprofloxacin Tablet 500 mg HJ', 1, 1, 0, 0, 'HEX', 449, '1', NULL, NULL, NULL, '2023-08-25 20:36:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (709, NULL, NULL, 'Citicoline Tablet 500 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (710, NULL, NULL, 'Clindamycin Tablet 150 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (711, NULL, NULL, 'Clindamycin Tablet 300 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (712, NULL, NULL, 'Clonidin Tablet 0 15 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (713, NULL, NULL, 'Clopidogrel Tablet 75 mg INTERBAT', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (714, NULL, NULL, 'Co Amoxiclav Tablet 625 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (715, NULL, NULL, 'Cotrimoxazole Tablet 960 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (716, NULL, NULL, 'Digoxin Tablet 0 25 mg YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (717, NULL, NULL, 'Diltiazem Tablet 30 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (718, NULL, NULL, 'Domperidone Tablet 10 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (719, NULL, NULL, 'Doxicycline Tablet 100 mg YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (720, NULL, NULL, 'Epherison HCl Tablet 50 mg MEDIKON', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (721, NULL, NULL, 'Erphafillin Tablet 200 mg Botol ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (722, NULL, NULL, 'Erythromycin Tablet 500 mg YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (723, NULL, NULL, 'Esomeprazole Tablet 40 mg Novel', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (724, NULL, NULL, 'Etoricoxib Tablet 60 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (725, NULL, NULL, 'Fenofibrate Tablet 100 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (726, NULL, NULL, 'Fenofibrate Tablet 200 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (727, NULL, NULL, 'Fenofibrate Tablet 300 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (728, NULL, NULL, 'Flunarizine Tablet 10 mg NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (729, NULL, NULL, 'Flunarizine Tablet 5 mg NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (730, NULL, NULL, 'Furosemid Tablet 40 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (731, NULL, NULL, 'Gabapentin Tablet 300 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (732, NULL, NULL, 'Gemfibrozil Tablet 300 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (733, 'OB - GLITAB5MGFM', '', 'Glibenclamide Tablet 5 mg FM', 1, 1, 0, 0, 'FM', 129, '1', NULL, NULL, NULL, '2023-08-26 07:41:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (734, NULL, NULL, 'Glibenclamide Tablet 5 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (735, NULL, NULL, 'Glimepiride Tablet 1 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (736, 'OB - GLITAB1MGHJ', '', 'Glimepiride Tablet 1 mg HJ', 1, 1, 0, 0, 'HEXA', 228, '1', NULL, NULL, NULL, '2023-08-26 07:44:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (737, NULL, NULL, 'Glimepiride Tablet 2 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (738, NULL, NULL, 'Glimepiride Tablet 3 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (739, NULL, NULL, 'Glimepiride Tablet 3 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (740, NULL, NULL, 'Glimepiride Tablet 4 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (741, NULL, NULL, 'Gliquidon Tablet 30 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (742, NULL, NULL, 'Glyceryl Guaiacolate Tablet 100 mg NOVA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (743, NULL, NULL, 'Griseofulvin Tablet 125 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (744, NULL, NULL, 'Griseofulvin Tablet 125 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (745, NULL, NULL, 'Griseofulvin Tablet 500 mg DARYA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (746, NULL, NULL, 'Guaifenesin Tablet 100 mg ERLIMPEX', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (747, 'OB - IBUTAB400MGNOV', '', 'Ibuprofen Tablet 400 mg NOVAPHARIN', 1, 1, 0, 0, 'NOVAPHARIN', 252, '1', NULL, NULL, NULL, '2023-08-26 08:25:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (748, NULL, NULL, 'Irbesartan Tablet 150 mg OTTO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (749, NULL, NULL, 'Irbesartan Tablet 300 mg OTTO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (750, NULL, NULL, 'Isosorbid Dinitrat Tablet 5 mg YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (751, NULL, NULL, 'Ivermectin Tablet 12 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (752, NULL, NULL, 'Kalium Diclofenac Tablet 25 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (753, NULL, NULL, 'Kalium Diclofenac Tablet 50 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (754, 'OB - KETTAB200MGHJ', '', 'Ketoconazol Tablet 200 mg HJ', 1, 1, 0, 0, 'Hexa', 394, '1', NULL, NULL, NULL, '2023-08-26 08:30:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (755, NULL, NULL, 'Ketoprofen Tablet 100 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (756, NULL, NULL, 'Ketoprofen Tablet 50 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (757, NULL, NULL, 'Ketorolac Tablet 10 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (758, NULL, NULL, 'Lactas Calcicus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (759, NULL, NULL, 'Lansoprazole Kapsul 30 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (760, NULL, NULL, 'Levofloxacin Tablet 500 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (761, NULL, NULL, 'Lisinopril Tablet 10 mg INF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (762, NULL, NULL, 'Lisinopril Tablet 5 mg OTTO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (763, NULL, NULL, 'Loratadine Tablet 10 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (764, NULL, NULL, 'Mecobalamin Tablet 250 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (765, NULL, NULL, 'Mecobalamin Tablet 500 mg ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (766, NULL, NULL, 'Meloxicam Tablet 15 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (767, 'OB - MELTAB75MGHJ', '', 'Meloxicam Tablet 7 5 mg HJ', 1, 1, 0, 0, 'Hexa', 296, '1', NULL, NULL, NULL, '2023-08-26 08:41:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (768, 'OB - METTAB500MGHJ', '', 'Metformin Tablet 500 mg HJ', 1, 1, 0, 0, 'HEX', 193, '1', NULL, NULL, NULL, '2023-08-25 20:51:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (769, NULL, NULL, 'Metformin Tablet 850 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (770, NULL, NULL, 'Methisoprinol Tablet 500 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (771, NULL, NULL, 'Methyl Prednisolone Tablet 8 mg MAHAKAM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (772, NULL, NULL, 'Methyl Prednisolone Tablet 4 mg TRIMAN', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (773, NULL, NULL, 'Methyl Prednisolone Tablet 16 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (774, NULL, NULL, 'Metoclopramide Tablet 10 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (775, NULL, NULL, 'Metronidazole Tablet 250 mg ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (776, NULL, NULL, 'Metronidazole Tablet 500 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (777, NULL, NULL, 'Natrium Diclofenac Tablet 25 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (778, NULL, NULL, 'Natrium Diclofenac Tablet 50 mg FM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (779, NULL, NULL, 'Natrium Diclofenac Tablet 50 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (780, NULL, NULL, 'Nifedipine Tablet 10 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (781, NULL, NULL, 'Ofloxacin Tablet 200 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (782, NULL, NULL, 'Ofloxacin Tablet 400 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (783, NULL, NULL, 'Omeprazole Kapsul 20 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (784, NULL, NULL, 'Ondancentron Tablet 4 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (785, NULL, NULL, 'Ondancentron Tablet 8 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (786, NULL, NULL, 'Paracetamol Tablet 500 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (787, NULL, NULL, 'Piracetam Tablet 1200 mg NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (788, NULL, NULL, 'Piracetam Tablet 400 mg BERNOFARM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (789, NULL, NULL, 'Piracetam Tablet 800 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (790, NULL, NULL, 'Piroxicam Kapsul 10 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (791, NULL, NULL, 'Piroxicam Kapsul 20 mg FM ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (792, NULL, NULL, 'Prednison Tablet 5 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (793, NULL, NULL, 'Propanolol Tablet 10 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (794, NULL, NULL, 'Propanolol Tablet 40 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (795, NULL, NULL, 'Propylthiouracil Tablet 100 mg Botol DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (796, NULL, NULL, 'Ramipril Tablet 5 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (797, NULL, NULL, 'Ranitidin Tablet 150 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (798, NULL, NULL, 'Rifampicin Tablet 5 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (799, NULL, NULL, 'Rosuvastatin Tablet 10 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (800, NULL, NULL, 'Salbutamol Tablet 2 mg FM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (801, NULL, NULL, 'Salbutamol Tablet 4 mg FM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (802, NULL, NULL, 'Simvastatin Tablet 20 mg TEMPO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (803, NULL, NULL, 'Simvastatin Tablet 10 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (804, NULL, NULL, 'Sirplus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (805, NULL, NULL, 'Spiramycin Tablet 500 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (806, NULL, NULL, 'Spironolactone Tablet 100 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (807, NULL, NULL, 'Spironolactone Tablet 25 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (808, NULL, NULL, 'Thiamphenicol Tablet 500 mg ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (809, NULL, NULL, 'Triamcinolone Tablet 4 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (810, NULL, NULL, 'Valsartan Tablet 160 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (811, NULL, NULL, 'Valsartan Tablet 80 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (812, NULL, NULL, 'Vit C Tablet 50 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (813, NULL, NULL, 'Vitamin B1 Tablet 100 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (814, NULL, NULL, 'Vitamin B6 Tablet 10 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (815, NULL, NULL, 'Vitamin D3 Tablet 1000 IU', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (816, NULL, NULL, 'Zinc Tablet 20 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (817, NULL, NULL, 'Loratadine Tablet 10 mg PROMED', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (818, NULL, NULL, 'Ciprofloxacin Tablet 500 mg PROMED', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (819, NULL, NULL, 'Glimepiride Tablet 4 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (820, NULL, NULL, 'Ketoconazol Tablet 200 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (821, NULL, NULL, 'Glimepiride Tablet 4 mg NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (822, NULL, NULL, 'Cetirizin Tablet 10 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (823, NULL, NULL, 'Antasida Doen Tablet MUTIFA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (824, NULL, NULL, 'Levofloxacin 500mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (825, NULL, NULL, 'Ambroxol Sirup 60 ml ERELA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (826, NULL, NULL, 'Amoxicillin Dry Sirup 125 mg SANBE', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (827, 'OB - ANTDOESIR60MLERE', '', 'Antasida Doen Sirup 60 ml ERELA', 6, 1, 0, 0, 'ELA', 4560, '1', NULL, NULL, NULL, '2023-08-25 20:14:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (828, NULL, NULL, 'Cefadroxil Dry Sirup 125 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (829, NULL, NULL, 'Cefixime Dry Sirup 30 ml HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (830, NULL, NULL, 'Cetirizine Drops 10 ml INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (831, NULL, NULL, 'Cetirizine Sirup 60 ml YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (832, NULL, NULL, 'Domperidone Sirup 60 ml HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (833, NULL, NULL, 'Ibuprofen Sirup 60 ml TEMPO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (834, NULL, NULL, 'Methisoprinol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (835, NULL, NULL, 'Paracetamol Sirup 60 ml YEKATRIA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (836, NULL, NULL, 'Sucralfate Suspensi 200 ml NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (837, NULL, NULL, 'Farmalat Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (838, NULL, NULL, 'Farmoten Tablet 12 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (839, NULL, NULL, 'Farmoten Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (840, NULL, NULL, 'Farsix Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (841, NULL, NULL, 'Fasidol Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (842, 'OB - FASTAB', '', 'Fasidol Tablet', 2, 1, 0, 0, '', 2709, '1', NULL, NULL, NULL, '2023-08-26 10:07:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (843, NULL, NULL, 'Farsobid Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (844, 'OB - FAXTAB10MG', '', 'Faxiden Tablet 10 Mg', 2, 1, 0, 0, '', 1419, '1', NULL, NULL, NULL, '2023-08-26 10:17:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (845, 'OB - FAXTAB20MG', '', 'Faxiden Tablet 20 Mg', 2, 1, 0, 0, '', 2104, '1', NULL, NULL, NULL, '2023-08-26 10:18:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (846, NULL, NULL, 'FG Troches Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (847, NULL, NULL, 'Fitbon Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (848, NULL, NULL, 'Fitbon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (849, NULL, NULL, 'Fituno Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (850, NULL, NULL, 'Flamar Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (851, NULL, NULL, 'Flamar Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (852, 'OB - FLATAB50MG', '', 'Flamigra Tablet 50 Mg', 1, 1, 0, 0, '', 256, '1', NULL, NULL, NULL, '2023-08-25 22:38:17', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (853, 'OB - FLOTAB500MG', '', 'Floxigra Tablet 500 Mg', 1, 1, 0, 0, '', 580, '1', NULL, NULL, NULL, '2023-08-25 22:40:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (854, NULL, NULL, 'Fluimucil Kapsul 200 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (855, NULL, NULL, 'Fluimucil Granule ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (856, NULL, NULL, 'Folamil Genio Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (857, NULL, NULL, 'Folamil Gold Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (858, NULL, NULL, 'Folavit Tablet 400 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (859, NULL, NULL, 'Fundamin E Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (860, NULL, NULL, 'Gastran Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (861, NULL, NULL, 'Gastridin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (862, NULL, NULL, 'Gastrinal HD Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (863, NULL, NULL, 'Gastrucid Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (864, NULL, NULL, 'Gitas Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (865, NULL, NULL, 'Glucodex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (866, NULL, NULL, 'Glucophage Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (867, NULL, NULL, 'Glucophage Tablet 850 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (868, NULL, NULL, 'Glucophage XR Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (869, NULL, NULL, 'Glucosamine Tablet 250 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (870, NULL, NULL, 'Glucosamine Tablet 500 Mg MPL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (871, NULL, NULL, 'Glucovance Tablet 500 2 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (872, NULL, NULL, 'Glucovance Tablet 500 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (873, NULL, NULL, 'Gludepatic Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (874, 'OB - GRATAB', '', 'Grafachlor Tablet', 1, 1, 0, 0, '', 178, '1', NULL, NULL, NULL, '2023-08-25 22:43:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (875, 'OB - GRATAB500MG', '', 'Grafadon Tablet 500 Mg', 1, 1, 0, 0, '', 314, '1', NULL, NULL, NULL, '2023-08-25 22:42:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (876, 'OB - GRAFORTAB', '', 'Grafadon Forte Tablet', 2, 1, 0, 0, '', 3381, '1', NULL, NULL, NULL, '2023-08-26 08:44:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (877, 'OB - GRATAB500MG', '', 'Grafamic Tablet 500 Mg', 2, 1, 0, 0, '', 3411, '1', NULL, NULL, NULL, '2023-08-26 08:46:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (878, 'OB - GRATAB500MG', '', 'Grafazol Tablet 500 Mg', 2, 1, 0, 0, '', 3415, '1', NULL, NULL, NULL, '2023-08-26 08:48:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (879, NULL, NULL, 'Grahabion Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (880, 'OB - GRATAB', '', 'Grathazon Tablet', 2, 1, 0, 0, '', 1241, '1', NULL, NULL, NULL, '2023-08-26 08:49:53', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (881, 'OB - GRATAB', '', 'Gratheos Tablet', 2, 1, 0, 0, '', 2074, '1', NULL, NULL, NULL, '2023-08-26 08:51:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (882, NULL, NULL, 'Gravask Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (883, NULL, NULL, 'Gravask Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (884, NULL, NULL, 'Grazeo Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (885, NULL, NULL, 'Grazeo Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (886, NULL, NULL, 'Hemobion Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (887, NULL, NULL, 'Heptasan Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (888, NULL, NULL, 'Histapan Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (889, 'OB - HISTAB', '', 'Histigo Tablet', 2, 1, 0, 0, '', 4802, '1', NULL, NULL, NULL, '2023-08-26 10:23:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (890, NULL, NULL, 'Hp Pro Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (891, 'OB - HUFTAB', '', 'Hufadextamin Tablet', 2, 1, 0, 0, '', 2008, '1', NULL, NULL, NULL, '2023-08-26 09:25:23', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (892, NULL, NULL, 'Imboost Force ES Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (893, NULL, NULL, 'Imboost Force Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (894, 'OB - IMBTAB10', '8998777143582', 'Imboost Tablet 10', 2, 1, 0, 0, 'PT. Soho Industri Pharmasi', 35000, '1', NULL, NULL, NULL, '2023-08-21 12:51:01', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (895, NULL, NULL, 'Imodium HCL Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (896, NULL, NULL, 'Imunos Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (897, NULL, NULL, 'Imunos Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (898, NULL, NULL, 'Inbion Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (899, NULL, NULL, 'Incidal OD Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (900, NULL, NULL, 'Indexon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (901, 'OB - INF500MGTAB', '', 'Infalgin 500 mg Tablet', 1, 1, 0, 0, '', 315, '1', NULL, NULL, NULL, '2023-08-25 22:22:15', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (902, NULL, NULL, 'Interflox Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (903, NULL, NULL, 'Interhistin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (904, NULL, NULL, 'Intermoxil Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (905, NULL, NULL, 'Interpril Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (906, NULL, NULL, 'Interpril Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (907, NULL, NULL, 'Intervask Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (908, NULL, NULL, 'Intervask Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (909, NULL, NULL, 'Interzol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (910, NULL, NULL, 'Inversyn Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (911, NULL, NULL, 'Isoprinosine Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (912, NULL, NULL, 'Isoric Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (913, NULL, NULL, 'Isoric Tablet 300 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (914, NULL, NULL, 'Isprinol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (915, 'OB - KADTAB', '', 'Kaditic Tablet', 2, 1, 0, 0, '', 2671, '1', NULL, NULL, NULL, '2023-08-26 10:25:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (916, NULL, NULL, 'Kaflam Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (917, NULL, NULL, 'Kaflam Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (918, NULL, NULL, 'Kalmethason Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (919, NULL, NULL, 'Kalmoxilin Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (920, NULL, NULL, 'Kalnex Tablet 250 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (921, NULL, NULL, 'Kalnex Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (922, NULL, NULL, 'Kaltrofen Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (923, NULL, NULL, 'Kaltrofen Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (924, NULL, NULL, 'Kenacort Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (925, NULL, NULL, 'Ketesse Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (926, NULL, NULL, 'Ketosteril Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (927, NULL, NULL, 'Ketricin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (928, NULL, NULL, 'Klotaren Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (929, NULL, NULL, 'Klotaren Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (930, NULL, NULL, 'Kolton Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (931, NULL, NULL, 'Kolton Tablet 300 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (932, NULL, NULL, 'Lameson Tablet 16 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (933, NULL, NULL, 'Lameson Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (934, NULL, NULL, 'Lameson Tablet 8 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (935, NULL, NULL, 'Lanadexon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (936, NULL, NULL, 'Lancid Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (937, NULL, NULL, 'Lapibal Tablet 250 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (938, NULL, NULL, 'Lapibal Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (939, NULL, NULL, 'Lasal Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (940, NULL, NULL, 'Lasal Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (941, NULL, NULL, 'Lasix Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (942, 'OB - LERKAP', '', 'Lerzin Kapsul', 2, 1, 0, 0, '', 3852, '1', NULL, NULL, NULL, '2023-08-26 10:28:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (943, NULL, NULL, 'Levitra Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (944, NULL, NULL, 'Licokalk Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (945, NULL, NULL, 'Licokalk Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (946, NULL, NULL, 'Limoxin Tablet 30 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (947, NULL, NULL, 'Lipitor Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (948, NULL, NULL, 'Lipitor Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (949, NULL, NULL, 'Lipitor Tablet 40 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (950, NULL, NULL, 'Lodia Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (951, 'OB - LOKTAB', '', 'Lokev Tablet', 2, 1, 0, 0, '', 4058, '1', NULL, NULL, NULL, '2023-08-26 10:30:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (952, NULL, NULL, 'Lopamide Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (953, NULL, NULL, 'Lostacef Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (954, NULL, NULL, 'Magerix Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (955, NULL, NULL, 'Matovit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (956, NULL, NULL, 'Matovit Fifty Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (957, NULL, NULL, 'Mectin Sanbe Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (958, NULL, NULL, 'Mediamer B6 Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (959, NULL, NULL, 'Medixon Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (960, NULL, NULL, 'Mefinal Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (961, NULL, NULL, 'Mefinter Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (962, NULL, NULL, 'Meloxin Tablet 15 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (963, NULL, NULL, 'Meloxin Tablet 7 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (964, NULL, NULL, 'Menin Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (965, NULL, NULL, 'Meptin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (966, NULL, NULL, 'Merislon Tablet 6 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (967, NULL, NULL, 'Mertigo Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (968, NULL, NULL, 'Metrix Tablet 1 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (969, NULL, NULL, 'Metrix Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (970, NULL, NULL, 'Metrix Tablet 3 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (971, NULL, NULL, 'Metrix Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (972, NULL, NULL, 'Microgynon Pil KB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (973, NULL, NULL, 'Milmor NF Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (974, NULL, NULL, 'Milmor Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (975, NULL, NULL, 'Molacort Tablet 0 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (976, NULL, NULL, 'Molacort Tablet 0 75 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (977, NULL, NULL, 'Molagit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (978, NULL, NULL, 'Moloco B 12 Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (979, NULL, NULL, 'Moxigra Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (980, NULL, NULL, 'Mucera Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (981, NULL, NULL, 'Mucopect Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (982, NULL, NULL, 'Mucos Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (983, NULL, NULL, 'Mucosta Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (984, NULL, NULL, 'Mycoral Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (985, NULL, NULL, 'Myonal Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (986, NULL, NULL, 'Myonep Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (987, NULL, NULL, 'Narfoz Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (988, NULL, NULL, 'Nephrolit Tablet 5', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (989, NULL, NULL, 'Neuralgin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (990, 'OB - NEUFORTAB', '8994573590162', 'Neurobion Forte Tablet', 2, 1, 0, 0, 'PT. Merck tbk', 38667, '1', NULL, NULL, NULL, '2023-08-22 09:27:08', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (991, 'OB - NEUTAB', '8994573000050', 'Neurobion Tablet', 2, 1, 0, 0, 'PT. Merck tbk', 23500, '1', NULL, NULL, NULL, '2023-08-22 09:25:26', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (992, NULL, NULL, 'Neurodex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (993, NULL, NULL, 'Neurofenac Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (994, NULL, NULL, 'Neuropyron V Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (995, NULL, NULL, 'Neurosanbe 5000 Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (996, NULL, NULL, 'Neurosanbe Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (997, NULL, NULL, 'Neurosanbe Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (998, NULL, NULL, 'Neurovit E Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (999, NULL, NULL, 'Nitrokaf Retard Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1000, NULL, NULL, 'Noperten Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1001, NULL, NULL, 'Noperten Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1002, NULL, NULL, 'Norvask Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1003, NULL, NULL, 'Norvask Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1004, NULL, NULL, 'Novalgin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1005, NULL, NULL, 'Nytex Kapsul 200 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1006, NULL, NULL, 'Obimin Af Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1007, NULL, NULL, 'Ocuson Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1008, NULL, NULL, 'Opimox Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1009, NULL, NULL, 'Opistan Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1010, NULL, NULL, 'Orphen Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1011, NULL, NULL, 'Oste Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1012, NULL, NULL, 'Oste Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1013, NULL, NULL, 'Osteokom Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1014, NULL, NULL, 'Otede Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1015, NULL, NULL, 'Ozen Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1016, NULL, NULL, 'Pharmathon Formula Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1017, NULL, NULL, 'Pirocam Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1018, NULL, NULL, 'Planotab Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1019, NULL, NULL, 'Plantacid Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1020, NULL, NULL, 'Polycrol Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1021, NULL, NULL, 'Polycrol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1022, NULL, NULL, 'Polysilane Max Peppermint Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1023, 'OB - POLTAB', '8993347028511', 'Polysilane Tablet', 2, 1, 0, 0, 'PT. Pharos Indonesia', 8100, '1', NULL, NULL, NULL, '2023-08-22 10:48:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1024, NULL, NULL, 'Pondex Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1025, NULL, NULL, 'Ponstan FCT Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1026, NULL, NULL, 'Postinor Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1027, NULL, NULL, 'Premaston Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1028, NULL, NULL, 'Primadex Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1029, NULL, NULL, 'Primadex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1030, NULL, NULL, 'Primadol Kaplet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1031, NULL, NULL, 'Primolut N Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1032, NULL, NULL, 'Primperan Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1033, NULL, NULL, 'Prodexon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1034, NULL, NULL, 'Profibrat Tablet 200 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1035, NULL, NULL, 'Profibrat Tablet 300 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1036, NULL, NULL, 'Profilas Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1037, NULL, NULL, 'Prolacta Baby Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1038, NULL, NULL, 'Prolacta Mother Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1039, NULL, NULL, 'Promedex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1040, NULL, NULL, 'Pronicy Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1041, NULL, NULL, 'Prorenal Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1042, NULL, NULL, 'Proris Tablet 200 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1043, NULL, NULL, 'Prostakur Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1044, NULL, NULL, 'Protop Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1045, NULL, NULL, 'Prove D Tablet 1000 IU', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1046, NULL, NULL, 'Provigen D3 Kapsul 1000 IU', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1047, NULL, NULL, 'Quinobiotic Kapsul 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1048, NULL, NULL, 'Rantin Tablet 150 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1049, NULL, NULL, 'Rechol Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1050, NULL, NULL, 'Rechol Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1051, NULL, NULL, 'Renabetic Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1052, NULL, NULL, 'Renadinac Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1053, 'OB - RENTAB50MG', '', 'Renadinac Tablet 50 Mg', 1, 1, 0, 0, '', 310, '1', NULL, NULL, NULL, '2023-08-25 22:16:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1054, NULL, NULL, 'Romuz Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1055, NULL, NULL, 'Rozgra Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1056, NULL, NULL, 'Rozgra Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1057, NULL, NULL, 'Ryvel Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1058, NULL, NULL, 'Sanmetidin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1059, NULL, NULL, 'Sanprima Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1060, NULL, NULL, 'Scanaflam Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1061, NULL, NULL, 'Scanaflam Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1062, NULL, NULL, 'Scandexon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1063, 'OB - SCOPLUTAB', '', 'Scopma Plus Tablet', 2, 1, 0, 0, '', 10016, '1', NULL, NULL, NULL, '2023-08-26 10:35:58', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1064, NULL, NULL, 'Selvim Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1065, NULL, NULL, 'Selvim Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1066, NULL, NULL, 'Sistenol Kaplet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1067, NULL, NULL, 'Solinfec Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1068, NULL, NULL, 'Spasmal Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1069, NULL, NULL, 'Spasminal Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1070, 'OB - STATAB500MG', '', 'Stanza Tablet 500 Mg', 2, 1, 0, 0, '', 3168, '1', NULL, NULL, NULL, '2023-08-26 09:21:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1071, NULL, NULL, 'Stimuno Forte Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1072, NULL, NULL, 'Strocain P Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1073, NULL, NULL, 'Sumagesic Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1074, NULL, NULL, 'Super Tetra Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1075, NULL, NULL, 'Surbex T Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1076, NULL, NULL, 'Surbex Z Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1077, NULL, NULL, 'Tarivid Tablet 200 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1078, NULL, NULL, 'Tarivid Tablet 400 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1079, NULL, NULL, 'Tensivask Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1080, NULL, NULL, 'Tensivask Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1081, NULL, NULL, 'Teosal Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1082, NULL, NULL, 'Theragran M Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1083, NULL, NULL, 'Thrombo Aspilet Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1084, NULL, NULL, 'Thyamicin Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1085, NULL, NULL, 'Tiriz HCl Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1086, NULL, NULL, 'Tokasid Tablet 200 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1087, NULL, NULL, 'Toras Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1088, NULL, NULL, 'Toras Tablet 8 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1089, NULL, NULL, 'Torasic Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1090, NULL, NULL, 'Triamcort Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1091, NULL, NULL, 'Trianta Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1092, NULL, NULL, 'Trichodazol Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1093, NULL, NULL, 'Trinordiol Pil KB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1094, NULL, NULL, 'Triocid Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1095, NULL, NULL, 'Trozin 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1096, NULL, NULL, 'Ultilox Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1097, NULL, NULL, 'Unalium Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1098, NULL, NULL, 'Unalium Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1099, NULL, NULL, 'Urinter Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1100, NULL, NULL, 'Urispas Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1101, NULL, NULL, 'Urogetic Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1102, NULL, NULL, 'Urotractin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1103, NULL, NULL, 'Valdres Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1104, NULL, NULL, 'Vastigo Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1105, NULL, NULL, 'Vectrine Tablet 300 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1106, NULL, NULL, 'Venaron Tablet 300 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1107, NULL, NULL, 'Venosmil Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1108, NULL, NULL, 'Vesperum Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1109, NULL, NULL, 'Viagra Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1110, NULL, NULL, 'Vit D3 Tablet 1000 IU CENTURY', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1111, NULL, NULL, 'Vit D3 Tablet 5000 IU CENTURY', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1112, NULL, NULL, 'Vitacee Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1113, NULL, NULL, 'Vitacee Plus Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1114, NULL, NULL, 'Vitazym Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1115, NULL, NULL, 'Voltadex Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1116, NULL, NULL, 'Voltaren Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1117, NULL, NULL, 'Voltaren Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1118, NULL, NULL, 'Vomarin Flash Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1119, NULL, NULL, 'Vometa Flash Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1120, 'OB - VOSTAB', '', 'Vosea Tablet', 2, 1, 0, 0, '', 1855, '1', NULL, NULL, NULL, '2023-08-26 08:54:58', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1121, NULL, NULL, 'Xenical Tablet 120 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1122, NULL, NULL, 'Yasmine Pil KB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1123, NULL, NULL, 'YAZ Pil KB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1124, NULL, NULL, 'Yusimox Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1125, NULL, NULL, 'Zevask Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1126, NULL, NULL, 'Zevask Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1127, NULL, NULL, 'Zoralin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1128, NULL, NULL, 'Zyloric Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1129, NULL, NULL, 'Zyloric Tablet 300 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1130, NULL, NULL, 'Claneksi Tablet 500 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1131, NULL, NULL, 'Prove D Tablet 5000 IU', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1132, NULL, NULL, 'Great D 1000 IU 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1133, NULL, NULL, 'Lostacef Kapsul 500 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1134, NULL, NULL, 'Nipe Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1135, NULL, NULL, 'Novalgin Drops 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1136, NULL, NULL, 'Novalgin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1137, NULL, NULL, 'Nymiko Sirup 12 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1138, NULL, NULL, 'Nytex Dry Sirup 75 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1139, NULL, NULL, 'Oroxin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1140, NULL, NULL, 'Ozen Drops 12 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1141, NULL, NULL, 'Ozen Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1142, NULL, NULL, 'Pondex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1143, NULL, NULL, 'Primadex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1144, NULL, NULL, 'Primavon Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1145, NULL, NULL, 'Primperan Paediatric Drops 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1146, NULL, NULL, 'Primperan Sirup 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1147, NULL, NULL, 'Profilas Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1148, NULL, NULL, 'Propepsa Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1149, NULL, NULL, 'Ryvel Drops 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1150, NULL, NULL, 'Ryvel Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1151, NULL, NULL, 'Salbuven Expectorant Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1152, NULL, NULL, 'Salbuven Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1153, NULL, NULL, 'Sanprima Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1154, NULL, NULL, 'Sirplus Grape 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1155, NULL, NULL, 'Sirplus Melon 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1156, NULL, NULL, 'Sirplus Orange 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1157, NULL, NULL, 'Sirplus Strawberry 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1158, NULL, NULL, 'Tiriz Oral Drops 20 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1159, NULL, NULL, 'Vesperum Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1160, NULL, NULL, 'Vometa Drops 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1161, NULL, NULL, 'Vometa Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1162, NULL, NULL, 'Vomitas Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1163, 'OB - VOSSIR30ML', '', 'Vosea Sirup 30 ml', 6, 1, 0, 0, '', 4530, '1', NULL, NULL, NULL, '2023-08-26 09:03:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1164, NULL, NULL, 'Yusimox Dry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1165, NULL, NULL, 'Yusimox Forte Dry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1166, NULL, NULL, 'Zibramax Dry Sirup 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1167, 'OB - ACICRE5GRA', '', 'Acifar Cream 5 Gram', 7, 1, 0, 0, '', 5741, '1', NULL, NULL, NULL, '2023-08-26 09:26:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1168, NULL, NULL, 'Aclonac Emulgel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1169, NULL, NULL, 'Acyclovir Cream 5 Gram ERELA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1170, 'OB - ACYCRE5GRAFM', '', 'Acyclovir Cream 5 Gram FM', 7, 0, 0, 0, 'FM', 3632, '1', NULL, NULL, NULL, '2023-08-25 19:31:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1171, NULL, NULL, 'Acyclovir Cream 5 Gram INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1172, NULL, NULL, 'Acyclovir Cream 5 Gram KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1173, NULL, NULL, 'Acyclovir Cream 5 Gram PHAPROS', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1174, NULL, NULL, 'Acyclovir Cream 5 Gram RAMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1175, NULL, NULL, 'Albothyl Gel 50 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1176, NULL, NULL, 'Apolar Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1177, NULL, NULL, 'Apolar N Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1178, NULL, NULL, 'Bactoderm Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1179, NULL, NULL, 'Bactoderm Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1180, NULL, NULL, 'Baycuten N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1181, NULL, NULL, 'Benoson Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1182, NULL, NULL, 'Benoson Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1183, NULL, NULL, 'Benoson G Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1184, NULL, NULL, 'Benoson M Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1185, NULL, NULL, 'Benoson N Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1186, NULL, NULL, 'Benoson N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1187, NULL, NULL, 'Benzolac 2 5 percent Gel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1188, NULL, NULL, 'Benzolac 5 percent Gel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1189, NULL, NULL, 'Benzolac Cl 5 Gel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1190, NULL, NULL, 'Bepanthen Ointment 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1191, NULL, NULL, 'Betametason Cream 5 Gram KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1192, NULL, NULL, 'Betason Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1193, NULL, NULL, 'Bevalex Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1194, NULL, NULL, 'Bioplacenton 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1195, NULL, NULL, 'Boraginol N Salep 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1196, NULL, NULL, 'Boraginol S Salep 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1197, NULL, NULL, 'Bravoderm Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1198, NULL, NULL, 'Bravoderm N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1199, NULL, NULL, 'Bufacomb Iob Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1200, NULL, NULL, 'Bufacort N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1201, NULL, NULL, 'Burnazin Cream 35 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1202, NULL, NULL, 'Carmed 10 percent Cream 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1203, NULL, NULL, 'Carmed 20 percent Cream 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1204, NULL, NULL, 'Centabio Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1205, NULL, NULL, 'Chloramfecort Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1206, NULL, NULL, 'Chloramfecort H Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1207, NULL, NULL, 'Cindala Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1208, NULL, NULL, 'Cinolon Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1209, NULL, NULL, 'Cinolon N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1210, NULL, NULL, 'Clinovir Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1211, NULL, NULL, 'Clobetasol Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1212, NULL, NULL, 'Clobetasol Salep 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1213, NULL, NULL, 'Daktarin Oral Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1214, NULL, NULL, 'Decubal Cream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1215, NULL, NULL, 'Dermasolon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1216, NULL, NULL, 'Dermatix Ultra Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1217, NULL, NULL, 'Dermatix Ultra Cream 9 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1218, NULL, NULL, 'Dermovate Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1219, NULL, NULL, 'Dermovate Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1220, NULL, NULL, 'Dermovate Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1221, NULL, NULL, 'Desolex Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1222, NULL, NULL, 'Desolex N Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1223, NULL, NULL, 'Desolex Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1224, 'OB - DEXCRE5GRA', '', 'Dexigen Cream 5 Gram', 7, 1, 0, 0, '', 8784, '1', NULL, NULL, NULL, '2023-08-26 09:40:58', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1225, NULL, NULL, 'Diclofenac Diethylamine Gel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1226, NULL, NULL, 'Digenta Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1227, NULL, NULL, 'Diprogenta Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1228, NULL, NULL, 'Diprogenta Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1229, NULL, NULL, 'Elocon Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1230, NULL, NULL, 'Elocon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1231, NULL, NULL, 'Elox Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1232, NULL, NULL, 'Elox Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1233, NULL, NULL, 'Enbatic Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1234, NULL, NULL, 'Erla Neo Hydrocort Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1235, NULL, NULL, 'Esperson Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1236, NULL, NULL, 'Esperson Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1237, NULL, NULL, 'Faktu Ointment', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1238, NULL, NULL, 'Fasolon Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1239, NULL, NULL, 'Fasolon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1240, NULL, NULL, 'Flamar Gel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1241, NULL, NULL, 'Fluocort N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1242, NULL, NULL, 'Formyco Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1243, 'OB - GENCRE5GRA', '', 'Genalten Cream 5 Gram', 7, 1, 0, 0, '', 3674, '1', NULL, NULL, NULL, '2023-08-26 10:22:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1244, NULL, NULL, 'Genoint Salep Kulit 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1245, NULL, NULL, 'Gentamicin Cream 5 Gram KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1246, NULL, NULL, 'Gentasolon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1247, NULL, NULL, 'Haemocain Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1248, NULL, NULL, 'Hercume Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1249, NULL, NULL, 'Hico Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1250, 'OB - HYD1PERCRE5GRAKAL', '', 'Hydrocortison 1 percent Cream 5 Gram KALBE', 7, 1, 0, 0, 'Kalbe', 4046, '1', NULL, NULL, NULL, '2023-08-26 08:21:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1251, 'OB - HYD25PERCRE5GRAKAL', '', 'Hydrocortison 2 5 percent Cream 5 Gram KALBE', 7, 1, 0, 0, 'Kalbe', 5339, '1', NULL, NULL, NULL, '2023-08-26 08:23:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1252, NULL, NULL, 'Hydrocortison 2 5 percent Cream 5 Gram INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1253, NULL, NULL, 'Iflacort Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1254, NULL, NULL, 'Ikaderm Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1255, NULL, NULL, 'Ikaderm Salep 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1256, NULL, NULL, 'Ikagen Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1257, NULL, NULL, 'Ikamycetin Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1258, NULL, NULL, 'Inerson Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1259, NULL, NULL, 'Interzol Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1260, NULL, NULL, 'Kalcinol N Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1261, NULL, NULL, 'Kalmicetine Dermatalogi Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1262, NULL, NULL, 'Kenacort A Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1263, NULL, NULL, 'Kenalog In Oralbase Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1264, 'OB - KETCRE2PER10GRAHJ', '', 'Ketoconazole Cream 2 percent  10 Gram HJ', 7, 1, 0, 0, 'Hexa', 4935, '1', NULL, NULL, NULL, '2023-08-26 08:27:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1265, NULL, NULL, 'Ketoconazole Cream 2 percent  15 Gram NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1266, NULL, NULL, 'Ketoconazole Cream 2 percent  15 Gram INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1267, NULL, NULL, 'Ketoconazole Cream 2 percent  15 Gram NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1268, NULL, NULL, 'Ketoconazole Cream 2 percent 10 Gram DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1269, NULL, NULL, 'Ketoconazole Cream 2 percent 10 Gram MULIA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1270, NULL, NULL, 'Ketomed Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1271, NULL, NULL, 'Ketomed Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1272, NULL, NULL, 'Kloderma Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1273, NULL, NULL, 'Kloderma Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1274, NULL, NULL, 'Kloderma Gel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1275, NULL, NULL, 'Kloderma Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1276, NULL, NULL, 'Kloderma Ointment 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1277, NULL, NULL, 'Lanakeloid Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1278, NULL, NULL, 'Liposin Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1279, NULL, NULL, 'Lotasbat Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1280, NULL, NULL, 'Lotasbat Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1281, NULL, NULL, 'Mebo Ointment 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1282, NULL, NULL, 'Mederma Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1283, NULL, NULL, 'Mederma Gel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1284, NULL, NULL, 'Medi Klin Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1285, NULL, NULL, 'Medi Klin TR Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1286, NULL, NULL, 'Mediquin Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1287, NULL, NULL, 'Melanox Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1288, NULL, NULL, 'Melanox Forte Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1289, NULL, NULL, 'Miconazole Cream 2 percent 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1290, NULL, NULL, 'Mometason Cream 0 1 percent 10 Gram NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1291, NULL, NULL, 'Mometason Cream 0 1 percent 10 Gram NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1292, NULL, NULL, 'Mometason Cream 0 1 percent 5 Gram NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1293, NULL, NULL, 'Mometason Cream 0 1 percent 5 Gram NULAB', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1294, NULL, NULL, 'Mupirocin Salep 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1295, NULL, NULL, 'MYCO Z Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1296, NULL, NULL, 'Mycoral Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1297, NULL, NULL, 'Mycorine Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1298, NULL, NULL, 'Mycorine Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1299, NULL, NULL, 'Mycospor Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1300, NULL, NULL, 'Mycospor Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1301, NULL, NULL, 'Mytaderm Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1302, NULL, NULL, 'Nebacetin Ointment 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1303, 'OB - NEOGEL15GRA', '', 'Neocenta Gel 15 Gram', 7, 1, 0, 0, '', 12842, '1', NULL, NULL, NULL, '2023-08-26 10:32:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1304, NULL, NULL, 'Nerisona Combi Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1305, 'OB - NISCRE5GRA', '', 'Nisagon Cream 5 Gram', 7, 1, 0, 0, '', 5547, '1', NULL, NULL, NULL, '2023-08-26 10:33:17', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1306, NULL, NULL, 'Nizoral Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1307, NULL, NULL, 'Pabanox Cream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1308, NULL, NULL, 'Parasol Cream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1309, NULL, NULL, 'Parasol SPF 33 Cream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1310, NULL, NULL, 'Permethrin 5 percent Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1311, NULL, NULL, 'Pikangsuang Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1312, NULL, NULL, 'Protocort Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1313, NULL, NULL, 'Sagestam Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1314, NULL, NULL, 'Salticin Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1315, NULL, NULL, 'Scabimite Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1316, NULL, NULL, 'Scabimite Cream 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1317, NULL, NULL, 'Solinfec Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1318, NULL, NULL, 'Synalten Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1319, NULL, NULL, 'Tokasid Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1320, NULL, NULL, 'Topcort Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1321, NULL, NULL, 'Triamcinolon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1322, NULL, NULL, 'Ultraderma Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1323, NULL, NULL, 'Ultraproct N Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1324, NULL, NULL, 'Vaslone Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1325, NULL, NULL, 'Visancort Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1326, NULL, NULL, 'Vitacid  0 025 Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1327, NULL, NULL, 'Vitacid 0 05 Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1328, NULL, NULL, 'Vitacid 0 1 Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1329, NULL, NULL, 'Vitaquin Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1330, NULL, NULL, 'Zoralin Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1331, NULL, NULL, 'Ketoconazole Cream 2 percent  10 Gram KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1332, NULL, NULL, 'Actifed Hijau Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1333, NULL, NULL, 'Actifed Merah Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1334, NULL, NULL, 'Actifed Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1335, NULL, NULL, 'Alco DMP Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1336, NULL, NULL, 'Alco Oral Drops Sirup 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1337, NULL, NULL, 'Alco Plus Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1338, NULL, NULL, 'Allerin Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1339, NULL, NULL, 'Alpara Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1340, NULL, NULL, 'Alpara Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1341, NULL, NULL, 'Anadex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1342, 'OB - ANAOBHSIR30ML', '8998667300545', 'Anakonidin OBH Sirup 30 ml', 6, 1, 5, 0, 'PT. Konimex', 7458, '1', NULL, NULL, NULL, '2023-08-19 13:04:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1343, NULL, NULL, 'Anakonidin OBH Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1344, 'OB - ANASIR30ML', '8998667300255', 'Anakonidin Sirup 30 ml', 6, 1, 5, 0, 'PT. Konimex', 6917, '1', NULL, NULL, NULL, '2023-08-19 12:59:59', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1345, NULL, NULL, 'Anakonidin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1346, NULL, NULL, 'Anaton Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1347, NULL, NULL, 'Asmadex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1348, NULL, NULL, 'Asmasolon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1349, NULL, NULL, 'Asthma Soho Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1350, NULL, NULL, 'Bronchitin Hijau 50 ml ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1351, NULL, NULL, 'Calortusin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1352, NULL, NULL, 'Citocetin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1353, NULL, NULL, 'Colfin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1354, NULL, NULL, 'Coparcetin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1355, NULL, NULL, 'Coparcetin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1356, NULL, NULL, 'Decolgen Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1357, 'OB - DECTAB', '8992112025021', 'Decolgen Tablet', 2, 1, 0, 0, 'PT. Darya Varia', 1760, '1', NULL, NULL, NULL, '2023-08-22 08:49:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1358, NULL, NULL, 'Decolsin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1359, 'OB - DECTAB', '8992112046125', 'Decolsin Tablet', 2, 1, 0, 0, 'PT. Darya Varia', 2500, '1', NULL, NULL, NULL, '2023-08-21 09:24:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1360, NULL, NULL, 'Demacolin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1361, NULL, NULL, 'Demacolin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1362, NULL, NULL, 'Dextral Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1363, NULL, NULL, 'Dextral Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1364, NULL, NULL, 'Dextral Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1365, NULL, NULL, 'Dextral Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1366, NULL, NULL, 'Esepuluh Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1367, NULL, NULL, 'Etaflusin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1368, NULL, NULL, 'Flucadex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1369, NULL, NULL, 'Flucadex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1370, NULL, NULL, 'Flumin Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1371, NULL, NULL, 'Flumin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1372, NULL, NULL, 'Flutamol P Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1373, NULL, NULL, 'Flutamol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1374, NULL, NULL, 'Fluzep Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1375, NULL, NULL, 'Halfilyn Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1376, 'OB - HUFBPSIR60MLHIJ', '8994254001222', 'Hufagrip BP Sirup 60 ml', 6, 1, 0, 0, 'PT. Gratia Husada Farma', 16833, '1', NULL, NULL, NULL, '2023-08-21 12:09:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1377, 'OB - HUFFLUBATSIR60ML', '8994254011115', 'Hufagrip Flu Batuk Sirup 60 ml', 6, 1, 0, 0, 'PT. Gratia Husada Farma', 19167, '1', NULL, NULL, NULL, '2023-08-21 12:10:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1378, 'OB - HUFPILSIR60ML', '8994254001338', 'Hufagrip Pilek Sirup 60 ml', 6, 1, 0, 0, 'PT. Gratia Husada Farma', 14500, '1', NULL, NULL, NULL, '2023-08-21 12:14:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1379, NULL, NULL, 'Ikadryl Sirup Flu 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1380, NULL, NULL, 'Intunal Forte Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1381, NULL, NULL, 'Intunal Forte Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1382, NULL, NULL, 'Intunal Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1383, 'OB - INTTAB', '8993883070500', 'Intunal Tablet', 2, 1, 0, 0, 'PT. Meprofarm', 2720, '1', NULL, NULL, NULL, '2023-08-22 08:56:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1384, 'OB - INZTAB', '8998667100732', 'Inza Tablet', 2, 1, 0, 0, 'PT. Konimex', 2292, '1', NULL, NULL, NULL, '2023-08-21 13:04:32', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1385, NULL, NULL, 'Lacoldin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1386, NULL, NULL, 'Lacoldin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1387, NULL, NULL, 'Lapifed DM Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1388, NULL, NULL, 'Lapifed Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1389, NULL, NULL, 'Lapifed Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1390, NULL, NULL, 'Lapifed Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1391, NULL, NULL, 'Lapisiv Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1392, 'OB - MIXFLUBATTAB', '8995858192620', 'Mixagrip Flu Batuk Tablet', 2, 1, 0, 0, 'PT. Saka Farma Laboratories', 2500, '1', NULL, NULL, NULL, '2023-08-22 08:35:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1393, NULL, NULL, 'Molexflu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1394, NULL, NULL, 'Nalgestan Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1395, NULL, NULL, 'Neo Napacin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1396, 'OB - NEOFORTAB', '8992112014018', 'Neozep Forte Tablet', 2, 1, 0, 0, 'PT. Darya Varia', 2300, '1', NULL, NULL, NULL, '2023-08-22 09:20:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1397, NULL, NULL, 'OBH Combi Kids Apel Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1398, 'OB - OBHCOMKIDMADSIR60ML', '8993113037051', 'OBH Combi Kids Madu Sirup 60 ml', 6, 1, 0, 0, 'PT. Combiphar', 16042, '1', NULL, NULL, NULL, '2023-08-22 09:43:54', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1399, 'OB - OBHCOMKIDORASIR60ML', '8993113044059', 'OBH Combi Kids Orange Sirup 60 ml', 6, 1, 0, 0, 'PT. Combiphar', 16042, '1', NULL, NULL, NULL, '2023-08-22 09:47:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1400, 'OB - OBHCOMKIDSTRSIR60ML', '8993113042055', 'OBH Combi Kids Strawberry Sirup 60 ml', 6, 0, 0, 0, 'PT. Combiphar', 16042, '1', NULL, NULL, NULL, '2023-08-22 09:46:08', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1401, NULL, NULL, 'OBH Combi Plus Madu Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1402, NULL, NULL, 'OBH Combi Plus Menthol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1403, 'OB - OBHCOMPLUMENSIR60ML', '8993113032056', 'OBH Combi Plus Menthol Sirup 60 ml', 6, 1, 0, 0, 'PT. Combiphar', 14167, '1', NULL, NULL, NULL, '2023-08-22 09:41:55', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1404, NULL, NULL, 'OBH Nellco Kids Cokelat Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1405, NULL, NULL, 'OBH Nellco Kids Orange Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1406, NULL, NULL, 'OBH Nellco Kids Strawberry Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1407, NULL, NULL, 'OBH Nellco Plus Menthol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1408, NULL, NULL, 'OBH Nellco Plus Menthol Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1409, NULL, NULL, 'OBH Nellco Special Jahe Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1410, NULL, NULL, 'OBH Nellco Special Jahe Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1411, NULL, NULL, 'OBH Nellco Special Madu Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1412, NULL, NULL, 'OBH Nellco Special Madu Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1413, NULL, NULL, 'OBH Nellco Special Menthol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1414, NULL, NULL, 'OBH Nellco Special Menthol Sirup 55 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1415, NULL, NULL, 'OBH Tropica Extra Kids Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1416, NULL, NULL, 'OBH Tropica Extra Kids Strawberry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1417, NULL, NULL, 'OBH Tropica Extra Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1418, NULL, NULL, 'OBH Tropica Extra Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1419, NULL, NULL, 'OBH Tropica Plus Kids Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1420, NULL, NULL, 'OBH Tropica Plus Kids Strawberry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1421, NULL, NULL, 'OBH Tropica Plus Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1422, NULL, NULL, 'OBH Tropica Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1423, NULL, NULL, 'Panadol Cold Flu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1424, NULL, NULL, 'Paraflu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1425, 'OB - PARFLUBATPETAB', '8998667102415', 'Paramex Flu Batuk PE Tablet', 2, 1, 0, 0, 'PT. Konimex', 2333, '1', NULL, NULL, NULL, '2023-08-22 10:00:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1426, NULL, NULL, 'Paratusin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1427, NULL, NULL, 'Paratusin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1428, 'OB - PIMCHESIR60ML', '8993515361570', 'PimTraKol Cherry Sirup 60 ml', 6, 1, 0, 0, 'PT. PIM Pharmaceuticals', 12917, '1', NULL, NULL, NULL, '2023-08-22 10:40:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1429, NULL, NULL, 'PimTraKol Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1430, 'OB - PIMLEMSIR60ML', '8993515361563', 'PimTraKol Lemon Sirup 60 ml', 6, 1, 0, 0, 'PT. PIM Pharmaceuticals', 12917, '1', NULL, NULL, NULL, '2023-08-22 10:37:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1431, NULL, NULL, 'PK Permanganas Kalium 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1432, 'OB - PROFLUBATTAB', '8992858063011', 'Procold Flu Batuk Tablet', 2, 1, 0, 0, 'PT. Kalbe Farma', 3750, '1', NULL, NULL, NULL, '2023-08-22 10:58:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1433, 'OB - PROFLUTAB', '8992858667202', 'Procold Flu Tablet', 2, 1, 0, 0, 'PT. Kalbe Farma', 3520, '1', NULL, NULL, NULL, '2023-08-22 10:56:18', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1434, NULL, NULL, 'Rhinofed Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1435, NULL, NULL, 'Rhinofed Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1436, NULL, NULL, 'Rhinos Junior Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1437, NULL, NULL, 'Rhinos Neo Drops 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1438, NULL, NULL, 'Rhinos SR Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1439, 'OB - SANTAB', '8993008125047', 'Sanaflu Tablet', 2, 1, 0, 0, 'PT. Sanbe', 2333, '1', NULL, NULL, NULL, '2023-08-22 12:30:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1440, NULL, NULL, 'Siladex Batuk Pilek Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1441, 'OB - SILBATPILSIR30ML', '8998667300507', 'Siladex Batuk Pilek Sirup 30 ml', 6, 1, 0, 0, 'PT. Konimex', 7667, '1', NULL, NULL, NULL, '2023-08-22 12:39:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1442, NULL, NULL, 'Siladex Batuk Pilek Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1443, 'OB - STOCOLTAB', '8999809400031', 'Stop Cold Tablet', 2, 1, 0, 0, 'PT. Darya Varia', 2883, '1', NULL, NULL, NULL, '2023-08-22 12:49:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1444, NULL, NULL, 'Tera F Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1445, 'OB - TERPLUSIR30ML', '8998667300330', 'Termorex Plus Sirup 30 ml', 6, 1, 0, 0, 'PT. Konimex', 8750, '1', NULL, NULL, NULL, '2023-08-22 13:38:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1446, NULL, NULL, 'Termorex Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1447, NULL, NULL, 'Tremenza Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1448, NULL, NULL, 'Tremenza Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1449, NULL, NULL, 'Triaminic Batuk Pilek Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1450, NULL, NULL, 'Triaminic Expectorant Pilek Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1451, NULL, NULL, 'Triaminic Pilek Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1452, NULL, NULL, 'Trifed Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1453, NULL, NULL, 'Trifed Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1454, NULL, NULL, 'Trifedrin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1455, NULL, NULL, 'Tuzalos Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1456, 'OB - ULTEXTTAB', '8997014050133', 'Ultraflu Extra Tablet', 2, 1, 0, 0, 'PT. Henson Farma', 2900, '1', NULL, NULL, NULL, '2023-08-22 14:10:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1457, 'OB - ULTTAB', '8997014050225', 'Ultraflu Tablet', 2, 1, 0, 0, 'PT. Henson Farma', 2900, '1', NULL, NULL, NULL, '2023-08-22 14:12:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1458, NULL, NULL, 'Benacol DTM Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1459, NULL, NULL, 'Grantusif Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1460, NULL, NULL, 'Halmezin Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1461, NULL, NULL, 'Komix Jahe Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1462, 'OB - KOMJERNIPSAC7ML', '8993058300807', 'Komix Jeruk Nipis Sachet 7 ml', 0, 1, 0, 0, 'PT. Bintang Toedjoe', 1400, '1', NULL, NULL, NULL, '2023-08-22 09:10:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1463, 'OB - KOMKIDSTRSAC5ML', '8993058303105', 'Komix Kid Strawberry Sachet 5 ml', 4, 1, 0, 0, 'PT. Bintang Toedjoe', 1000, '1', NULL, NULL, NULL, '2023-08-22 08:58:01', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1464, NULL, NULL, 'Komix Peppermint Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1465, 'OB - KONTAB', '8998667100084', 'Konidin Tablet', 2, 1, 0, 0, 'PT. Konimex', 2167, '1', NULL, NULL, NULL, '2023-08-21 14:41:23', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1466, NULL, NULL, 'Lapisiv T Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1467, 'OB - MEXTAB', '8993218330019', 'Mextril Tablet ', 2, 1, 0, 0, 'PT. Sejahtera Lestari Farma', 2600, '1', NULL, NULL, NULL, '2023-08-22 08:21:51', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1468, NULL, NULL, 'Sanadryl DMP Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1469, NULL, NULL, 'Sanadryl DMP Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1470, NULL, NULL, 'Siladex Antitussive Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1471, 'OB - SILANTSIR30ML', '8998667300774', 'Siladex Antitussive Sirup 30 ml', 6, 1, 0, 0, 'PT. Konimex', 7667, '1', NULL, NULL, NULL, '2023-08-22 12:44:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1472, NULL, NULL, 'Siladex Antitussive Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1473, NULL, NULL, 'Siladex DMP Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1474, NULL, NULL, 'Siladex DMP Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1475, NULL, NULL, 'Siladex DMP Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1476, 'OB - VICF44ANASIR27ML', '4987176004611', 'Vicks F44 Anak Sirup 27 ml', 6, 1, 0, 0, 'PT. Darya Varia', 9333, '1', NULL, NULL, NULL, '2023-08-22 14:23:26', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1477, NULL, NULL, 'Vicks F44 Anak Sirup 54 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1478, NULL, NULL, 'Vicks F44 Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1479, 'OB - VICF44SIR27ML', '4987176002679', 'Vicks F44 Sirup 27 ml', 6, 1, 0, 0, 'PT. Darya Varia', 8677, '1', NULL, NULL, NULL, '2023-08-22 14:24:43', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1480, NULL, NULL, 'Vicks F44 Sirup 54 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1481, NULL, NULL, 'Woods Antitussive Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1482, 'OB - WOOANTSIR60ML', '8992858589214', 'Woods Antitussive Sirup 60 ml', 6, 1, 0, 0, 'PT. Kalbe Farma', 18333, '1', NULL, NULL, NULL, '2023-08-22 14:43:58', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1483, NULL, NULL, 'Akurat Compact Test Kehamilan ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1484, NULL, NULL, 'Akurat Strip Test Kehamilan ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1485, NULL, NULL, 'Alkafil', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1486, NULL, NULL, 'Alkohol Swabs', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1487, NULL, NULL, 'Andalan Kondom 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1488, NULL, NULL, 'Andalan Kondom 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1489, NULL, NULL, 'Antis Spray Jasmine Tea 55 ml ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1490, NULL, NULL, 'Antis Spray Jeruk Nipis 55 ml ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1491, NULL, NULL, 'Antis Spray Timun 55 ml ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1492, NULL, NULL, 'Arm Slim L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1493, NULL, NULL, 'Arm Slim M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1494, NULL, NULL, 'Arm Slim S', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1495, NULL, NULL, 'Autan Active Protect Sachet 6 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1496, NULL, NULL, 'Autan Floral Protect Sachet 6 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1497, NULL, NULL, 'Autan Lotion Kids 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1498, NULL, NULL, 'Autan Tube Soft Lotion 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1499, NULL, NULL, 'Avail Biru', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1500, NULL, NULL, 'Avail Hijau', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1501, NULL, NULL, 'Avail Merah', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1502, NULL, NULL, 'Blood Lanced Onemed', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1503, NULL, NULL, 'Botol Kaca Asi', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1504, NULL, NULL, 'Breast Pump Mami', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1505, NULL, NULL, 'Breast Pump Mami With Botol', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1506, 'AL - BYEFEVANASAC', '8992870712096', 'Byebye Fever Anak Sachet', 4, 1, 3, 0, 'PT. Hisamitsu', 9050, '1', NULL, NULL, NULL, '2023-08-09 16:44:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1507, 'AL - BYEFEVBAYSAC', '8992870712102', 'Byebye Fever Bayi Sachet', 4, 1, 3, 0, 'PT. Hisamitsu', 6400, '1', NULL, NULL, NULL, '2023-08-09 16:42:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1508, NULL, NULL, 'Cangkang Kapsul Nomer 0', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1509, NULL, NULL, 'Cangkang Kapsul Nomer 00', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1510, NULL, NULL, 'Cangkang Kapsul Nomer 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1511, NULL, NULL, 'Cangkang Kapsul Nomer 2', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1512, NULL, NULL, 'Cangkang Kapsul Nomer 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1513, NULL, NULL, 'Celana Sunat L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1514, NULL, NULL, 'Celana Sunat M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1515, NULL, NULL, 'Celana Sunat S', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1516, NULL, NULL, 'Charm Body 35 cm 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1517, NULL, NULL, 'Charm Body 35 cm 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1518, 'AL - CHAEXTMAX10', '8993189270291', 'Charm Extra Maxi 10', 3, 1, 0, 0, 'PT. Uni-Charm Indonesia', 5925, '1', NULL, NULL, NULL, '2023-08-23 15:18:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1519, NULL, NULL, 'Charm Extra Maxi 30', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1520, NULL, NULL, 'Charm Extra Maxi 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1521, NULL, NULL, 'Charm Extra Maxi 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1522, NULL, NULL, 'Charm Extra Maxi Wings 2', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1523, 'AL - CHANIGWIN2', '8993189270680', 'Charm Night Wings 2', 5, 1, 0, 0, 'PT. Uni Charm Inodneia', 2585, '1', NULL, NULL, NULL, '2023-08-23 15:25:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1524, NULL, NULL, 'Charm Night Wings 4', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1525, NULL, NULL, 'Charm Night Wings 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1526, NULL, NULL, 'Cinderella Cotton Buds Adult 100 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1527, NULL, NULL, 'Cinderella Cotton Buds Adult 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1528, NULL, NULL, 'Cinderella Cotton Buds Baby 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1529, NULL, NULL, 'Confidence Adult Basic L 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1530, NULL, NULL, 'Confidence Adult Basic M 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1531, NULL, NULL, 'Confidence Adult Basic XL 6', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1532, NULL, NULL, 'Confidence Adult Classic Day L 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1533, NULL, NULL, 'Confidence Adult Classic Day M 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1534, NULL, NULL, 'Confidence Adult Classic Day XL 6', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1535, NULL, NULL, 'Confidence Adult Classic Night L 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1536, NULL, NULL, 'Confidence Adult Classic Night M 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1537, NULL, NULL, 'Confidence Adult Classic Night XL 6', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1538, 'AL - CONPREBIRL1', '8992959850053', 'Confidence Premium Biru L 1 ', 5, 1, 0, 0, 'PT. Softex Indonesia', 11565, '1', NULL, NULL, NULL, '2023-08-23 15:43:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1539, NULL, NULL, 'Confidence Premium Biru M 1 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1540, NULL, NULL, 'Confidence Premium Biru Xl 1 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1541, NULL, NULL, 'Counterpain Patch 10 X 7 cm 4 Lembar', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1542, NULL, NULL, 'Cussons Wipes 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1543, NULL, NULL, 'Daryantulle', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1544, NULL, NULL, 'Dermafix 10 X 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1545, NULL, NULL, 'Dermafix 10 X 25', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1546, NULL, NULL, 'Dermafix 5 X 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1547, NULL, NULL, 'Dodo Botol Susu 120 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1548, NULL, NULL, 'Dodo Botol Susu 240 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1549, NULL, NULL, 'Dodo Botol Susu 60 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1550, NULL, NULL, 'Dodo Breast Pad', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1551, NULL, NULL, 'Dodo Breast Pump Reguler', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1552, NULL, NULL, 'Dodo Breast Pump With Botol', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1553, NULL, NULL, 'Dodo Breastmilk Storage Bag 100 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1554, NULL, NULL, 'Dodo Cleaning Brush Botol And Nipple', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1555, NULL, NULL, 'Dodo Cotton Balls', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1556, NULL, NULL, 'Dodo Cotton Buds Adult 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1557, NULL, NULL, 'Dodo Cotton Buds Adult 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1558, NULL, NULL, 'Dodo Cotton Buds Baby 150', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1559, NULL, NULL, 'Dodo Cotton Buds Baby 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1560, NULL, NULL, 'Dodo Nipple L Gepeng', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1561, NULL, NULL, 'Dodo Nipple M Bulat', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1562, NULL, NULL, 'Dodo Nipple M Gepeng', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1563, NULL, NULL, 'Dodo Nipple S Bulat', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1564, NULL, NULL, 'Dodo Nipple S Gepeng', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1565, NULL, NULL, 'Dodo Nipple XL Bulat', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1566, NULL, NULL, 'Dodo Penyambung Puting', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1567, NULL, NULL, 'Dr P L 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1568, NULL, NULL, 'Dr P M 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1569, NULL, NULL, 'Dr P XL 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1570, NULL, NULL, 'Durex Close Fit 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1571, NULL, NULL, 'Durex Comfort 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1572, NULL, NULL, 'Durex Dua Lima 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1573, NULL, NULL, 'Durex Extra Safe 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1574, NULL, NULL, 'Durex Fetherlite 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1575, NULL, NULL, 'Durex Invisible 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1576, NULL, NULL, 'Durex Love 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1577, NULL, NULL, 'Durex Love 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1578, NULL, NULL, 'Durex Performa 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1579, NULL, NULL, 'Durex Play Lubricant 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1580, NULL, NULL, 'Durex Pleasuremax 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1581, NULL, NULL, 'Durex Ribbed 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1582, NULL, NULL, 'Durex Strawberry 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1583, NULL, NULL, 'Durex Tingle 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1584, NULL, NULL, 'Durex Together 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1585, NULL, NULL, 'Empeng Apus Pigeon', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1586, NULL, NULL, 'Empeng Apus Pigeon Kemas', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1587, NULL, NULL, 'Eucaliptus Eagle Desinfectan Spray 280 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1588, 'AL - FIEGRA3', '9555163307332', 'Fiesta Grape 3', 5, 1, 0, 1, 'PT. NRS Global Patners', 11333, '1', NULL, NULL, NULL, '2023-08-21 12:04:42', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1589, NULL, NULL, 'Fiesta Banana 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1590, 'AL - FIEBUBGUM3', '9555163306045', 'Fiesta Bubble Gum 3', 5, 1, 0, 1, 'PT. NRS Global Patners', 11333, '1', NULL, NULL, NULL, '2023-08-21 12:04:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1591, NULL, NULL, 'Fiesta Delay 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1592, NULL, NULL, 'Fiesta Durian 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1593, NULL, NULL, 'Fiesta Intimate Natural Lubricant Gel 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1594, NULL, NULL, 'Fiesta Intimate Strawberry Lubricant Gel 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1595, NULL, NULL, 'Fiesta Max Dotted 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1596, NULL, NULL, 'Fiesta Max Dotted 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1597, NULL, NULL, 'Fiesta Party Pack 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1598, NULL, NULL, 'Fiesta Strawberry 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1599, NULL, NULL, 'Fiesta Strawberry 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1600, NULL, NULL, 'Fiesta Ultra Safe 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1601, NULL, NULL, 'Fiesta Ultra Thin 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1602, NULL, NULL, 'Folley Catether 16', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1603, NULL, NULL, 'Folley Catether 18', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1604, NULL, NULL, 'Gilet Gold ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1605, NULL, NULL, 'Gluco DR Strip Test', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1606, NULL, NULL, 'Hand Sanitizer Medika 500 ml Pump', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1607, 'AL - HAN', '8999777026370', 'Hansaplast', 5, 1, 0, 0, 'PT. Beidersdorf Indonesia', 225, '1', NULL, NULL, NULL, '2023-08-21 11:21:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1608, NULL, NULL, 'Hansaplast Amplop 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1609, NULL, NULL, 'Hansaplast Aqua Protect', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1610, NULL, NULL, 'Hansaplast Cooling Fever ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1611, NULL, NULL, 'Hansaplast Disney ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1612, NULL, NULL, 'Hansaplast Disney Princess', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1613, NULL, NULL, 'Hansaplast Jumbo 24', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1614, NULL, NULL, 'Hansaplast Jumbo 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1615, NULL, NULL, 'Hansaplast Kids Disney Cars 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1616, NULL, NULL, 'Hansaplast Kids Disney Frozen 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1617, NULL, NULL, 'Hansaplast Kids Disney Mickey 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1618, NULL, NULL, 'Hansaplast Kids Little Pony 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1619, NULL, NULL, 'Hansaplast Kids Starwars', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1620, NULL, NULL, 'Hansaplast Kids Starwars 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1621, NULL, NULL, 'Hansaplast Koyo Hangat 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1622, 'AL - HANKOYHAN10', '8999777765392', 'Hansaplast Koyo Hangat 10', 4, 1, 3, 0, 'PT. Beiersdorf', 6400, '1', NULL, NULL, NULL, '2023-08-09 16:57:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1623, 'AL - HANKOYPAN', '8999777090579', 'Hansaplast Koyo Panas ', 4, 1, 3, 0, 'PT. Beiersdorf', 6400, '1', NULL, NULL, NULL, '2023-08-09 16:56:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1624, NULL, NULL, 'Hansaplast Koyo Panas 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-08-22 07:08:03', 1, '2023-08-22 02:08:00', 1);
INSERT INTO `tx_produk` VALUES (1625, NULL, NULL, 'Hansaplast Mix 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1626, ' - HANROL1,2CMX1M', '8999777019891', 'Hansaplast Roll 1,25 cm X 1 M', 5, 1, 0, 0, 'PT. Beidersdorf Indonesia', 3700, '1', NULL, NULL, NULL, '2023-08-21 11:27:36', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1627, 'AL - HANROL125CMX5M', '8999777012267', 'Hansaplast Roll 1 25 cm X 5 M', 5, 1, 0, 0, 'PT. Beidersdorf Indonesia', 10150, '1', NULL, NULL, NULL, '2023-08-21 11:30:54', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1628, NULL, NULL, 'Huki Botol Susu 120 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1629, NULL, NULL, 'Huki Botol Susu 240 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1630, NULL, NULL, 'Huki Botol Susu 60 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1631, NULL, NULL, 'Huki Cotton Buds 120', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1632, NULL, NULL, 'Huki Cotton Buds Adult 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1633, NULL, NULL, 'Huki Cotton Buds Adult 150', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1634, NULL, NULL, 'Huki Cotton Buds Adult 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1635, NULL, NULL, 'Huki Cotton Buds Baby 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1636, NULL, NULL, 'Huki Cotton Buds Baby 150', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1637, NULL, NULL, 'Huki Cotton Buds Baby 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1638, NULL, NULL, 'Huki Nipple L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1639, NULL, NULL, 'Huki Nipple L Box', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1640, NULL, NULL, 'Huki Nipple M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1641, NULL, NULL, 'Huki Nipple M Box', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1642, NULL, NULL, 'Huki Nipple S', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1643, NULL, NULL, 'Huki Nipple S Box', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1644, NULL, NULL, 'Hypafix 10 cm X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1645, NULL, NULL, 'Hypafix 5 cm X 1 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1646, NULL, NULL, 'Hypafix 5 cm X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1647, NULL, NULL, 'I Free Pad', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1648, NULL, NULL, 'Ice Bag For Compres Onemed', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1649, NULL, NULL, 'Infus Set GEA', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1650, NULL, NULL, 'Infus Set Onemed', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1651, NULL, NULL, 'Infus Set Terumo ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1652, NULL, NULL, 'Kantong Asi Kasih Umi 30', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1653, NULL, NULL, 'Kapas Gulung 100 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1654, NULL, NULL, 'Kapas Gulung 1000 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1655, NULL, NULL, 'Kapas Gulung 250 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1656, NULL, NULL, 'Kapas Gulung 50 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1657, NULL, NULL, 'Kapas Gulung 500 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1658, NULL, NULL, 'Kapas Kharisma 30 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1659, NULL, NULL, 'Kapas Kharisma 45 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1660, NULL, NULL, 'Kapas Medi Soft Cotton Balls 75 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1661, 'AL - KAPSEL35GRA', '8991038110354', 'Kapas Selection 35 Gram', 5, 1, 0, 0, 'PT. Tarunakusuma Purinusa', 4833, '1', NULL, NULL, NULL, '2023-08-21 13:36:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1662, NULL, NULL, 'Kapas selection 50 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1663, NULL, NULL, 'Kasa Darma Husada', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1664, NULL, NULL, 'Kasa Keyko Orange', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1665, NULL, NULL, 'Kasa Steril Indah Medika', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1666, NULL, NULL, 'Kasa Steril Three Med', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1667, NULL, NULL, 'Kassa Keyko Biru', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1668, 'AL - KEM100ML', '8997005990448', 'Kemiriku 100 ml', 6, 1, 0, 0, 'PT. Inticosmetic Lestari', 10083, '1', NULL, NULL, NULL, '2023-08-21 13:49:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1669, NULL, NULL, 'Kertas Puyer 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1670, NULL, NULL, 'Kinoki Gold', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1671, NULL, NULL, 'Kinoki White', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1672, NULL, NULL, 'Kondom Arjuna Extra Tipis 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1673, NULL, NULL, 'Kondom Arjuna Jempol 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1674, NULL, NULL, 'Koolfever Adult Sachet', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1675, 'AL - KOOANASAC', '4987072061817', 'Koolfever Anak Sachet', 4, 1, 3, 0, 'PT. Kobayashi', 5958, '1', NULL, NULL, NULL, '2023-08-09 16:51:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1676, 'AL - KOOBABSAC', '4987072022306', 'Koolfever Baby Sachet', 4, 1, 3, 0, 'PT. Kobayashi', 4792, '1', NULL, NULL, NULL, '2023-08-09 16:49:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1677, NULL, NULL, 'Kotak P3K', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1678, NULL, NULL, 'Laurier Double Comfort Long Wing 14', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1679, NULL, NULL, 'Laurier Double Comfort Long Wing 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1680, NULL, NULL, 'Laurier Long Wing 14', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1681, NULL, NULL, 'Laurier Long Wings 7', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1682, NULL, NULL, 'Laurier Relax Night 30 cm 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1683, NULL, NULL, 'Laurier Relax Night 30 cm 16', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1684, NULL, NULL, 'Laurier Relax Night 30 cm 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1685, NULL, NULL, 'Laurier Relax Night 35 cm 6', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1686, NULL, NULL, 'Laurier Relax Night 40 cm 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1687, NULL, NULL, 'Laurier Super Maxi 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1688, NULL, NULL, 'Laurier Super Maxi 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1689, NULL, NULL, 'Laurier Super Maxi 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1690, NULL, NULL, 'Laurier Super Maxi Long 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1691, NULL, NULL, 'Laurier Super Maxi Wings 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1692, NULL, NULL, 'Laurier Super Maxi Wings 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1693, NULL, NULL, 'Leucoplast 1 25 cm X 4 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1694, NULL, NULL, 'Leucoplast 2 5 cm X 4 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1695, NULL, NULL, 'Leucoplast 5 cm X 4 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1696, NULL, NULL, 'Leucoplast 7 5 cm X 4 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1697, NULL, NULL, 'Lifree L 4', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1698, NULL, NULL, 'Lifree M 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1699, NULL, NULL, 'Lomatuell H', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1700, NULL, NULL, 'Magic Power Biru', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1701, 'AL - MAGPOWHIT', '8997007270074', 'Magic Power Hitam', 5, 1, 0, 0, 'PT. Etica Sari Pratama', 9200, '1', NULL, NULL, NULL, '2023-08-22 08:17:36', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1702, NULL, NULL, 'Magic Power Merah', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1703, NULL, NULL, 'Mamy Poko Standar L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1704, NULL, NULL, 'Mamy Poko Standar M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1705, NULL, NULL, 'Mamy Poko Standar New Born', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1706, NULL, NULL, 'Mamy Poko Standar S', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1707, NULL, NULL, 'Mamy Poko Standar XL', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1708, NULL, NULL, 'Masker Cantol', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1709, NULL, NULL, 'Masker Hijab', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1710, NULL, NULL, 'Max Kleen Desinfectan Spray 200 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1711, NULL, NULL, 'Medicare Glove L 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1712, NULL, NULL, 'Medicare Glove M 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1713, NULL, NULL, 'Medicare Glove S 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1714, NULL, NULL, 'Microfine BD 31 G Ungu', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1715, NULL, NULL, 'Microfine BD 31 G Hijau', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1716, NULL, NULL, 'Micropore 1 In X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1717, NULL, NULL, 'Micropore 1 Per 2 In X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1718, NULL, NULL, 'Micropore 3 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1719, NULL, NULL, 'Minyak Niagara Lavender 100 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1720, NULL, NULL, 'Minyak Niagara Original 100 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1721, NULL, NULL, 'Mitu Baby Antiseptik Biru 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1722, NULL, NULL, 'Mitu Baby Antiseptik Biru 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1723, NULL, NULL, 'Mitu Baby Antiseptik Hijau 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1724, NULL, NULL, 'Mitu Baby Antiseptik Pink 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1725, NULL, NULL, 'Mitu Baby Antiseptik Putih 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1726, NULL, NULL, 'Mitu Baby Antiseptik Ungu 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1727, NULL, NULL, 'Ms Tell Me Strip Test Kehamilan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1728, NULL, NULL, 'Needle 27 G Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1729, NULL, NULL, 'Nuvo Hand Sanitizer 250 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1730, NULL, NULL, 'Nuvo Hand Sanitizer 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1731, NULL, NULL, 'Nuvo Hand Sanitizer 85 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1732, NULL, NULL, 'Nuvo Hand Sanitizer Pump 250 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1733, NULL, NULL, 'Onemed Strip Test Kehamilan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1734, NULL, NULL, 'Onestep Test HIV', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1735, NULL, NULL, 'Ovutest Scope', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1736, NULL, NULL, 'Ovutest Strip Test Kesuburan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1737, NULL, NULL, 'Oxycan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1738, NULL, NULL, 'Pastik', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1739, NULL, NULL, 'Perban Indah Medika 10 cm', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1740, NULL, NULL, 'Perban Indah Medika 15 cm', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1741, NULL, NULL, 'Perban Indah Medika 5 cm', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1742, NULL, NULL, 'Pigeon Baby Wash 200 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1743, NULL, NULL, 'Pigeon Botol 120 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1744, NULL, NULL, 'Pigeon Botol 240 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1745, NULL, NULL, 'Pigeon Botol 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1746, NULL, NULL, 'Pigeon Cotton Buds Adult 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1747, NULL, NULL, 'Pigeon Niple M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1748, NULL, NULL, 'Pigeon Niple S ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1749, NULL, NULL, 'Pigeon Niple Ulir S', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1750, NULL, NULL, 'Pigeon Nipple L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1751, NULL, NULL, 'Pigeon Nipple L Ulir', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1752, NULL, NULL, 'Pigeon Nipple M Ulir', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1753, NULL, NULL, 'Pot Salep 10 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1754, NULL, NULL, 'Pot Salep 15 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1755, NULL, NULL, 'Pot Salep 30 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1756, NULL, NULL, 'Pot Salep 5 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1757, NULL, NULL, 'Pot Salep 50 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1758, NULL, NULL, 'Pregcy Strip Test Kehamilan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1759, NULL, NULL, 'Rohto Fever Patch', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1760, NULL, NULL, 'Safe Gloves 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1761, NULL, NULL, 'Safe Gloves M 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1762, NULL, NULL, 'Safe Gloves S 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1763, NULL, NULL, 'Salonpas Gel Patch 2 Lembar 10 cm X 14 cm', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1764, NULL, NULL, 'Salonpas Koyo Besar 45 cm', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1765, NULL, NULL, 'Salonpas Pain Relief Patch 3 Lembar 7 cm X 10 cm', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1766, NULL, NULL, 'Salonpas Pain Relief Patch 5 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1767, NULL, NULL, 'Sensi Glove L 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1768, NULL, NULL, 'Sensi Glove L 60', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1769, NULL, NULL, 'Sensi Glove M 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1770, NULL, NULL, 'Sensi Glove M 60', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1771, NULL, NULL, 'Sensi Glove S 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1772, NULL, NULL, 'Sensi Glove S 60', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1773, NULL, NULL, 'Sensitif Compact Test Kehamilan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1774, NULL, NULL, 'Sensitif Strip Plus Cawan Test Kehamilan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1775, NULL, NULL, 'Sensitif Strip Test Kehamilan', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1776, NULL, NULL, 'Soffel Spray 130 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1777, NULL, NULL, 'Soffel Tube Apel 80 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1778, NULL, NULL, 'Soffel Tube Bengkuang 80 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1779, NULL, NULL, 'Soffel Tube Geranium 80 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1780, NULL, NULL, 'Soffel Tube Jeruk 80 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1781, NULL, NULL, 'Sofie Maternity 45 cm 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1782, NULL, NULL, 'Sofratulle', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1783, NULL, NULL, 'Softex Maternity 45 cm 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1784, NULL, NULL, 'Spuit 1 Cc Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1785, NULL, NULL, 'Spuit 10 Cc Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1786, NULL, NULL, 'Spuit 20 Cc Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1787, NULL, NULL, 'Spuit 3 Cc Onemed', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1788, NULL, NULL, 'Spuit 3 Cc Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1789, NULL, NULL, 'Spuit 5 Cc Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1790, NULL, NULL, 'Spuit 50 Cc Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1791, NULL, NULL, 'Stik Blood Glucose Easy Touch', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1792, NULL, NULL, 'Stik Cholesterol Easy Touch', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1793, NULL, NULL, 'Stik Uric Acid Easy Touch', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1794, NULL, NULL, 'Stikpan Biru', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1795, NULL, NULL, 'Super Magic Man', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1796, NULL, NULL, 'Super Magic Premium 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1797, NULL, NULL, 'Supreme Pampers L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1798, NULL, NULL, 'Supreme Pampers M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1799, NULL, NULL, 'Supreme Pampers XL', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1800, NULL, NULL, 'Supreme Sensation 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1801, NULL, NULL, 'Supreme Sensation Kondom 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1802, NULL, NULL, 'Surflo Abbocath 22', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1803, NULL, NULL, 'Surflo Abbocath 24', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1804, NULL, NULL, 'Sutra Biru Gerigi 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1805, NULL, NULL, 'Sutra Biru Gerigi 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1806, 'AL - SUTCLAMER12', '8852961002126', 'Sutra Classic Merah 12', 3, 1, 0, 0, 'PT. DKT International', 19883, '1', NULL, NULL, NULL, '2023-08-21 14:22:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1807, NULL, NULL, 'Sutra Classic Merah 24', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1808, 'AL - SUTCLAMER3', '8852961002102', 'Sutra Classic Merah 3', 5, 1, 0, 0, 'PT. DKT International', 5583, '1', NULL, NULL, NULL, '2023-08-21 14:20:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1809, NULL, NULL, 'Sutra Lubricant 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1810, 'AL - SUTOKHIT12', '8852961003246', 'Sutra OK Hitam 12', 0, 1, 0, 0, 'PT. DKT International', 27417, '1', NULL, NULL, NULL, '2023-08-21 14:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1811, NULL, NULL, 'Sutra OK Hitam 24', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1812, 'AL - SUTOKHIT3', '8852961003222', 'Sutra OK Hitam 3', 5, 1, 0, 0, 'PT. DKT International', 7708, '1', NULL, NULL, NULL, '2023-08-21 14:13:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1813, NULL, NULL, 'Sutra Plus Abu abu 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1814, NULL, NULL, 'Sutra Plus Abu abu 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1815, NULL, NULL, 'Sweety L', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1816, NULL, NULL, 'Sweety M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1817, NULL, NULL, 'Sweety S', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1818, NULL, NULL, 'Sweety XL', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1819, NULL, NULL, 'Sweety XXL', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1820, NULL, NULL, 'Tensocrep 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1821, NULL, NULL, 'Tensocrep 4', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1822, NULL, NULL, 'Tensocrep 6', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1823, NULL, NULL, 'Termometer Digital Lentur Avico', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1824, NULL, NULL, 'Termometer Digital Lentur Dasmed', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1825, NULL, NULL, 'Termometer Digital Lentur General Care', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1826, NULL, NULL, 'Termometer Digital Lentur Magic Star', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1827, NULL, NULL, 'Termometer Digital Lentur One Care', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1828, NULL, NULL, 'Termometer Digital One Alpha 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1829, NULL, NULL, 'Termometer Digital One Alpha 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1830, NULL, NULL, 'Termometer Digital Thermo One', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1831, NULL, NULL, 'Termometer Safety Air Raksa', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1832, NULL, NULL, 'Tissue Green Soft 200', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1833, NULL, NULL, 'Tissue Green Soft 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1834, NULL, NULL, 'Tissue Jolly 1000 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1835, NULL, NULL, 'Tissue Jolly 250', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1836, NULL, NULL, 'Tissue Montis 250', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1837, NULL, NULL, 'Tissue Multi 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1838, NULL, NULL, 'Tissue Multi 250', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1839, NULL, NULL, 'Tissue Nice 200', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1840, NULL, NULL, 'Tissue Nice 250', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1841, NULL, NULL, 'Tissue Paseo 10 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1842, NULL, NULL, 'Tissue Paseo 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1843, NULL, NULL, 'Tissue Paseo 130 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1844, NULL, NULL, 'Tissue Paseo 200', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1845, NULL, NULL, 'Tissue Paseo 250', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1846, NULL, NULL, 'Tissue Paseo 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1847, NULL, NULL, 'Tissue Paseo 70', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1848, NULL, NULL, 'Tissue Tessa 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1849, NULL, NULL, 'Tissue Tessa 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1850, NULL, NULL, 'Tissue Tessa 250', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1851, NULL, NULL, 'Tissue Today 50', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1852, NULL, NULL, 'Tissue Wetkins', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1853, NULL, NULL, 'Ultrafix 10 cm X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1854, NULL, NULL, 'Ultrafix 5 cm X 1 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1855, NULL, NULL, 'Ultrafix 5 cm X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1856, NULL, NULL, 'Under Pad', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1857, NULL, NULL, 'Urinal Cowok', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1858, NULL, NULL, 'Urinal Wanita', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1859, NULL, NULL, 'Urine Bag ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1860, NULL, NULL, 'Vagiklin Tissue 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1861, NULL, NULL, 'Vagimax Tissue 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1862, NULL, NULL, 'Vivo 0 03 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1863, NULL, NULL, 'Vivo Endurance 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1864, NULL, NULL, 'Vivo Extra Sensation 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1865, NULL, NULL, 'Vivo Fruity Affair 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1866, NULL, NULL, 'Vivo Passionate Dots 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1867, NULL, NULL, 'We Care L 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1868, NULL, NULL, 'We Care M 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1869, NULL, NULL, 'We Care XL 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1870, NULL, NULL, 'Wing Needle 23 Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1871, NULL, NULL, 'Wing Needle 25 Terumo', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1872, NULL, NULL, 'Wintuell', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1873, NULL, NULL, 'WWZ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1874, NULL, NULL, 'Asepso Clean 80 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1875, NULL, NULL, 'Asepso Fresh 80 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1876, NULL, NULL, 'Asepso Merah 80 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1877, NULL, NULL, 'Asepso Moisture 80 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1878, NULL, NULL, 'Asepso Sulfur 80 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1879, NULL, NULL, 'Cusson Baby Oil Mild Gentle 100 ml Biru', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1880, NULL, NULL, 'Cusson Baby Oil Mild Gentle 50 ml Biru', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1881, NULL, NULL, 'Cusson Baby Oil Soft Smooth 100 ml Pink', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1882, NULL, NULL, 'Cusson Baby Oil Soft Smooth 50 ml Pink', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1883, NULL, NULL, 'Cusson Baby Soap Fresh Naurish 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1884, NULL, NULL, 'Cusson Baby Soap Fresh Naurish 75 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1885, NULL, NULL, 'Cusson Baby Soap Mild Gentle 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1886, NULL, NULL, 'Cusson Baby Soap Protect Care 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1887, NULL, NULL, 'Cusson Baby Soap Protect Care 75 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1888, NULL, NULL, 'Cusson Baby Soap Soft Smooth 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1889, NULL, NULL, 'Cusson Baby Soap Soft Smooth 75 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1890, NULL, NULL, 'Dettol Soap Cool 105 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1891, NULL, NULL, 'Dettol Soap Cool 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1892, NULL, NULL, 'Dettol Soap Fresh 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1893, NULL, NULL, 'Dettol Soap Fresh 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1894, NULL, NULL, 'Dettol Soap Lasting Fresh 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1895, NULL, NULL, 'Dettol Soap Lasting Fresh 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1896, NULL, NULL, 'Dettol Soap Original 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1897, NULL, NULL, 'Dettol Soap Original 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1898, NULL, NULL, 'Dettol Soap Pro Skin Sensitive 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1899, NULL, NULL, 'Dettol Soap Pro Skin Sensitive 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1900, NULL, NULL, 'Dettol Soap Re Energize 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1901, NULL, NULL, 'Dettol Soap ReEnergize 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1902, NULL, NULL, 'Dettol Soap Sensitif 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1903, NULL, NULL, 'Dettol Soap Sensitif 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1904, NULL, NULL, 'Dettol Soap Skin Care 105 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1905, NULL, NULL, 'Dettol Soap Skin Care 65 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1906, NULL, NULL, 'Enzim Fresh Mint 100 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1907, NULL, NULL, 'Enzim Mild 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1908, NULL, NULL, 'Holy Sabun Antiseptik 20 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1909, NULL, NULL, 'Holy Sabun Antiseptik 200 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1910, NULL, NULL, 'Holy Sabun Antiseptik 80 Gram ', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1911, NULL, NULL, 'JF Sulfur Acne Care 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1912, NULL, NULL, 'JF Sulfur Acne Protect Blemish Care 65 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1913, NULL, NULL, 'JF Sulfur Acne Protect Mild Care 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1914, NULL, NULL, 'JF Sulfur Acne Protect Oily Care 65 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1915, NULL, NULL, 'JF Sulfur Acne Protect Oily Care 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1916, NULL, NULL, 'JF Sulfur Acne Protect Sensitiv Care 65 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1917, NULL, NULL, 'JF Sulfur Acne Sport Care 65 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1918, NULL, NULL, 'JF Sulfur Anti Acne 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1919, NULL, NULL, 'JF Sulfur Blue Ocean 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1920, NULL, NULL, 'JF Sulfur Derma Protect Green Cool 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1921, NULL, NULL, 'JF Sulfur Derma Protect Blue Ocean 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1922, NULL, NULL, 'JF Sulfur Dermamed 90 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1923, NULL, NULL, 'Nourish Acne Plast Man', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1924, NULL, NULL, 'Nourish Acne Plast Women', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1925, NULL, NULL, 'Pepsodent White 120 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1926, NULL, NULL, 'Pepsodent White 190 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1927, NULL, NULL, 'Pepsodent White 25 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1928, NULL, NULL, 'Pepsodent White 75 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1929, NULL, NULL, 'Polident Flavour Free 20 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1930, NULL, NULL, 'Polident Flavour Free 60 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1931, 'UM - POLFREMIN20GRA', '8992695604767', 'Polident Fresh Mint 20 Gram', 3, 1, 0, 0, 'PT. Anugrah Pharmindo Lestari', 33000, '1', NULL, NULL, NULL, '2023-08-22 10:34:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1932, NULL, NULL, 'Polident Fresh Mint 60 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1933, NULL, NULL, 'Sensodyne Cool Gel 160 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1934, NULL, NULL, 'Sensodyne Coolgel 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1935, NULL, NULL, 'Sensodyne Freshmint 160 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1936, 'UM - SENFRE50GRA', '8992695705266', 'Sensodyne Freshmint 50 Gram', 5, 1, 0, 0, '', 13000, '1', NULL, NULL, NULL, '2023-08-22 15:15:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1937, NULL, NULL, 'Sensodyne Fresmint 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1938, NULL, NULL, 'Sensodyne Gen White 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1939, NULL, NULL, 'Sensodyne Gen White 50 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1940, NULL, NULL, 'Sensodyne Gentle White 160 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1941, NULL, NULL, 'Sensodyne Original 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1942, NULL, NULL, 'Sensodyne Rapid Relief 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1943, NULL, NULL, 'Sensodyne Repair Prot Ext Fresh 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1944, 'UM - ZINSHABOT170ML', '8781230901', 'Zinc Shampoo Botol 170 ml', 2, 1, 2, 0, 'Lion', 400, '1', NULL, NULL, NULL, '2023-08-01 16:52:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1945, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 3, 0, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:58:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1946, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 1, 0, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:58:02', 1, '2023-08-09 10:08:00', 1);
INSERT INTO `tx_produk` VALUES (1947, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 1, 0, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:57:59', 1, '2023-08-09 10:08:00', 1);
INSERT INTO `tx_produk` VALUES (1948, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 1, 0, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:57:55', 1, '2023-08-09 10:08:00', 1);
INSERT INTO `tx_produk` VALUES (1949, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 1, 2, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:57:50', 1, '2023-08-09 10:08:00', 1);
INSERT INTO `tx_produk` VALUES (1950, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 1, 2, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:57:47', 1, '2023-08-09 10:08:00', 1);
INSERT INTO `tx_produk` VALUES (1951, 'OB - VITTETTEL', '8992828831367', 'Vital Tetes Telinga', 6, 1, 1, 2, 'PT. Medikon', 13500, '1', NULL, NULL, NULL, '2023-08-09 15:57:41', 1, '2023-08-09 10:08:00', 1);
INSERT INTO `tx_produk` VALUES (1952, 'OB - INSTETMATHIJ', '8885015220061', 'Insto Tetes Mata 7,5 ml', 6, 1, 3, 0, 'PT. Pharma Health Care', 12750, '1', NULL, NULL, NULL, '2023-08-09 16:08:42', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1953, 'OB - ROHTETMAT', '8992821100026', 'Rohto Tetes Mata', 6, 1, 3, 0, 'PT. Rohto', 10417, '1', NULL, NULL, NULL, '2023-08-09 16:14:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1954, 'OB - FRELAV', '8997021870090', 'FreshCare Lavender', 5, 1, 3, 0, 'PT. Ultra Sakti', 10083, '1', NULL, NULL, NULL, '2023-08-09 16:17:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1955, 'OB - FREGRE', '8997021870052', 'FreshCare GreenTea', 5, 1, 3, 0, 'PT. Ultra Sakti', 10083, '1', NULL, NULL, NULL, '2023-08-09 16:21:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1956, 'OB - FREHOT', '8997021870151', 'FreshCare Hot', 5, 1, 3, 0, 'PT. Ultra Sakti', 10083, '1', NULL, NULL, NULL, '2023-08-09 16:23:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1957, 'OB - FREKUN', '8997021870137', 'FreshCare Kuning', 5, 1, 3, 0, 'PT. Ultra Sakti', 10083, '1', NULL, NULL, NULL, '2023-08-09 16:25:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1958, 'OB - SAF', '8995102800448', 'Safecare', 5, 1, 3, 0, 'PT. Surabaya Indah', 13958, '1', NULL, NULL, NULL, '2023-08-09 16:29:37', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1959, 'OB - FREPRE', '8997021872094', 'FreshCare PressRelax', 5, 1, 3, 0, 'PT. ULtra Sakti', 10250, '1', NULL, NULL, NULL, '2023-08-09 16:31:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1960, 'OB - PLO', '8992772613088', 'Plossa Panasin', 5, 1, 3, 0, 'PT. Capung Indah', 9167, '1', NULL, NULL, NULL, '2023-08-09 16:35:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1961, 'OB - PLOHIJ', '8992772613071', 'Plossa Hijau', 5, 1, 3, 0, 'PT. Capung Indah', 9167, '1', NULL, NULL, NULL, '2023-08-09 16:37:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1962, ' - PLOBIR', '8992772613064', 'Plossa Biru', 5, 1, 3, 0, 'PT. Capung Indah', 9167, '1', NULL, NULL, NULL, '2023-08-09 16:39:26', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1963, 'OB - BYEFEVDEW', '8992870712133', 'ByeBye Fever Dewasa', 4, 1, 3, 0, 'PT. Hisamitsu', 10500, '1', NULL, NULL, NULL, '2023-08-09 16:46:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1964, 'OB - KOYCAB', '8993338005033', 'Koyo Cabe', 4, 1, 3, 0, 'PT. Indo Abadi', 10125, '1', NULL, NULL, NULL, '2023-08-09 17:00:55', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1965, 'OB - BALTELTREJOY', '8993365030206', 'Balsem Telon Tresno Joyo', 5, 1, 3, 0, 'PT. Ultra Sakti', 7042, '1', NULL, NULL, NULL, '2023-08-10 13:55:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1966, 'OB - GPUKRI60G', '8993176721690', 'GPU Krim 60g', 5, 1, 3, 0, 'PT. Eagle', 8167, '1', NULL, NULL, NULL, '2023-08-10 14:31:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1967, 'OB - MINGAN', '8993176110142', 'Minyak Gandapura', 6, 1, 3, 0, 'PT. Cap Lang', 6833, '1', NULL, NULL, NULL, '2023-08-10 14:33:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1968, 'OB - GPUMIN30ML', '8993176110111', 'GPU Minyak 30 ml', 6, 1, 3, 0, 'PT. Eagle', 8000, '1', NULL, NULL, NULL, '2023-08-10 14:40:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1969, 'OB - GPUMIN60ML', '8993176110104', 'GPU Minyak 60 ml', 6, 1, 3, 0, 'PT. Eagle', 13875, '1', NULL, NULL, NULL, '2023-08-10 14:41:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1970, 'OB - PAR', '8993014522229', 'Parcok', 6, 1, 3, 0, 'Air Mancur', 6417, '1', NULL, NULL, NULL, '2023-08-10 14:53:13', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1971, 'OB - MEDOIL', '4897016459009', 'Medicated Oil 12ml', 6, 1, 3, 0, 'PT. Fitto', 16667, '1', NULL, NULL, NULL, '2023-08-10 14:55:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1972, 'OB - MINKAP3ML', '8994472000014', 'Minyak Kapak 3 ml', 5, 1, 3, 0, 'PT. Yahi Utama', 5225, '1', NULL, NULL, NULL, '2023-08-10 15:03:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1973, 'OB - MINKAP5ML', '8994472000021', 'Minyak Kapak 5 ml', 5, 1, 3, 0, 'PT. Yasi Utama', 9103, '1', NULL, NULL, NULL, '2023-08-10 15:02:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1974, ' - MINKAP10ML', '8994472000038', 'Minyak Kapak 10 ml', 5, 1, 3, 0, 'PT. Yasi Utama', 14091, '1', NULL, NULL, NULL, '2023-08-21 13:30:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1975, 'OB - MINTAWCC', '8997916248850 ', 'Minyak Tawon CC', 5, 1, 3, 0, 'Golden', 19747, '1', NULL, NULL, NULL, '2023-08-10 15:11:40', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1976, ' - MINTAWCC', '8997916248843', 'Minyak Tawon DD', 5, 1, 3, 0, 'Tawon', 26790, '1', NULL, NULL, NULL, '2023-08-10 15:13:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1977, 'OB - COUCOO5GRA', '4987176018083', 'Vicks Inhaler', 5, 1, 3, 0, 'Vicks', 17000, '1', NULL, NULL, NULL, '2023-08-10 15:23:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1978, 'OB - MYBABMINTELPLU', '8999908204202', ' My Baby Minyak Telon Plus 60ml', 6, 1, 3, 0, 'PT. Tempo', 14833, '1', NULL, NULL, NULL, '2023-08-19 10:56:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1979, 'OB - MENDRAH1', '8998168001118', 'Menthol Dragon H1', 5, 1, 3, 0, 'Dragon', 9600, '1', NULL, NULL, NULL, '2023-08-19 11:09:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1980, 'OB - MENDRAH2', '8998168001125', 'Menthol Dragon H2', 5, 1, 3, 0, 'Dragon', 7500, '1', NULL, NULL, NULL, '2023-08-19 11:12:44', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1981, 'OB - MENDRAHSB', '8998168001071', 'Menthol Dragon HSB ', 5, 1, 3, 0, 'Dragon', 29000, '1', NULL, NULL, NULL, '2023-08-19 11:17:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1982, 'OB - MINSERSITCAPLAN30M', '8993176111026', 'Minyak Sereh Sitronela Cap Lang 30ml', 6, 1, 3, 0, 'PT. Eagle Indo Pharma', 5167, '1', NULL, NULL, NULL, '2023-08-19 11:40:32', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1983, 'OB - MINTELCAPLAN30M', '8993176110135', 'Minyak Telon Cap Lang  30ml', 6, 1, 3, 0, 'PT. Eagle Indo Pharma', 8833, '1', NULL, NULL, NULL, '2023-08-19 11:52:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1984, 'OB - MINTELCAPGAJ60M', '8995179100182', 'Minyak Telon Cap Gajah 60ml', 6, 1, 3, 0, 'PT. USFI', 15083, '1', NULL, NULL, NULL, '2023-08-19 11:58:54', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1985, 'OB - NEWACNLOT10M', '8993035123368', 'New Acnol Lotion 10ml', 5, 1, 3, 0, 'PT. John Francis Laboratories', 13750, '1', NULL, NULL, NULL, '2023-08-19 12:43:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1986, 'OB - NEWACNLOT10M', '8993035123368', 'New Acnol Lotion 10ml', 5, 1, 3, 0, 'PT. John Francis Laboratories', 13750, '1', NULL, NULL, NULL, '2023-08-19 12:43:30', 1, '2023-08-19 07:08:00', 1);
INSERT INTO `tx_produk` VALUES (1987, 'OB - ALK70%100', '8995179100359', 'Alkohol 70% 100ml', 6, 1, 0, 0, 'PT. USFI', 9583, '1', NULL, NULL, NULL, '2023-08-19 12:52:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1988, 'OB - BEABRA', '8992696404441-', 'Bear Brand', 6, 1, 0, 0, 'PT. Nestle', 9000, '1', NULL, NULL, NULL, '2023-08-19 13:26:50', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1989, 'OB - BET15ML', '8992843100158', 'Betadin 15 ml', 6, 1, 5, 0, 'PT. Mahakam', 13750, '1', NULL, NULL, NULL, '2023-08-21 07:11:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1990, ' - ', '8992843100615', 'Betadine Feminim Hygiene 60 ml', 6, 1, 0, 0, 'PT. Mahakam', 32883, '', NULL, NULL, NULL, '2023-08-21 07:18:51', 1, '2023-08-21 02:08:00', 1);
INSERT INTO `tx_produk` VALUES (1991, ' - ', '8992843100615', 'Betadine Feminim Hygiene 60 ml', 6, 1, 0, 0, 'PT. Mahakam', 32883, '', NULL, NULL, NULL, '2023-08-21 07:18:57', 1, '2023-08-21 02:08:00', 1);
INSERT INTO `tx_produk` VALUES (1992, ' - ', '8992843100615', 'Betadine Feminim Hygiene 60 ml', 6, 1, 0, 0, 'PT. Mahakam', 32883, '1', NULL, NULL, NULL, '2023-08-21 07:19:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1993, ' - BETKUM100ML', '8992843121009', 'Betadine Kumur 100 ml', 6, 1, 0, 0, 'PT. Mahakam', 22500, '1', NULL, NULL, NULL, '2023-08-21 07:23:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1994, ' - BETKUM100ML', '8992843121009', 'Betadine Kumur 100 ml', 6, 1, 0, 0, 'PT. Mahakam', 22500, '', NULL, NULL, NULL, '2023-08-21 07:22:56', 1, '2023-08-21 02:08:00', 1);
INSERT INTO `tx_produk` VALUES (1995, 'OB - BIN7MASANG', '8993058304201', 'Bejo Bintang 7 Masuk Angin Sachet 15 ml', 4, 1, 0, 0, 'PT. Bintang Toedjoe', 2208, '1', NULL, NULL, NULL, '2023-08-22 08:44:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1996, 'OB - CALLOT60ML', '8993005123015', 'Caladin Lotion 60 ml', 6, 1, 0, 0, 'PT. Galenium Pharmasia Laboratories', 14583, '1', NULL, NULL, NULL, '2023-08-21 08:13:47', 1, '2023-08-21 03:08:00', 1);
INSERT INTO `tx_produk` VALUES (1997, 'OB - CALLOT60ML', '8993005123015', 'Caladin Lotion 60 ml', 6, 1, 0, 0, 'PT. Galenium Pharmasia Laboratories', 14583, '1', NULL, NULL, NULL, '2023-08-21 08:13:40', 1, '2023-08-21 03:08:00', 1);
INSERT INTO `tx_produk` VALUES (1998, 'OB - CALLOT60ML', '8993005123015', 'Caladine Lotion 60 ml', 6, 1, 0, 0, 'PT. Galenium Pharmasia Laboratories', 14583, '1', NULL, NULL, NULL, '2023-08-21 08:17:43', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1999, 'OB - CALPOW60GR', '8993005124012-', 'Caladine Powder 60 Gr', 5, 1, 0, 0, 'PT. Galenium Pharmasia Laboratories', 10500, '1', NULL, NULL, NULL, '2023-08-21 08:17:15', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2000, 'OB - ADESARKAL320ML', '8992772586016', 'Adem Sari Kaleng 320 ml', 6, 1, 0, 0, 'PT. Sari Enesis Indah', 5583, '1', NULL, NULL, NULL, '2023-08-21 08:21:29', 1, '2023-08-21 03:08:00', 1);
INSERT INTO `tx_produk` VALUES (2001, 'OB - ADESARKAL320ML', '8992772586016', 'Adem Sari Kaleng 320 ml', 6, 1, 0, 0, 'PT. Sari Enesis Indah', 5583, '1', NULL, NULL, NULL, '2023-08-21 08:21:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2002, 'OB - CAL', '8997010310156', 'Callusol', 6, 1, 0, 0, 'PT. Pratapa Nirmala', 28333, '1', NULL, NULL, NULL, '2023-08-21 08:25:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2003, 'OB - CEBTAB', '8997223540036', 'Cebadiar Tablet', 2, 1, 0, 0, 'PT. Ikong', 2850, '1', NULL, NULL, NULL, '2023-08-21 08:34:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2004, 'OB - COMTAB125MG', '8993212111102', 'Combantrin Syrup', 6, 1, 0, 0, 'PT. Plizer', 18000, '1', NULL, NULL, NULL, '2023-08-21 08:40:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2005, 'OB - COM', '8997012330664', 'Combicitrine', 6, 1, 0, 0, 'PT. Berlico Mulia Farma', 3208, '1', NULL, NULL, NULL, '2023-08-21 08:50:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2006, 'OB - DETCAI45ML', '8993560022006', 'Dettol Cair 45 ml', 6, 1, 0, 0, 'PT Reckitt Benckiser Indonesia', 10833, '1', NULL, NULL, NULL, '2023-08-21 09:31:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2007, 'OB - DIEDAYAOJIN30MLOBAMER', '6888245870091', 'Die Da Yao Jing 30 ml Obat Merah', 6, 1, 0, 0, 'PT. Saras Subur Abadi', 24167, '1', NULL, NULL, NULL, '2023-08-21 09:43:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2008, ' - EGOGUMORASAC20GR', '8993430169633', 'Egoji Gummy Orange Sachet 20 gr', 4, 1, 0, 0, 'Pt. Natural Food Succes', 7500, '1', NULL, NULL, NULL, '2023-08-22 08:51:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2009, ' - EGOGUMORASAC20GR', '8993430169626', 'Egoji Gummy Strawberry Sachet 20 gr', 4, 1, 0, 0, 'PT. Natural Food Succes', 7500, '1', NULL, NULL, NULL, '2023-08-22 08:50:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2010, 'OB - ESECAI10MLSAC', '8998898810240', 'Esemag Cair 10 ml Sachet', 4, 1, 0, 0, 'PT. Sido Muncul', 1600, '1', NULL, NULL, NULL, '2023-08-22 08:52:51', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2011, 'OB - FIEBLACOF3', '8997025201470', 'Fiesta Black Coffee 3', 5, 1, 0, 1, 'PT. NRS Global Patners', 11333, '1', NULL, NULL, NULL, '2023-08-21 12:03:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2012, 'OB - GENVIO', '', 'Gentian Violet', 5, 1, 0, 0, 'PT. Ciubros Farma', 3250, '1', NULL, NULL, NULL, '2023-08-21 11:03:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2013, 'OB - GOMCIT', '8997009230175', 'Gom Cito', 5, 1, 0, 0, 'PT. Ciubros Farma', 3167, '1', NULL, NULL, NULL, '2023-08-21 11:06:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2014, 'OB - NEWHAUFUNSAN', '8997001270070', 'New Hau Fung San', 6, 1, 0, 0, 'PT. Bintang Kupu Kupu', 5083, '1', NULL, NULL, NULL, '2023-08-21 11:45:23', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2015, ' - ', '8997208160044', 'Kakaktua Obat Gigi', 0, 1, 0, 0, 'PT. Samco Farma', 12000, '1', NULL, NULL, NULL, '2023-08-21 13:21:43', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2016, ' - ', '8997208160044', 'Kakaktua Obat Gigi', 0, 1, 0, 0, 'PT. Samco Farma', 12000, '', NULL, NULL, NULL, '2023-08-21 13:21:24', 1, '2023-08-21 08:08:00', 1);
INSERT INTO `tx_produk` VALUES (2017, 'OB - KEJBEL', '8992781210308', 'Keji Beling', 2, 1, 0, 0, 'PT. Borobudur', 9100, '1', NULL, NULL, NULL, '2023-08-21 13:45:12', 1, '2023-08-21 08:08:00', 1);
INSERT INTO `tx_produk` VALUES (2018, 'OB - KIR', '8991102800020', 'Kiranti', 6, 1, 0, 0, 'PT. Cayadewi Sehat Indonesia Abadi', 5333, '1', NULL, NULL, NULL, '2023-08-21 13:52:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2019, 'OB - KOMKIDOBH', '8993058302900', 'Komix Kid OBH 5 ml', 4, 1, 0, 0, 'PT. Bintang Toedjoe', 1000, '1', NULL, NULL, NULL, '2023-08-22 08:58:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2020, 'OB - KONKAYPUT30ML', '8998667400252', 'Konicare Kayu Putih 30 ml', 5, 1, 0, 0, 'PT. Konimex', 11333, '1', NULL, NULL, NULL, '2023-08-21 14:34:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2021, 'OB - KONTEL30ML', '8998667400276', 'Konicare Telon 30 ml', 5, 1, 0, 0, 'PT. Konimex', 11333, '1', NULL, NULL, NULL, '2023-08-21 14:34:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2022, 'OB - KONTELPLU30ML', '8998667400924', 'Konicare Telon Plus 30 ml', 5, 1, 0, 0, 'PT. Konimex', 12792, '1', NULL, NULL, NULL, '2023-08-21 14:33:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2023, ' - ', '4800136111047', 'Lactacyd Baby 60 ml', 6, 1, 0, 0, 'PT. Sanofi', 26792, '1', NULL, NULL, NULL, '2023-08-21 14:53:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2024, 'OB - MINKAYPUTGAJ30ML', '8995179100090', 'Minyak Kayu Putih Gajah 30 Ml', 6, 1, 0, 0, 'PT. USFI', 9583, '1', NULL, NULL, NULL, '2023-08-22 07:10:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2025, 'OB - MINKAYPUTGAJ60ML', '8995179100106', 'Minyak Kayu Putih Gajah 60 Ml', 6, 1, 0, 0, 'PT. USFI', 18250, '1', NULL, NULL, NULL, '2023-08-22 07:13:36', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2026, 'OB - MINKAYPUTLAN30ML', '8993176110081', 'Minyak Kayu Putih Lang 30 Ml', 6, 1, 0, 0, 'PT. EAGLE INDO PHARMA', 9625, '1', NULL, NULL, NULL, '2023-08-22 07:17:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2027, 'OB - MINKAYPUTLAN60ML', '8993176110074', 'Minyak Kayu Putih Lang 60 Ml', 6, 1, 0, 0, 'PT. EAGLE INDO PHARMA', 18500, '1', NULL, NULL, NULL, '2023-08-22 07:20:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2028, 'OB - MINKAYPUTLANPLU30ML', '8993176721966', 'Minyak Kayu Putih Lang Plus 30 Ml', 6, 1, 0, 0, 'PT. EAGLE INDO PHARMA', 10667, '1', NULL, NULL, NULL, '2023-08-22 07:25:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2029, 'OB - MINKAYPUTLANAROLAV30ML', '8993176720785', 'Minyak Kayu Putih Lang Aromaterapi Lavender 30 Ml', 6, 1, 0, 0, 'PT. EAGLE INDO PHARMA', 10667, '1', NULL, NULL, NULL, '2023-08-22 07:28:26', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2030, 'OB - KUNASASIDMUNSAC', '8998898809107', 'Kunyit Asam Sido Muncul Sachet', 4, 1, 0, 0, 'Sido Muncul', 1300, '1', NULL, NULL, NULL, '2023-08-22 09:00:46', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2031, 'OB - KUNASASIRSIDMUNSAC', '8998898825107', 'Kunyit Asam Sirih Sido Muncul Sachet', 4, 1, 0, 0, 'Sido Muncul', 1400, '1', NULL, NULL, NULL, '2023-08-22 09:00:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2032, 'OB - LISFRE100ML', '8992725910417', 'Listerine Freshburst 100 Ml', 6, 1, 0, 0, 'PT. LF Beauty Manufacturing Indonesia', 7917, '1', NULL, NULL, NULL, '2023-08-22 07:46:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2033, 'OB - LISCOOMIN100ML', '8992725910400', 'Listerine Cool Mint 100 Ml', 6, 1, 0, 0, 'PT. LF Beauty Manufacturing Indonesia', 7917, '1', NULL, NULL, NULL, '2023-08-22 07:49:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2034, 'OB - LISFRE250ML', '8992725910424', 'Listerine Freshburst 250 Ml', 6, 1, 0, 0, 'PT. LF Beauty Manufacturing Indonesia', 20000, '1', NULL, NULL, NULL, '2023-08-22 07:52:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2035, 'OB - LISCOOMIN250ML', '8992725910332', 'Listerine Cool Mint 250 Ml', 6, 1, 0, 0, 'PT. LF Beauty Manufacturing Indonesia', 20000, '1', NULL, NULL, NULL, '2023-08-22 07:55:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2036, 'OB - MADTJORISAC20GRA', '8993365170025', 'Madu TJ Original Sachet 20 Gram', 4, 1, 0, 0, 'PT. Ultra Sakti', 700, '1', NULL, NULL, NULL, '2023-08-22 09:02:15', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2037, 'OB - MIC5ML', '8993347006847', 'Microlax 5 Ml', 7, 1, 0, 0, 'PT. Faratu', 20000, '1', NULL, NULL, NULL, '2023-08-22 08:24:40', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2038, 'OB - PED50ML', '8993113021074', 'Peditox 50 Ml', 6, 1, 0, 0, 'PT. Pharma Health Care', 8833, '1', NULL, NULL, NULL, '2023-08-22 10:04:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2039, 'OB - PERWOOPEP', '8992858687101', 'Permen Woods Peppermint', 5, 1, 0, 0, 'PT. Kalbe Farma', 4600, '1', NULL, NULL, NULL, '2023-08-22 10:13:05', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2040, 'OB - PHA', '8992799160701', 'Pharmaton', 2, 1, 0, 0, 'PT. Sanofi', 22200, '1', NULL, NULL, NULL, '2023-08-22 10:22:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2041, ' - PROHERSAC15ML', '8992858564006', 'Promag Herbal Gazero Sachet 15 ml', 4, 1, 0, 0, 'PT. Kalbe Farma', 2166, '1', NULL, NULL, NULL, '2023-08-22 11:17:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2042, 'OB - RAPWAN', '8992003131206', 'Rapet Wangi', 3, 1, 0, 0, 'PT. Deltomed Laboratories', 10500, '1', NULL, NULL, NULL, '2023-08-22 11:47:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2043, 'OB - RIV100ML', '8995179100533', 'Rivanol 100 ml', 6, 1, 0, 0, 'PT. USFI', 3500, '1', NULL, NULL, NULL, '2023-08-22 11:53:06', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2044, 'AL - SUTBIRGER12', '8997013148688', 'Salep 88', 5, 1, 0, 2, 'PT. Meccaya', 10167, '1', NULL, NULL, NULL, '2023-08-22 12:27:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2045, ' - BEDSALPIN', '8995179100717', 'Bedak Salicyl Pink', 5, 1, 0, 0, 'PT. Usaha Sekawan Farmasi Indonesia', 5250, '1', NULL, NULL, NULL, '2023-08-22 13:15:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2046, 'OB - BEDSALMEN', '8995179100724', 'Bedak Salicyl Menthol', 5, 1, 0, 0, 'PT. Usaha Sekawan Farmasi Indonesia', 7333, '1', NULL, NULL, NULL, '2023-08-22 13:17:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2047, '2 - TALHER85GR', '8996200900092', 'Talk Herocyn 85 gr', 3, 1, 0, 2, 'PT. Coronet Crown', 11333, '1', NULL, NULL, NULL, '2023-08-22 13:24:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2048, 'OB - TALHER85GR', '8996200900047', 'Talk Herocyn Baby 100 gr', 6, 1, 0, 0, 'PT. Coronet Crown', 7542, '1', NULL, NULL, NULL, '2023-08-22 13:27:56', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2049, 'OB - TALNEOULT', '8997014050119', 'Talk Neo Ultracyn', 6, 1, 0, 0, 'PT. Henson Farma', 7542, '1', NULL, NULL, NULL, '2023-08-22 13:31:37', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2050, ' - ROHTETMAT', '8997234450010', 'Tilung', 6, 1, 0, 0, 'CV. Ibu Sri', 22000, '1', NULL, NULL, NULL, '2023-08-22 13:42:40', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2051, ' - MINTELCAPLAN30M', '8995179100175', 'Minyak Telon Cap Gajah 30 Ml', 6, 1, 0, 0, 'PT. USFI', 8250, '', NULL, NULL, NULL, '2023-08-22 13:45:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2052, ' - MINTELCAPLAN30M', '8995179100175', 'Minyak Telon Cap Gajah 30 Ml', 6, 1, 0, 0, 'PT. USFI', 8250, '1', NULL, NULL, NULL, '2023-08-22 13:45:54', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2053, 'OB - VERACNGEL10GRA', '8992828889887', 'Verile Acne Gel 10 Gram', 7, 1, 0, 0, 'PT. Medikon Prima Laboratories', 13833, '1', NULL, NULL, NULL, '2023-08-22 14:18:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2054, 'OB - WEM', '8997021870687', 'Welmove', 2, 1, 0, 0, 'PT. Ultra Sakti', 15250, '1', NULL, NULL, NULL, '2023-08-22 14:40:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2055, 'OB - LARBADBOT200ML', '8999988888989', 'Larutan Badak Botol 200 Ml', 6, 1, 0, 0, 'PT. Sinde Budi Sentosa', 3042, '1', NULL, NULL, NULL, '2023-08-22 14:54:16', 1, '2023-08-22 09:08:00', 1);
INSERT INTO `tx_produk` VALUES (2056, 'OB - LARBADBOT200ML', '8999988888989', 'Larutan Badak Botol 200 Ml', 6, 1, 0, 0, 'PT. Sinde Budi Sentosa', 3042, '1', NULL, NULL, NULL, '2023-08-22 14:53:48', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2057, 'OB - NOSSAL6GRA', '', 'Nosib Salep 6 Gram', 3, 1, 0, 0, '', 6458, '1', NULL, NULL, NULL, '2023-08-22 15:13:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2058, '3 - LARBADBOT200ML', '8999988888811', 'Larutan Badak Kaleng Jeruk 320 ml', 6, 1, 0, 0, 'PT. Sinde Budi Sentosa', 5292, '1', NULL, NULL, NULL, '2023-08-22 15:25:59', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2059, '3 - LARBADKALLEC320ML', '8999988888866', 'Larutan Badak Kaleng Leci 320 ml', 6, 1, 0, 0, 'PT. Sinde Budi Sentosa', 5292, '1', NULL, NULL, NULL, '2023-08-22 15:28:35', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2060, '3 - LARBADKALANG320ML', '8999988888859', 'Larutan Badak Kaleng Anggur 320 ml', 6, 1, 0, 0, 'PT. Sinde Budi Sentosa', 5292, '1', NULL, NULL, NULL, '2023-08-22 15:35:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2061, '3 - LARBADKALSTR320ML', '8999988888828', 'Larutan Badak Kaleng Strawberry 320 ml', 6, 1, 0, 0, 'PT. Sinde Budi Sentosa', 5292, '1', NULL, NULL, NULL, '2023-08-22 15:38:33', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2062, '3 - LARKAK3ANAKALLEC250ML', '8995227500995', 'Larutan Kaki 3 Anak Kaleng Leci 250 ml', 6, 1, 0, 0, 'PT. Kino Indonesia', 4667, '1', NULL, NULL, NULL, '2023-08-22 15:42:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2063, '3 - LARKAK3ANAKALLEC250ML', '8995227501015', 'Larutan Kaki 3 Anak Kaleng Strawberry 250 ml', 6, 1, 0, 0, 'PT. Kino Indonesia', 4667, '1', NULL, NULL, NULL, '2023-08-22 15:45:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2064, '3 - LARKAK3ANAKALJER250ML', '8995227501008', 'Larutan Kaki 3 Anak Kaleng Jeruk 250 ml', 6, 1, 0, 0, 'PT. Kino Indonesia', 4667, '1', NULL, NULL, NULL, '2023-08-22 15:47:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2065, '1 - CHANIGWIN9', '8993189230103', 'Charm Night Wings 9', 3, 1, 0, 0, 'PT. Uni Charm Inodneia', 7895, '1', NULL, NULL, NULL, '2023-08-23 15:23:17', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2066, '1 - LAUMAX8', '8992727000048', 'Laurier Maxi 8', 3, 1, 0, 0, 'PT. Kao Indonesia', 3630, '1', NULL, NULL, NULL, '2023-08-23 15:29:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2067, '1 - SENPOPDEW2+1M', '7237841213235', 'Sensi Popok Dewasa 2+1 M', 5, 1, 0, 0, 'PT. Arista Latindo', 9950, '1', NULL, NULL, NULL, '2023-08-23 15:33:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2068, 'AL - SENPOPDEW2+1L', '7237841213334', 'Sensi Popok Dewasa 2+1 L', 5, 1, 0, 0, 'PT. Arista Latindo', 11950, '1', NULL, NULL, NULL, '2023-08-23 15:39:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2069, 'AL - SENPOPDEW2+1XL', '7237841213433', 'Sensi Popok Dewasa 2+1 XL', 5, 1, 0, 0, 'PT. Arista Latindo', 16395, '1', NULL, NULL, NULL, '2023-08-23 15:37:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2070, '3 - SGMANA0-6BUL150', '8999099920509', 'SGM Ananda 0-6 Bulan 150g', 3, 1, 0, 0, 'PT. Sarihusada', 15125, '1', NULL, NULL, NULL, '2023-08-23 15:47:07', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2071, '3 - SGMANA6-1BUL150', '8999099920585', 'SGM Ananda 6-12 Bulan 150g', 3, 1, 0, 0, 'PT. Sarihusada', 15115, '1', NULL, NULL, NULL, '2023-08-23 15:49:03', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2072, 'UM - DIASWE25', '8992802602518', 'DIabetasol  Sweetener 25', 3, 1, 0, 0, 'PT. Sanghiang Perkasa', 19990, '1', NULL, NULL, NULL, '2023-08-23 15:51:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2073, ' - TROSLICLA25', '749921001047', 'Tropicana Slim Classic 25', 3, 1, 0, 0, 'PT. Nutrifood Indonesia', 23425, '1', NULL, NULL, NULL, '2023-08-23 15:56:20', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2074, '3 - TROSLIDIA25', '749921001122', 'Tropicana Slim Diabtx 25', 3, 1, 0, 0, 'PT. Nutrifood ', 24475, '1', NULL, NULL, NULL, '2023-08-23 15:58:08', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2075, 'OB - PANANA212YEATAB', '8992695160201', 'Panadol Anak 2 12 Years Tablet', 2, 1, 0, 0, 'PT. Sterling Product Indonesia', 14000, '1', NULL, NULL, NULL, '2023-08-23 16:29:22', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2076, 'OB - CHRSAC', '8997011910010', 'Chrysanthemum Sachet', 4, 1, 0, 0, 'PT. Perdana Sakti Indonesia', 2800, '1', NULL, NULL, NULL, '2023-08-23 17:03:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2077, 'OB - OBABATIBUDANANA75ML', '081364361709', 'Obat Batuk Ibu Dan Anak 75 ml', 6, 1, 0, 0, 'PT. Sentosa Karya Gemilang', 24000, '1', NULL, NULL, NULL, '2023-08-23 17:15:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2078, 'OB - ACYTAB400HEX', '', 'Acyclovir Tablet 400mg HJ', 1, 1, 0, 0, 'HEXA', 643, '1', NULL, NULL, NULL, '2023-08-25 20:40:09', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2079, 'OB - BET0,1CRE5GR', '', 'Bethamethasone 0,1% Cream 5 gr', 7, 1, 0, 0, 'FM', 2934, '1', NULL, NULL, NULL, '2023-08-25 20:22:30', 1, '2023-08-25 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (2080, 'OB - BET0,1CRE5GR', '', 'Betamethasone 0,1% Cream 5 gr', 7, 1, 0, 0, 'FM', 2934, '1', NULL, NULL, NULL, '2023-08-25 20:22:10', 1, '2023-08-25 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (2081, 'OB - BET0,1CRE5GR', '', 'Betamethasone 0,1% Cream 5 gr', 7, 1, 0, 0, 'FM', 2934, '1', NULL, NULL, NULL, '2023-08-25 20:22:49', 1, '2023-08-25 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (2082, 'OB - BET0,1CRE5GR', '', 'Betamethasone 0,1% Cream 5 gr', 7, 1, 0, 0, 'FM', 2934, '1', NULL, NULL, NULL, '2023-08-25 20:22:00', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2083, 'OB - DICSOD50MG', '', 'Diclofenac Sodium 50 mg', 1, 1, 0, 0, 'SAMCO', 131, '1', NULL, NULL, NULL, '2023-08-25 20:39:49', 1, '2023-08-25 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (2084, 'OB - DICSOD50MG', '', 'Natrium Diclofenac 50 mg SAMCO', 1, 1, 0, 0, 'SAMCO', 131, '1', NULL, NULL, NULL, '2023-08-25 20:43:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2085, ' - NATDIC50MGSAM', '', 'Kalium Diclofenac 50 mg HEXA', 1, 1, 0, 0, 'HEX', 447, '', NULL, NULL, NULL, '2023-08-25 20:44:56', 1, '2023-08-25 15:08:00', 1);
INSERT INTO `tx_produk` VALUES (2086, ' - NATDIC50MGSAM', '', 'Kalium Diclofenac 50 mg HEXA', 1, 1, 0, 0, 'HEX', 447, '1', NULL, NULL, NULL, '2023-08-25 20:45:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2087, 'OB - METPRETAB4MGDEX', '', 'Methyl Prednisolone Tablet 4 mg DEXA', 1, 1, 0, 0, 'DEXA', 174, '1', NULL, NULL, NULL, '2023-08-25 20:55:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2088, 'OB - OMEKAP20MGERR', '', 'Omeprazole Kapsul 20 mg HEX', 1, 1, 0, 0, 'HEXA', 371, '1', NULL, NULL, NULL, '2023-08-25 21:00:10', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2089, ' - AMOTAB500MGERR', '', 'Amoxicillin Kapsul 500 mg HEX', 1, 1, 0, 0, 'HEXA', 448, '1', NULL, NULL, NULL, '2023-08-25 21:06:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2090, 'OB - DEXPLUTAB', '', 'Dexteem Plus Tablet', 1, 1, 0, 0, '', 275, '1', NULL, NULL, NULL, '2023-08-25 21:12:53', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2091, 'OB - ERPTAB', '', 'Erphaflam Tab', 1, 1, 0, 0, '', 297, '1', NULL, NULL, NULL, '2023-08-25 22:11:37', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2092, 'OB - GRATAB', '', 'Graxine Tablet', 1, 1, 0, 0, '', 215, '1', NULL, NULL, NULL, '2023-08-25 22:18:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2093, 'OB - BIOTAB', '', 'Biomega Tablet', 1, 1, 0, 0, '', 564, '1', NULL, NULL, NULL, '2023-08-25 22:25:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2094, 'OB - BROELI60ML', '', 'Bronkris Tablet', 1, 1, 0, 0, '', 166, '1', NULL, NULL, NULL, '2023-08-25 22:37:01', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2095, 'OB - GLITAB2MGHJ', '', 'Glimepiride Tablet 2 mg HJ', 1, 1, 0, 0, 'Hexa', 245, '1', NULL, NULL, NULL, '2023-08-26 07:47:04', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2096, 'OB - GLITAB3MGHJ', '', 'Glimepiride Tablet 3 mg HJ', 1, 1, 0, 0, 'Hexa', 456, '1', NULL, NULL, NULL, '2023-08-26 07:49:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2097, 'OB - GLUTAB250MGHJ', '', 'Glucosamine Tablet 250 Mg HJ', 1, 1, 0, 0, 'Hexa', 553, '1', NULL, NULL, NULL, '2023-08-26 07:51:37', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2098, 'OB - LANKAP30MGIFR', '', 'Lansoprazole Kapsul 30 mg IFR', 1, 1, 0, 0, 'Ifars', 677, '1', NULL, NULL, NULL, '2023-08-26 08:33:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2099, 'OB - ASAMEFTAB500MGAFI', '', 'Asam Mefenamat Tablet 500 mg AFI', 1, 1, 0, 0, 'AFI', 169, '1', NULL, NULL, NULL, '2023-08-26 08:36:29', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2100, 'OB - MELTAB15MGHJ', '', 'Meloxicam Tablet 15 mg HJ', 1, 1, 0, 0, 'Hexa', 388, '1', NULL, NULL, NULL, '2023-08-26 08:38:47', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2101, 'OB - ATMTAB', '', 'Atmacid Tablet ', 2, 1, 0, 0, '', 3074, '1', NULL, NULL, NULL, '2023-08-26 08:56:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2102, 'OB - DEXTAB0,5MG', '', 'Dexaharsen Tablet 0,5 Mg', 2, 1, 0, 0, '', 1674, '1', NULL, NULL, NULL, '2023-08-26 09:14:34', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2103, 'OB - DEXTAB0,7MG', '', 'Dexaharsen Tablet 0,75 Mg', 2, 1, 0, 0, '', 1899, '1', NULL, NULL, NULL, '2023-08-26 09:16:28', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2104, 'OB - DANTAB0,5MG', '', 'Danasone Tablet 0,5 Mg', 2, 1, 0, 0, '', 967, '1', NULL, NULL, NULL, '2023-08-26 09:18:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2105, 'OB - DAPSIR60ML', '', 'Dapyrin Sirup 60 ml', 6, 1, 0, 0, '', 6877, '1', NULL, NULL, NULL, '2023-08-26 09:20:02', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2106, 'OB - ANAFORTAB500MG', '', 'Anastan Forte Tablet 500 Mg', 2, 1, 0, 0, '', 3438, '1', NULL, NULL, NULL, '2023-08-26 09:22:49', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2107, 'OB - ACITAB200MG', '', 'Acifar Tablet 200 Mg', 2, 1, 0, 0, '', 4918, '1', NULL, NULL, NULL, '2023-08-26 09:28:24', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2108, 'OB - ALOTAB100MG', '', 'Alofar Tablet 100 Mg', 2, 1, 0, 0, '', 2645, '1', NULL, NULL, NULL, '2023-08-26 09:30:12', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2109, 'OB - ALOTAB300MG', '', 'Alofar Tablet 300 Mg', 2, 1, 0, 0, '', 5894, '1', NULL, NULL, NULL, '2023-08-26 09:31:38', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2110, 'OB - ANETAB', '', 'Anelat Tablet', 2, 1, 0, 0, '', 1398, '1', NULL, NULL, NULL, '2023-08-26 09:32:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2111, 'OB - ARMCRE5GR', '', 'Armacort Cream 5 Gr', 7, 1, 0, 0, '', 6719, '1', NULL, NULL, NULL, '2023-08-26 09:34:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2112, 'OB - CALPLUTAB', '', 'Calcifar Plus Tablet', 2, 1, 0, 0, '', 1785, '1', NULL, NULL, NULL, '2023-08-26 09:35:52', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2113, 'OB - CAZDRO15ML', '', 'Cazetin Drops 15 ml', 6, 1, 0, 0, '', 18233, '1', NULL, NULL, NULL, '2023-08-26 09:37:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2114, 'OB - CLOCRE5GR', '', 'Clonaderm Cream 5 Gr', 7, 1, 0, 0, '', 7256, '1', NULL, NULL, NULL, '2023-08-26 09:39:16', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2115, 'OB - DIOTAB500MG', '', 'Dionicol Tablet 500 Mg', 2, 1, 0, 0, '', 11005, '1', NULL, NULL, NULL, '2023-08-26 09:42:21', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2116, 'OB - DIODRYSIR60ML', '', 'Dionicol Dry Sirup 60 ml', 6, 1, 0, 0, '', 8401, '1', NULL, NULL, NULL, '2023-08-26 09:44:18', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2117, 'OB - ELOCRE5GR', '', 'Elomox Cream 5 Gr', 7, 1, 0, 0, '', 8075, '1', NULL, NULL, NULL, '2023-08-26 09:45:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2118, 'OB - FARTAB500MG', '', 'Fargetix Tablet 500 Mg', 2, 1, 0, 0, '', 2889, '1', NULL, NULL, NULL, '2023-08-26 09:52:31', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2119, 'OB - FARTAB', '', 'Farizol Tablet', 2, 1, 0, 0, '', 3107, '1', NULL, NULL, NULL, '2023-08-26 09:53:55', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2120, 'OB - FARTAB400MG', '', 'Farsifen Tablet  400 Mg', 2, 1, 0, 0, '', 3955, '1', NULL, NULL, NULL, '2023-08-26 09:56:11', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2121, 'OB - FARTAB200MG', '', 'Farsifen Tablet 200 Mg', 2, 1, 0, 0, '', 2260, '1', NULL, NULL, NULL, '2023-08-26 09:57:39', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2122, 'OB - FARFORSIR60ML', '', 'Farsifen Forte Sirup 60 ml', 6, 1, 0, 0, '', 6798, '1', NULL, NULL, NULL, '2023-08-26 10:01:30', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2123, 'OB - FARPLUTAB', '', 'Farsifen Plus Tablet', 2, 1, 0, 0, '', 3300, '1', NULL, NULL, NULL, '2023-08-26 10:03:25', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2124, 'OB - FARSIR60ML', '', 'Farsifen Sirup 60 ml', 6, 1, 0, 0, '', 5495, '1', NULL, NULL, NULL, '2023-08-26 10:05:36', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2125, 'OB - FASFORTAB', '', 'Fasiprim Forte Tablet', 2, 1, 0, 0, '', 5059, '1', NULL, NULL, NULL, '2023-08-26 10:15:42', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2126, 'OB - LERSIR60ML', '', 'Lerzin Sirup 60 ml', 6, 1, 0, 0, '', 5521, '1', NULL, NULL, NULL, '2023-08-26 10:29:27', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (2127, 'OB - RHETAB4MG', '', 'Rhemafar Tablet 4 Mg', 2, 1, 0, 0, '', 3865, '1', NULL, NULL, NULL, '2023-08-26 10:34:40', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 544 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tx_produk_harga` VALUES (37, 28, 1, 420, NULL, 'dokter', NULL, 2, '2023-07-16 22:05:57', NULL, '2023-08-22 09:53:23', 1, '2023-08-22 04:08:00', 1);
INSERT INTO `tx_produk_harga` VALUES (38, 28, 2, 430, 100, NULL, NULL, 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (39, 28, 3, 420, NULL, NULL, 'y', 2, '2023-07-16 22:05:57', NULL, '2023-07-16 22:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (40, 29, 4, 500, NULL, NULL, NULL, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (41, 29, 1, 430, NULL, '-', NULL, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (42, 29, 2, 420, 1000, NULL, NULL, 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (43, 29, 3, 450, NULL, NULL, 'y', 2, '2023-07-19 10:10:54', NULL, '2023-07-19 10:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (44, 1944, 4, 500, NULL, NULL, NULL, 1, '2023-08-01 16:52:41', NULL, '2023-08-01 16:52:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (45, 1944, 1, 450, NULL, 'beli 2', NULL, 1, '2023-08-01 16:52:41', NULL, '2023-08-01 16:52:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (46, 1944, 2, 430, 100, NULL, NULL, 1, '2023-08-01 16:52:41', NULL, '2023-08-01 16:52:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (47, 1944, 3, 430, NULL, NULL, 'y', 1, '2023-08-01 16:52:41', NULL, '2023-08-01 16:52:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (48, 1944, 4, 500, NULL, NULL, NULL, 1, '2023-08-01 23:09:05', NULL, '2023-08-01 23:09:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (49, 1944, 2, 430, 100, NULL, NULL, 1, '2023-08-01 23:09:05', NULL, '2023-08-01 23:09:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (50, 29, 4, 500, NULL, NULL, NULL, 1, '2023-08-01 23:10:41', NULL, '2023-08-01 23:10:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (51, 29, 2, 420, 1000, NULL, NULL, 1, '2023-08-01 23:10:41', NULL, '2023-08-01 23:10:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (52, 29, 4, 500, NULL, NULL, NULL, 1, '2023-08-01 23:13:49', NULL, '2023-08-01 23:13:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (53, 29, 2, 420, 1000, NULL, NULL, 1, '2023-08-01 23:13:49', NULL, '2023-08-01 23:15:02', 1, '2023-08-01 18:08:00', 1);
INSERT INTO `tx_produk_harga` VALUES (54, 29, 2, 420, 1000, NULL, NULL, 1, '2023-08-01 23:13:49', NULL, '2023-08-01 23:15:02', 1, '2023-08-01 18:08:00', 1);
INSERT INTO `tx_produk_harga` VALUES (55, 29, 4, 500, NULL, NULL, NULL, 1, '2023-08-01 23:15:08', NULL, '2023-08-01 23:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (56, 29, 2, 420, 1000, NULL, NULL, 1, '2023-08-01 23:15:08', NULL, '2023-08-01 23:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (57, 29, 2, 420, 1000, NULL, NULL, 1, '2023-08-01 23:15:08', NULL, '2023-08-01 23:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (58, 297, 4, 1500, NULL, NULL, NULL, 1, '2023-08-22 08:43:05', NULL, '2023-08-22 08:43:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (59, 297, 1, 1500, NULL, '', NULL, 1, '2023-08-09 15:22:15', NULL, '2023-08-09 15:22:15', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (60, 297, 2, 1300, 10, NULL, NULL, 1, '2023-08-09 15:22:15', NULL, '2023-08-09 15:22:15', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (61, 297, 3, 1500, NULL, NULL, 'y', 1, '2023-08-09 15:22:15', NULL, '2023-08-09 15:22:15', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (62, 1945, 4, 16500, NULL, NULL, NULL, 1, '2023-08-09 16:02:56', NULL, '2023-08-09 16:02:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (63, 1945, 1, 16500, NULL, '', NULL, 1, '2023-08-09 16:02:56', NULL, '2023-08-09 16:02:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (64, 1945, 2, 16200, 5, NULL, NULL, 1, '2023-08-09 16:02:56', NULL, '2023-08-09 16:02:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (65, 1945, 3, 16200, NULL, NULL, 'y', 1, '2023-08-09 16:02:56', NULL, '2023-08-09 16:02:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (66, 1952, 4, 15500, NULL, NULL, NULL, 1, '2023-08-09 16:11:31', NULL, '2023-08-09 16:11:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (67, 1952, 1, 15500, NULL, '', NULL, 1, '2023-08-09 16:11:31', NULL, '2023-08-09 16:11:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (68, 1952, 2, 15300, 5, NULL, NULL, 1, '2023-08-09 16:11:31', NULL, '2023-08-09 16:11:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (69, 1952, 3, 15300, NULL, NULL, 'y', 1, '2023-08-09 16:11:31', NULL, '2023-08-09 16:11:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (70, 1953, 4, 12500, NULL, NULL, NULL, 1, '2023-08-09 16:14:50', NULL, '2023-08-09 16:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (71, 1953, 1, 12500, NULL, '.', NULL, 1, '2023-08-09 16:14:50', NULL, '2023-08-09 16:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (72, 1953, 2, 12500, 5, NULL, NULL, 1, '2023-08-09 16:14:50', NULL, '2023-08-09 16:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (73, 1953, 3, 12500, NULL, NULL, 'y', 1, '2023-08-09 16:14:50', NULL, '2023-08-09 16:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (74, 1954, 4, 12500, NULL, NULL, NULL, 1, '2023-08-09 16:18:23', NULL, '2023-08-09 16:18:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (75, 1954, 1, 12500, NULL, '.', NULL, 1, '2023-08-09 16:18:23', NULL, '2023-08-09 16:18:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (76, 1954, 2, 12500, 10, NULL, NULL, 1, '2023-08-09 16:18:23', NULL, '2023-08-09 16:18:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (77, 1954, 3, 12100, NULL, NULL, 'y', 1, '2023-08-09 16:18:23', NULL, '2023-08-09 16:18:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (78, 1955, 4, 12500, NULL, NULL, NULL, 1, '2023-08-09 16:21:49', NULL, '2023-08-09 16:21:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (79, 1955, 1, 12500, NULL, '.', NULL, 1, '2023-08-09 16:21:49', NULL, '2023-08-09 16:21:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (80, 1955, 2, 12100, 10, NULL, NULL, 1, '2023-08-09 16:21:49', NULL, '2023-08-09 16:21:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (81, 1955, 3, 12100, NULL, NULL, 'y', 1, '2023-08-09 16:21:49', NULL, '2023-08-09 16:21:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (82, 1956, 4, 12500, NULL, NULL, NULL, 1, '2023-08-09 16:24:02', NULL, '2023-08-09 16:24:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (83, 1956, 1, 12500, NULL, '.', NULL, 1, '2023-08-09 16:24:02', NULL, '2023-08-09 16:24:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (84, 1956, 2, 12100, 10, NULL, NULL, 1, '2023-08-09 16:24:02', NULL, '2023-08-09 16:24:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (85, 1956, 3, 12100, NULL, NULL, 'y', 1, '2023-08-09 16:24:02', NULL, '2023-08-09 16:24:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (86, 1957, 4, 12500, NULL, NULL, NULL, 1, '2023-08-09 16:26:01', NULL, '2023-08-09 16:26:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (87, 1957, 1, 12500, NULL, '.', NULL, 1, '2023-08-09 16:26:01', NULL, '2023-08-09 16:26:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (88, 1957, 2, 12500, 10, NULL, NULL, 1, '2023-08-09 16:26:01', NULL, '2023-08-09 16:26:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (89, 1957, 3, 12500, NULL, NULL, 'y', 1, '2023-08-09 16:26:01', NULL, '2023-08-09 16:26:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (90, 1958, 4, 16900, NULL, NULL, NULL, 1, '2023-08-09 16:29:37', NULL, '2023-08-09 16:29:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (91, 1958, 1, 16900, NULL, '.', NULL, 1, '2023-08-09 16:29:37', NULL, '2023-08-09 16:29:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (92, 1958, 2, 16900, 5, NULL, NULL, 1, '2023-08-09 16:29:37', NULL, '2023-08-09 16:29:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (93, 1958, 3, 16900, NULL, NULL, 'y', 1, '2023-08-09 16:29:37', NULL, '2023-08-09 16:29:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (94, 1959, 4, 12500, NULL, NULL, NULL, 1, '2023-08-09 16:32:08', NULL, '2023-08-09 16:32:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (95, 1960, 4, 11000, NULL, NULL, NULL, 1, '2023-08-09 16:36:19', NULL, '2023-08-09 16:36:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (96, 1961, 4, 11000, NULL, NULL, NULL, 1, '2023-08-09 16:39:13', NULL, '2023-08-09 16:39:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (97, 1962, 4, 11000, NULL, NULL, NULL, 1, '2023-08-09 16:39:26', NULL, '2023-08-09 16:39:26', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (98, 1507, 4, 7850, NULL, NULL, NULL, 1, '2023-08-22 08:47:36', NULL, '2023-08-22 08:47:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (99, 1506, 4, 11000, NULL, NULL, NULL, 1, '2023-08-22 08:47:58', NULL, '2023-08-22 08:47:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (100, 1963, 4, 12700, NULL, NULL, NULL, 1, '2023-08-22 08:48:16', NULL, '2023-08-22 08:48:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (101, 1676, 4, 6000, NULL, NULL, NULL, 1, '2023-08-22 08:58:54', NULL, '2023-08-22 08:58:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (102, 1675, 4, 7300, NULL, NULL, NULL, 1, '2023-08-22 08:59:17', NULL, '2023-08-22 08:59:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (103, 1623, 4, 7700, NULL, NULL, NULL, 1, '2023-08-22 09:00:07', NULL, '2023-08-22 09:00:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (104, 1622, 4, 7700, NULL, NULL, NULL, 1, '2023-08-22 08:59:52', NULL, '2023-08-22 08:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (105, 1964, 4, 12000, NULL, NULL, NULL, 1, '2023-08-22 08:59:40', NULL, '2023-08-22 08:59:40', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (106, 600, 4, 18600, NULL, NULL, NULL, 1, '2023-08-10 13:43:43', NULL, '2023-08-10 13:43:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (107, 603, 4, 18600, NULL, NULL, NULL, 1, '2023-08-10 13:45:42', NULL, '2023-08-10 13:45:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (108, 596, 4, 18600, NULL, NULL, NULL, 1, '2023-08-10 13:47:17', NULL, '2023-08-10 13:47:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (109, 598, 4, 14800, NULL, NULL, NULL, 1, '2023-08-10 13:48:56', NULL, '2023-08-10 13:48:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (110, 594, 4, 14800, NULL, NULL, NULL, 1, '2023-08-10 13:50:49', NULL, '2023-08-10 13:50:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (111, 601, 4, 14800, NULL, NULL, NULL, 1, '2023-08-10 13:52:31', NULL, '2023-08-10 13:52:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (112, 1965, 4, 8500, NULL, NULL, NULL, 1, '2023-08-10 13:56:00', NULL, '2023-08-10 13:56:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (113, 556, 4, 13800, NULL, NULL, NULL, 1, '2023-08-10 13:57:56', NULL, '2023-08-10 13:57:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (114, 554, 4, 9300, NULL, NULL, NULL, 1, '2023-08-10 14:00:32', NULL, '2023-08-10 14:00:32', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (115, 562, 4, 14300, NULL, NULL, NULL, 1, '2023-08-10 14:03:38', NULL, '2023-08-10 14:03:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (116, 548, 4, 12200, NULL, NULL, NULL, 1, '2023-08-10 14:04:54', NULL, '2023-08-10 14:04:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (117, 545, 4, 12200, NULL, NULL, NULL, 1, '2023-08-10 14:06:48', NULL, '2023-08-10 14:06:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (118, 621, 4, 8700, NULL, NULL, NULL, 1, '2023-08-10 14:10:05', NULL, '2023-08-10 14:10:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (119, 549, 4, 5000, NULL, NULL, NULL, 1, '2023-08-10 14:13:01', NULL, '2023-08-10 14:13:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (120, 550, 4, 9300, NULL, NULL, NULL, 1, '2023-08-10 14:13:56', NULL, '2023-08-10 14:13:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (121, 590, 4, 11200, NULL, NULL, NULL, 1, '2023-08-10 14:16:06', NULL, '2023-08-10 14:16:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (122, 1966, 4, 9900, NULL, NULL, NULL, 1, '2023-08-10 14:31:41', NULL, '2023-08-10 14:31:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (123, 1967, 4, 8200, NULL, NULL, NULL, 1, '2023-08-10 14:34:16', NULL, '2023-08-10 14:34:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (124, 589, 4, 16200, NULL, NULL, NULL, 1, '2023-08-10 14:37:48', NULL, '2023-08-10 14:37:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (125, 1969, 4, 16700, NULL, NULL, NULL, 1, '2023-08-10 14:42:13', NULL, '2023-08-10 14:42:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (126, 1968, 4, 9600, NULL, NULL, NULL, 1, '2023-08-10 14:45:11', NULL, '2023-08-10 14:45:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (127, 1970, 4, 7500, NULL, NULL, NULL, 1, '2023-08-10 14:53:25', NULL, '2023-08-10 14:53:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (128, 1971, 4, 20000, NULL, NULL, NULL, 1, '2023-08-10 14:55:49', NULL, '2023-08-10 14:55:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (129, 1972, 4, 6300, NULL, NULL, NULL, 1, '2023-08-10 15:03:14', NULL, '2023-08-10 15:03:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (130, 1973, 4, 11000, NULL, NULL, NULL, 1, '2023-08-10 15:02:47', NULL, '2023-08-10 15:02:47', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (131, 1974, 4, 17000, NULL, NULL, NULL, 1, '2023-08-21 13:30:25', NULL, '2023-08-21 13:30:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (132, 1975, 4, 23000, NULL, NULL, NULL, 1, '2023-08-10 15:11:50', NULL, '2023-08-10 15:11:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (133, 1976, 4, 31000, NULL, NULL, NULL, 1, '2023-08-10 15:13:30', NULL, '2023-08-10 15:13:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (134, 575, 4, 10400, NULL, NULL, NULL, 1, '2023-08-21 08:59:17', NULL, '2023-08-21 08:59:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (135, 573, 4, 30300, NULL, NULL, NULL, 1, '2023-08-21 08:52:55', NULL, '2023-08-21 08:52:55', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (136, 579, 4, 10400, NULL, NULL, NULL, 1, '2023-08-10 15:20:53', NULL, '2023-08-10 15:20:53', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (137, 1977, 4, 20400, NULL, NULL, NULL, 1, '2023-08-10 15:23:11', NULL, '2023-08-10 15:23:12', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (138, 654, 4, 8500, NULL, NULL, NULL, 1, '2023-08-10 15:24:24', NULL, '2023-08-10 15:24:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (139, 1978, 4, 17800, NULL, NULL, NULL, 1, '2023-08-19 10:56:38', NULL, '2023-08-19 10:56:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (140, 1979, 4, 11600, NULL, NULL, NULL, 1, '2023-08-19 11:09:29', NULL, '2023-08-19 11:09:29', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (141, 1980, 4, 9000, NULL, NULL, NULL, 1, '2023-08-19 11:13:10', NULL, '2023-08-19 11:13:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (142, 1981, 4, 34800, NULL, NULL, NULL, 1, '2023-08-19 11:18:08', NULL, '2023-08-19 11:18:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (143, 1982, 4, 6300, NULL, NULL, NULL, 1, '2023-08-19 11:42:09', NULL, '2023-08-19 11:42:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (144, 1983, 4, 10600, NULL, NULL, NULL, 1, '2023-08-19 11:53:00', NULL, '2023-08-19 11:53:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (145, 1984, 4, 18100, NULL, NULL, NULL, 1, '2023-08-19 11:59:16', NULL, '2023-08-19 11:59:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (146, 1985, 4, 16500, NULL, NULL, NULL, 1, '2023-08-19 12:44:07', NULL, '2023-08-19 12:44:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (147, 30, 4, 2500, NULL, NULL, NULL, 1, '2023-08-22 08:39:54', NULL, '2023-08-22 08:39:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (148, 1987, 4, 11500, NULL, NULL, NULL, 1, '2023-08-19 12:52:38', NULL, '2023-08-19 12:52:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (149, 31, 4, 19000, NULL, NULL, NULL, 1, '2023-08-22 08:40:29', NULL, '2023-08-22 08:40:29', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (150, 1344, 4, 8500, NULL, NULL, NULL, 1, '2023-08-19 13:16:42', NULL, '2023-08-19 13:16:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (151, 1342, 4, 9000, NULL, NULL, NULL, 1, '2023-08-19 13:04:05', NULL, '2023-08-19 13:04:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (152, 295, 4, 3500, NULL, NULL, NULL, 1, '2023-08-22 08:41:14', NULL, '2023-08-22 08:41:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (153, 33, 4, 4000, NULL, NULL, NULL, 1, '2023-08-22 08:41:35', NULL, '2023-08-22 08:41:35', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (154, 294, 4, 2500, NULL, NULL, NULL, 1, '2023-08-22 08:41:59', NULL, '2023-08-22 08:41:59', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (155, 34, 4, 5500, NULL, NULL, NULL, 1, '2023-08-19 13:19:28', NULL, '2023-08-19 13:19:28', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (156, 1988, 4, 10800, NULL, NULL, NULL, 1, '2023-08-19 13:27:05', NULL, '2023-08-19 13:27:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (157, 566, 4, 6600, NULL, NULL, NULL, 1, '2023-08-22 08:43:58', NULL, '2023-08-22 08:43:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (158, 1989, 4, 16500, NULL, NULL, NULL, 1, '2023-08-21 07:11:37', NULL, '2023-08-21 07:11:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (159, 1992, 4, 39500, NULL, NULL, NULL, 1, '2023-08-21 07:19:11', NULL, '2023-08-21 07:19:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (160, 1993, 4, 27000, NULL, NULL, NULL, 1, '2023-08-21 07:23:09', NULL, '2023-08-21 07:23:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (161, 1995, 4, 2700, NULL, NULL, NULL, 1, '2023-08-22 08:44:31', NULL, '2023-08-22 08:44:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (162, 39, 4, 2300, NULL, NULL, NULL, 1, '2023-08-21 07:32:01', NULL, '2023-08-21 07:32:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (163, 309, 4, 14000, NULL, NULL, NULL, 1, '2023-08-21 07:34:52', NULL, '2023-08-21 07:34:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (164, 42, 4, 17200, NULL, NULL, NULL, 1, '2023-08-21 07:41:16', NULL, '2023-08-21 07:41:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (165, 43, 4, 17200, NULL, NULL, NULL, 1, '2023-08-21 07:39:17', NULL, '2023-08-21 07:39:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (166, 41, 4, 17200, NULL, NULL, NULL, 1, '2023-08-21 07:40:53', NULL, '2023-08-21 07:40:53', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (167, 311, 4, 14500, NULL, NULL, NULL, 1, '2023-08-21 07:43:50', NULL, '2023-08-21 07:43:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (168, 52, 4, 4600, NULL, NULL, NULL, 1, '2023-08-22 08:47:04', NULL, '2023-08-22 08:47:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (169, 48, 4, 2400, NULL, NULL, NULL, 1, '2023-08-22 08:45:45', NULL, '2023-08-22 08:45:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (170, 50, 4, 2200, NULL, NULL, NULL, 1, '2023-08-22 08:45:25', NULL, '2023-08-22 08:45:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (171, 51, 4, 2400, NULL, NULL, NULL, 1, '2023-08-22 08:46:05', NULL, '2023-08-22 08:46:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (172, 53, 4, 4350, NULL, NULL, NULL, 1, '2023-08-21 08:01:03', NULL, '2023-08-21 08:01:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (173, 317, 4, 12800, NULL, NULL, NULL, 1, '2023-08-21 08:06:22', NULL, '2023-08-21 08:06:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (174, 316, 4, 12750, NULL, NULL, NULL, 1, '2023-08-21 08:08:21', NULL, '2023-08-21 08:08:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (175, 1998, 4, 17500, NULL, NULL, NULL, 1, '2023-08-21 08:17:43', NULL, '2023-08-21 08:17:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (176, 1999, 4, 12600, NULL, NULL, NULL, 1, '2023-08-21 08:17:33', NULL, '2023-08-21 08:17:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (177, 2001, 4, 6700, NULL, NULL, NULL, 1, '2023-08-21 08:22:01', NULL, '2023-08-21 08:22:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (178, 2002, 4, 34000, NULL, NULL, NULL, 1, '2023-08-21 08:25:43', NULL, '2023-08-21 08:25:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (179, 569, 4, 27600, NULL, NULL, NULL, 1, '2023-08-21 08:28:49', NULL, '2023-08-21 08:28:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (180, 55, 4, 50400, NULL, NULL, NULL, 1, '2023-08-21 08:31:30', NULL, '2023-08-21 08:31:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (181, 2003, 4, 3500, NULL, NULL, NULL, 1, '2023-08-21 08:34:38', NULL, '2023-08-21 08:34:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (182, 2004, 4, 22000, NULL, NULL, NULL, 1, '2023-08-25 21:59:14', NULL, '2023-08-25 21:59:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (183, 68, 4, 19600, NULL, NULL, NULL, 1, '2023-08-21 08:42:48', NULL, '2023-08-21 08:42:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (184, 585, 4, 29500, NULL, NULL, NULL, 1, '2023-08-21 09:04:20', NULL, '2023-08-21 09:04:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (185, 74, 4, 21000, NULL, NULL, NULL, 1, '2023-08-21 09:09:22', NULL, '2023-08-21 09:09:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (186, 346, 4, 52800, NULL, NULL, NULL, 1, '2023-08-21 09:12:44', NULL, '2023-08-21 09:12:44', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (187, 1357, 4, 2200, NULL, NULL, NULL, 1, '2023-08-22 08:49:07', NULL, '2023-08-22 08:49:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (188, 1359, 4, 3000, NULL, NULL, NULL, 1, '2023-08-21 09:24:48', NULL, '2023-08-21 09:24:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (189, 76, 4, 13800, NULL, NULL, NULL, 1, '2023-08-21 09:27:21', NULL, '2023-08-21 09:27:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (190, 2006, 4, 13000, NULL, NULL, NULL, 1, '2023-08-21 09:31:56', NULL, '2023-08-21 09:31:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (191, 80, 4, 5200, NULL, NULL, NULL, 1, '2023-08-22 08:50:04', NULL, '2023-08-22 08:50:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (192, 81, 4, 3400, NULL, NULL, NULL, 1, '2023-08-21 09:38:51', NULL, '2023-08-21 09:38:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (193, 2007, 4, 29100, NULL, NULL, NULL, 1, '2023-08-21 09:43:38', NULL, '2023-08-21 09:43:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (194, 2008, 4, 9000, NULL, NULL, NULL, 1, '2023-08-22 08:51:27', NULL, '2023-08-22 08:51:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (195, 2009, 4, 9000, NULL, NULL, NULL, 1, '2023-08-22 08:50:41', NULL, '2023-08-22 08:50:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (196, 89, 4, 19600, NULL, NULL, NULL, 1, '2023-08-21 09:52:46', NULL, '2023-08-21 09:52:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (197, 93, 4, 6000, NULL, NULL, NULL, 1, '2023-08-25 22:05:18', NULL, '2023-08-25 22:05:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (198, 92, 4, 40800, NULL, NULL, NULL, 1, '2023-08-21 10:00:23', NULL, '2023-08-21 10:00:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (199, 94, 4, 8100, NULL, NULL, NULL, 1, '2023-08-22 08:52:28', NULL, '2023-08-22 08:52:28', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (200, 359, 4, 2500, NULL, NULL, NULL, 1, '2023-08-22 08:52:13', NULL, '2023-08-22 08:52:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (201, 2010, 4, 2000, NULL, NULL, NULL, 1, '2023-08-22 08:52:51', NULL, '2023-08-22 08:52:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (202, 97, 4, 7600, NULL, NULL, NULL, 1, '2023-08-22 08:53:21', NULL, '2023-08-22 08:53:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (203, 102, 4, 15600, NULL, NULL, NULL, 1, '2023-08-22 08:53:43', NULL, '2023-08-22 08:53:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (204, 106, 4, 3600, NULL, NULL, NULL, 1, '2023-08-21 10:20:09', NULL, '2023-08-21 10:20:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (205, 2011, 4, 13600, NULL, NULL, NULL, 1, '2023-08-21 12:03:19', NULL, '2023-08-21 12:03:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (206, 1588, 4, 13600, NULL, NULL, NULL, 1, '2023-08-21 12:04:42', NULL, '2023-08-21 12:04:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (207, 1590, 4, 13600, NULL, NULL, NULL, 1, '2023-08-21 12:04:06', NULL, '2023-08-21 12:04:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (208, 113, 4, 16000, NULL, NULL, NULL, 1, '2023-08-21 10:30:01', NULL, '2023-08-21 10:30:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (209, 114, 4, 16000, NULL, NULL, NULL, 1, '2023-08-21 10:32:04', NULL, '2023-08-21 10:32:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (210, 118, 4, 16000, NULL, NULL, NULL, 1, '2023-08-21 10:40:21', NULL, '2023-08-21 10:40:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (211, 109, 4, 16000, NULL, NULL, NULL, 1, '2023-08-21 10:43:13', NULL, '2023-08-21 10:43:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (212, 116, 4, 16000, NULL, NULL, NULL, 1, '2023-08-21 10:46:14', NULL, '2023-08-21 10:46:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (213, 107, 4, 16000, NULL, NULL, NULL, 1, '2023-08-21 10:49:03', NULL, '2023-08-21 10:49:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (214, 125, 4, 17100, NULL, NULL, NULL, 1, '2023-08-21 10:53:17', NULL, '2023-08-21 10:53:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (215, 124, 4, 17100, NULL, NULL, NULL, 1, '2023-08-21 10:55:06', NULL, '2023-08-21 10:55:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (216, 126, 4, 17100, NULL, NULL, NULL, 1, '2023-08-21 10:56:28', NULL, '2023-08-21 10:56:28', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (217, 588, 4, 15000, NULL, NULL, NULL, 1, '2023-08-21 10:59:51', NULL, '2023-08-21 10:59:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (218, 2012, 4, 3900, NULL, NULL, NULL, 1, '2023-08-21 11:03:58', NULL, '2023-08-21 11:03:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (219, 2013, 4, 3900, NULL, NULL, NULL, 1, '2023-08-21 11:06:39', NULL, '2023-08-21 11:06:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (220, 1607, 4, 400, NULL, NULL, NULL, 1, '2023-08-21 11:21:10', NULL, '2023-08-21 11:21:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (221, 1626, 4, 4500, NULL, NULL, NULL, 1, '2023-08-21 11:27:36', NULL, '2023-08-21 11:27:36', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (222, 1627, 4, 12200, NULL, NULL, NULL, 1, '2023-08-22 08:54:16', NULL, '2023-08-22 08:54:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (223, 141, 4, 7500, NULL, NULL, NULL, 1, '2023-08-22 08:55:25', NULL, '2023-08-22 08:55:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (224, 144, 4, 7200, NULL, NULL, NULL, 1, '2023-08-22 08:54:56', NULL, '2023-08-22 08:54:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (225, 368, 4, 15600, NULL, NULL, NULL, 1, '2023-08-21 11:41:38', NULL, '2023-08-21 11:41:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (226, 2014, 4, 6100, NULL, NULL, NULL, 1, '2023-08-21 11:45:23', NULL, '2023-08-21 11:45:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (227, 602, 4, 18600, NULL, NULL, NULL, 1, '2023-08-21 11:50:22', NULL, '2023-08-21 11:50:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (228, 1376, 4, 20300, NULL, NULL, NULL, 1, '2023-08-21 12:09:48', NULL, '2023-08-21 12:09:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (229, 1377, 4, 23100, NULL, NULL, NULL, 1, '2023-08-21 12:12:46', NULL, '2023-08-21 12:12:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (230, 1378, 4, 17400, NULL, NULL, NULL, 1, '2023-08-21 12:14:48', NULL, '2023-08-21 12:14:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (231, 370, 4, 18000, NULL, NULL, NULL, 1, '2023-08-21 12:16:27', NULL, '2023-08-21 12:16:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (232, 607, 4, 7300, NULL, NULL, NULL, 1, '2023-08-21 12:23:13', NULL, '2023-08-21 12:23:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (233, 894, 4, 42000, NULL, NULL, NULL, 1, '2023-08-21 12:51:01', NULL, '2023-08-21 12:51:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (234, 379, 4, 43800, NULL, NULL, NULL, 1, '2023-08-21 12:55:07', NULL, '2023-08-21 12:55:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (235, 1383, 4, 3300, NULL, NULL, NULL, 1, '2023-08-22 08:56:04', NULL, '2023-08-22 08:56:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (236, 1384, 4, 2800, NULL, NULL, NULL, 1, '2023-08-21 13:04:32', NULL, '2023-08-21 13:04:32', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (237, 151, 4, 1500, NULL, NULL, NULL, 1, '2023-08-22 08:56:27', NULL, '2023-08-22 08:56:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (238, 2015, 4, 14400, NULL, NULL, NULL, 1, '2023-08-21 13:21:43', NULL, '2023-08-21 13:21:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (239, 609, 4, 15500, NULL, NULL, NULL, 1, '2023-08-21 13:23:09', NULL, '2023-08-21 13:23:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (240, 610, 4, 8200, NULL, NULL, NULL, 1, '2023-08-21 13:28:10', NULL, '2023-08-21 13:28:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (241, 1661, 4, 6000, NULL, NULL, NULL, 1, '2023-08-21 13:36:35', NULL, '2023-08-21 13:36:35', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (242, 156, 4, 16200, NULL, NULL, NULL, 1, '2023-08-21 13:41:57', NULL, '2023-08-21 13:41:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (243, 157, 4, 10920, NULL, NULL, NULL, 1, '2023-08-22 08:56:58', NULL, '2023-08-22 08:56:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (244, 1668, 4, 12100, NULL, NULL, NULL, 1, '2023-08-21 13:49:29', NULL, '2023-08-21 13:49:29', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (245, 387, 4, 3000, NULL, NULL, NULL, 1, '2023-08-21 14:00:38', NULL, '2023-08-21 14:00:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (246, 1463, 4, 1200, NULL, NULL, NULL, 1, '2023-08-22 08:58:01', NULL, '2023-08-22 08:58:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (247, 2019, 4, 1200, NULL, NULL, NULL, 1, '2023-08-22 08:58:27', NULL, '2023-08-22 08:58:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (248, 1812, 4, 9300, NULL, NULL, NULL, 1, '2023-08-21 14:13:38', NULL, '2023-08-21 14:13:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (249, 1810, 4, 33000, NULL, NULL, NULL, 1, '2023-08-21 14:17:04', NULL, '2023-08-21 14:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (250, 1808, 4, 6700, NULL, NULL, NULL, 1, '2023-08-21 14:20:33', NULL, '2023-08-21 14:20:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (251, 1806, 4, 23900, NULL, NULL, NULL, 1, '2023-08-21 14:22:20', NULL, '2023-08-21 14:22:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (252, 2020, 4, 13600, NULL, NULL, NULL, 1, '2023-08-21 14:34:02', NULL, '2023-08-21 14:34:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (253, 2021, 4, 13600, NULL, NULL, NULL, 1, '2023-08-21 14:34:25', NULL, '2023-08-21 14:34:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (254, 2022, 4, 15400, NULL, NULL, NULL, 1, '2023-08-21 14:33:50', NULL, '2023-08-21 14:33:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (255, 1465, 4, 2700, NULL, NULL, NULL, 1, '2023-08-21 14:41:23', NULL, '2023-08-21 14:41:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (256, 2023, 4, 32200, NULL, NULL, NULL, 1, '2023-08-21 14:53:06', NULL, '2023-08-21 14:53:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (257, 2024, 4, 11500, NULL, NULL, NULL, 1, '2023-08-22 07:11:01', NULL, '2023-08-22 07:11:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (258, 2025, 4, 21900, NULL, NULL, NULL, 1, '2023-08-22 07:13:59', NULL, '2023-08-22 07:13:59', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (259, 2026, 4, 11600, NULL, NULL, NULL, 1, '2023-08-22 07:17:27', NULL, '2023-08-22 07:17:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (260, 2027, 4, 22200, NULL, NULL, NULL, 1, '2023-08-22 07:22:09', NULL, '2023-08-22 07:22:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (261, 2028, 4, 12900, NULL, NULL, NULL, 1, '2023-08-22 07:25:52', NULL, '2023-08-22 07:25:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (262, 2029, 4, 12900, NULL, NULL, NULL, 1, '2023-08-22 07:28:52', NULL, '2023-08-22 07:28:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (263, 2030, 4, 1600, NULL, NULL, NULL, 1, '2023-08-22 09:00:46', NULL, '2023-08-22 09:00:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (264, 2031, 4, 1700, NULL, NULL, NULL, 1, '2023-08-22 09:00:31', NULL, '2023-08-22 09:00:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (265, 400, 4, 6900, NULL, NULL, NULL, 1, '2023-08-22 09:01:19', NULL, '2023-08-22 09:01:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (266, 397, 4, 6000, NULL, NULL, NULL, 1, '2023-08-22 07:40:27', NULL, '2023-08-22 07:40:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (267, 398, 4, 13200, NULL, NULL, NULL, 1, '2023-08-22 07:50:52', NULL, '2023-08-22 07:50:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (268, 2032, 4, 9600, NULL, NULL, NULL, 1, '2023-08-22 07:46:54', NULL, '2023-08-22 07:46:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (269, 2033, 4, 9600, NULL, NULL, NULL, 1, '2023-08-22 07:49:25', NULL, '2023-08-22 07:49:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (270, 2034, 4, 24000, NULL, NULL, NULL, 1, '2023-08-22 07:52:32', NULL, '2023-08-22 07:52:32', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (271, 2035, 4, 24000, NULL, NULL, NULL, 1, '2023-08-22 07:55:17', NULL, '2023-08-22 07:55:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (272, 664, 4, 1000, NULL, NULL, NULL, 1, '2023-08-22 09:03:45', NULL, '2023-08-22 09:03:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (273, 663, 4, 1000, NULL, NULL, NULL, 1, '2023-08-22 09:03:04', NULL, '2023-08-22 09:03:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (274, 672, 4, 18900, NULL, NULL, NULL, 1, '2023-08-22 08:01:34', NULL, '2023-08-22 08:01:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (275, 670, 4, 18900, NULL, NULL, NULL, 1, '2023-08-22 08:03:05', NULL, '2023-08-22 08:03:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (276, 668, 4, 13200, NULL, NULL, NULL, 1, '2023-08-22 08:05:05', NULL, '2023-08-22 08:05:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (277, 667, 4, 13200, NULL, NULL, NULL, 1, '2023-08-22 08:06:24', NULL, '2023-08-22 08:06:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (278, 669, 4, 13200, NULL, NULL, NULL, 1, '2023-08-22 08:07:44', NULL, '2023-08-22 08:07:44', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (279, 2036, 4, 1000, NULL, NULL, NULL, 1, '2023-08-22 09:02:15', NULL, '2023-08-22 09:02:15', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (280, 675, 4, 1000, NULL, NULL, NULL, 1, '2023-08-22 09:03:21', NULL, '2023-08-22 09:03:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (281, 676, 4, 1000, NULL, NULL, NULL, 1, '2023-08-22 09:02:34', NULL, '2023-08-22 09:02:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (282, 1701, 4, 11500, NULL, NULL, NULL, 1, '2023-08-23 17:56:16', NULL, '2023-08-23 17:56:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (283, 1467, 4, 3200, NULL, NULL, NULL, 1, '2023-08-22 08:21:51', NULL, '2023-08-22 08:21:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (284, 2037, 4, 24000, NULL, NULL, NULL, 1, '2023-08-22 08:24:56', NULL, '2023-08-22 08:24:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (285, 410, 4, 2000, NULL, NULL, NULL, 1, '2023-08-22 08:27:47', NULL, '2023-08-22 08:27:47', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (286, 176, 4, 3000, NULL, NULL, NULL, 1, '2023-08-22 08:32:45', NULL, '2023-08-22 08:32:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (287, 1392, 4, 3000, NULL, NULL, NULL, 1, '2023-08-22 08:35:35', NULL, '2023-08-22 08:35:35', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (288, 296, 4, 1500, NULL, NULL, NULL, 1, '2023-08-22 15:48:41', NULL, '2023-08-22 15:48:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (289, 390, 4, 2000, NULL, NULL, NULL, 1, '2023-08-22 09:08:44', NULL, '2023-08-22 09:08:44', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (290, 1462, 4, 2000, NULL, NULL, NULL, 1, '2023-08-22 09:10:12', NULL, '2023-08-22 09:10:12', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (291, 179, 4, 9000, NULL, NULL, NULL, 1, '2023-08-22 09:13:19', NULL, '2023-08-22 09:13:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (292, 412, 4, 16800, NULL, NULL, NULL, 1, '2023-08-22 09:15:48', NULL, '2023-08-22 09:15:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (293, 180, 4, 5800, NULL, NULL, NULL, 1, '2023-08-22 09:18:05', NULL, '2023-08-22 09:18:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (294, 1396, 4, 2800, NULL, NULL, NULL, 1, '2023-08-22 09:20:52', NULL, '2023-08-22 09:20:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (295, 991, 4, 28200, NULL, NULL, NULL, 1, '2023-08-22 09:25:26', NULL, '2023-08-22 09:25:26', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (296, 990, 4, 46500, NULL, NULL, NULL, 1, '2023-08-22 09:27:08', NULL, '2023-08-22 09:27:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (297, 191, 4, 17600, NULL, NULL, NULL, 1, '2023-08-22 09:29:56', NULL, '2023-08-22 09:29:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (298, 419, 4, 16900, NULL, NULL, NULL, 1, '2023-08-22 09:35:06', NULL, '2023-08-22 09:35:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (299, 425, 4, 17100, NULL, NULL, NULL, 1, '2023-08-22 09:38:06', NULL, '2023-08-22 09:38:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (300, 1403, 4, 17100, NULL, NULL, NULL, 1, '2023-08-22 09:41:55', NULL, '2023-08-22 09:41:55', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (301, 1398, 4, 19300, NULL, NULL, NULL, 1, '2023-08-22 09:43:54', NULL, '2023-08-22 09:43:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (302, 1400, 4, 19300, NULL, NULL, NULL, 1, '2023-08-22 09:46:08', NULL, '2023-08-22 09:46:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (303, 1399, 4, 19300, NULL, NULL, NULL, 1, '2023-08-22 09:47:39', NULL, '2023-08-22 09:47:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (304, 202, 4, 2000, NULL, NULL, NULL, 1, '2023-08-22 09:50:02', NULL, '2023-08-22 09:50:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (305, 205, 4, 12300, NULL, NULL, NULL, 1, '2023-08-22 09:53:33', NULL, '2023-08-22 09:53:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (306, 207, 4, 14100, NULL, NULL, NULL, 1, '2023-08-22 09:55:20', NULL, '2023-08-22 09:55:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (307, 209, 4, 2500, NULL, NULL, NULL, 1, '2023-08-22 09:58:30', NULL, '2023-08-22 09:58:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (308, 1425, 4, 3000, NULL, NULL, NULL, 1, '2023-08-22 10:00:33', NULL, '2023-08-22 10:00:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (309, 208, 4, 2200, NULL, NULL, NULL, 1, '2023-08-22 10:02:02', NULL, '2023-08-22 10:02:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (310, 2038, 4, 10600, NULL, NULL, NULL, 1, '2023-08-22 10:04:42', NULL, '2023-08-22 10:04:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (311, 252, 4, 2300, NULL, NULL, NULL, 1, '2023-08-22 10:08:03', NULL, '2023-08-22 10:08:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (312, 2039, 4, 5600, NULL, NULL, NULL, 1, '2023-08-22 10:13:24', NULL, '2023-08-22 10:13:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (313, 32, 4, 2500, NULL, NULL, NULL, 1, '2023-08-22 10:19:34', NULL, '2023-08-22 10:19:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (314, 2040, 4, 27000, NULL, NULL, NULL, 1, '2023-08-22 10:22:32', NULL, '2023-08-22 10:22:32', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (315, 212, 4, 2300, NULL, NULL, NULL, 1, '2023-08-22 10:25:13', NULL, '2023-08-22 10:25:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (316, 211, 4, 12600, NULL, NULL, NULL, 1, '2023-08-22 10:27:11', NULL, '2023-08-22 10:27:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (317, 213, 4, 3800, NULL, NULL, NULL, 1, '2023-08-22 10:29:25', NULL, '2023-08-22 10:29:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (318, 1931, 4, 39600, NULL, NULL, NULL, 1, '2023-08-22 10:34:00', NULL, '2023-08-22 10:34:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (319, 1430, 4, 15600, NULL, NULL, NULL, 1, '2023-08-22 10:37:05', NULL, '2023-08-22 10:37:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (320, 1428, 4, 15600, NULL, NULL, NULL, 1, '2023-08-22 10:40:04', NULL, '2023-08-22 10:40:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (321, 1023, 4, 9800, NULL, NULL, NULL, 1, '2023-08-22 10:48:06', NULL, '2023-08-22 10:48:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (322, 452, 4, 25500, NULL, NULL, NULL, 1, '2023-08-22 10:51:53', NULL, '2023-08-22 10:51:53', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (323, 1433, 4, 4300, NULL, NULL, NULL, 1, '2023-08-22 10:56:18', NULL, '2023-08-22 10:56:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (324, 1432, 4, 4500, NULL, NULL, NULL, 1, '2023-08-22 10:58:34', NULL, '2023-08-22 10:58:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (325, 215, 4, 8100, NULL, NULL, NULL, 1, '2023-08-22 11:05:55', NULL, '2023-08-22 11:05:55', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (326, 2041, 4, 2600, NULL, NULL, NULL, 1, '2023-08-22 11:17:00', NULL, '2023-08-22 11:17:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (327, 462, 4, 29100, NULL, NULL, NULL, 1, '2023-08-22 11:29:20', NULL, '2023-08-22 11:29:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (328, 218, 4, 3600, NULL, NULL, NULL, 1, '2023-08-22 11:44:58', NULL, '2023-08-22 11:44:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (329, 2042, 4, 12600, NULL, NULL, NULL, 1, '2023-08-22 11:47:42', NULL, '2023-08-22 11:47:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (330, 2043, 4, 4200, NULL, NULL, NULL, 1, '2023-08-22 11:53:23', NULL, '2023-08-22 11:53:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (331, 233, 4, 18000, NULL, NULL, NULL, 1, '2023-08-22 11:59:03', NULL, '2023-08-22 11:59:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (332, 234, 4, 18000, NULL, NULL, NULL, 1, '2023-08-22 12:01:23', NULL, '2023-08-22 12:01:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (333, 232, 4, 0, NULL, NULL, NULL, 1, '2023-08-23 16:39:16', NULL, '2023-08-23 16:39:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (334, 221, 4, 800, NULL, NULL, NULL, 1, '2023-08-22 12:08:37', NULL, '2023-08-22 12:08:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (335, 220, 4, 1000, NULL, NULL, NULL, 1, '2023-08-22 12:14:50', NULL, '2023-08-22 12:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (336, 626, 4, 5100, NULL, NULL, NULL, 1, '2023-08-22 12:18:34', NULL, '2023-08-22 12:18:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (337, 624, 4, 7200, NULL, NULL, NULL, 1, '2023-08-22 12:22:42', NULL, '2023-08-22 12:22:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (338, 2044, 4, 12300, NULL, NULL, NULL, 1, '2023-08-22 12:27:56', NULL, '2023-08-22 12:27:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (339, 1439, 4, 2800, NULL, NULL, NULL, 1, '2023-08-22 12:30:11', NULL, '2023-08-22 12:30:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (340, 477, 4, 20800, NULL, NULL, NULL, 1, '2023-08-22 12:34:00', NULL, '2023-08-22 12:34:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (341, 1441, 4, 9300, NULL, NULL, NULL, 1, '2023-08-22 12:39:21', NULL, '2023-08-22 12:39:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (342, 484, 4, 9300, NULL, NULL, NULL, 1, '2023-08-22 12:42:39', NULL, '2023-08-22 12:42:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (343, 1471, 4, 9300, NULL, NULL, NULL, 1, '2023-08-22 12:44:22', NULL, '2023-08-22 12:44:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (344, 492, 4, 34800, NULL, NULL, NULL, 1, '2023-08-22 12:46:50', NULL, '2023-08-22 12:46:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (345, 1443, 4, 3500, NULL, NULL, NULL, 1, '2023-08-22 12:49:52', NULL, '2023-08-22 12:49:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (346, 497, 4, 34800, NULL, NULL, NULL, 1, '2023-08-22 12:53:57', NULL, '2023-08-22 12:53:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (347, 244, 4, 11600, NULL, NULL, NULL, 1, '2023-08-22 12:58:40', NULL, '2023-08-22 12:58:40', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (348, 247, 4, 11600, NULL, NULL, NULL, 1, '2023-08-22 13:02:18', NULL, '2023-08-22 13:02:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (349, 245, 4, 1300, NULL, NULL, NULL, 1, '2023-08-22 13:05:04', NULL, '2023-08-22 13:05:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (350, 242, 4, 2300, NULL, NULL, NULL, 1, '2023-08-22 13:09:41', NULL, '2023-08-22 13:09:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (351, 2045, 4, 6300, NULL, NULL, NULL, 1, '2023-08-22 13:15:14', NULL, '2023-08-22 13:15:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (352, 2046, 4, 8800, NULL, NULL, NULL, 1, '2023-08-22 13:18:14', NULL, '2023-08-22 13:18:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (353, 2047, 4, 13600, NULL, NULL, NULL, 1, '2023-08-22 13:24:12', NULL, '2023-08-22 13:24:12', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (354, 2048, 4, 9000, NULL, NULL, NULL, 1, '2023-08-22 13:27:56', NULL, '2023-08-22 13:27:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (355, 2049, 4, 9100, NULL, NULL, NULL, 1, '2023-08-22 13:32:01', NULL, '2023-08-22 13:32:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (356, 505, 4, 10000, NULL, NULL, NULL, 1, '2023-08-22 13:39:15', NULL, '2023-08-22 13:39:15', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (357, 1445, 4, 10500, NULL, NULL, NULL, 1, '2023-08-22 13:38:48', NULL, '2023-08-22 13:38:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (358, 2050, 4, 26400, NULL, NULL, NULL, 1, '2023-08-22 13:42:40', NULL, '2023-08-22 13:42:40', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (359, 2052, 4, 9900, NULL, NULL, NULL, 1, '2023-08-22 13:45:54', NULL, '2023-08-22 13:45:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (360, 508, 4, 3000, NULL, NULL, NULL, 1, '2023-08-22 13:48:27', NULL, '2023-08-22 13:48:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (361, 509, 4, 4000, NULL, NULL, NULL, 1, '2023-08-22 13:50:33', NULL, '2023-08-22 13:50:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (362, 510, 4, 4000, NULL, NULL, NULL, 1, '2023-08-22 13:52:33', NULL, '2023-08-22 13:52:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (363, 513, 4, 3200, NULL, NULL, NULL, 1, '2023-08-22 13:54:46', NULL, '2023-08-22 13:54:46', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (364, 512, 4, 3200, NULL, NULL, NULL, 1, '2023-08-22 13:58:03', NULL, '2023-08-22 13:58:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (365, 511, 4, 4100, NULL, NULL, NULL, 1, '2023-08-22 13:59:52', NULL, '2023-08-22 13:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (366, 514, 4, 15300, NULL, NULL, NULL, 1, '2023-08-22 14:03:13', NULL, '2023-08-22 14:03:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (367, 515, 4, 36000, NULL, NULL, NULL, 1, '2023-08-22 14:05:11', NULL, '2023-08-22 14:05:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (368, 254, 4, 3200, NULL, NULL, NULL, 1, '2023-08-22 14:06:57', NULL, '2023-08-22 14:06:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (369, 1456, 4, 3500, NULL, NULL, NULL, 1, '2023-08-22 14:10:07', NULL, '2023-08-22 14:10:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (370, 1457, 4, 3500, NULL, NULL, NULL, 1, '2023-08-22 14:12:38', NULL, '2023-08-22 14:12:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (371, 521, 4, 3000, NULL, NULL, NULL, 1, '2023-08-22 14:15:57', NULL, '2023-08-22 14:15:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (372, 2053, 4, 16600, NULL, NULL, NULL, 1, '2023-08-22 14:18:49', NULL, '2023-08-22 14:18:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (373, 261, 4, 1700, NULL, NULL, NULL, 1, '2023-08-22 14:21:09', NULL, '2023-08-22 14:21:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (374, 1476, 4, 11200, NULL, NULL, NULL, 1, '2023-08-22 14:23:26', NULL, '2023-08-22 14:23:26', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (375, 1479, 4, 10500, NULL, NULL, NULL, 1, '2023-08-22 14:24:43', NULL, '2023-08-22 14:24:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (376, 263, 4, 13800, NULL, NULL, NULL, 1, '2023-08-22 14:27:35', NULL, '2023-08-22 14:27:35', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (377, 262, 4, 13800, NULL, NULL, NULL, 1, '2023-08-22 14:28:11', NULL, '2023-08-22 14:28:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (378, 274, 4, 2000, NULL, NULL, NULL, 1, '2023-08-22 14:32:30', NULL, '2023-08-22 14:32:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (379, 268, 4, 6600, NULL, NULL, NULL, 1, '2023-08-22 14:35:07', NULL, '2023-08-22 14:35:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (380, 527, 4, 800, NULL, NULL, NULL, 1, '2023-08-22 14:37:38', NULL, '2023-08-22 14:37:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (381, 2054, 4, 18300, NULL, NULL, NULL, 1, '2023-08-22 14:40:31', NULL, '2023-08-22 14:40:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (382, 529, 4, 22000, NULL, NULL, NULL, 1, '2023-08-22 14:42:49', NULL, '2023-08-22 14:42:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (383, 1482, 4, 22000, NULL, NULL, NULL, 1, '2023-08-22 14:43:58', NULL, '2023-08-22 14:43:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (384, 526, 4, 1600, NULL, NULL, NULL, 1, '2023-08-22 14:47:24', NULL, '2023-08-22 14:47:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (385, 525, 4, 1600, NULL, NULL, NULL, 1, '2023-08-22 14:48:45', NULL, '2023-08-22 14:48:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (386, 289, 4, 1800, NULL, NULL, NULL, 1, '2023-08-22 14:51:25', NULL, '2023-08-22 14:51:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (387, 2056, 4, 4000, NULL, NULL, NULL, 1, '2023-08-22 15:37:14', NULL, '2023-08-22 15:37:14', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (388, 246, 4, 11500, NULL, NULL, NULL, 1, '2023-08-22 15:00:04', NULL, '2023-08-22 15:00:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (389, 236, 4, 20000, NULL, NULL, NULL, 1, '2023-08-22 15:06:20', NULL, '2023-08-22 15:06:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (390, 187, 4, 5300, NULL, NULL, NULL, 1, '2023-08-22 15:10:20', NULL, '2023-08-22 15:10:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (391, 2057, 4, 7800, NULL, NULL, NULL, 1, '2023-08-22 15:13:22', NULL, '2023-08-22 15:13:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (392, 1936, 4, 15600, NULL, NULL, NULL, 1, '2023-08-22 15:15:33', NULL, '2023-08-22 15:15:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (393, 2058, 4, 6500, NULL, NULL, NULL, 1, '2023-08-22 15:36:56', NULL, '2023-08-22 15:36:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (394, 2059, 4, 6500, NULL, NULL, NULL, 1, '2023-08-22 15:36:45', NULL, '2023-08-22 15:36:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (395, 2060, 4, 6500, NULL, NULL, NULL, 1, '2023-08-22 15:35:34', NULL, '2023-08-22 15:35:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (396, 2061, 4, 6500, NULL, NULL, NULL, 1, '2023-08-22 15:38:33', NULL, '2023-08-22 15:38:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (397, 2062, 4, 6000, NULL, NULL, NULL, 1, '2023-08-22 15:42:57', NULL, '2023-08-22 15:42:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (398, 2063, 4, 6000, NULL, NULL, NULL, 1, '2023-08-22 15:45:25', NULL, '2023-08-22 15:45:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (399, 2064, 4, 6000, NULL, NULL, NULL, 1, '2023-08-22 15:47:02', NULL, '2023-08-22 15:47:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (400, 466, 4, 14000, NULL, NULL, NULL, 1, '2023-08-22 15:52:03', NULL, '2023-08-22 15:52:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (401, 1518, 4, 7500, NULL, NULL, NULL, 1, '2023-08-23 15:18:28', NULL, '2023-08-23 15:18:28', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (402, 2065, 4, 9500, NULL, NULL, NULL, 1, '2023-08-23 15:23:17', NULL, '2023-08-23 15:23:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (403, 1523, 4, 3500, NULL, NULL, NULL, 1, '2023-08-23 15:25:03', NULL, '2023-08-23 15:25:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (404, 2066, 4, 4500, NULL, NULL, NULL, 1, '2023-08-23 15:29:49', NULL, '2023-08-23 15:29:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (405, 2067, 4, 12000, NULL, NULL, NULL, 1, '2023-08-23 15:33:21', NULL, '2023-08-23 15:33:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (406, 2068, 4, 14500, NULL, NULL, NULL, 1, '2023-08-23 15:39:12', NULL, '2023-08-23 15:39:12', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (407, 2069, 4, 20000, NULL, NULL, NULL, 1, '2023-08-23 15:37:07', NULL, '2023-08-23 15:37:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (408, 1538, 4, 14000, NULL, NULL, NULL, 1, '2023-08-23 15:43:10', NULL, '2023-08-23 15:43:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (409, 2070, 4, 18500, NULL, NULL, NULL, 1, '2023-08-23 15:47:07', NULL, '2023-08-23 15:47:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (410, 2071, 4, 18500, NULL, NULL, NULL, 1, '2023-08-23 15:49:03', NULL, '2023-08-23 15:49:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (411, 2073, 4, 28500, NULL, NULL, NULL, 1, '2023-08-23 15:56:20', NULL, '2023-08-23 15:56:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (412, 2074, 4, 29500, NULL, NULL, NULL, 1, '2023-08-23 15:58:08', NULL, '2023-08-23 15:58:08', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (413, 69, 4, 1100, NULL, NULL, NULL, 1, '2023-08-23 16:03:21', NULL, '2023-08-23 16:03:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (414, 104, 4, 7500, NULL, NULL, NULL, 1, '2023-08-23 16:10:26', NULL, '2023-08-23 16:10:26', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (415, 105, 4, 10500, NULL, NULL, NULL, 1, '2023-08-23 16:12:20', NULL, '2023-08-23 16:12:20', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (416, 153, 4, 2000, NULL, NULL, NULL, 1, '2023-08-23 16:16:40', NULL, '2023-08-23 16:16:40', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (417, 161, 4, 3000, NULL, NULL, NULL, 1, '2023-08-23 16:18:34', NULL, '2023-08-23 16:18:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (418, 163, 4, 9100, NULL, NULL, NULL, 1, '2023-08-23 16:21:22', NULL, '2023-08-23 16:21:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (419, 164, 4, 9500, NULL, NULL, NULL, 1, '2023-08-23 16:23:19', NULL, '2023-08-23 16:23:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (420, 2075, 4, 17000, NULL, NULL, NULL, 1, '2023-08-23 16:29:34', NULL, '2023-08-23 16:29:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (421, 216, 4, 0, NULL, NULL, NULL, 1, '2023-08-23 16:34:07', NULL, '2023-08-23 16:34:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (422, 217, 4, 36000, NULL, NULL, NULL, 1, '2023-08-23 16:34:50', NULL, '2023-08-23 16:34:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (423, 219, 4, 35000, NULL, NULL, NULL, 1, '2023-08-23 16:35:50', NULL, '2023-08-23 16:35:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (424, 231, 4, 18000, NULL, NULL, NULL, 1, '2023-08-23 16:39:56', NULL, '2023-08-23 16:39:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (425, 239, 4, 4200, NULL, NULL, NULL, 1, '2023-08-23 16:43:33', NULL, '2023-08-23 16:43:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (426, 270, 4, 6600, NULL, NULL, NULL, 1, '2023-08-23 16:48:27', NULL, '2023-08-23 16:48:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (427, 280, 4, 6500, NULL, NULL, NULL, 1, '2023-08-23 16:51:07', NULL, '2023-08-23 16:51:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (428, 319, 4, 12000, NULL, NULL, NULL, 1, '2023-08-23 16:55:12', NULL, '2023-08-23 16:55:12', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (429, 320, 4, 9000, NULL, NULL, NULL, 1, '2023-08-23 16:57:34', NULL, '2023-08-23 16:57:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (430, 323, 4, 22000, NULL, NULL, NULL, 1, '2023-08-23 16:59:29', NULL, '2023-08-23 16:59:29', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (431, 2076, 4, 3500, NULL, NULL, NULL, 1, '2023-08-23 17:03:27', NULL, '2023-08-23 17:03:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (432, 335, 4, 32000, NULL, NULL, NULL, 1, '2023-08-23 17:05:22', NULL, '2023-08-23 17:05:22', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (433, 413, 4, 45000, NULL, NULL, NULL, 1, '2023-08-23 17:07:31', NULL, '2023-08-23 17:07:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (434, 418, 4, 25000, NULL, NULL, NULL, 1, '2023-08-23 17:10:01', NULL, '2023-08-23 17:10:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (435, 2077, 4, 29000, NULL, NULL, NULL, 1, '2023-08-23 17:15:42', NULL, '2023-08-23 17:15:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (436, 440, 4, 32000, NULL, NULL, NULL, 1, '2023-08-23 17:18:33', NULL, '2023-08-23 17:18:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (437, 467, 4, 33000, NULL, NULL, NULL, 1, '2023-08-23 17:19:52', NULL, '2023-08-23 17:19:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (438, 634, 4, 14500, NULL, NULL, NULL, 1, '2023-08-23 17:25:47', NULL, '2023-08-23 17:25:47', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (439, 646, 4, 55500, NULL, NULL, NULL, 1, '2023-08-23 17:27:30', NULL, '2023-08-23 17:27:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (440, 649, 4, 10000, NULL, NULL, NULL, 1, '2023-08-23 17:29:19', NULL, '2023-08-23 17:29:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (441, 655, 4, 21600, NULL, NULL, NULL, 1, '2023-08-23 17:32:09', NULL, '2023-08-23 17:32:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (442, 656, 4, 38000, NULL, NULL, NULL, 1, '2023-08-23 17:33:45', NULL, '2023-08-23 17:33:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (443, 340, 4, 17100, NULL, NULL, NULL, 1, '2023-08-23 17:35:53', NULL, '2023-08-23 17:35:53', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (444, 339, 4, 17100, NULL, NULL, NULL, 1, '2023-08-23 17:36:30', NULL, '2023-08-23 17:36:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (445, 350, 4, 2100, NULL, NULL, NULL, 1, '2023-08-23 17:39:42', NULL, '2023-08-23 17:39:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (446, 388, 4, 3000, NULL, NULL, NULL, 1, '2023-08-23 17:42:03', NULL, '2023-08-23 17:42:03', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (447, 396, 4, 24000, NULL, NULL, NULL, 1, '2023-08-23 17:44:29', NULL, '2023-08-23 17:44:29', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (448, 2078, 4, 800, NULL, NULL, NULL, 1, '2023-08-25 20:40:09', NULL, '2023-08-25 20:40:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (449, 1170, 4, 4500, NULL, NULL, NULL, 1, '2023-08-25 19:31:50', NULL, '2023-08-25 19:31:50', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (450, 683, 4, 522, NULL, NULL, NULL, 1, '2023-08-25 19:36:00', NULL, '2023-08-25 19:36:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (451, 684, 4, 2000, NULL, NULL, NULL, 1, '2023-08-25 19:58:24', NULL, '2023-08-25 19:58:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (452, 687, 4, 0, NULL, NULL, NULL, 1, '2023-08-25 21:04:59', NULL, '2023-08-25 21:04:59', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (453, 689, 4, 200, NULL, NULL, NULL, 1, '2023-08-25 20:09:59', NULL, '2023-08-25 20:09:59', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (454, 827, 4, 5500, NULL, NULL, NULL, 1, '2023-08-25 20:14:38', NULL, '2023-08-25 20:14:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (455, 2082, 4, 3600, NULL, NULL, NULL, 1, '2023-08-25 20:23:09', NULL, '2023-08-25 20:23:09', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (456, 696, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 20:27:16', NULL, '2023-08-25 20:27:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (457, 702, 4, 1000, NULL, NULL, NULL, 1, '2023-08-25 20:30:40', NULL, '2023-08-25 20:30:40', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (458, 705, 4, 300, NULL, NULL, NULL, 1, '2023-08-25 20:34:28', NULL, '2023-08-25 20:34:28', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (459, 708, 4, 600, NULL, NULL, NULL, 1, '2023-08-25 20:36:25', NULL, '2023-08-25 20:36:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (460, 2084, 4, 200, NULL, NULL, NULL, 1, '2023-08-25 20:43:16', NULL, '2023-08-25 20:43:16', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (461, 2086, 4, 600, NULL, NULL, NULL, 1, '2023-08-25 20:45:27', NULL, '2023-08-25 20:45:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (462, 768, 4, 300, NULL, NULL, NULL, 1, '2023-08-25 20:51:38', NULL, '2023-08-25 20:51:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (463, 2087, 4, 300, NULL, NULL, NULL, 1, '2023-08-25 20:55:34', NULL, '2023-08-25 20:55:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (464, 2088, 4, 500, NULL, NULL, NULL, 1, '2023-08-25 21:00:10', NULL, '2023-08-25 21:00:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (465, 2089, 4, 600, NULL, NULL, NULL, 1, '2023-08-25 21:06:38', NULL, '2023-08-25 21:06:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (466, 2090, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 21:15:34', NULL, '2023-08-25 21:15:34', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (467, 2091, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 22:11:54', NULL, '2023-08-25 22:11:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (468, 1053, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 22:16:48', NULL, '2023-08-25 22:16:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (469, 2092, 4, 300, NULL, NULL, NULL, 1, '2023-08-25 22:18:51', NULL, '2023-08-25 22:18:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (470, 901, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 22:22:15', NULL, '2023-08-25 22:22:15', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (471, 2093, 4, 1000, NULL, NULL, NULL, 1, '2023-08-25 22:25:21', NULL, '2023-08-25 22:25:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (472, 2094, 4, 200, NULL, NULL, NULL, 1, '2023-08-25 22:37:01', NULL, '2023-08-25 22:37:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (473, 852, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 22:38:17', NULL, '2023-08-25 22:38:18', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (474, 853, 4, 800, NULL, NULL, NULL, 1, '2023-08-25 22:40:27', NULL, '2023-08-25 22:40:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (475, 875, 4, 400, NULL, NULL, NULL, 1, '2023-08-25 22:42:02', NULL, '2023-08-25 22:42:02', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (476, 874, 4, 300, NULL, NULL, NULL, 1, '2023-08-25 22:43:38', NULL, '2023-08-25 22:43:38', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (477, 733, 4, 200, NULL, NULL, NULL, 1, '2023-08-26 07:41:52', NULL, '2023-08-26 07:41:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (478, 736, 4, 300, NULL, NULL, NULL, 1, '2023-08-26 07:44:10', NULL, '2023-08-26 07:44:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (479, 2095, 4, 400, NULL, NULL, NULL, 1, '2023-08-26 07:47:21', NULL, '2023-08-26 07:47:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (480, 2096, 4, 600, NULL, NULL, NULL, 1, '2023-08-26 07:49:45', NULL, '2023-08-26 07:49:45', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (481, 2097, 4, 700, NULL, NULL, NULL, 1, '2023-08-26 07:51:48', NULL, '2023-08-26 07:51:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (482, 1250, 4, 5500, NULL, NULL, NULL, 1, '2023-08-26 08:21:13', NULL, '2023-08-26 08:21:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (483, 1251, 4, 7000, NULL, NULL, NULL, 1, '2023-08-26 08:23:24', NULL, '2023-08-26 08:23:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (484, 747, 4, 400, NULL, NULL, NULL, 1, '2023-08-26 08:25:19', NULL, '2023-08-26 08:25:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (485, 1264, 4, 6500, NULL, NULL, NULL, 1, '2023-08-26 08:27:56', NULL, '2023-08-26 08:27:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (486, 754, 4, 500, NULL, NULL, NULL, 1, '2023-08-26 08:30:11', NULL, '2023-08-26 08:30:11', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (487, 2098, 4, 900, NULL, NULL, NULL, 1, '2023-08-26 08:33:39', NULL, '2023-08-26 08:33:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (488, 2099, 4, 300, NULL, NULL, NULL, 1, '2023-08-26 08:36:42', NULL, '2023-08-26 08:36:42', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (489, 2100, 4, 500, NULL, NULL, NULL, 1, '2023-08-26 08:38:57', NULL, '2023-08-26 08:38:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (490, 767, 4, 400, NULL, NULL, NULL, 1, '2023-08-26 08:41:05', NULL, '2023-08-26 08:41:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (491, 876, 4, 4500, NULL, NULL, NULL, 1, '2023-08-26 08:44:25', NULL, '2023-08-26 08:44:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (492, 877, 4, 4500, NULL, NULL, NULL, 1, '2023-08-26 08:46:00', NULL, '2023-08-26 08:46:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (493, 878, 4, 5000, NULL, NULL, NULL, 1, '2023-08-26 08:48:00', NULL, '2023-08-26 08:48:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (494, 880, 4, 2000, NULL, NULL, NULL, 1, '2023-08-26 08:49:53', NULL, '2023-08-26 08:49:53', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (495, 881, 4, 3000, NULL, NULL, NULL, 1, '2023-08-26 08:51:29', NULL, '2023-08-26 08:51:29', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (496, 1120, 4, 2500, NULL, NULL, NULL, 1, '2023-08-26 08:54:58', NULL, '2023-08-26 08:54:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (497, 2101, 4, 4000, NULL, NULL, NULL, 1, '2023-08-26 08:59:44', NULL, '2023-08-26 08:59:44', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (498, 1163, 4, 6000, NULL, NULL, NULL, 1, '2023-08-26 09:03:05', NULL, '2023-08-26 09:03:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (499, 2102, 4, 2500, NULL, NULL, NULL, 1, '2023-08-26 09:14:47', NULL, '2023-08-26 09:14:47', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (500, 2103, 4, 3000, NULL, NULL, NULL, 1, '2023-08-26 09:16:40', NULL, '2023-08-26 09:16:40', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (501, 2104, 4, 1500, NULL, NULL, NULL, 1, '2023-08-26 09:18:21', NULL, '2023-08-26 09:18:21', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (502, 2105, 4, 9000, NULL, NULL, NULL, 1, '2023-08-26 09:20:13', NULL, '2023-08-26 09:20:13', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (503, 1070, 4, 4000, NULL, NULL, NULL, 1, '2023-08-26 09:21:33', NULL, '2023-08-26 09:21:33', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (504, 2106, 4, 4500, NULL, NULL, NULL, 1, '2023-08-26 09:22:59', NULL, '2023-08-26 09:22:59', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (505, 891, 4, 3000, NULL, NULL, NULL, 1, '2023-08-26 09:25:23', NULL, '2023-08-26 09:25:23', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (506, 1167, 4, 7500, NULL, NULL, NULL, 1, '2023-08-26 09:26:39', NULL, '2023-08-26 09:26:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (507, 2107, 4, 6500, NULL, NULL, NULL, 1, '2023-08-26 09:28:43', NULL, '2023-08-26 09:28:43', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (508, 2108, 4, 3500, NULL, NULL, NULL, 1, '2023-08-26 09:30:25', NULL, '2023-08-26 09:30:25', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (509, 2109, 4, 7500, NULL, NULL, NULL, 1, '2023-08-26 09:31:51', NULL, '2023-08-26 09:31:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (510, 2110, 4, 2000, NULL, NULL, NULL, 1, '2023-08-26 09:33:07', NULL, '2023-08-26 09:33:07', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (511, 2111, 4, 8500, NULL, NULL, NULL, 1, '2023-08-26 09:34:39', NULL, '2023-08-26 09:34:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (512, 2112, 4, 2500, NULL, NULL, NULL, 1, '2023-08-26 09:36:01', NULL, '2023-08-26 09:36:01', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (513, 2113, 4, 23000, NULL, NULL, NULL, 1, '2023-08-26 09:37:48', NULL, '2023-08-26 09:37:48', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (514, 2114, 4, 9500, NULL, NULL, NULL, 1, '2023-08-26 09:39:27', NULL, '2023-08-26 09:39:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (515, 1224, 4, 11000, NULL, NULL, NULL, 1, '2023-08-26 09:40:58', NULL, '2023-08-26 09:40:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (516, 2115, 4, 14000, NULL, NULL, NULL, 1, '2023-08-26 09:42:31', NULL, '2023-08-26 09:42:31', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (517, 2116, 4, 11000, NULL, NULL, NULL, 1, '2023-08-26 09:44:30', NULL, '2023-08-26 09:44:30', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (518, 2117, 4, 10500, NULL, NULL, NULL, 1, '2023-08-26 09:45:51', NULL, '2023-08-26 09:45:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (519, 2118, 4, 4000, NULL, NULL, NULL, 1, '2023-08-26 09:52:41', NULL, '2023-08-26 09:52:41', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (520, 2119, 4, 4000, NULL, NULL, NULL, 1, '2023-08-26 09:54:04', NULL, '2023-08-26 09:54:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (521, 2120, 4, 5000, NULL, NULL, NULL, 1, '2023-08-26 09:56:24', NULL, '2023-08-26 09:56:24', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (522, 2121, 4, 3000, NULL, NULL, NULL, 1, '2023-08-26 09:57:53', NULL, '2023-08-26 09:57:53', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (523, 2122, 4, 8500, NULL, NULL, NULL, 1, '2023-08-26 10:01:58', NULL, '2023-08-26 10:01:58', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (524, 2123, 4, 4500, NULL, NULL, NULL, 1, '2023-08-26 10:03:37', NULL, '2023-08-26 10:03:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (525, 2124, 4, 7000, NULL, NULL, NULL, 1, '2023-08-26 10:05:54', NULL, '2023-08-26 10:05:54', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (526, 842, 4, 3500, NULL, NULL, NULL, 1, '2023-08-26 10:07:19', NULL, '2023-08-26 10:07:19', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (527, 362, 4, 13500, NULL, NULL, NULL, 1, '2023-08-26 10:08:39', NULL, '2023-08-26 10:08:39', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (528, 360, 4, 8500, NULL, NULL, NULL, 1, '2023-08-26 10:09:56', NULL, '2023-08-26 10:09:56', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (529, 361, 4, 7000, NULL, NULL, NULL, 1, '2023-08-26 10:14:10', NULL, '2023-08-26 10:14:10', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (530, 2125, 4, 6500, NULL, NULL, NULL, 1, '2023-08-26 10:15:51', NULL, '2023-08-26 10:15:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (531, 844, 4, 2000, NULL, NULL, NULL, 1, '2023-08-26 10:17:00', NULL, '2023-08-26 10:17:00', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (532, 845, 4, 3000, NULL, NULL, NULL, 1, '2023-08-26 10:18:05', NULL, '2023-08-26 10:18:05', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (533, 1243, 4, 5000, NULL, NULL, NULL, 1, '2023-08-26 10:22:27', NULL, '2023-08-26 10:22:27', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (534, 889, 4, 6500, NULL, NULL, NULL, 1, '2023-08-26 10:23:57', NULL, '2023-08-26 10:23:57', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (535, 915, 4, 3500, NULL, NULL, NULL, 1, '2023-08-26 10:25:06', NULL, '2023-08-26 10:25:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (536, 391, 4, 11000, NULL, NULL, NULL, 1, '2023-08-26 10:26:49', NULL, '2023-08-26 10:26:49', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (537, 942, 4, 5000, NULL, NULL, NULL, 1, '2023-08-26 10:28:06', NULL, '2023-08-26 10:28:06', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (538, 2126, 4, 7000, NULL, NULL, NULL, 1, '2023-08-26 10:29:37', NULL, '2023-08-26 10:29:37', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (539, 951, 4, 5500, NULL, NULL, NULL, 1, '2023-08-26 10:30:52', NULL, '2023-08-26 10:30:52', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (540, 1303, 4, 16500, NULL, NULL, NULL, 1, '2023-08-26 10:32:04', NULL, '2023-08-26 10:32:04', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (541, 1305, 4, 7000, NULL, NULL, NULL, 1, '2023-08-26 10:33:17', NULL, '2023-08-26 10:33:17', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (542, 2127, 4, 5000, NULL, NULL, NULL, 1, '2023-08-26 10:34:51', NULL, '2023-08-26 10:34:51', NULL, NULL, 0);
INSERT INTO `tx_produk_harga` VALUES (543, 1063, 4, 13000, NULL, NULL, NULL, 1, '2023-08-26 10:35:58', NULL, '2023-08-26 10:35:58', NULL, NULL, 0);

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
  `jumlah_stok` int(11) NOT NULL DEFAULT 0,
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
) ENGINE = InnoDB AUTO_INCREMENT = 460 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk_stok
-- ----------------------------
INSERT INTO `tx_produk_stok` VALUES (1, 27, 1, 1, NULL, 12, NULL, '2023-07-31', NULL, '2023-07-26 10:11:55', 1, '2023-07-26 15:11:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (2, 14, 2, 0, NULL, 144, NULL, '2023-07-20', 2, '2023-07-10 10:05:07', NULL, '2023-07-10 15:05:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (3, 13, 2, 1, NULL, 10, NULL, '2023-07-22', 2, '2023-07-10 11:02:11', NULL, '2023-07-10 16:02:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (4, 15, 2, 1, NULL, 13, NULL, '2023-07-19', 2, '2023-07-10 11:02:39', NULL, '2023-07-10 16:02:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (5, 29, 1, 1, NULL, 0, NULL, '2023-07-31', 1, '2023-07-26 10:11:28', NULL, '2023-07-31 16:54:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (6, 297, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-09 15:23:53', NULL, '2023-08-09 15:23:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (7, 1945, 1, 1, NULL, 3, NULL, '2026-04-30', 1, '2023-08-09 15:59:52', NULL, '2023-08-09 15:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (8, 1952, 1, 1, NULL, 3, NULL, '2027-04-30', 1, '2023-08-09 16:10:21', NULL, '2023-08-09 16:10:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (9, 1953, 1, 1, NULL, 3, NULL, '2025-10-31', 1, '2023-08-09 16:15:23', NULL, '2023-08-09 16:15:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (10, 1954, 1, 1, NULL, 3, NULL, '2025-12-31', 1, '2023-08-09 16:19:01', NULL, '2023-08-09 16:19:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (11, 1955, 1, 1, NULL, 3, NULL, '2026-02-28', 1, '2023-08-09 16:22:24', NULL, '2023-08-09 16:22:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (12, 1956, 1, 1, NULL, 3, NULL, '2026-02-28', 1, '2023-08-09 16:24:31', NULL, '2023-08-09 16:24:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (13, 1957, 1, 1, NULL, 3, NULL, '2026-01-31', 1, '2023-08-09 16:26:31', NULL, '2023-08-09 16:26:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (14, 1958, 1, 1, NULL, 3, NULL, '2026-07-31', 1, '2023-08-09 16:30:12', NULL, '2023-08-09 16:30:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (15, 1959, 1, 1, NULL, 3, NULL, '2025-03-31', 1, '2023-08-09 16:32:49', NULL, '2023-08-09 16:32:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (16, 1960, 1, 1, NULL, 2, NULL, '2024-11-30', 1, '2023-08-09 16:36:04', NULL, '2023-08-09 16:36:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (17, 1961, 1, 1, NULL, 2, NULL, '2025-02-20', 1, '2023-08-09 16:37:46', NULL, '2023-08-09 16:37:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (18, 1962, 1, 1, NULL, 2, NULL, '2025-02-13', 1, '2023-08-09 16:38:55', NULL, '2023-08-09 16:38:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (19, 1507, 1, 1, NULL, 10, NULL, '2025-11-30', 1, '2023-08-09 16:42:40', NULL, '2023-08-09 16:42:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (20, 1506, 1, 1, NULL, 10, NULL, '2025-12-31', 1, '2023-08-09 16:44:51', NULL, '2023-08-09 16:44:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (21, 1963, 1, 1, NULL, 10, NULL, '2026-05-31', 1, '2023-08-09 16:47:13', NULL, '2023-08-09 16:47:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (22, 1676, 1, 1, NULL, 12, NULL, '2026-02-24', 1, '2023-08-09 16:52:39', NULL, '2023-08-09 16:52:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (23, 1675, 1, 1, NULL, 12, NULL, '2026-06-18', 1, '2023-08-09 16:53:09', NULL, '2023-08-09 16:53:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (24, 1622, 1, 1, NULL, 10, NULL, '2025-03-31', 1, '2023-08-09 16:57:58', NULL, '2023-08-09 16:57:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (25, 1623, 1, 1, NULL, 10, NULL, '2025-04-30', 1, '2023-08-09 16:58:19', NULL, '2023-08-09 16:58:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (26, 1964, 1, 1, NULL, 20, NULL, '2027-02-28', 1, '2023-08-09 17:01:35', NULL, '2023-08-09 17:01:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (27, 600, 1, 1, NULL, 2, NULL, '2025-09-30', 1, '2023-08-10 13:44:23', NULL, '2023-08-10 13:44:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (28, 603, 1, 1, NULL, 2, NULL, '2025-10-31', 1, '2023-08-10 13:46:26', NULL, '2023-08-10 13:46:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (29, 598, 1, 1, NULL, 2, NULL, '2026-05-31', 1, '2023-08-10 13:49:40', NULL, '2023-08-10 13:49:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (30, 601, 1, 1, NULL, 2, NULL, '2026-03-31', 1, '2023-08-10 13:53:13', NULL, '2023-08-10 13:53:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (31, 1965, 1, 1, NULL, 5, NULL, '2026-02-28', 1, '2023-08-23 17:24:33', 1, '2023-08-23 17:24:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (32, 556, 1, 1, NULL, 3, NULL, '2026-09-30', 1, '2023-08-10 13:58:38', NULL, '2023-08-10 13:58:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (33, 554, 1, 1, NULL, 3, NULL, '2028-04-30', 1, '2023-08-10 14:01:23', NULL, '2023-08-10 14:01:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (34, 562, 1, 1, NULL, 3, NULL, '2027-05-31', 1, '2023-08-10 14:02:42', NULL, '2023-08-10 14:02:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (35, 548, 1, 1, NULL, 3, NULL, '2027-12-31', 1, '2023-08-10 14:05:52', NULL, '2023-08-10 14:05:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (36, 545, 1, 1, NULL, 3, NULL, '2027-11-30', 1, '2023-08-10 14:07:20', NULL, '2023-08-10 14:07:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (37, 621, 1, 1, NULL, 3, NULL, '2027-01-31', 1, '2023-08-10 14:10:40', NULL, '2023-08-10 14:10:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (38, 549, 1, 1, NULL, 5, NULL, '2028-06-30', 1, '2023-08-23 17:23:03', 1, '2023-08-23 17:23:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (39, 550, 1, 1, NULL, 5, NULL, '2028-04-30', 1, '2023-08-23 17:23:34', 1, '2023-08-23 17:23:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (40, 590, 1, 1, NULL, 3, NULL, '2024-11-30', 1, '2023-08-10 14:16:48', NULL, '2023-08-10 14:16:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (41, 1966, 1, 0, NULL, 6, NULL, '1970-01-01', 1, '2023-08-10 14:43:29', 1, '2023-08-10 14:43:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (42, 1967, 1, 1, NULL, 3, NULL, '2028-05-31', 1, '2023-08-10 14:34:58', NULL, '2023-08-10 14:34:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (43, 589, 1, 1, NULL, 3, NULL, '2028-06-30', 1, '2023-08-10 14:38:35', NULL, '2023-08-10 14:38:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (44, 1968, 1, 1, NULL, 9, NULL, '2028-02-29', 1, '2023-08-10 14:44:04', 1, '2023-08-10 14:44:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (45, 1969, 1, 0, NULL, 6, NULL, '1970-01-01', 1, '2023-08-10 14:47:02', 1, '2023-08-10 14:47:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (46, 1970, 1, 1, NULL, 3, NULL, '2025-09-30', 1, '2023-08-10 14:53:59', NULL, '2023-08-10 14:53:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (47, 1971, 1, 1, NULL, 3, NULL, '2026-03-31', 1, '2023-08-10 14:56:26', NULL, '2023-08-10 14:56:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (48, 1972, 1, 1, NULL, 3, NULL, '2027-09-30', 1, '2023-08-10 14:58:56', NULL, '2023-08-10 14:58:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (49, 1973, 1, 1, NULL, 3, NULL, '2027-03-31', 1, '2023-08-10 15:03:56', NULL, '2023-08-10 15:03:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (50, 1974, 1, 1, NULL, 3, NULL, '2027-12-31', 1, '2023-08-10 15:04:24', NULL, '2023-08-10 15:04:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (51, 1975, 1, 1, NULL, 3, NULL, '2027-12-31', 1, '2023-08-10 15:14:05', NULL, '2023-08-10 15:14:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (52, 1976, 1, 1, NULL, 3, NULL, '2027-07-31', 1, '2023-08-10 15:14:31', NULL, '2023-08-10 15:14:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (53, 579, 1, 1, NULL, 3, NULL, '2025-05-31', 1, '2023-08-10 15:25:16', NULL, '2023-08-10 15:25:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (54, 575, 1, 0, NULL, 3, NULL, '2024-06-30', 1, '2023-08-10 15:26:10', NULL, '2023-08-10 15:26:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (55, 573, 1, 1, NULL, 6, NULL, '2025-06-30', 1, '2023-08-21 08:56:51', 1, '2023-08-21 08:56:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (56, 1977, 1, 1, NULL, 6, NULL, '2024-12-31', 1, '2023-08-10 15:27:31', NULL, '2023-08-10 15:27:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (57, 654, 1, 1, NULL, 6, NULL, '2025-03-31', 1, '2023-08-10 15:28:30', NULL, '2023-08-10 15:28:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (58, 1978, 1, 1, NULL, 6, NULL, '2025-06-30', 1, '2023-08-19 10:57:21', NULL, '2023-08-19 10:57:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (59, 1979, 1, 1, NULL, 3, NULL, '2026-01-31', 1, '2023-08-19 11:10:10', NULL, '2023-08-19 11:10:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (60, 1980, 1, 1, NULL, 3, NULL, '2026-03-31', 1, '2023-08-19 11:14:45', NULL, '2023-08-19 11:14:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (61, 1982, 1, 1, NULL, 3, NULL, '2027-11-30', 1, '2023-08-19 11:43:21', NULL, '2023-08-19 11:43:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (62, 1983, 1, 1, NULL, 3, NULL, '2028-02-29', 1, '2023-08-19 11:53:59', NULL, '2023-08-19 11:53:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (63, 1984, 1, 1, NULL, 3, NULL, '2027-03-31', 1, '2023-08-19 12:00:44', NULL, '2023-08-19 12:00:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (64, 1985, 1, 1, NULL, 3, NULL, '2026-02-23', 1, '2023-08-19 12:44:46', NULL, '2023-08-19 12:44:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (65, 1987, 1, 1, NULL, 3, NULL, '2028-05-31', 1, '2023-08-19 12:53:11', NULL, '2023-08-19 12:53:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (66, 31, 1, 1, NULL, 10, NULL, '2026-01-31', 1, '2023-08-19 12:56:39', NULL, '2023-08-19 12:56:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (67, 1344, 1, 1, NULL, 3, NULL, '2026-03-31', 1, '2023-08-19 13:00:37', NULL, '2023-08-19 13:00:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (68, 1342, 1, 1, NULL, 3, NULL, '2025-04-30', 1, '2023-08-19 13:03:03', NULL, '2023-08-19 13:03:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (69, 295, 1, 1, NULL, 12, NULL, '2025-01-31', 1, '2023-08-19 13:08:37', NULL, '2023-08-19 13:08:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (70, 33, 1, 1, NULL, 20, NULL, '2026-03-31', 1, '2023-08-19 13:11:16', NULL, '2023-08-19 13:11:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (71, 294, 1, 1, NULL, 5, NULL, '2025-03-31', 1, '2023-08-19 13:14:09', NULL, '2023-08-19 13:14:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (72, 34, 1, 1, NULL, 6, NULL, '2026-03-31', 1, '2023-08-19 13:20:11', NULL, '2023-08-19 13:20:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (73, 1988, 1, 1, NULL, 3, NULL, '2024-08-31', 1, '2023-08-19 13:27:38', NULL, '2023-08-19 13:27:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (74, 566, 1, 1, NULL, 6, NULL, '2026-05-31', 1, '2023-08-19 13:31:03', NULL, '2023-08-19 13:31:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (75, 1989, 1, 1, NULL, 3, NULL, '2026-06-30', 1, '2023-08-21 07:12:39', NULL, '2023-08-21 07:12:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (76, 1992, 1, 1, NULL, 3, NULL, '2024-03-31', 1, '2023-08-21 07:20:29', NULL, '2023-08-21 07:20:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (77, 1993, 1, 0, NULL, 3, NULL, '2025-12-31', 1, '2023-08-21 07:24:03', NULL, '2023-08-21 07:24:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (78, 1995, 1, 0, NULL, 12, NULL, '2024-06-30', 1, '2023-08-21 07:29:41', NULL, '2023-08-21 07:29:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (79, 39, 1, 1, NULL, 6, NULL, '2027-11-30', 1, '2023-08-21 07:32:43', NULL, '2023-08-21 07:32:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (80, 309, 1, 1, NULL, 3, NULL, '2024-08-31', 1, '2023-08-21 07:35:36', NULL, '2023-08-21 07:35:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (81, 42, 1, 1, NULL, 1, NULL, '2024-11-30', 1, '2023-08-21 07:38:15', NULL, '2023-08-21 07:38:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (82, 43, 1, 1, NULL, 1, NULL, '2025-01-31', 1, '2023-08-21 07:39:56', NULL, '2023-08-21 07:39:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (83, 41, 1, 1, NULL, 1, NULL, '2025-02-28', 1, '2023-08-21 07:42:01', NULL, '2023-08-21 07:42:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (84, 311, 1, 1, NULL, 3, NULL, '2024-05-31', 1, '2023-08-21 07:44:46', NULL, '2023-08-21 07:44:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (85, 52, 1, 1, NULL, 24, NULL, '2028-04-30', 1, '2023-08-21 07:48:41', NULL, '2023-08-21 07:48:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (86, 48, 1, 1, NULL, 25, NULL, '2026-03-31', 1, '2023-08-21 07:50:56', NULL, '2023-08-21 07:50:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (87, 50, 1, 1, NULL, 50, NULL, '2026-02-02', 1, '2023-08-23 16:01:03', 1, '2023-08-23 16:01:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (88, 51, 1, 1, NULL, 25, NULL, '2026-02-28', 1, '2023-08-21 07:58:00', NULL, '2023-08-21 07:58:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (89, 53, 1, 1, NULL, 24, NULL, '2025-03-31', 1, '2023-08-21 08:02:14', NULL, '2023-08-21 08:02:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (90, 317, 1, 1, NULL, 5, NULL, '2025-05-31', 1, '2023-08-23 16:53:32', 1, '2023-08-23 16:53:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (91, 316, 1, 1, NULL, 3, NULL, '2025-04-30', 1, '2023-08-21 08:08:59', NULL, '2023-08-21 08:08:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (92, 1998, 1, 1, NULL, 3, NULL, '2025-01-31', 1, '2023-08-21 08:14:53', NULL, '2023-08-21 08:14:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (93, 1999, 1, 1, NULL, 3, NULL, '2028-02-29', 1, '2023-08-21 08:18:46', NULL, '2023-08-21 08:18:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (94, 2002, 1, 1, NULL, 3, NULL, '2025-05-31', 1, '2023-08-21 08:26:27', NULL, '2023-08-21 08:26:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (95, 569, 1, 1, NULL, 3, NULL, '2024-04-30', 1, '2023-08-21 08:29:22', NULL, '2023-08-21 08:29:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (96, 55, 1, 1, NULL, 5, NULL, '2024-08-08', 1, '2023-08-23 16:02:01', 1, '2023-08-23 16:02:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (97, 2003, 1, 1, NULL, 10, NULL, '2027-09-30', 1, '2023-08-21 08:35:21', NULL, '2023-08-21 08:35:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (98, 68, 1, 1, NULL, 3, NULL, '2026-06-30', 1, '2023-08-21 08:45:47', NULL, '2023-08-21 08:45:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (99, 2005, 1, 1, NULL, 12, NULL, '2026-08-31', 1, '2023-08-21 08:51:39', NULL, '2023-08-21 08:51:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (100, 585, 1, 1, NULL, 3, NULL, '2025-06-30', 1, '2023-08-21 09:05:32', NULL, '2023-08-21 09:05:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (101, 74, 1, 1, NULL, 4, NULL, '2026-04-30', 1, '2023-08-23 16:05:07', 1, '2023-08-23 16:05:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (102, 346, 1, 1, NULL, 5, NULL, '2026-01-18', 1, '2023-08-23 17:38:11', 1, '2023-08-23 17:38:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (103, 1357, 1, 1, NULL, 25, NULL, '2026-01-31', 1, '2023-08-21 09:22:29', NULL, '2023-08-21 09:22:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (104, 1359, 1, 1, NULL, 6, NULL, '2026-03-31', 1, '2023-08-21 09:25:40', NULL, '2023-08-21 09:25:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (105, 76, 1, 1, NULL, 1, NULL, '2027-03-31', 1, '2023-08-21 09:28:00', NULL, '2023-08-21 09:28:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (106, 2006, 1, 1, NULL, 3, NULL, '2026-05-31', 1, '2023-08-21 09:32:58', NULL, '2023-08-21 09:32:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (107, 80, 1, 1, NULL, 24, NULL, '2026-06-30', 1, '2023-08-23 16:06:43', 1, '2023-08-23 16:06:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (108, 81, 1, 1, NULL, 6, NULL, '2025-12-31', 1, '2023-08-21 09:38:32', NULL, '2023-08-21 09:38:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (109, 1225, 1, 1, NULL, 3, NULL, '2026-11-30', 1, '2023-08-21 09:43:00', NULL, '2023-08-21 09:43:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (110, 2008, 1, 1, NULL, 5, NULL, '2024-08-31', 1, '2023-08-21 09:48:29', NULL, '2023-08-21 09:48:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (111, 89, 1, 1, NULL, 3, NULL, '2026-01-31', 1, '2023-08-21 09:54:34', NULL, '2023-08-21 09:54:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (112, 93, 1, 1, NULL, 25, NULL, '2024-06-30', 1, '2023-08-21 09:58:28', NULL, '2023-08-21 09:58:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (113, 92, 1, 1, NULL, 2, NULL, '2024-05-31', 1, '2023-08-21 10:01:09', NULL, '2023-08-21 10:01:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (114, 94, 1, 1, NULL, 12, NULL, '2028-05-31', 1, '2023-08-21 10:05:09', NULL, '2023-08-21 10:05:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (115, 359, 1, 1, NULL, 6, NULL, '2024-12-31', 1, '2023-08-21 10:07:18', NULL, '2023-08-21 10:07:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (116, 2010, 1, 1, NULL, 5, NULL, '2024-09-30', 1, '2023-08-21 10:10:55', NULL, '2023-08-21 10:10:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (117, 97, 1, 1, NULL, 12, NULL, '2026-02-28', 1, '2023-08-21 10:15:08', NULL, '2023-08-21 10:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (118, 102, 1, 1, NULL, 8, NULL, '2024-11-30', 1, '2023-08-23 16:08:29', 1, '2023-08-23 16:08:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (119, 106, 1, 1, NULL, 6, NULL, '2028-06-30', 1, '2023-08-21 10:20:43', NULL, '2023-08-21 10:20:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (120, 2011, 1, 1, NULL, 1, NULL, '2027-04-30', 1, '2023-08-21 10:24:17', NULL, '2023-08-21 10:24:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (121, 1588, 1, 1, NULL, 1, NULL, '2026-05-31', 1, '2023-08-21 10:26:07', NULL, '2023-08-21 10:26:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (122, 1590, 1, 1, NULL, 1, NULL, '2027-02-28', 1, '2023-08-21 10:27:50', NULL, '2023-08-21 10:27:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (123, 113, 1, 1, NULL, 1, NULL, '2026-09-30', 1, '2023-08-21 10:30:46', NULL, '2023-08-21 10:30:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (124, 114, 1, 1, NULL, 2, NULL, '2026-04-13', 1, '2023-08-23 16:14:15', 1, '2023-08-23 16:14:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (125, 118, 1, 1, NULL, 1, NULL, '2027-03-31', 1, '2023-08-21 10:42:10', NULL, '2023-08-21 10:42:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (126, 109, 1, 1, NULL, 2, NULL, '2026-02-28', 1, '2023-08-23 16:15:08', 1, '2023-08-23 16:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (127, 116, 1, 1, NULL, 1, NULL, '2027-02-28', 1, '2023-08-21 10:47:01', NULL, '2023-08-21 10:47:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (128, 107, 1, 1, NULL, 2, NULL, '2026-12-13', 1, '2023-08-23 16:14:45', 1, '2023-08-23 16:14:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (129, 125, 1, 1, NULL, 1, NULL, '2024-10-31', 1, '2023-08-21 10:54:07', NULL, '2023-08-21 10:54:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (130, 124, 1, 1, NULL, 1, NULL, '2024-12-31', 1, '2023-08-21 10:55:39', NULL, '2023-08-21 10:55:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (131, 126, 1, 1, NULL, 1, NULL, '2025-01-31', 1, '2023-08-21 10:57:02', NULL, '2023-08-21 10:57:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (132, 588, 1, 1, NULL, 3, NULL, '2028-01-31', 1, '2023-08-21 11:00:30', NULL, '2023-08-21 11:00:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (133, 2012, 1, 1, NULL, 6, NULL, '2026-12-31', 1, '2023-08-21 11:04:41', NULL, '2023-08-21 11:04:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (134, 2013, 1, 1, NULL, 6, NULL, '2027-05-31', 1, '2023-08-21 11:07:12', NULL, '2023-08-21 11:07:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (135, 1607, 1, 1, NULL, 100, NULL, '2026-03-31', 1, '2023-08-21 11:21:49', NULL, '2023-08-21 11:21:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (136, 1626, 1, 1, NULL, 10, NULL, '2026-02-28', 1, '2023-08-21 11:29:00', NULL, '2023-08-21 11:29:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (137, 1627, 1, 1, NULL, 10, NULL, '2025-10-31', 1, '2023-08-21 11:31:53', NULL, '2023-08-21 11:31:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (138, 141, 1, 1, NULL, 10, NULL, '2026-03-31', 1, '2023-08-21 11:35:29', NULL, '2023-08-21 11:35:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (139, 144, 1, 1, NULL, 10, NULL, '2026-03-31', 1, '2023-08-21 11:39:48', NULL, '2023-08-21 11:39:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (140, 368, 1, 1, NULL, 3, NULL, '2024-11-30', 1, '2023-08-21 11:42:13', NULL, '2023-08-21 11:42:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (141, 2014, 1, 0, NULL, 3, NULL, '2027-08-31', 1, '2023-08-21 11:46:38', NULL, '2023-08-21 11:46:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (142, 594, 1, 1, NULL, 2, NULL, '2025-08-31', 1, '2023-08-21 11:51:51', NULL, '2023-08-21 11:51:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (143, 596, 1, 0, NULL, 2, NULL, '2025-08-31', 1, '2023-08-21 11:53:08', NULL, '2023-08-21 11:53:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (144, 1376, 1, 1, NULL, 3, NULL, '2026-12-31', 1, '2023-08-21 12:08:52', NULL, '2023-08-21 12:08:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (145, 1377, 1, 1, NULL, 3, NULL, '2026-02-28', 1, '2023-08-21 12:13:49', NULL, '2023-08-21 12:13:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (146, 1378, 1, 1, NULL, 3, NULL, '2025-10-31', 1, '2023-08-21 12:15:21', NULL, '2023-08-21 12:15:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (147, 370, 1, 1, NULL, 3, NULL, '2025-12-31', 1, '2023-08-21 12:16:58', NULL, '2023-08-21 12:16:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (148, 607, 1, 1, NULL, 6, NULL, '2028-03-31', 1, '2023-08-21 12:45:46', NULL, '2023-08-21 12:45:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (149, 894, 1, 1, NULL, 10, NULL, '2026-01-31', 1, '2023-08-21 12:51:50', NULL, '2023-08-21 12:51:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (150, 379, 1, 1, NULL, 2, NULL, '2025-01-31', 1, '2023-08-21 12:56:11', NULL, '2023-08-21 12:56:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (151, 1383, 1, 1, NULL, 25, NULL, '2026-05-31', 1, '2023-08-21 12:58:37', NULL, '2023-08-21 12:58:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (152, 1384, 1, 1, NULL, 6, NULL, '2025-05-31', 1, '2023-08-21 13:05:16', NULL, '2023-08-21 13:05:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (153, 151, 1, 1, NULL, 25, NULL, '2025-03-31', 1, '2023-08-21 13:11:54', NULL, '2023-08-21 13:11:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (154, 609, 1, 1, NULL, 6, NULL, '2024-08-31', 1, '2023-08-21 13:23:56', NULL, '2023-08-21 13:23:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (155, 2015, 1, 1, NULL, 3, NULL, '2026-04-30', 1, '2023-08-21 13:25:08', NULL, '2023-08-21 13:25:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (156, 610, 1, 1, NULL, 3, NULL, '2025-01-31', 1, '2023-08-21 13:29:03', NULL, '2023-08-21 13:29:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (157, 1661, 1, 1, NULL, 12, NULL, '1970-01-01', 1, '2023-08-21 13:37:33', NULL, '2023-08-21 13:37:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (158, 156, 1, 1, NULL, 3, NULL, '2027-10-31', 1, '2023-08-21 13:42:35', NULL, '2023-08-21 13:42:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (159, 157, 1, 1, NULL, 10, NULL, '2027-02-28', 1, '2023-08-21 13:47:26', NULL, '2023-08-21 13:47:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (160, 1668, 1, 1, NULL, 3, NULL, '2026-06-30', 1, '2023-08-21 13:50:43', NULL, '2023-08-21 13:50:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (161, 2018, 1, 1, NULL, 3, NULL, '2024-06-30', 1, '2023-08-21 13:53:41', NULL, '2023-08-21 13:53:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (162, 387, 1, 1, NULL, 12, NULL, '2025-05-31', 1, '2023-08-23 17:42:40', 1, '2023-08-23 17:42:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (163, 1463, 1, 1, NULL, 10, NULL, '2024-09-30', 1, '2023-08-21 14:06:37', NULL, '2023-08-21 14:06:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (164, 2019, 1, 1, NULL, 10, NULL, '2025-03-31', 1, '2023-08-21 14:09:31', NULL, '2023-08-21 14:09:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (165, 1812, 1, 1, NULL, 27, NULL, '2027-05-31', 1, '2023-08-23 17:47:50', 1, '2023-08-23 17:47:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (166, 1810, 1, 1, NULL, 3, NULL, '2027-03-31', 1, '2023-08-21 14:19:36', NULL, '2023-08-21 14:19:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (167, 1808, 1, 1, NULL, 27, NULL, '2028-01-31', 1, '2023-08-23 17:47:19', 1, '2023-08-23 17:47:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (168, 1806, 1, 1, NULL, 3, NULL, '2027-10-31', 1, '2023-08-21 14:23:07', NULL, '2023-08-21 14:23:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (169, 2020, 1, 1, NULL, 3, NULL, '2025-04-30', 1, '2023-08-21 14:28:17', NULL, '2023-08-21 14:28:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (170, 2021, 1, 1, NULL, 3, NULL, '2026-01-31', 1, '2023-08-21 14:31:25', NULL, '2023-08-21 14:31:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (171, 2022, 1, 1, NULL, 3, NULL, '2025-07-31', 1, '2023-08-21 14:35:09', NULL, '2023-08-21 14:35:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (172, 1465, 1, 1, NULL, 6, NULL, '2026-01-31', 1, '2023-08-21 14:42:38', NULL, '2023-08-21 14:42:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (173, 2023, 1, 0, NULL, 3, NULL, '2025-02-28', 1, '2023-08-21 14:55:02', NULL, '2023-08-21 14:55:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (174, 2024, 1, 1, NULL, 3, NULL, '2027-06-30', 1, '2023-08-22 07:11:59', NULL, '2023-08-22 07:11:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (175, 2025, 1, 1, NULL, 3, NULL, '2026-12-24', 1, '2023-08-22 07:14:50', NULL, '2023-08-22 07:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (176, 2026, 1, 1, NULL, 12, NULL, '2028-05-31', 1, '2023-08-22 07:18:12', NULL, '2023-08-22 07:18:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (177, 2027, 1, 1, NULL, 24, NULL, '2028-01-31', 1, '2023-08-22 07:21:27', 1, '2023-08-22 07:21:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (178, 2028, 1, 1, NULL, 3, NULL, '2028-02-29', 1, '2023-08-22 07:26:31', NULL, '2023-08-22 07:26:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (179, 2029, 1, 1, NULL, 3, NULL, '2028-04-30', 1, '2023-08-22 07:29:35', NULL, '2023-08-22 07:29:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (180, 2030, 1, 1, NULL, 5, NULL, '2024-11-30', 1, '2023-08-22 07:32:55', NULL, '2023-08-22 07:32:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (181, 2031, 1, 1, NULL, 5, NULL, '2024-08-31', 1, '2023-08-22 07:35:09', NULL, '2023-08-22 07:35:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (182, 400, 1, 1, NULL, 4, NULL, '2027-04-30', 1, '2023-08-22 07:39:05', NULL, '2023-08-22 07:39:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (183, 397, 1, 1, NULL, 4, NULL, '2026-10-31', 1, '2023-08-22 07:41:06', NULL, '2023-08-22 07:41:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (184, 398, 1, 1, NULL, 5, NULL, '2026-11-30', 1, '2023-08-23 17:45:37', 1, '2023-08-23 17:45:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (185, 2032, 1, 1, NULL, 1, NULL, '2026-05-31', 1, '2023-08-22 07:47:40', NULL, '2023-08-22 07:47:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (186, 2033, 1, 1, NULL, 2, NULL, '2026-03-05', 1, '2023-08-22 07:50:08', NULL, '2023-08-22 07:50:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (187, 2034, 1, 1, NULL, 1, NULL, '2026-04-18', 1, '2023-08-22 07:53:09', NULL, '2023-08-22 07:53:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (188, 2035, 1, 1, NULL, 2, NULL, '2026-02-22', 1, '2023-08-22 07:55:48', NULL, '2023-08-22 07:55:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (189, 664, 1, 1, NULL, 12, NULL, '2026-05-31', 1, '2023-08-22 07:58:37', NULL, '2023-08-22 07:58:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (190, 663, 1, 1, NULL, 12, NULL, '2026-01-31', 1, '2023-08-22 07:59:52', NULL, '2023-08-22 07:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (191, 672, 1, 1, NULL, 3, NULL, '2026-03-31', 1, '2023-08-22 08:02:10', NULL, '2023-08-22 08:02:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (192, 670, 1, 1, NULL, 3, NULL, '2025-12-31', 1, '2023-08-22 08:03:40', NULL, '2023-08-22 08:03:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (193, 668, 1, 1, NULL, 2, NULL, '2026-02-28', 1, '2023-08-22 08:05:41', NULL, '2023-08-22 08:05:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (194, 667, 1, 1, NULL, 2, NULL, '2025-11-30', 1, '2023-08-22 08:06:59', NULL, '2023-08-22 08:06:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (195, 669, 1, 1, NULL, 2, NULL, '2026-03-31', 1, '2023-08-22 08:08:14', NULL, '2023-08-22 08:08:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (196, 2036, 1, 1, NULL, 12, NULL, '2026-03-31', 1, '2023-08-22 08:13:24', NULL, '2023-08-22 08:13:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (197, 675, 1, 1, NULL, 12, NULL, '2026-03-31', 1, '2023-08-22 08:14:08', NULL, '2023-08-22 08:14:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (198, 676, 1, 1, NULL, 12, NULL, '2026-05-31', 1, '2023-08-22 08:14:39', NULL, '2023-08-22 08:14:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (199, 1701, 1, 1, NULL, 13, NULL, '2028-09-30', 1, '2023-08-23 17:48:43', 1, '2023-08-23 17:48:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (200, 1467, 1, 1, NULL, 25, NULL, '2024-10-31', 1, '2023-08-22 08:22:47', NULL, '2023-08-22 08:22:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (201, 2037, 1, 1, NULL, 3, NULL, '2026-05-31', 1, '2023-08-22 08:25:36', NULL, '2023-08-22 08:25:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (202, 410, 1, 1, NULL, 50, NULL, '2026-08-31', 1, '2023-08-22 08:28:14', NULL, '2023-08-22 08:28:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (203, 176, 1, 1, NULL, 25, NULL, '2024-12-31', 1, '2023-08-22 08:34:15', NULL, '2023-08-22 08:34:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (204, 1392, 1, 1, NULL, 6, NULL, '2024-11-30', 1, '2023-08-22 08:36:01', NULL, '2023-08-22 08:36:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (205, 296, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-22 09:06:24', NULL, '2023-08-22 09:06:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (206, 390, 1, 1, NULL, 30, NULL, '2025-02-28', 1, '2023-08-22 09:09:19', NULL, '2023-08-22 09:09:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (207, 1462, 1, 1, NULL, 30, NULL, '2025-01-31', 1, '2023-08-22 09:10:53', NULL, '2023-08-22 09:10:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (208, 179, 1, 1, NULL, 10, NULL, '2025-01-20', 1, '2023-08-22 09:13:58', NULL, '2023-08-22 09:13:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (209, 412, 1, 1, NULL, 3, NULL, '2026-01-05', 1, '2023-08-22 09:16:27', NULL, '2023-08-22 09:16:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (210, 180, 1, 1, NULL, 25, NULL, '2024-10-31', 1, '2023-08-22 09:18:39', NULL, '2023-08-22 09:18:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (211, 1396, 1, 1, NULL, 25, NULL, '2025-02-28', 1, '2023-08-22 09:22:27', NULL, '2023-08-22 09:22:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (212, 991, 1, 1, NULL, 3, NULL, '2025-05-18', 1, '2023-08-22 09:26:10', NULL, '2023-08-22 09:26:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (213, 990, 1, 1, NULL, 3, NULL, '2025-08-23', 1, '2023-08-22 09:27:37', NULL, '2023-08-22 09:27:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (214, 191, 1, 1, NULL, 3, NULL, '2028-06-30', 1, '2023-08-22 09:31:16', NULL, '2023-08-22 09:31:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (215, 419, 1, 1, NULL, 8, NULL, '2025-02-28', 1, '2023-08-23 17:12:08', 1, '2023-08-23 17:12:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (216, 425, 1, 1, NULL, 3, NULL, '1970-01-01', 1, '2023-08-22 09:38:37', NULL, '2023-08-22 09:38:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (217, 1403, 1, 1, NULL, 6, NULL, '2025-02-28', 1, '2023-08-22 09:42:28', NULL, '2023-08-22 09:42:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (218, 1398, 1, 1, NULL, 2, NULL, '2025-04-23', 1, '2023-08-22 09:44:22', NULL, '2023-08-22 09:44:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (219, 1400, 1, 1, NULL, 2, NULL, '2025-03-31', 1, '2023-08-22 09:46:37', NULL, '2023-08-22 09:46:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (220, 1399, 1, 1, NULL, 2, NULL, '2025-04-30', 1, '2023-08-22 09:48:05', NULL, '2023-08-22 09:48:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (221, 202, 1, 1, NULL, 62, NULL, '2028-06-30', 1, '2023-08-23 16:26:05', 1, '2023-08-23 16:26:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (222, 205, 1, 1, NULL, 5, NULL, '2026-04-30', 1, '2023-08-22 09:54:02', NULL, '2023-08-22 09:54:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (223, 207, 1, 1, NULL, 5, NULL, '2026-05-31', 1, '2023-08-22 09:55:54', NULL, '2023-08-22 09:55:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (224, 209, 1, 1, NULL, 25, NULL, '2025-04-30', 1, '2023-08-22 09:59:10', NULL, '2023-08-22 09:59:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (225, 1425, 1, 1, NULL, 6, NULL, '2025-01-31', 1, '2023-08-22 10:01:16', NULL, '2023-08-22 10:01:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (226, 208, 1, 1, NULL, 6, NULL, '2026-03-31', 1, '2023-08-22 10:02:42', NULL, '2023-08-22 10:02:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (227, 2038, 1, 1, NULL, 3, NULL, '2025-05-31', 1, '2023-08-22 10:05:18', NULL, '2023-08-22 10:05:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (228, 252, 1, 1, NULL, 20, NULL, '2025-05-31', 1, '2023-08-22 10:08:38', NULL, '2023-08-22 10:08:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (229, 2039, 1, 1, NULL, 15, NULL, '2027-02-28', 1, '2023-08-22 10:14:44', NULL, '2023-08-22 10:14:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (230, 32, 1, 1, NULL, 30, NULL, '2024-07-31', 1, '2023-08-22 10:20:31', NULL, '2023-08-22 10:20:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (231, 212, 1, 1, NULL, 10, NULL, '2025-12-31', 1, '2023-08-22 10:25:50', NULL, '2023-08-22 10:25:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (232, 211, 1, 1, NULL, 3, NULL, '2026-05-31', 1, '2023-08-22 10:27:44', NULL, '2023-08-22 10:27:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (233, 213, 1, 1, NULL, 6, NULL, '2024-09-30', 1, '2023-08-22 10:29:55', NULL, '2023-08-22 10:29:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (234, 1931, 1, 1, NULL, 2, NULL, '2026-02-28', 1, '2023-08-22 10:34:51', NULL, '2023-08-22 10:34:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (235, 1430, 1, 1, NULL, 1, NULL, '2025-04-30', 1, '2023-08-22 10:37:57', NULL, '2023-08-22 10:37:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (236, 1428, 1, 1, NULL, 2, NULL, '2025-06-30', 1, '2023-08-22 10:42:19', NULL, '2023-08-22 10:42:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (237, 1023, 1, 1, NULL, 5, NULL, '2025-05-31', 1, '2023-08-22 10:49:02', NULL, '2023-08-22 10:49:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (238, 452, 1, 1, NULL, 3, NULL, '2026-01-31', 1, '2023-08-22 10:54:12', NULL, '2023-08-22 10:54:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (239, 1433, 1, 1, NULL, 24, NULL, '2024-12-31', 1, '2023-08-22 10:57:28', NULL, '2023-08-22 10:57:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (240, 1432, 1, 1, NULL, 6, NULL, '2024-12-31', 1, '2023-08-22 10:59:24', NULL, '2023-08-22 10:59:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (241, 215, 1, 1, NULL, 12, NULL, '2025-03-31', 1, '2023-08-22 11:09:19', NULL, '2023-08-22 11:09:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (242, 2041, 1, 1, NULL, 18, NULL, '2025-03-31', 1, '2023-08-22 11:19:05', NULL, '2023-08-22 11:19:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (243, 462, 1, 1, NULL, 3, NULL, '2025-04-30', 1, '2023-08-22 11:30:41', NULL, '2023-08-22 11:30:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (244, 218, 1, 1, NULL, 10, NULL, '2025-02-28', 1, '2023-08-22 11:44:28', NULL, '2023-08-22 11:44:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (245, 2042, 1, 1, NULL, 3, NULL, '2025-09-30', 1, '2023-08-22 11:48:17', NULL, '2023-08-22 11:48:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (246, 2043, 1, 1, NULL, 3, NULL, '2027-02-28', 1, '2023-08-22 11:53:56', NULL, '2023-08-22 11:53:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (247, 233, 1, 1, NULL, 2, NULL, '2024-09-30', 1, '2023-08-22 11:59:57', NULL, '2023-08-22 11:59:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (248, 234, 1, 1, NULL, 2, NULL, '2024-12-31', 1, '2023-08-22 12:01:55', NULL, '2023-08-22 12:01:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (249, 232, 1, 1, NULL, 2, NULL, '2024-08-31', 1, '2023-08-22 12:04:10', NULL, '2023-08-22 12:04:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (250, 221, 1, 1, NULL, 30, NULL, '2024-12-31', 1, '2023-08-22 12:09:36', NULL, '2023-08-22 12:09:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (251, 220, 1, 1, NULL, 30, NULL, '2025-03-31', 1, '2023-08-22 12:15:46', NULL, '2023-08-22 12:15:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (252, 626, 1, 1, NULL, 6, NULL, '2028-05-31', 1, '2023-08-22 12:19:12', NULL, '2023-08-22 12:19:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (253, 624, 1, 1, NULL, 3, NULL, '2027-09-30', 1, '2023-08-22 12:23:58', NULL, '2023-08-22 12:23:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (254, 2044, 1, 1, NULL, 6, NULL, '2025-12-31', 1, '2023-08-22 12:28:27', NULL, '2023-08-22 12:28:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (255, 1439, 1, 1, NULL, 6, NULL, '2024-06-16', 1, '2023-08-22 12:30:47', NULL, '2023-08-22 12:30:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (256, 477, 1, 1, NULL, 1, NULL, '2025-02-28', 1, '2023-08-22 12:34:34', NULL, '2023-08-22 12:34:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (257, 1441, 1, 1, NULL, 3, NULL, '2026-03-31', 1, '2023-08-22 12:39:59', NULL, '2023-08-22 12:39:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (258, 484, 1, 1, NULL, 3, NULL, '2025-06-30', 1, '2023-08-22 12:43:30', NULL, '2023-08-22 12:43:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (259, 1471, 1, 1, NULL, 3, NULL, '2024-12-31', 1, '2023-08-22 12:44:52', NULL, '2023-08-22 12:44:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (260, 492, 1, 1, NULL, 3, NULL, '2024-07-31', 1, '2023-08-22 12:47:42', NULL, '2023-08-22 12:47:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (261, 1443, 1, 1, NULL, 5, NULL, '2024-12-31', 1, '2023-08-22 12:51:23', NULL, '2023-08-22 12:51:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (262, 497, 1, 1, NULL, 2, NULL, '2024-08-31', 1, '2023-08-22 12:55:24', NULL, '2023-08-22 12:55:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (263, 244, 1, 1, NULL, 2, NULL, '2025-06-13', 1, '2023-08-22 13:00:50', NULL, '2023-08-22 13:00:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (264, 245, 1, 1, NULL, 24, NULL, '2025-10-31', 1, '2023-08-22 13:05:57', NULL, '2023-08-22 13:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (265, 242, 1, 1, NULL, 20, NULL, '2025-09-30', 1, '2023-08-22 13:10:18', NULL, '2023-08-22 13:10:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (266, 2045, 1, 1, NULL, 3, NULL, '2026-10-31', 1, '2023-08-22 13:19:48', NULL, '2023-08-22 13:19:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (267, 2046, 1, 0, NULL, 3, NULL, '2027-05-31', 1, '2023-08-22 13:20:55', NULL, '2023-08-22 13:20:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (268, 2047, 1, 1, NULL, 3, NULL, '2028-05-31', 1, '2023-08-22 13:24:52', NULL, '2023-08-22 13:24:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (269, 2048, 1, 1, NULL, 3, NULL, '2027-01-31', 1, '2023-08-22 13:28:39', NULL, '2023-08-22 13:28:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (270, 2049, 1, 1, NULL, 3, NULL, '2028-06-07', 1, '2023-08-22 13:32:57', NULL, '2023-08-22 13:32:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (271, 505, 1, 1, NULL, 3, NULL, '1970-01-01', 1, '2023-08-22 13:37:03', NULL, '2023-08-22 13:37:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (272, 1445, 1, 1, NULL, 3, NULL, '2025-01-31', 1, '2023-08-22 13:39:48', NULL, '2023-08-22 13:39:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (273, 2050, 1, 1, NULL, 3, NULL, '2026-05-31', 1, '2023-08-22 13:43:11', NULL, '2023-08-22 13:43:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (274, 2052, 1, 1, NULL, 3, NULL, '2026-11-30', 1, '2023-08-22 13:46:55', NULL, '2023-08-22 13:46:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (275, 508, 1, 1, NULL, 12, NULL, '2025-03-31', 1, '2023-08-22 13:48:55', NULL, '2023-08-22 13:48:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (276, 509, 1, 1, NULL, 24, NULL, '2025-05-31', 1, '2023-08-22 13:51:08', NULL, '2023-08-22 13:51:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (277, 510, 1, 1, NULL, 12, NULL, '2025-03-31', 1, '2023-08-22 13:53:09', NULL, '2023-08-22 13:53:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (278, 513, 1, 1, NULL, 5, NULL, '2024-08-31', 1, '2023-08-22 13:55:18', NULL, '2023-08-22 13:55:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (279, 511, 1, 1, NULL, 5, NULL, '2025-03-31', 1, '2023-08-22 14:00:30', NULL, '2023-08-22 14:00:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (280, 514, 1, 1, NULL, 3, NULL, '2024-09-30', 1, '2023-08-22 14:03:47', NULL, '2023-08-22 14:03:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (281, 515, 1, 1, NULL, 3, NULL, '2024-10-31', 1, '2023-08-22 14:05:57', NULL, '2023-08-22 14:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (282, 254, 1, 1, NULL, 6, NULL, '2028-03-20', 1, '2023-08-22 14:07:46', NULL, '2023-08-22 14:07:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (283, 1456, 1, 1, NULL, 6, NULL, '2027-05-29', 1, '2023-08-22 14:10:36', NULL, '2023-08-22 14:10:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (284, 1457, 1, 1, NULL, 25, NULL, '2027-03-21', 1, '2023-08-22 14:13:08', NULL, '2023-08-22 14:13:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (285, 521, 1, 1, NULL, 12, NULL, '2024-11-15', 1, '2023-08-22 14:16:32', NULL, '2023-08-22 14:16:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (286, 2053, 1, 1, NULL, 3, NULL, '2026-02-28', 1, '2023-08-22 14:19:16', NULL, '2023-08-22 14:19:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (287, 261, 1, 1, NULL, 50, NULL, '2024-11-30', 1, '2023-08-22 14:21:43', NULL, '2023-08-22 14:21:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (288, 1476, 1, 1, NULL, 6, NULL, '2025-02-12', 1, '2023-08-22 14:23:53', NULL, '2023-08-22 14:23:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (289, 1479, 1, 1, NULL, 6, NULL, '2024-08-23', 1, '2023-08-22 14:25:11', NULL, '2023-08-22 14:25:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (290, 262, 1, 1, NULL, 1, NULL, '2024-12-31', 1, '2023-08-22 14:28:34', NULL, '2023-08-22 14:28:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (291, 263, 1, 1, NULL, 2, NULL, '2025-02-28', 1, '2023-08-22 14:28:54', NULL, '2023-08-22 14:28:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (292, 274, 1, 1, NULL, 50, NULL, '2026-01-31', 1, '2023-08-22 14:33:01', NULL, '2023-08-22 14:33:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (293, 268, 1, 1, NULL, 3, NULL, '2025-03-31', 1, '2023-08-22 14:35:37', NULL, '2023-08-22 14:35:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (294, 527, 1, 1, NULL, 36, NULL, '2024-07-31', 1, '2023-08-22 14:38:10', NULL, '2023-08-22 14:38:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (295, 2054, 1, 1, NULL, 3, NULL, '2025-09-30', 1, '2023-08-22 14:41:12', NULL, '2023-08-22 14:41:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (296, 529, 1, 1, NULL, 3, NULL, '2026-01-31', 1, '2023-08-22 14:43:26', NULL, '2023-08-22 14:43:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (297, 1482, 1, 1, NULL, 3, NULL, '2025-01-31', 1, '2023-08-22 14:44:25', NULL, '2023-08-22 14:44:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (298, 526, 1, 1, NULL, 36, NULL, '2025-04-30', 1, '2023-08-23 17:22:09', 1, '2023-08-23 17:22:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (299, 525, 1, 1, NULL, 36, NULL, '2025-04-30', 1, '2023-08-23 17:21:44', 1, '2023-08-23 17:21:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (300, 289, 1, 1, NULL, 50, NULL, '2024-05-31', 1, '2023-08-22 14:51:53', NULL, '2023-08-22 14:51:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (301, 2056, 1, 1, NULL, 8, NULL, '2025-03-14', 1, '2023-08-22 15:21:40', 1, '2023-08-22 15:21:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (302, 512, 1, 1, NULL, 6, NULL, '2024-12-31', 1, '2023-08-22 14:56:10', NULL, '2023-08-22 14:56:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (303, 247, 1, 1, NULL, 4, NULL, '2025-07-16', 1, '2023-08-23 16:47:00', 1, '2023-08-23 16:47:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (304, 246, 1, 1, NULL, 4, NULL, '2025-07-12', 1, '2023-08-23 16:46:02', 1, '2023-08-23 16:46:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (305, 236, 1, 1, NULL, 6, NULL, '2024-11-30', 1, '2023-08-22 15:07:33', NULL, '2023-08-22 15:07:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (306, 187, 1, 1, NULL, 6, NULL, '2026-03-31', 1, '2023-08-22 15:10:54', NULL, '2023-08-22 15:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (307, 2057, 1, 1, NULL, 3, NULL, '2028-03-31', 1, '2023-08-22 15:13:51', NULL, '2023-08-22 15:13:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (308, 1936, 1, 1, NULL, 3, NULL, '2025-04-02', 1, '2023-08-22 15:16:07', NULL, '2023-08-22 15:16:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (309, 2058, 1, 1, NULL, 2, NULL, '2025-03-14', 1, '2023-08-22 15:26:33', NULL, '2023-08-22 15:26:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (310, 2059, 1, 1, NULL, 2, NULL, '2025-06-20', 1, '2023-08-22 15:32:00', NULL, '2023-08-22 15:32:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (311, 2060, 1, 1, NULL, 1, NULL, '2025-04-10', 1, '2023-08-22 15:36:09', NULL, '2023-08-22 15:36:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (312, 2061, 1, 0, NULL, 1, NULL, '2025-06-07', 1, '2023-08-22 15:38:57', NULL, '2023-08-22 15:38:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (313, 2062, 1, 1, NULL, 1, NULL, '2026-05-31', 1, '2023-08-22 15:44:19', NULL, '2023-08-22 15:44:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (314, 2063, 1, 1, NULL, 2, NULL, '2026-04-30', 1, '2023-08-22 15:45:57', NULL, '2023-08-22 15:45:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (315, 2064, 1, 1, NULL, 3, NULL, '2025-12-31', 1, '2023-08-22 15:47:29', NULL, '2023-08-22 15:47:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (316, 466, 1, 1, NULL, 3, NULL, '2024-07-31', 1, '2023-08-22 15:52:34', NULL, '2023-08-22 15:52:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (317, 1518, 1, 1, NULL, 1, NULL, '2024-12-31', 1, '2023-08-23 15:20:33', NULL, '2023-08-23 15:20:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (318, 1523, 1, 1, NULL, 6, NULL, '2024-12-31', 1, '2023-08-23 15:25:27', NULL, '2023-08-23 15:25:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (319, 2065, 1, 1, NULL, 1, NULL, '2024-12-31', 1, '2023-08-23 15:26:17', NULL, '2023-08-23 15:26:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (320, 2066, 1, 1, NULL, 2, NULL, '2024-12-31', 1, '2023-08-23 15:30:09', NULL, '2023-08-23 15:30:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (321, 2067, 1, 1, NULL, 1, NULL, '2028-01-31', 1, '2023-08-23 15:37:49', NULL, '2023-08-23 15:37:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (322, 2068, 1, 1, NULL, 1, NULL, '2027-07-31', 1, '2023-08-23 15:38:30', NULL, '2023-08-23 15:38:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (323, 2069, 1, 1, NULL, 1, NULL, '2028-05-31', 1, '2023-08-23 15:38:59', NULL, '2023-08-23 15:38:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (324, 1538, 1, 0, NULL, 12, NULL, '2024-12-31', 1, '2023-08-23 15:44:26', NULL, '2023-08-23 15:44:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (325, 2070, 1, 1, NULL, 1, NULL, '2025-06-29', 1, '2023-08-23 15:47:47', NULL, '2023-08-23 15:47:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (326, 2071, 1, 1, NULL, 1, NULL, '2025-07-08', 1, '2023-08-23 15:49:36', NULL, '2023-08-23 15:49:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (327, 2072, 1, 1, NULL, 1, NULL, '2024-09-20', 1, '2023-08-23 15:51:21', NULL, '2023-08-23 15:51:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (328, 2073, 1, 0, NULL, 1, NULL, '2026-01-30', 1, '2023-08-23 15:56:47', NULL, '2023-08-23 15:56:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (329, 2074, 1, 0, NULL, 1, NULL, '2026-04-01', 1, '2023-08-23 15:58:36', NULL, '2023-08-23 15:58:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (330, 69, 1, 1, NULL, 25, NULL, '2025-06-30', 1, '2023-08-23 16:03:56', NULL, '2023-08-23 16:03:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (331, 104, 1, 1, NULL, 10, NULL, '2024-12-31', 1, '2023-08-23 16:11:01', NULL, '2023-08-23 16:11:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (332, 105, 1, 1, NULL, 10, NULL, '2025-03-31', 1, '2023-08-23 16:12:47', NULL, '2023-08-23 16:12:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (333, 153, 1, 1, NULL, 20, NULL, '2026-06-30', 1, '2023-08-23 16:17:20', NULL, '2023-08-23 16:17:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (334, 161, 1, 1, NULL, 10, NULL, '2026-03-31', 1, '2023-08-23 16:19:05', NULL, '2023-08-23 16:19:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (335, 163, 1, 1, NULL, 30, NULL, '2026-09-30', 1, '2023-08-23 16:21:56', NULL, '2023-08-23 16:21:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (336, 164, 1, 1, NULL, 10, NULL, '2025-06-30', 1, '2023-08-23 16:23:57', NULL, '2023-08-23 16:23:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (337, 2075, 1, 1, NULL, 10, NULL, '2026-06-30', 1, '2023-08-23 16:30:18', NULL, '2023-08-23 16:30:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (338, 217, 1, 1, NULL, 1, NULL, '2024-03-31', 1, '2023-08-23 16:36:49', NULL, '2023-08-23 16:36:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (339, 219, 1, 1, NULL, 1, NULL, '2024-11-30', 1, '2023-08-23 16:37:28', NULL, '2023-08-23 16:37:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (340, 231, 1, 1, NULL, 4, NULL, '2025-05-31', 1, '2023-08-23 16:40:41', NULL, '2023-08-23 16:40:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (341, 239, 1, 1, NULL, 30, NULL, '2024-05-31', 1, '2023-08-23 16:44:14', NULL, '2023-08-23 16:44:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (342, 270, 1, 1, NULL, 5, NULL, '2025-04-30', 1, '2023-08-23 16:48:58', NULL, '2023-08-23 16:48:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (343, 280, 1, 1, NULL, 25, NULL, '2025-12-31', 1, '2023-08-23 16:51:41', NULL, '2023-08-23 16:51:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (344, 319, 1, 1, NULL, 2, NULL, '2024-09-30', 1, '2023-08-23 16:55:43', NULL, '2023-08-23 16:55:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (345, 320, 1, 1, NULL, 2, NULL, '2026-03-31', 1, '2023-08-23 16:58:14', NULL, '2023-08-23 16:58:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (346, 323, 1, 1, NULL, 4, NULL, '2024-11-30', 1, '2023-08-23 17:00:08', NULL, '2023-08-23 17:00:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (347, 2076, 1, 1, NULL, 10, NULL, '2027-02-28', 1, '2023-08-23 17:03:58', NULL, '2023-08-23 17:03:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (348, 335, 1, 1, NULL, 2, NULL, '2025-07-31', 1, '2023-08-23 17:06:00', NULL, '2023-08-23 17:06:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (349, 413, 1, 1, NULL, 2, NULL, '2025-07-09', 1, '2023-08-23 17:08:22', NULL, '2023-08-23 17:08:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (350, 418, 1, 1, NULL, 2, NULL, '2024-12-31', 1, '2023-08-23 17:10:39', NULL, '2023-08-23 17:10:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (351, 440, 1, 1, NULL, 2, NULL, '2026-01-31', 1, '2023-08-23 17:19:02', NULL, '2023-08-23 17:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (352, 467, 1, 1, NULL, 2, NULL, '2024-06-30', 1, '2023-08-23 17:20:27', NULL, '2023-08-23 17:20:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (353, 634, 1, 1, NULL, 2, NULL, '2026-12-31', 1, '2023-08-23 17:26:18', NULL, '2023-08-23 17:26:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (354, 646, 1, 1, NULL, 2, NULL, '2025-09-30', 1, '2023-08-23 17:28:04', NULL, '2023-08-23 17:28:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (355, 649, 1, 1, NULL, 2, NULL, '2026-03-24', 1, '2023-08-23 17:30:01', NULL, '2023-08-23 17:30:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (356, 655, 1, 1, NULL, 2, NULL, '2025-05-10', 1, '2023-08-23 17:32:45', NULL, '2023-08-23 17:32:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (357, 656, 1, 1, NULL, 2, NULL, '2025-04-13', 1, '2023-08-23 17:34:13', NULL, '2023-08-23 17:34:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (358, 339, 1, 1, NULL, 1, NULL, '2025-05-31', 1, '2023-08-23 17:37:08', NULL, '2023-08-23 17:37:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (359, 340, 1, 1, NULL, 1, NULL, '2025-05-31', 1, '2023-08-23 17:37:25', NULL, '2023-08-23 17:37:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (360, 350, 1, 1, NULL, 6, NULL, '2025-03-31', 1, '2023-08-23 17:40:07', NULL, '2023-08-23 17:40:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (361, 388, 1, 1, NULL, 4, NULL, '2024-07-31', 1, '2023-08-23 17:43:06', NULL, '2023-08-23 17:43:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (362, 396, 1, 1, NULL, 2, NULL, '2026-10-31', 1, '2023-08-23 17:45:09', NULL, '2023-08-23 17:45:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (363, 2078, 1, 1, NULL, 100, NULL, '2025-01-31', 1, '2023-08-25 19:27:51', NULL, '2023-08-25 19:27:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (364, 1170, 1, 1, NULL, 1, NULL, '2026-06-30', 1, '2023-08-25 19:30:05', NULL, '2023-08-25 19:30:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (365, 683, 1, 1, NULL, 100, NULL, '2024-08-31', 1, '2023-08-25 19:36:50', NULL, '2023-08-25 19:36:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (366, 684, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-25 19:49:40', NULL, '2023-08-25 19:49:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (367, 687, 1, 1, NULL, 200, NULL, '2025-02-28', 1, '2023-08-25 20:04:14', NULL, '2023-08-25 20:04:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (368, 689, 1, 1, NULL, 100, NULL, '2025-02-28', 1, '2023-08-25 20:11:15', NULL, '2023-08-25 20:11:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (369, 827, 1, 1, NULL, 5, NULL, '2025-07-31', 1, '2023-08-25 20:15:26', NULL, '2023-08-25 20:15:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (370, 2082, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-25 20:24:20', NULL, '2023-08-25 20:24:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (371, 696, 1, 1, NULL, 30, NULL, '2025-06-30', 1, '2023-08-25 20:27:53', NULL, '2023-08-25 20:27:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (372, 702, 1, 1, NULL, 100, NULL, '2025-06-30', 1, '2023-08-25 20:31:35', NULL, '2023-08-25 20:31:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (373, 705, 1, 1, NULL, 100, NULL, '2025-05-31', 1, '2023-08-25 20:35:21', NULL, '2023-08-25 20:35:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (374, 708, 1, 1, NULL, 100, NULL, '2027-01-31', 1, '2023-08-25 20:37:22', NULL, '2023-08-25 20:37:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (375, 2084, 1, 1, NULL, 100, NULL, '2026-03-31', 1, '2023-08-25 20:41:00', NULL, '2023-08-25 20:41:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (376, 2086, 1, 1, NULL, 100, NULL, '2025-06-30', 1, '2023-08-25 20:46:36', NULL, '2023-08-25 20:46:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (377, 768, 1, 1, NULL, 200, NULL, '2025-04-30', 1, '2023-08-25 20:52:58', NULL, '2023-08-25 20:52:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (378, 2087, 1, 1, NULL, 100, NULL, '2025-02-28', 1, '2023-08-25 20:56:53', NULL, '2023-08-25 20:56:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (379, 2088, 1, 1, NULL, 200, NULL, '2025-01-31', 1, '2023-08-25 21:01:19', NULL, '2023-08-25 21:01:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (380, 2089, 1, 1, NULL, 200, NULL, '2025-02-28', 1, '2023-08-25 21:07:45', NULL, '2023-08-25 21:07:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (381, 2090, 1, 1, NULL, 200, NULL, '2027-05-31', 1, '2023-08-25 21:17:22', NULL, '2023-08-25 21:17:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (382, 2004, 1, 1, NULL, 3, NULL, '2025-03-31', 1, '2023-08-25 21:59:00', NULL, '2023-08-25 21:59:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (383, 2091, 1, 1, NULL, 50, NULL, '2026-06-30', 1, '2023-08-25 22:15:14', NULL, '2023-08-25 22:15:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (384, 1053, 1, 1, NULL, 100, NULL, '2025-06-30', 1, '2023-08-25 22:17:19', NULL, '2023-08-25 22:17:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (385, 2092, 1, 1, NULL, 100, NULL, '2026-02-28', 1, '2023-08-25 22:19:57', NULL, '2023-08-25 22:19:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (386, 901, 1, 1, NULL, 100, NULL, '2026-01-31', 1, '2023-08-25 22:22:47', NULL, '2023-08-25 22:22:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (387, 2093, 1, 1, NULL, 100, NULL, '2026-02-28', 1, '2023-08-25 22:25:53', NULL, '2023-08-25 22:25:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (388, 2094, 1, 1, NULL, 100, NULL, '2025-12-31', 1, '2023-08-25 22:37:25', NULL, '2023-08-25 22:37:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (389, 852, 1, 1, NULL, 50, NULL, '2027-06-30', 1, '2023-08-25 22:38:43', NULL, '2023-08-25 22:38:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (390, 853, 1, 1, NULL, 100, NULL, '2025-04-30', 1, '2023-08-25 22:41:00', NULL, '2023-08-25 22:41:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (391, 875, 1, 1, NULL, 100, NULL, '2026-05-31', 1, '2023-08-25 22:42:45', NULL, '2023-08-25 22:42:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (392, 874, 1, 1, NULL, 100, NULL, '2028-02-29', 1, '2023-08-25 22:44:03', NULL, '2023-08-25 22:44:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (393, 733, 1, 1, NULL, 100, NULL, '2027-05-31', 1, '2023-08-26 07:42:25', NULL, '2023-08-26 07:42:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (394, 736, 1, 1, NULL, 100, NULL, '2026-05-31', 1, '2023-08-26 07:45:19', NULL, '2023-08-26 07:45:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (395, 2095, 1, 1, NULL, 100, NULL, '2027-01-31', 1, '2023-08-26 07:48:04', NULL, '2023-08-26 07:48:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (396, 2096, 1, 1, NULL, 100, NULL, '2027-02-28', 1, '2023-08-26 07:50:11', NULL, '2023-08-26 07:50:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (397, 2097, 1, 0, NULL, 100, NULL, '2025-06-30', 1, '2023-08-26 07:52:10', NULL, '2023-08-26 07:52:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (398, 1250, 1, 1, NULL, 5, NULL, '2028-01-31', 1, '2023-08-26 08:21:55', NULL, '2023-08-26 08:21:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (399, 1251, 1, 1, NULL, 5, NULL, '2028-02-29', 1, '2023-08-26 08:23:48', NULL, '2023-08-26 08:23:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (400, 747, 1, 1, NULL, 100, NULL, '2025-06-30', 1, '2023-08-26 08:25:49', NULL, '2023-08-26 08:25:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (401, 1264, 1, 1, NULL, 5, NULL, '2025-05-31', 1, '2023-08-26 08:28:40', NULL, '2023-08-26 08:28:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (402, 754, 1, 1, NULL, 100, NULL, '2025-05-31', 1, '2023-08-26 08:31:20', NULL, '2023-08-26 08:31:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (403, 2098, 1, 1, NULL, 50, NULL, '2026-06-30', 1, '2023-08-26 08:34:07', NULL, '2023-08-26 08:34:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (404, 2099, 1, 0, NULL, 100, NULL, '2025-06-30', 1, '2023-08-26 08:37:03', NULL, '2023-08-26 08:37:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (405, 2100, 1, 1, NULL, 100, NULL, '2025-06-30', 1, '2023-08-26 08:39:42', NULL, '2023-08-26 08:39:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (406, 767, 1, 1, NULL, 100, NULL, '2025-06-30', 1, '2023-08-26 08:41:31', NULL, '2023-08-26 08:41:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (407, 876, 1, 1, NULL, 10, NULL, '2027-01-31', 1, '2023-08-26 08:44:54', NULL, '2023-08-26 08:44:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (408, 877, 1, 1, NULL, 10, NULL, '2027-01-31', 1, '2023-08-26 08:46:47', NULL, '2023-08-26 08:46:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (409, 878, 1, 1, NULL, 10, NULL, '2027-10-31', 1, '2023-08-26 08:48:25', NULL, '2023-08-26 08:48:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (410, 880, 1, 1, NULL, 20, NULL, '2026-10-31', 1, '2023-08-26 08:50:15', NULL, '2023-08-26 08:50:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (411, 881, 1, 1, NULL, 10, NULL, '2027-04-30', 1, '2023-08-26 08:52:02', NULL, '2023-08-26 08:52:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (412, 1120, 1, 1, NULL, 10, NULL, '2026-03-31', 1, '2023-08-26 08:55:27', NULL, '2023-08-26 08:55:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (413, 2101, 1, 1, NULL, 10, NULL, '2027-06-30', 1, '2023-08-26 09:00:59', NULL, '2023-08-26 09:00:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (414, 1163, 1, 1, NULL, 2, NULL, '2023-08-31', 1, '2023-08-26 09:03:35', NULL, '2023-08-26 09:03:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (415, 2102, 1, 1, NULL, 20, NULL, '2026-12-31', 1, '2023-08-26 09:15:41', NULL, '2023-08-26 09:15:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (416, 2103, 1, 0, NULL, 20, NULL, '2026-12-31', 1, '2023-08-26 09:17:04', NULL, '2023-08-26 09:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (417, 2104, 1, 0, NULL, 20, NULL, '2025-01-31', 1, '2023-08-26 09:18:49', NULL, '2023-08-26 09:18:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (418, 2105, 1, 1, NULL, 2, NULL, '2025-05-31', 1, '2023-08-26 09:20:35', NULL, '2023-08-26 09:20:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (419, 1070, 1, 1, NULL, 10, NULL, '2025-02-28', 1, '2023-08-26 09:21:52', NULL, '2023-08-26 09:21:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (420, 2106, 1, 1, NULL, 10, NULL, '2026-05-31', 1, '2023-08-26 09:23:26', NULL, '2023-08-26 09:23:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (421, 891, 1, 1, NULL, 10, NULL, '2025-04-30', 1, '2023-08-26 09:25:53', NULL, '2023-08-26 09:25:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (422, 1167, 1, 1, NULL, 5, NULL, '2026-05-31', 1, '2023-08-26 09:27:01', NULL, '2023-08-26 09:27:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (423, 2107, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-26 09:29:14', NULL, '2023-08-26 09:29:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (424, 2108, 1, 1, NULL, 10, NULL, '2027-06-30', 1, '2023-08-26 09:30:48', NULL, '2023-08-26 09:30:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (425, 2109, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-26 09:32:14', NULL, '2023-08-26 09:32:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (426, 2110, 1, 1, NULL, 10, NULL, '2024-09-30', 1, '2023-08-26 09:33:31', NULL, '2023-08-26 09:33:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (427, 2111, 1, 1, NULL, 2, NULL, '2024-04-30', 1, '2023-08-26 09:35:05', NULL, '2023-08-26 09:35:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (428, 2112, 1, 1, NULL, 10, NULL, '2026-04-30', 1, '2023-08-26 09:36:27', NULL, '2023-08-26 09:36:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (429, 2113, 1, 1, NULL, 3, NULL, '2025-06-30', 1, '2023-08-26 09:38:12', NULL, '2023-08-26 09:38:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (430, 2114, 1, 1, NULL, 2, NULL, '2027-05-31', 1, '2023-08-26 09:39:54', NULL, '2023-08-26 09:39:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (431, 1224, 1, 1, NULL, 5, NULL, '2027-06-30', 1, '2023-08-26 09:41:23', NULL, '2023-08-26 09:41:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (432, 2115, 1, 1, NULL, 10, NULL, '2025-07-31', 1, '2023-08-26 09:43:02', NULL, '2023-08-26 09:43:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (433, 2116, 1, 1, NULL, 2, NULL, '2025-06-30', 1, '2023-08-26 09:44:55', NULL, '2023-08-26 09:44:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (434, 2117, 1, 1, NULL, 2, NULL, '2026-03-31', 1, '2023-08-26 09:46:15', NULL, '2023-08-26 09:46:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (435, 2118, 1, 0, NULL, 10, NULL, '2027-05-31', 1, '2023-08-26 09:53:04', NULL, '2023-08-26 09:53:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (436, 2119, 1, 1, NULL, 10, NULL, '2026-07-31', 1, '2023-08-26 09:54:57', NULL, '2023-08-26 09:54:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (437, 2120, 1, 1, NULL, 10, NULL, '2026-06-30', 1, '2023-08-26 09:56:49', NULL, '2023-08-26 09:56:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (438, 2121, 1, 1, NULL, 10, NULL, '2025-04-30', 1, '2023-08-26 09:58:18', NULL, '2023-08-26 09:58:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (439, 2122, 1, 1, NULL, 2, NULL, '2027-03-31', 1, '2023-08-26 10:02:30', NULL, '2023-08-26 10:02:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (440, 2123, 1, 1, NULL, 10, NULL, '2025-06-30', 1, '2023-08-26 10:04:08', NULL, '2023-08-26 10:04:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (441, 2124, 1, 1, NULL, 2, NULL, '2027-07-31', 1, '2023-08-26 10:06:29', NULL, '2023-08-26 10:06:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (442, 842, 1, 1, NULL, 10, NULL, '2027-06-30', 1, '2023-08-26 10:07:49', NULL, '2023-08-26 10:07:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (443, 362, 1, 1, NULL, 2, NULL, '2026-04-30', 1, '2023-08-26 10:09:05', NULL, '2023-08-26 10:09:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (444, 360, 1, 1, NULL, 2, NULL, '2025-06-30', 1, '2023-08-26 10:10:24', NULL, '2023-08-26 10:10:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (445, 361, 1, 1, NULL, 2, NULL, '2025-06-30', 1, '2023-08-26 10:14:38', NULL, '2023-08-26 10:14:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (446, 2125, 1, 1, NULL, 10, NULL, '2026-09-30', 1, '2023-08-26 10:16:19', NULL, '2023-08-26 10:16:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (447, 844, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-26 10:17:25', NULL, '2023-08-26 10:17:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (448, 845, 1, 1, NULL, 10, NULL, '2025-05-31', 1, '2023-08-26 10:18:32', NULL, '2023-08-26 10:18:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (449, 1243, 1, 1, NULL, 2, NULL, '2026-06-30', 1, '2023-08-26 10:23:04', NULL, '2023-08-26 10:23:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (450, 889, 1, 1, NULL, 5, NULL, '2026-06-30', 1, '2023-08-26 10:24:18', NULL, '2023-08-26 10:24:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (451, 915, 1, 1, NULL, 15, NULL, '2025-07-31', 1, '2023-08-26 10:25:31', NULL, '2023-08-26 10:25:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (452, 391, 1, 1, NULL, 1, NULL, '2026-05-31', 1, '2023-08-26 10:27:17', NULL, '2023-08-26 10:27:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (453, 942, 1, 1, NULL, 10, NULL, '2027-06-30', 1, '2023-08-26 10:28:34', NULL, '2023-08-26 10:28:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (454, 2126, 1, 1, NULL, 2, NULL, '2027-06-30', 1, '2023-08-26 10:30:11', NULL, '2023-08-26 10:30:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (455, 951, 1, 1, NULL, 10, NULL, '2027-06-30', 1, '2023-08-26 10:31:17', NULL, '2023-08-26 10:31:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (456, 1303, 1, 1, NULL, 2, NULL, '2025-06-30', 1, '2023-08-26 10:32:27', NULL, '2023-08-26 10:32:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (457, 1305, 1, 1, NULL, 2, NULL, '2025-06-30', 1, '2023-08-26 10:33:42', NULL, '2023-08-26 10:33:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (458, 2127, 1, 1, NULL, 10, NULL, '2027-06-30', 1, '2023-08-26 10:35:19', NULL, '2023-08-26 10:35:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (459, 1063, 1, 1, NULL, 10, NULL, '2026-08-31', 1, '2023-08-26 10:36:25', NULL, '2023-08-26 10:36:25', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_detail`;
CREATE TABLE `tx_produk_stok_detail`  (
  `id_stok_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok` int(11) NOT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `id_gudang` int(11) NULL DEFAULT NULL,
  `id_supplier` int(11) NULL DEFAULT NULL,
  `id_status_stok` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `jumlah_stok` int(11) NULL DEFAULT NULL,
  `kode_batch` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_beli` int(11) NULL DEFAULT NULL,
  `exp_date` date NULL DEFAULT NULL,
  `flag_ver` int(11) NOT NULL DEFAULT 0,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 510 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tx_produk_stok_detail` VALUES (23, 0, 29, 1, 1, 1, 1, 10, NULL, 0, '2023-07-31', 0, 1, '2023-07-26 10:11:28', NULL, '2023-07-26 15:11:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (24, 0, 27, 1, 1, 1, 2, 12, NULL, 0, '2023-07-31', 0, 1, '2023-07-26 10:11:55', NULL, '2023-07-26 15:11:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (25, 0, 27, 1, 1, 1, 1, 12, NULL, 0, '2023-07-31', 0, 1, '2023-07-26 10:11:55', NULL, '2023-07-27 16:54:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (26, 0, 297, 1, 1, 1, 4, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-09 15:23:53', NULL, '2023-08-09 15:23:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (27, 0, 1945, 1, 1, 1, 6, 3, NULL, 0, '2026-04-30', 0, 1, '2023-08-09 15:59:52', NULL, '2023-08-09 15:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (28, 0, 1952, 1, 1, 1, 6, 3, NULL, 0, '2027-04-30', 0, 1, '2023-08-09 16:10:21', NULL, '2023-08-09 16:10:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (29, 0, 1953, 1, 1, 1, 6, 3, NULL, 0, '2025-10-31', 0, 1, '2023-08-09 16:15:23', NULL, '2023-08-09 16:15:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (30, 0, 1954, 1, 1, 1, 5, 3, NULL, 0, '2025-12-31', 0, 1, '2023-08-09 16:19:01', NULL, '2023-08-09 16:19:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (31, 0, 1955, 1, 1, 1, 5, 3, NULL, 0, '2026-02-28', 0, 1, '2023-08-09 16:22:24', NULL, '2023-08-09 16:22:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (32, 0, 1956, 1, 1, 1, 5, 3, NULL, 0, '2026-02-28', 0, 1, '2023-08-09 16:24:31', NULL, '2023-08-09 16:24:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (33, 0, 1957, 1, 1, 1, 5, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-09 16:26:31', NULL, '2023-08-09 16:26:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (34, 0, 1958, 1, 1, 1, 5, 3, NULL, 0, '2026-07-31', 0, 1, '2023-08-09 16:30:12', NULL, '2023-08-09 16:30:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (35, 0, 1959, 1, 1, 1, 5, 3, NULL, 0, '2025-03-31', 0, 1, '2023-08-09 16:32:49', NULL, '2023-08-09 16:32:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (36, 0, 1960, 1, 1, 1, 5, 2, NULL, 0, '2024-11-30', 0, 1, '2023-08-09 16:36:04', NULL, '2023-08-09 16:36:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (37, 0, 1961, 1, 1, 1, 5, 2, NULL, 0, '2025-02-20', 0, 1, '2023-08-09 16:37:46', NULL, '2023-08-09 16:37:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (38, 0, 1962, 1, 1, 1, 5, 2, NULL, 0, '2025-02-13', 0, 1, '2023-08-09 16:38:55', NULL, '2023-08-09 16:38:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (39, 0, 1507, 1, 1, 1, 4, 10, NULL, 0, '2025-11-30', 0, 1, '2023-08-09 16:42:40', NULL, '2023-08-09 16:42:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (40, 0, 1506, 1, 1, 1, 4, 10, NULL, 0, '2025-12-31', 0, 1, '2023-08-09 16:44:51', NULL, '2023-08-09 16:44:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (41, 0, 1963, 1, 1, 1, 4, 10, NULL, 0, '2026-05-31', 0, 1, '2023-08-09 16:47:13', NULL, '2023-08-09 16:47:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (42, 0, 1676, 1, 1, 1, 4, 12, NULL, 0, '2026-02-24', 0, 1, '2023-08-09 16:52:39', NULL, '2023-08-09 16:52:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (43, 0, 1675, 1, 1, 1, 4, 12, NULL, 0, '2026-06-18', 0, 1, '2023-08-09 16:53:09', NULL, '2023-08-09 16:53:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (44, 0, 1622, 1, 1, 1, 4, 10, NULL, 0, '2025-03-31', 0, 1, '2023-08-09 16:57:58', NULL, '2023-08-09 16:57:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (45, 0, 1623, 1, 1, 1, 4, 10, NULL, 0, '2025-04-30', 0, 1, '2023-08-09 16:58:19', NULL, '2023-08-09 16:58:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (46, 0, 1964, 1, 1, 1, 4, 20, NULL, 0, '2027-02-28', 0, 1, '2023-08-09 17:01:35', NULL, '2023-08-09 17:01:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (47, 0, 600, 1, 1, 1, 7, 2, NULL, 0, '2025-09-30', 0, 1, '2023-08-10 13:44:23', NULL, '2023-08-10 13:44:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (48, 0, 603, 1, 1, 1, 7, 2, NULL, 0, '2025-10-31', 0, 1, '2023-08-10 13:46:26', NULL, '2023-08-10 13:46:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (49, 0, 598, 1, 1, 1, 6, 2, NULL, 0, '2026-05-31', 0, 1, '2023-08-10 13:49:40', NULL, '2023-08-10 13:49:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (50, 0, 601, 1, 1, 1, 6, 2, NULL, 0, '2026-03-31', 0, 1, '2023-08-10 13:53:13', NULL, '2023-08-10 13:53:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (51, 0, 1965, 1, 1, 1, 5, 3, NULL, 0, '2026-02-28', 0, 1, '2023-08-10 13:56:32', NULL, '2023-08-10 13:56:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (52, 0, 556, 1, 1, 1, 5, 3, NULL, 0, '2026-09-30', 0, 1, '2023-08-10 13:58:38', NULL, '2023-08-10 13:58:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (53, 0, 554, 1, 1, 1, 5, 3, NULL, 0, '2028-04-30', 0, 1, '2023-08-10 14:01:23', NULL, '2023-08-10 14:01:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (54, 0, 562, 1, 1, 1, 5, 3, NULL, 0, '2027-05-31', 0, 1, '2023-08-10 14:02:42', NULL, '2023-08-10 14:02:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (55, 0, 548, 1, 1, 1, 5, 3, NULL, 0, '2027-12-31', 0, 1, '2023-08-10 14:05:52', NULL, '2023-08-10 14:05:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (56, 0, 545, 1, 1, 1, 5, 3, NULL, 0, '2027-11-30', 0, 1, '2023-08-10 14:07:20', NULL, '2023-08-10 14:07:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (57, 0, 621, 1, 1, 1, 5, 3, NULL, 0, '2027-01-31', 0, 1, '2023-08-10 14:10:40', NULL, '2023-08-10 14:10:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (58, 0, 549, 1, 1, 1, 5, 3, NULL, 0, '2028-05-31', 0, 1, '2023-08-10 14:12:04', NULL, '2023-08-10 14:12:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (59, 0, 550, 1, 1, 1, 5, 3, NULL, 0, '2027-12-31', 0, 1, '2023-08-10 14:14:33', NULL, '2023-08-10 14:14:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (60, 0, 590, 1, 1, 1, 5, 3, NULL, 0, '2024-11-30', 0, 1, '2023-08-10 14:16:48', NULL, '2023-08-10 14:16:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (61, 0, 1966, 1, 1, 1, 5, 3, NULL, 0, '2026-02-28', 0, 1, '2023-08-10 14:32:07', NULL, '2023-08-10 14:32:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (62, 0, 1967, 1, 1, 1, 6, 3, NULL, 0, '2028-05-31', 0, 1, '2023-08-10 14:34:58', NULL, '2023-08-10 14:34:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (63, 0, 589, 1, 1, 1, 6, 3, NULL, 0, '2028-06-30', 0, 1, '2023-08-10 14:38:35', NULL, '2023-08-10 14:38:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (64, 0, 1968, 1, 1, 1, 6, 3, NULL, 0, '2028-06-30', 0, 1, '2023-08-10 14:40:50', NULL, '2023-08-10 14:40:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (65, 0, 1969, 1, 1, 1, 6, 3, NULL, 0, '2028-02-29', 0, 1, '2023-08-10 14:42:42', NULL, '2023-08-10 14:42:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (66, 0, 1966, 1, 0, 1, 5, 3, NULL, 0, '1970-01-01', 0, 1, '2023-08-10 14:43:29', NULL, '2023-08-10 14:43:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (67, 0, 1968, 1, 1, 1, 6, 6, NULL, 0, '2028-02-29', 0, 1, '2023-08-10 14:44:04', NULL, '2023-08-10 14:44:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (68, 0, 1969, 1, 0, 1, 6, 3, NULL, 0, '1970-01-01', 0, 1, '2023-08-10 14:47:02', NULL, '2023-08-10 14:47:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (69, 0, 1970, 1, 1, 1, 6, 3, NULL, 0, '2025-09-30', 0, 1, '2023-08-10 14:53:59', NULL, '2023-08-10 14:53:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (70, 0, 1971, 1, 1, 1, 6, 3, NULL, 0, '2026-03-31', 0, 1, '2023-08-10 14:56:26', NULL, '2023-08-10 14:56:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (71, 0, 1972, 1, 1, 1, 5, 3, NULL, 0, '2027-09-30', 0, 1, '2023-08-10 14:58:56', NULL, '2023-08-10 14:58:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (72, 0, 1973, 1, 1, 1, 5, 3, NULL, 0, '2027-03-31', 0, 1, '2023-08-10 15:03:56', NULL, '2023-08-10 15:03:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (73, 0, 1974, 1, 1, 1, 5, 3, NULL, 0, '2027-12-31', 0, 1, '2023-08-10 15:04:24', NULL, '2023-08-10 15:04:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (74, 0, 1975, 1, 1, 1, 5, 3, NULL, 0, '2027-12-31', 0, 1, '2023-08-10 15:14:05', NULL, '2023-08-10 15:14:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (75, 0, 1976, 1, 1, 1, 5, 3, NULL, 0, '2027-07-31', 0, 1, '2023-08-10 15:14:31', NULL, '2023-08-10 15:14:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (76, 0, 579, 1, 1, 1, 5, 3, NULL, 0, '2025-05-31', 0, 1, '2023-08-10 15:25:16', NULL, '2023-08-10 15:25:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (77, 0, 575, 1, 0, 1, 5, 3, NULL, 0, '2024-06-30', 0, 1, '2023-08-10 15:26:10', NULL, '2023-08-10 15:26:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (78, 0, 573, 1, 1, 1, 5, 3, NULL, 0, '2025-06-30', 0, 1, '2023-08-10 15:26:41', NULL, '2023-08-10 15:26:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (79, 0, 1977, 1, 1, 1, 5, 6, NULL, 0, '2024-12-31', 0, 1, '2023-08-10 15:27:31', NULL, '2023-08-10 15:27:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (80, 0, 654, 1, 1, 1, 5, 6, NULL, 0, '2025-03-31', 0, 1, '2023-08-10 15:28:30', NULL, '2023-08-10 15:28:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (81, 0, 1978, 1, 1, 1, 6, 6, NULL, 0, '2025-06-30', 0, 1, '2023-08-19 10:57:21', NULL, '2023-08-19 10:57:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (82, 0, 1979, 1, 1, 1, 5, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-19 11:10:10', NULL, '2023-08-19 11:10:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (83, 0, 1980, 1, 1, 1, 5, 3, NULL, 0, '2026-03-31', 0, 1, '2023-08-19 11:14:45', NULL, '2023-08-19 11:14:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (84, 0, 1982, 1, 1, 1, 6, 3, NULL, 0, '2027-11-30', 0, 1, '2023-08-19 11:43:21', NULL, '2023-08-19 11:43:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (85, 0, 1983, 1, 1, 1, 6, 3, NULL, 0, '2028-02-29', 0, 1, '2023-08-19 11:53:59', NULL, '2023-08-19 11:53:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (86, 0, 1984, 1, 1, 1, 6, 3, NULL, 0, '2027-03-31', 0, 1, '2023-08-19 12:00:44', NULL, '2023-08-19 12:00:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (87, 0, 1985, 1, 1, 1, 5, 3, NULL, 0, '2026-02-23', 0, 1, '2023-08-19 12:44:46', NULL, '2023-08-19 12:44:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (88, 0, 1987, 1, 1, 1, 6, 3, NULL, 0, '2028-05-31', 0, 1, '2023-08-19 12:53:11', NULL, '2023-08-19 12:53:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (89, 0, 31, 1, 1, 1, 2, 10, NULL, 0, '2026-01-31', 0, 1, '2023-08-19 12:56:39', NULL, '2023-08-19 12:56:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (90, 0, 1344, 1, 1, 1, 6, 3, NULL, 0, '2026-03-31', 0, 1, '2023-08-19 13:00:37', NULL, '2023-08-19 13:00:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (91, 0, 1342, 1, 1, 1, 6, 3, NULL, 0, '2025-04-30', 0, 1, '2023-08-19 13:03:03', NULL, '2023-08-19 13:03:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (92, 0, 295, 1, 1, 1, 4, 12, NULL, 0, '2025-01-31', 0, 1, '2023-08-19 13:08:37', NULL, '2023-08-19 13:08:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (93, 0, 33, 1, 1, 1, 2, 20, NULL, 0, '2026-03-31', 0, 1, '2023-08-19 13:11:16', NULL, '2023-08-19 13:11:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (94, 0, 294, 1, 1, 1, 4, 5, NULL, 0, '2025-03-31', 0, 1, '2023-08-19 13:14:09', NULL, '2023-08-19 13:14:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (95, 0, 34, 1, 1, 1, 2, 6, NULL, 0, '2026-03-31', 0, 1, '2023-08-19 13:20:11', NULL, '2023-08-19 13:20:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (96, 0, 1988, 1, 1, 1, 6, 3, NULL, 0, '2024-08-31', 0, 1, '2023-08-19 13:27:38', NULL, '2023-08-19 13:27:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (97, 0, 566, 1, 1, 1, 6, 6, NULL, 0, '2026-05-31', 0, 1, '2023-08-19 13:31:03', NULL, '2023-08-19 13:31:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (98, 0, 1989, 1, 1, 1, 6, 3, NULL, 0, '2026-06-30', 0, 1, '2023-08-21 07:12:39', NULL, '2023-08-21 07:12:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (99, 0, 1992, 1, 1, 1, 6, 3, NULL, 0, '2024-03-31', 0, 1, '2023-08-21 07:20:29', NULL, '2023-08-21 07:20:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (100, 0, 1993, 1, 0, 1, 6, 3, NULL, 0, '2025-12-31', 0, 1, '2023-08-21 07:24:03', NULL, '2023-08-21 07:24:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (101, 0, 1995, 1, 0, 1, 4, 12, NULL, 0, '2024-06-30', 0, 1, '2023-08-21 07:29:41', NULL, '2023-08-21 07:29:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (102, 0, 39, 1, 1, 1, 1, 6, NULL, 0, '2027-11-30', 0, 1, '2023-08-21 07:32:43', NULL, '2023-08-21 07:32:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (103, 0, 309, 1, 1, 1, 6, 3, NULL, 0, '2024-08-31', 0, 1, '2023-08-21 07:35:36', NULL, '2023-08-21 07:35:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (104, 0, 42, 1, 1, 1, 6, 1, NULL, 0, '2024-11-30', 0, 1, '2023-08-21 07:38:15', NULL, '2023-08-21 07:38:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (105, 0, 43, 1, 1, 1, 6, 1, NULL, 0, '2025-01-31', 0, 1, '2023-08-21 07:39:56', NULL, '2023-08-21 07:39:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (106, 0, 41, 1, 1, 1, 6, 1, NULL, 0, '2025-02-28', 0, 1, '2023-08-21 07:42:01', NULL, '2023-08-21 07:42:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (107, 0, 311, 1, 1, 1, 6, 3, NULL, 0, '2024-05-31', 0, 1, '2023-08-21 07:44:46', NULL, '2023-08-21 07:44:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (108, 0, 52, 1, 1, 1, 2, 24, NULL, 0, '2028-04-30', 0, 1, '2023-08-21 07:48:41', NULL, '2023-08-21 07:48:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (109, 0, 48, 1, 1, 1, 2, 25, NULL, 0, '2026-03-31', 0, 1, '2023-08-21 07:50:56', NULL, '2023-08-21 07:50:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (110, 0, 50, 1, 0, 1, 2, 25, NULL, 0, '2026-02-28', 0, 1, '2023-08-21 07:54:15', NULL, '2023-08-21 07:54:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (111, 0, 51, 1, 1, 1, 2, 25, NULL, 0, '2026-02-28', 0, 1, '2023-08-21 07:58:00', NULL, '2023-08-21 07:58:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (112, 0, 53, 1, 1, 1, 2, 24, NULL, 0, '2025-03-31', 0, 1, '2023-08-21 08:02:14', NULL, '2023-08-21 08:02:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (113, 0, 317, 1, 1, 1, 6, 3, NULL, 0, '2025-03-31', 0, 1, '2023-08-21 08:07:08', NULL, '2023-08-21 08:07:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (114, 0, 316, 1, 1, 1, 6, 3, NULL, 0, '2025-04-30', 0, 1, '2023-08-21 08:08:59', NULL, '2023-08-21 08:08:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (115, 0, 1998, 1, 1, 1, 6, 3, NULL, 0, '2025-01-31', 0, 1, '2023-08-21 08:14:53', NULL, '2023-08-21 08:14:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (116, 0, 1999, 1, 1, 1, 5, 3, NULL, 0, '2028-02-29', 0, 1, '2023-08-21 08:18:46', NULL, '2023-08-21 08:18:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (117, 0, 2002, 1, 1, 1, 6, 3, NULL, 0, '2025-05-31', 0, 1, '2023-08-21 08:26:27', NULL, '2023-08-21 08:26:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (118, 0, 569, 1, 1, 1, 7, 3, NULL, 0, '2024-04-30', 0, 1, '2023-08-21 08:29:22', NULL, '2023-08-21 08:29:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (119, 0, 55, 1, 1, 1, 5, 3, NULL, 0, '2024-09-30', 0, 1, '2023-08-21 08:32:14', NULL, '2023-08-21 08:32:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (120, 0, 2003, 1, 1, 1, 2, 10, NULL, 0, '2027-09-30', 0, 1, '2023-08-21 08:35:21', NULL, '2023-08-21 08:35:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (121, 0, 68, 1, 1, 1, 1, 3, NULL, 0, '2026-06-30', 0, 1, '2023-08-21 08:45:47', NULL, '2023-08-21 08:45:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (122, 0, 2005, 1, 1, 1, 6, 12, NULL, 0, '2026-08-31', 0, 1, '2023-08-21 08:51:39', NULL, '2023-08-21 08:51:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (123, 0, 573, 1, 1, 1, 5, 3, NULL, 0, '2025-06-30', 0, 1, '2023-08-21 08:56:51', NULL, '2023-08-21 08:56:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (124, 0, 585, 1, 1, 1, 7, 3, NULL, 0, '2025-06-30', 0, 1, '2023-08-21 09:05:32', NULL, '2023-08-21 09:05:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (125, 0, 74, 1, 1, 1, 3, 3, NULL, 0, '2026-04-30', 0, 1, '2023-08-21 09:10:40', NULL, '2023-08-21 09:10:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (126, 0, 346, 1, 1, 1, 6, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 09:13:30', NULL, '2023-08-21 09:13:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (127, 0, 1357, 1, 1, 1, 2, 25, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 09:22:29', NULL, '2023-08-21 09:22:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (128, 0, 1359, 1, 1, 1, 2, 6, NULL, 0, '2026-03-31', 0, 1, '2023-08-21 09:25:40', NULL, '2023-08-21 09:25:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (129, 0, 76, 1, 1, 1, 2, 1, NULL, 0, '2027-03-31', 0, 1, '2023-08-21 09:28:00', NULL, '2023-08-21 09:28:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (130, 0, 2006, 1, 1, 1, 6, 3, NULL, 0, '2026-05-31', 0, 1, '2023-08-21 09:32:58', NULL, '2023-08-21 09:32:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (131, 0, 80, 1, 1, 1, 2, 1, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 09:36:03', NULL, '2023-08-21 09:36:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (132, 0, 81, 1, 1, 1, 2, 6, NULL, 0, '2025-12-31', 0, 1, '2023-08-21 09:38:32', NULL, '2023-08-21 09:38:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (133, 0, 1225, 1, 1, 1, 6, 3, NULL, 0, '2026-11-30', 0, 1, '2023-08-21 09:43:00', NULL, '2023-08-21 09:43:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (134, 0, 2008, 1, 1, 1, 4, 5, NULL, 0, '2024-08-31', 0, 1, '2023-08-21 09:48:29', NULL, '2023-08-21 09:48:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (135, 0, 89, 1, 1, 1, 3, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 09:54:34', NULL, '2023-08-21 09:54:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (136, 0, 93, 1, 1, 1, 2, 25, NULL, 0, '2024-06-30', 0, 1, '2023-08-21 09:58:28', NULL, '2023-08-21 09:58:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (137, 0, 92, 1, 1, 1, 6, 2, NULL, 0, '2024-05-31', 0, 1, '2023-08-21 10:01:09', NULL, '2023-08-21 10:01:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (138, 0, 94, 1, 1, 1, 2, 12, NULL, 0, '2028-05-31', 0, 1, '2023-08-21 10:05:09', NULL, '2023-08-21 10:05:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (139, 0, 359, 1, 1, 1, 4, 6, NULL, 0, '2024-12-31', 0, 1, '2023-08-21 10:07:18', NULL, '2023-08-21 10:07:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (140, 0, 2010, 1, 1, 1, 4, 5, NULL, 0, '2024-09-30', 0, 1, '2023-08-21 10:10:55', NULL, '2023-08-21 10:10:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (141, 0, 97, 1, 1, 1, 2, 12, NULL, 0, '2026-02-28', 0, 1, '2023-08-21 10:15:08', NULL, '2023-08-21 10:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (142, 0, 102, 1, 1, 1, 2, 6, NULL, 0, '2025-11-30', 0, 1, '2023-08-21 10:17:53', NULL, '2023-08-21 10:17:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (143, 0, 106, 1, 1, 1, 2, 6, NULL, 0, '2028-06-30', 0, 1, '2023-08-21 10:20:43', NULL, '2023-08-21 10:20:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (144, 0, 2011, 1, 1, 1, 5, 1, NULL, 0, '2027-04-30', 0, 1, '2023-08-21 10:24:17', NULL, '2023-08-21 10:24:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (145, 0, 1588, 1, 1, 1, 5, 1, NULL, 0, '2026-05-31', 0, 1, '2023-08-21 10:26:07', NULL, '2023-08-21 10:26:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (146, 0, 1590, 1, 1, 1, 5, 1, NULL, 0, '2027-02-28', 0, 1, '2023-08-21 10:27:50', NULL, '2023-08-21 10:27:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (147, 0, 113, 1, 1, 1, 5, 1, NULL, 0, '2026-09-30', 0, 1, '2023-08-21 10:30:46', NULL, '2023-08-21 10:30:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (148, 0, 114, 1, 1, 1, 5, 1, NULL, 0, '2026-04-30', 0, 1, '2023-08-21 10:32:55', NULL, '2023-08-21 10:32:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (149, 0, 118, 1, 1, 1, 5, 1, NULL, 0, '2027-03-31', 0, 1, '2023-08-21 10:42:10', NULL, '2023-08-21 10:42:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (150, 0, 109, 1, 1, 1, 5, 1, NULL, 0, '2026-02-28', 0, 1, '2023-08-21 10:44:07', NULL, '2023-08-21 10:44:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (151, 0, 116, 1, 1, 1, 5, 1, NULL, 0, '2027-02-28', 0, 1, '2023-08-21 10:47:01', NULL, '2023-08-21 10:47:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (152, 0, 107, 1, 1, 1, 5, 1, NULL, 0, '2026-12-31', 0, 1, '2023-08-21 10:50:19', NULL, '2023-08-21 10:50:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (153, 0, 125, 1, 1, 1, 6, 1, NULL, 0, '2024-10-31', 0, 1, '2023-08-21 10:54:07', NULL, '2023-08-21 10:54:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (154, 0, 124, 1, 1, 1, 6, 1, NULL, 0, '2024-12-31', 0, 1, '2023-08-21 10:55:39', NULL, '2023-08-21 10:55:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (155, 0, 126, 1, 1, 1, 6, 1, NULL, 0, '2025-01-31', 0, 1, '2023-08-21 10:57:02', NULL, '2023-08-21 10:57:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (156, 0, 588, 1, 1, 1, 7, 3, NULL, 0, '2028-01-31', 0, 1, '2023-08-21 11:00:30', NULL, '2023-08-21 11:00:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (157, 0, 2012, 1, 1, 1, 5, 6, NULL, 0, '2026-12-31', 0, 1, '2023-08-21 11:04:41', NULL, '2023-08-21 11:04:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (158, 0, 2013, 1, 1, 1, 5, 6, NULL, 0, '2027-05-31', 0, 1, '2023-08-21 11:07:12', NULL, '2023-08-21 11:07:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (159, 0, 1607, 1, 1, 1, 5, 100, NULL, 0, '2026-03-31', 0, 1, '2023-08-21 11:21:49', NULL, '2023-08-21 11:21:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (160, 0, 1626, 1, 1, 1, 5, 10, NULL, 0, '2026-02-28', 0, 1, '2023-08-21 11:29:00', NULL, '2023-08-21 11:29:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (161, 0, 1627, 1, 1, 1, 5, 10, NULL, 0, '2025-10-31', 0, 1, '2023-08-21 11:31:53', NULL, '2023-08-21 11:31:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (162, 0, 141, 1, 1, 1, 2, 10, NULL, 0, '2026-03-31', 0, 1, '2023-08-21 11:35:29', NULL, '2023-08-21 11:35:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (163, 0, 144, 1, 1, 1, 2, 10, NULL, 0, '2026-03-31', 0, 1, '2023-08-21 11:39:48', NULL, '2023-08-21 11:39:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (164, 0, 368, 1, 1, 1, 6, 3, NULL, 0, '2024-11-30', 0, 1, '2023-08-21 11:42:13', NULL, '2023-08-21 11:42:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (165, 0, 2014, 1, 0, 1, 6, 3, NULL, 0, '2027-08-31', 0, 1, '2023-08-21 11:46:38', NULL, '2023-08-21 11:46:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (166, 0, 594, 1, 1, 1, 7, 2, NULL, 0, '2025-08-31', 0, 1, '2023-08-21 11:51:51', NULL, '2023-08-21 11:51:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (167, 0, 596, 1, 0, 1, 7, 2, NULL, 0, '2025-08-31', 0, 1, '2023-08-21 11:53:08', NULL, '2023-08-21 11:53:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (168, 0, 1376, 1, 1, 1, 6, 3, NULL, 0, '2026-12-31', 0, 1, '2023-08-21 12:08:52', NULL, '2023-08-21 12:08:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (169, 0, 1377, 1, 1, 1, 6, 3, NULL, 0, '2026-02-28', 0, 1, '2023-08-21 12:13:49', NULL, '2023-08-21 12:13:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (170, 0, 1378, 1, 1, 1, 6, 3, NULL, 0, '2025-10-31', 0, 1, '2023-08-21 12:15:21', NULL, '2023-08-21 12:15:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (171, 0, 370, 1, 1, 1, 6, 3, NULL, 0, '2025-12-31', 0, 1, '2023-08-21 12:16:58', NULL, '2023-08-21 12:16:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (172, 0, 607, 1, 1, 1, 7, 6, NULL, 0, '2028-03-31', 0, 1, '2023-08-21 12:45:46', NULL, '2023-08-21 12:45:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (173, 0, 894, 1, 1, 1, 2, 10, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 12:51:50', NULL, '2023-08-21 12:51:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (174, 0, 379, 1, 1, 1, 6, 2, NULL, 0, '2025-01-31', 0, 1, '2023-08-21 12:56:11', NULL, '2023-08-21 12:56:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (175, 0, 1383, 1, 1, 1, 2, 25, NULL, 0, '2026-05-31', 0, 1, '2023-08-21 12:58:37', NULL, '2023-08-21 12:58:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (176, 0, 1384, 1, 1, 1, 2, 6, NULL, 0, '2025-05-31', 0, 1, '2023-08-21 13:05:16', NULL, '2023-08-21 13:05:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (177, 0, 151, 1, 1, 1, 2, 25, NULL, 0, '2025-03-31', 0, 1, '2023-08-21 13:11:54', NULL, '2023-08-21 13:11:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (178, 0, 609, 1, 1, 1, 7, 6, NULL, 0, '2024-08-31', 0, 1, '2023-08-21 13:23:56', NULL, '2023-08-21 13:23:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (179, 0, 2015, 1, 1, 1, 5, 3, NULL, 0, '2026-04-30', 0, 1, '2023-08-21 13:25:08', NULL, '2023-08-21 13:25:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (180, 0, 610, 1, 1, 1, 7, 3, NULL, 0, '2025-01-31', 0, 1, '2023-08-21 13:29:03', NULL, '2023-08-21 13:29:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (181, 0, 1661, 1, 1, 1, 5, 12, NULL, 0, '1970-01-01', 0, 1, '2023-08-21 13:37:33', NULL, '2023-08-21 13:37:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (182, 0, 156, 1, 1, 1, 6, 3, NULL, 0, '2027-10-31', 0, 1, '2023-08-21 13:42:35', NULL, '2023-08-21 13:42:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (183, 0, 157, 1, 1, 1, 2, 10, NULL, 0, '2027-02-28', 0, 1, '2023-08-21 13:47:26', NULL, '2023-08-21 13:47:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (184, 0, 1668, 1, 1, 1, 6, 3, NULL, 0, '2026-06-30', 0, 1, '2023-08-21 13:50:43', NULL, '2023-08-21 13:50:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (185, 0, 2018, 1, 1, 1, 6, 3, NULL, 0, '2024-06-30', 0, 1, '2023-08-21 13:53:41', NULL, '2023-08-21 13:53:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (186, 0, 387, 1, 1, 1, 7, 8, NULL, 0, '2025-03-31', 0, 1, '2023-08-21 14:01:40', NULL, '2023-08-21 14:01:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (187, 0, 1463, 1, 1, 1, 4, 10, NULL, 0, '2024-09-30', 0, 1, '2023-08-21 14:06:37', NULL, '2023-08-21 14:06:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (188, 0, 2019, 1, 1, 1, 4, 10, NULL, 0, '2025-03-31', 0, 1, '2023-08-21 14:09:31', NULL, '2023-08-21 14:09:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (189, 0, 1812, 1, 1, 1, 5, 3, NULL, 0, '2027-05-31', 0, 1, '2023-08-21 14:14:20', NULL, '2023-08-21 14:14:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (190, 0, 1810, 1, 1, 1, 3, 3, NULL, 0, '2027-03-31', 0, 1, '2023-08-21 14:19:36', NULL, '2023-08-21 14:19:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (191, 0, 1808, 1, 1, 1, 5, 3, NULL, 0, '2028-01-31', 0, 1, '2023-08-21 14:21:06', NULL, '2023-08-21 14:21:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (192, 0, 1806, 1, 1, 1, 3, 3, NULL, 0, '2027-10-31', 0, 1, '2023-08-21 14:23:07', NULL, '2023-08-21 14:23:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (193, 0, 2020, 1, 1, 1, 6, 3, NULL, 0, '2025-04-30', 0, 1, '2023-08-21 14:28:17', NULL, '2023-08-21 14:28:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (194, 0, 2021, 1, 1, 1, 6, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 14:31:25', NULL, '2023-08-21 14:31:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (195, 0, 2022, 1, 1, 1, 5, 3, NULL, 0, '2025-07-31', 0, 1, '2023-08-21 14:35:09', NULL, '2023-08-21 14:35:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (196, 0, 1465, 1, 1, 1, 2, 6, NULL, 0, '2026-01-31', 0, 1, '2023-08-21 14:42:38', NULL, '2023-08-21 14:42:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (197, 0, 2023, 1, 0, 1, 6, 3, NULL, 0, '2025-02-28', 0, 1, '2023-08-21 14:55:02', NULL, '2023-08-21 14:55:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (198, 0, 2024, 1, 1, 1, 6, 3, NULL, 0, '2027-06-30', 0, 1, '2023-08-22 07:11:59', NULL, '2023-08-22 07:11:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (199, 0, 2025, 1, 1, 1, 6, 3, NULL, 0, '2026-12-24', 0, 1, '2023-08-22 07:14:50', NULL, '2023-08-22 07:14:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (200, 0, 2026, 1, 1, 1, 6, 12, NULL, 0, '2028-05-31', 0, 1, '2023-08-22 07:18:12', NULL, '2023-08-22 07:18:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (201, 0, 2027, 1, 1, 1, 6, 12, NULL, 0, '2028-01-31', 0, 1, '2023-08-22 07:20:46', NULL, '2023-08-22 07:20:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (202, 0, 2027, 1, 1, 1, 6, 12, NULL, 0, '2028-01-31', 0, 1, '2023-08-22 07:21:27', NULL, '2023-08-22 07:21:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (203, 0, 2028, 1, 1, 1, 6, 3, NULL, 0, '2028-02-29', 0, 1, '2023-08-22 07:26:31', NULL, '2023-08-22 07:26:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (204, 0, 2029, 1, 1, 1, 6, 3, NULL, 0, '2028-04-30', 0, 1, '2023-08-22 07:29:35', NULL, '2023-08-22 07:29:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (205, 0, 2030, 1, 1, 1, 4, 5, NULL, 0, '2024-11-30', 0, 1, '2023-08-22 07:32:55', NULL, '2023-08-22 07:32:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (206, 0, 2031, 1, 1, 1, 4, 5, NULL, 0, '2024-08-31', 0, 1, '2023-08-22 07:35:09', NULL, '2023-08-22 07:35:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (207, 0, 400, 1, 1, 1, 6, 4, NULL, 0, '2027-04-30', 0, 1, '2023-08-22 07:39:05', NULL, '2023-08-22 07:39:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (208, 0, 397, 1, 1, 1, 6, 4, NULL, 0, '2026-10-31', 0, 1, '2023-08-22 07:41:06', NULL, '2023-08-22 07:41:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (209, 0, 398, 1, 1, 1, 6, 3, NULL, 0, '2026-11-30', 0, 1, '2023-08-22 07:43:01', NULL, '2023-08-22 07:43:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (210, 0, 2032, 1, 1, 1, 6, 1, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 07:47:40', NULL, '2023-08-22 07:47:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (211, 0, 2033, 1, 1, 1, 6, 2, NULL, 0, '2026-03-05', 0, 1, '2023-08-22 07:50:08', NULL, '2023-08-22 07:50:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (212, 0, 2034, 1, 1, 1, 6, 1, NULL, 0, '2026-04-18', 0, 1, '2023-08-22 07:53:09', NULL, '2023-08-22 07:53:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (213, 0, 2035, 1, 1, 1, 6, 2, NULL, 0, '2026-02-22', 0, 1, '2023-08-22 07:55:48', NULL, '2023-08-22 07:55:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (214, 0, 664, 1, 1, 1, 4, 12, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 07:58:37', NULL, '2023-08-22 07:58:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (215, 0, 663, 1, 1, 1, 4, 12, NULL, 0, '2026-01-31', 0, 1, '2023-08-22 07:59:52', NULL, '2023-08-22 07:59:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (216, 0, 672, 1, 1, 1, 6, 3, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 08:02:10', NULL, '2023-08-22 08:02:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (217, 0, 670, 1, 1, 1, 6, 3, NULL, 0, '2025-12-31', 0, 1, '2023-08-22 08:03:40', NULL, '2023-08-22 08:03:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (218, 0, 668, 1, 1, 1, 6, 2, NULL, 0, '2026-02-28', 0, 1, '2023-08-22 08:05:41', NULL, '2023-08-22 08:05:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (219, 0, 667, 1, 1, 1, 6, 2, NULL, 0, '2025-11-30', 0, 1, '2023-08-22 08:06:59', NULL, '2023-08-22 08:06:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (220, 0, 669, 1, 1, 1, 6, 2, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 08:08:14', NULL, '2023-08-22 08:08:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (221, 0, 2036, 1, 1, 1, 4, 12, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 08:13:24', NULL, '2023-08-22 08:13:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (222, 0, 675, 1, 1, 1, 4, 12, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 08:14:08', NULL, '2023-08-22 08:14:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (223, 0, 676, 1, 1, 1, 4, 12, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 08:14:39', NULL, '2023-08-22 08:14:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (224, 0, 1701, 1, 1, 1, 5, 3, NULL, 0, '2028-01-31', 0, 1, '2023-08-22 08:18:32', NULL, '2023-08-22 08:18:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (225, 0, 1467, 1, 1, 1, 2, 25, NULL, 0, '2024-10-31', 0, 1, '2023-08-22 08:22:47', NULL, '2023-08-22 08:22:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (226, 0, 2037, 1, 1, 1, 7, 3, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 08:25:36', NULL, '2023-08-22 08:25:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (227, 0, 410, 1, 1, 1, 5, 50, NULL, 0, '2026-08-31', 0, 1, '2023-08-22 08:28:14', NULL, '2023-08-22 08:28:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (228, 0, 176, 1, 1, 1, 2, 25, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 08:34:15', NULL, '2023-08-22 08:34:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (229, 0, 1392, 1, 1, 1, 2, 6, NULL, 0, '2024-11-30', 0, 1, '2023-08-22 08:36:01', NULL, '2023-08-22 08:36:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (230, 0, 296, 1, 1, 1, 4, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-22 09:06:24', NULL, '2023-08-22 09:06:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (231, 0, 390, 1, 1, 1, 4, 30, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 09:09:19', NULL, '2023-08-22 09:09:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (232, 0, 1462, 1, 1, 1, 4, 30, NULL, 0, '2025-01-31', 0, 1, '2023-08-22 09:10:53', NULL, '2023-08-22 09:10:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (233, 0, 179, 1, 1, 1, 2, 10, NULL, 0, '2025-01-20', 0, 1, '2023-08-22 09:13:58', NULL, '2023-08-22 09:13:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (234, 0, 412, 1, 1, 1, 6, 3, NULL, 0, '2026-01-05', 0, 1, '2023-08-22 09:16:27', NULL, '2023-08-22 09:16:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (235, 0, 180, 1, 1, 1, 2, 25, NULL, 0, '2024-10-31', 0, 1, '2023-08-22 09:18:39', NULL, '2023-08-22 09:18:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (236, 0, 1396, 1, 1, 1, 2, 25, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 09:22:27', NULL, '2023-08-22 09:22:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (237, 0, 991, 1, 1, 1, 2, 3, NULL, 0, '2025-05-18', 0, 1, '2023-08-22 09:26:10', NULL, '2023-08-22 09:26:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (238, 0, 990, 1, 1, 1, 2, 3, NULL, 0, '2025-08-23', 0, 1, '2023-08-22 09:27:37', NULL, '2023-08-22 09:27:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (239, 0, 191, 1, 1, 1, 6, 3, NULL, 0, '2028-06-30', 0, 1, '2023-08-22 09:31:16', NULL, '2023-08-22 09:31:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (240, 0, 419, 1, 1, 1, 6, 6, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 09:35:43', NULL, '2023-08-22 09:35:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (241, 0, 425, 1, 1, 1, 6, 3, NULL, 0, '1970-01-01', 0, 1, '2023-08-22 09:38:37', NULL, '2023-08-22 09:38:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (242, 0, 1403, 1, 1, 1, 6, 6, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 09:42:28', NULL, '2023-08-22 09:42:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (243, 0, 1398, 1, 1, 1, 6, 2, NULL, 0, '2025-04-23', 0, 1, '2023-08-22 09:44:22', NULL, '2023-08-22 09:44:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (244, 0, 1400, 1, 1, 1, 6, 2, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 09:46:37', NULL, '2023-08-22 09:46:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (245, 0, 1399, 1, 1, 1, 6, 2, NULL, 0, '2025-04-30', 0, 1, '2023-08-22 09:48:05', NULL, '2023-08-22 09:48:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (246, 0, 202, 1, 1, 1, 2, 12, NULL, 0, '2028-04-30', 0, 1, '2023-08-22 09:50:33', NULL, '2023-08-22 09:50:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (247, 0, 205, 1, 1, 1, 2, 5, NULL, 0, '2026-04-30', 0, 1, '2023-08-22 09:54:02', NULL, '2023-08-22 09:54:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (248, 0, 207, 1, 1, 1, 2, 5, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 09:55:54', NULL, '2023-08-22 09:55:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (249, 0, 209, 1, 1, 1, 2, 25, NULL, 0, '2025-04-30', 0, 1, '2023-08-22 09:59:10', NULL, '2023-08-22 09:59:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (250, 0, 1425, 1, 1, 1, 2, 6, NULL, 0, '2025-01-31', 0, 1, '2023-08-22 10:01:16', NULL, '2023-08-22 10:01:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (251, 0, 208, 1, 1, 1, 2, 6, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 10:02:42', NULL, '2023-08-22 10:02:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (252, 0, 2038, 1, 1, 1, 6, 3, NULL, 0, '2025-05-31', 0, 1, '2023-08-22 10:05:18', NULL, '2023-08-22 10:05:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (253, 0, 252, 1, 1, 1, 5, 20, NULL, 0, '2025-05-31', 0, 1, '2023-08-22 10:08:38', NULL, '2023-08-22 10:08:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (254, 0, 2039, 1, 1, 1, 5, 15, NULL, 0, '2027-02-28', 0, 1, '2023-08-22 10:14:44', NULL, '2023-08-22 10:14:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (255, 0, 32, 1, 1, 1, 5, 30, NULL, 0, '2024-07-31', 0, 1, '2023-08-22 10:20:31', NULL, '2023-08-22 10:20:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (256, 0, 212, 1, 1, 1, 2, 10, NULL, 0, '2025-12-31', 0, 1, '2023-08-22 10:25:50', NULL, '2023-08-22 10:25:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (257, 0, 211, 1, 1, 1, 3, 3, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 10:27:44', NULL, '2023-08-22 10:27:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (258, 0, 213, 1, 1, 1, 2, 6, NULL, 0, '2024-09-30', 0, 1, '2023-08-22 10:29:55', NULL, '2023-08-22 10:29:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (259, 0, 1931, 1, 1, 1, 3, 2, NULL, 0, '2026-02-28', 0, 1, '2023-08-22 10:34:51', NULL, '2023-08-22 10:34:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (260, 0, 1430, 1, 1, 1, 6, 1, NULL, 0, '2025-04-30', 0, 1, '2023-08-22 10:37:57', NULL, '2023-08-22 10:37:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (261, 0, 1428, 1, 1, 1, 6, 2, NULL, 0, '2025-06-30', 0, 1, '2023-08-22 10:42:19', NULL, '2023-08-22 10:42:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (262, 0, 1023, 1, 1, 1, 2, 5, NULL, 0, '2025-05-31', 0, 1, '2023-08-22 10:49:02', NULL, '2023-08-22 10:49:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (263, 0, 452, 1, 1, 1, 6, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-22 10:54:12', NULL, '2023-08-22 10:54:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (264, 0, 1433, 1, 1, 1, 2, 24, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 10:57:28', NULL, '2023-08-22 10:57:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (265, 0, 1432, 1, 1, 1, 2, 6, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 10:59:24', NULL, '2023-08-22 10:59:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (266, 0, 215, 1, 1, 1, 2, 12, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 11:09:19', NULL, '2023-08-22 11:09:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (267, 0, 2041, 1, 1, 1, 4, 18, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 11:19:05', NULL, '2023-08-22 11:19:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (268, 0, 462, 1, 1, 1, 6, 3, NULL, 0, '2025-04-30', 0, 1, '2023-08-22 11:30:41', NULL, '2023-08-22 11:30:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (269, 0, 218, 1, 1, 1, 5, 10, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 11:44:28', NULL, '2023-08-22 11:44:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (270, 0, 2042, 1, 1, 1, 3, 3, NULL, 0, '2025-09-30', 0, 1, '2023-08-22 11:48:17', NULL, '2023-08-22 11:48:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (271, 0, 2043, 1, 1, 1, 6, 3, NULL, 0, '2027-02-28', 0, 1, '2023-08-22 11:53:56', NULL, '2023-08-22 11:53:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (272, 0, 233, 1, 1, 1, 6, 2, NULL, 0, '2024-09-30', 0, 1, '2023-08-22 11:59:57', NULL, '2023-08-22 11:59:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (273, 0, 234, 1, 1, 1, 6, 2, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 12:01:55', NULL, '2023-08-22 12:01:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (274, 0, 232, 1, 1, 1, 6, 2, NULL, 0, '2024-08-31', 0, 1, '2023-08-22 12:04:10', NULL, '2023-08-22 12:04:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (275, 0, 221, 1, 1, 1, 5, 30, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 12:09:36', NULL, '2023-08-22 12:09:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (276, 0, 220, 1, 1, 1, 5, 30, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 12:15:46', NULL, '2023-08-22 12:15:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (277, 0, 626, 1, 1, 1, 7, 6, NULL, 0, '2028-05-31', 0, 1, '2023-08-22 12:19:12', NULL, '2023-08-22 12:19:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (278, 0, 624, 1, 1, 1, 5, 3, NULL, 0, '2027-09-30', 0, 1, '2023-08-22 12:23:58', NULL, '2023-08-22 12:23:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (279, 0, 2044, 1, 1, 1, 5, 6, NULL, 0, '2025-12-31', 0, 1, '2023-08-22 12:28:27', NULL, '2023-08-22 12:28:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (280, 0, 1439, 1, 1, 1, 2, 6, NULL, 0, '2024-06-16', 0, 1, '2023-08-22 12:30:47', NULL, '2023-08-22 12:30:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (281, 0, 477, 1, 1, 1, 6, 1, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 12:34:34', NULL, '2023-08-22 12:34:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (282, 0, 1441, 1, 1, 1, 6, 3, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 12:39:59', NULL, '2023-08-22 12:39:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (283, 0, 484, 1, 1, 1, 6, 3, NULL, 0, '2025-06-30', 0, 1, '2023-08-22 12:43:30', NULL, '2023-08-22 12:43:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (284, 0, 1471, 1, 1, 1, 6, 3, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 12:44:52', NULL, '2023-08-22 12:44:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (285, 0, 492, 1, 1, 1, 6, 3, NULL, 0, '2024-07-31', 0, 1, '2023-08-22 12:47:42', NULL, '2023-08-22 12:47:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (286, 0, 1443, 1, 1, 1, 2, 5, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 12:51:23', NULL, '2023-08-22 12:51:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (287, 0, 497, 1, 1, 1, 6, 2, NULL, 0, '2024-08-31', 0, 1, '2023-08-22 12:55:24', NULL, '2023-08-22 12:55:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (288, 0, 244, 1, 1, 1, 5, 2, NULL, 0, '2025-06-13', 0, 1, '2023-08-22 13:00:50', NULL, '2023-08-22 13:00:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (289, 0, 245, 1, 1, 1, 5, 24, NULL, 0, '2025-10-31', 0, 1, '2023-08-22 13:05:57', NULL, '2023-08-22 13:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (290, 0, 242, 1, 1, 1, 2, 20, NULL, 0, '2025-09-30', 0, 1, '2023-08-22 13:10:18', NULL, '2023-08-22 13:10:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (291, 0, 2045, 1, 1, 1, 5, 3, NULL, 0, '2026-10-31', 0, 1, '2023-08-22 13:19:48', NULL, '2023-08-22 13:19:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (292, 0, 2046, 1, 0, 1, 5, 3, NULL, 0, '2027-05-31', 0, 1, '2023-08-22 13:20:55', NULL, '2023-08-22 13:20:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (293, 0, 2047, 1, 1, 1, 3, 3, NULL, 0, '2028-05-31', 0, 1, '2023-08-22 13:24:52', NULL, '2023-08-22 13:24:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (294, 0, 2048, 1, 1, 1, 6, 3, NULL, 0, '2027-01-31', 0, 1, '2023-08-22 13:28:39', NULL, '2023-08-22 13:28:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (295, 0, 2049, 1, 1, 1, 6, 3, NULL, 0, '2028-06-07', 0, 1, '2023-08-22 13:32:57', NULL, '2023-08-22 13:32:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (296, 0, 505, 1, 1, 1, 6, 3, NULL, 0, '1970-01-01', 0, 1, '2023-08-22 13:37:03', NULL, '2023-08-22 13:37:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (297, 0, 1445, 1, 1, 1, 6, 3, NULL, 0, '2025-01-31', 0, 1, '2023-08-22 13:39:48', NULL, '2023-08-22 13:39:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (298, 0, 2050, 1, 1, 1, 6, 3, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 13:43:11', NULL, '2023-08-22 13:43:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (299, 0, 2052, 1, 1, 1, 6, 3, NULL, 0, '2026-11-30', 0, 1, '2023-08-22 13:46:55', NULL, '2023-08-22 13:46:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (300, 0, 508, 1, 1, 1, 4, 12, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 13:48:55', NULL, '2023-08-22 13:48:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (301, 0, 509, 1, 1, 1, 4, 24, NULL, 0, '2025-05-31', 0, 1, '2023-08-22 13:51:08', NULL, '2023-08-22 13:51:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (302, 0, 510, 1, 1, 1, 4, 12, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 13:53:09', NULL, '2023-08-22 13:53:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (303, 0, 513, 1, 1, 1, 4, 5, NULL, 0, '2024-08-31', 0, 1, '2023-08-22 13:55:18', NULL, '2023-08-22 13:55:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (304, 0, 511, 1, 1, 1, 4, 5, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 14:00:30', NULL, '2023-08-22 14:00:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (305, 0, 514, 1, 1, 1, 6, 3, NULL, 0, '2024-09-30', 0, 1, '2023-08-22 14:03:47', NULL, '2023-08-22 14:03:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (306, 0, 515, 1, 1, 1, 6, 3, NULL, 0, '2024-10-31', 0, 1, '2023-08-22 14:05:57', NULL, '2023-08-22 14:05:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (307, 0, 254, 1, 1, 1, 2, 6, NULL, 0, '2028-03-20', 0, 1, '2023-08-22 14:07:46', NULL, '2023-08-22 14:07:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (308, 0, 1456, 1, 1, 1, 2, 6, NULL, 0, '2027-05-29', 0, 1, '2023-08-22 14:10:36', NULL, '2023-08-22 14:10:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (309, 0, 1457, 1, 1, 1, 2, 25, NULL, 0, '2027-03-21', 0, 1, '2023-08-22 14:13:08', NULL, '2023-08-22 14:13:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (310, 0, 521, 1, 1, 1, 4, 12, NULL, 0, '2024-11-15', 0, 1, '2023-08-22 14:16:32', NULL, '2023-08-22 14:16:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (311, 0, 2053, 1, 1, 1, 7, 3, NULL, 0, '2026-02-28', 0, 1, '2023-08-22 14:19:16', NULL, '2023-08-22 14:19:16', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (312, 0, 261, 1, 1, 1, 2, 50, NULL, 0, '2024-11-30', 0, 1, '2023-08-22 14:21:43', NULL, '2023-08-22 14:21:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (313, 0, 1476, 1, 1, 1, 6, 6, NULL, 0, '2025-02-12', 0, 1, '2023-08-22 14:23:53', NULL, '2023-08-22 14:23:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (314, 0, 1479, 1, 1, 1, 6, 6, NULL, 0, '2024-08-23', 0, 1, '2023-08-22 14:25:11', NULL, '2023-08-22 14:25:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (315, 0, 262, 1, 1, 1, 6, 1, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 14:28:34', NULL, '2023-08-22 14:28:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (316, 0, 263, 1, 1, 1, 6, 2, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 14:28:54', NULL, '2023-08-22 14:28:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (317, 0, 274, 1, 1, 1, 2, 50, NULL, 0, '2026-01-31', 0, 1, '2023-08-22 14:33:01', NULL, '2023-08-22 14:33:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (318, 0, 268, 1, 1, 1, 6, 3, NULL, 0, '2025-03-31', 0, 1, '2023-08-22 14:35:37', NULL, '2023-08-22 14:35:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (319, 0, 527, 1, 1, 1, 4, 36, NULL, 0, '2024-07-31', 0, 1, '2023-08-22 14:38:10', NULL, '2023-08-22 14:38:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (320, 0, 2054, 1, 1, 1, 2, 3, NULL, 0, '2025-09-30', 0, 1, '2023-08-22 14:41:12', NULL, '2023-08-22 14:41:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (321, 0, 529, 1, 1, 1, 6, 3, NULL, 0, '2026-01-31', 0, 1, '2023-08-22 14:43:26', NULL, '2023-08-22 14:43:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (322, 0, 1482, 1, 1, 1, 6, 3, NULL, 0, '2025-01-31', 0, 1, '2023-08-22 14:44:25', NULL, '2023-08-22 14:44:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (323, 0, 526, 1, 1, 1, 4, 30, NULL, 0, '2025-02-28', 0, 1, '2023-08-22 14:48:04', NULL, '2023-08-22 14:48:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (324, 0, 525, 1, 1, 1, 4, 30, NULL, 0, '2025-01-31', 0, 1, '2023-08-22 14:49:21', NULL, '2023-08-22 14:49:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (325, 0, 289, 1, 1, 1, 2, 50, NULL, 0, '2024-05-31', 0, 1, '2023-08-22 14:51:53', NULL, '2023-08-22 14:51:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (326, 0, 2056, 1, 1, 1, 6, 6, NULL, 0, '2028-05-24', 0, 1, '2023-08-22 14:55:02', NULL, '2023-08-22 14:55:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (327, 0, 512, 1, 1, 1, 4, 6, NULL, 0, '2024-12-31', 0, 1, '2023-08-22 14:56:10', NULL, '2023-08-22 14:56:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (328, 0, 247, 1, 1, 1, 5, 2, NULL, 0, '2025-07-12', 0, 1, '2023-08-22 14:58:46', NULL, '2023-08-22 14:58:46', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (329, 0, 246, 1, 1, 1, 2, 2, NULL, 0, '2025-07-16', 0, 1, '2023-08-22 15:00:34', NULL, '2023-08-22 15:00:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (330, 0, 236, 1, 1, 1, 2, 6, NULL, 0, '2024-11-30', 0, 1, '2023-08-22 15:07:33', NULL, '2023-08-22 15:07:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (331, 0, 187, 1, 1, 1, 2, 6, NULL, 0, '2026-03-31', 0, 1, '2023-08-22 15:10:54', NULL, '2023-08-22 15:10:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (332, 0, 2057, 1, 1, 1, 3, 3, NULL, 0, '2028-03-31', 0, 1, '2023-08-22 15:13:51', NULL, '2023-08-22 15:13:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (333, 0, 1936, 1, 1, 1, 5, 3, NULL, 0, '2025-04-02', 0, 1, '2023-08-22 15:16:07', NULL, '2023-08-22 15:16:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (334, 0, 2056, 1, 1, 1, 6, 2, NULL, 0, '2025-03-14', 0, 1, '2023-08-22 15:21:40', NULL, '2023-08-22 15:21:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (335, 0, 2058, 1, 1, 1, 6, 2, NULL, 0, '2025-03-14', 0, 1, '2023-08-22 15:26:33', NULL, '2023-08-22 15:26:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (336, 0, 2059, 1, 1, 1, 6, 2, NULL, 0, '2025-06-20', 0, 1, '2023-08-22 15:32:00', NULL, '2023-08-22 15:32:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (337, 0, 2060, 1, 1, 1, 6, 1, NULL, 0, '2025-04-10', 0, 1, '2023-08-22 15:36:09', NULL, '2023-08-22 15:36:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (338, 0, 2061, 1, 0, 1, 6, 1, NULL, 0, '2025-06-07', 0, 1, '2023-08-22 15:38:57', NULL, '2023-08-22 15:38:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (339, 0, 2062, 1, 1, 1, 6, 1, NULL, 0, '2026-05-31', 0, 1, '2023-08-22 15:44:19', NULL, '2023-08-22 15:44:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (340, 0, 2063, 1, 1, 1, 6, 2, NULL, 0, '2026-04-30', 0, 1, '2023-08-22 15:45:57', NULL, '2023-08-22 15:45:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (341, 0, 2064, 1, 1, 1, 6, 3, NULL, 0, '2025-12-31', 0, 1, '2023-08-22 15:47:29', NULL, '2023-08-22 15:47:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (342, 0, 466, 1, 1, 1, 6, 3, NULL, 0, '2024-07-31', 0, 1, '2023-08-22 15:52:34', NULL, '2023-08-22 15:52:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (343, 0, 1518, 1, 1, 1, 3, 1, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 15:20:33', NULL, '2023-08-23 15:20:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (344, 0, 1523, 1, 1, 1, 5, 6, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 15:25:27', NULL, '2023-08-23 15:25:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (345, 0, 2065, 1, 1, 1, 3, 1, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 15:26:17', NULL, '2023-08-23 15:26:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (346, 0, 2066, 1, 1, 1, 3, 2, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 15:30:09', NULL, '2023-08-23 15:30:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (347, 0, 2067, 1, 1, 1, 5, 1, NULL, 0, '2028-01-31', 0, 1, '2023-08-23 15:37:49', NULL, '2023-08-23 15:37:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (348, 0, 2068, 1, 1, 1, 5, 1, NULL, 0, '2027-07-31', 0, 1, '2023-08-23 15:38:30', NULL, '2023-08-23 15:38:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (349, 0, 2069, 1, 1, 1, 5, 1, NULL, 0, '2028-05-31', 0, 1, '2023-08-23 15:38:59', NULL, '2023-08-23 15:38:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (350, 0, 1538, 1, 0, 1, 5, 12, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 15:44:26', NULL, '2023-08-23 15:44:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (351, 0, 2070, 1, 1, 1, 3, 1, NULL, 0, '2025-06-29', 0, 1, '2023-08-23 15:47:47', NULL, '2023-08-23 15:47:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (352, 0, 2071, 1, 1, 1, 3, 1, NULL, 0, '2025-07-08', 0, 1, '2023-08-23 15:49:36', NULL, '2023-08-23 15:49:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (353, 0, 2072, 1, 1, 1, 3, 1, NULL, 0, '2024-09-20', 0, 1, '2023-08-23 15:51:21', NULL, '2023-08-23 15:51:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (354, 0, 2073, 1, 0, 1, 3, 1, NULL, 0, '2026-01-30', 0, 1, '2023-08-23 15:56:47', NULL, '2023-08-23 15:56:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (355, 0, 2074, 1, 0, 1, 3, 1, NULL, 0, '2026-04-01', 0, 1, '2023-08-23 15:58:36', NULL, '2023-08-23 15:58:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (356, 0, 50, 1, 1, 1, 2, 25, NULL, 0, '2026-02-02', 0, 1, '2023-08-23 16:01:03', NULL, '2023-08-23 16:01:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (357, 0, 55, 1, 1, 1, 5, 2, NULL, 0, '2024-08-08', 0, 1, '2023-08-23 16:02:01', NULL, '2023-08-23 16:02:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (358, 0, 69, 1, 1, 1, 2, 25, NULL, 0, '2025-06-30', 0, 1, '2023-08-23 16:03:56', NULL, '2023-08-23 16:03:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (359, 0, 74, 1, 1, 1, 3, 1, NULL, 0, '2026-04-30', 0, 1, '2023-08-23 16:05:07', NULL, '2023-08-23 16:05:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (360, 0, 80, 1, 1, 1, 2, 23, NULL, 0, '2026-06-30', 0, 1, '2023-08-23 16:06:43', NULL, '2023-08-23 16:06:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (361, 0, 102, 1, 1, 1, 2, 2, NULL, 0, '2024-11-30', 0, 1, '2023-08-23 16:08:29', NULL, '2023-08-23 16:08:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (362, 0, 104, 1, 1, 1, 2, 10, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 16:11:01', NULL, '2023-08-23 16:11:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (363, 0, 105, 1, 1, 1, 2, 10, NULL, 0, '2025-03-31', 0, 1, '2023-08-23 16:12:47', NULL, '2023-08-23 16:12:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (364, 0, 114, 1, 1, 1, 5, 1, NULL, 0, '2026-04-13', 0, 1, '2023-08-23 16:14:15', NULL, '2023-08-23 16:14:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (365, 0, 107, 1, 1, 1, 5, 1, NULL, 0, '2026-12-13', 0, 1, '2023-08-23 16:14:45', NULL, '2023-08-23 16:14:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (366, 0, 109, 1, 1, 1, 5, 1, NULL, 0, '2026-02-28', 0, 1, '2023-08-23 16:15:08', NULL, '2023-08-23 16:15:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (367, 0, 153, 1, 1, 1, 5, 20, NULL, 0, '2026-06-30', 0, 1, '2023-08-23 16:17:20', NULL, '2023-08-23 16:17:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (368, 0, 161, 1, 1, 1, 2, 10, NULL, 0, '2026-03-31', 0, 1, '2023-08-23 16:19:05', NULL, '2023-08-23 16:19:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (369, 0, 163, 1, 1, 1, 2, 30, NULL, 0, '2026-09-30', 0, 1, '2023-08-23 16:21:56', NULL, '2023-08-23 16:21:56', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (370, 0, 164, 1, 1, 1, 2, 10, NULL, 0, '2025-06-30', 0, 1, '2023-08-23 16:23:57', NULL, '2023-08-23 16:23:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (371, 0, 202, 1, 1, 1, 2, 50, NULL, 0, '2028-06-30', 0, 1, '2023-08-23 16:26:05', NULL, '2023-08-23 16:26:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (372, 0, 2075, 1, 1, 1, 2, 10, NULL, 0, '2026-06-30', 0, 1, '2023-08-23 16:30:18', NULL, '2023-08-23 16:30:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (373, 0, 217, 1, 1, 1, 6, 1, NULL, 0, '2024-03-31', 0, 1, '2023-08-23 16:36:49', NULL, '2023-08-23 16:36:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (374, 0, 219, 1, 1, 1, 6, 1, NULL, 0, '2024-11-30', 0, 1, '2023-08-23 16:37:28', NULL, '2023-08-23 16:37:28', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (375, 0, 231, 1, 1, 1, 6, 4, NULL, 0, '2025-05-31', 0, 1, '2023-08-23 16:40:41', NULL, '2023-08-23 16:40:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (376, 0, 239, 1, 1, 1, 2, 30, NULL, 0, '2024-05-31', 0, 1, '2023-08-23 16:44:14', NULL, '2023-08-23 16:44:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (377, 0, 246, 1, 1, 1, 2, 2, NULL, 0, '2025-07-12', 0, 1, '2023-08-23 16:46:02', NULL, '2023-08-23 16:46:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (378, 0, 247, 1, 1, 1, 5, 2, NULL, 0, '2025-07-16', 0, 1, '2023-08-23 16:47:00', NULL, '2023-08-23 16:47:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (379, 0, 270, 1, 1, 1, 6, 5, NULL, 0, '2025-04-30', 0, 1, '2023-08-23 16:48:58', NULL, '2023-08-23 16:48:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (380, 0, 280, 1, 1, 1, 2, 25, NULL, 0, '2025-12-31', 0, 1, '2023-08-23 16:51:41', NULL, '2023-08-23 16:51:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (381, 0, 317, 1, 1, 1, 6, 2, NULL, 0, '2025-05-31', 0, 1, '2023-08-23 16:53:32', NULL, '2023-08-23 16:53:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (382, 0, 319, 1, 1, 1, 6, 2, NULL, 0, '2024-09-30', 0, 1, '2023-08-23 16:55:43', NULL, '2023-08-23 16:55:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (383, 0, 320, 1, 1, 1, 6, 2, NULL, 0, '2026-03-31', 0, 1, '2023-08-23 16:58:14', NULL, '2023-08-23 16:58:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (384, 0, 323, 1, 1, 1, 6, 4, NULL, 0, '2024-11-30', 0, 1, '2023-08-23 17:00:08', NULL, '2023-08-23 17:00:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (385, 0, 2076, 1, 1, 1, 4, 10, NULL, 0, '2027-02-28', 0, 1, '2023-08-23 17:03:58', NULL, '2023-08-23 17:03:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (386, 0, 335, 1, 1, 1, 6, 2, NULL, 0, '2025-07-31', 0, 1, '2023-08-23 17:06:00', NULL, '2023-08-23 17:06:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (387, 0, 413, 1, 1, 1, 6, 2, NULL, 0, '2025-07-09', 0, 1, '2023-08-23 17:08:22', NULL, '2023-08-23 17:08:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (388, 0, 418, 1, 1, 1, 6, 2, NULL, 0, '2024-12-31', 0, 1, '2023-08-23 17:10:39', NULL, '2023-08-23 17:10:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (389, 0, 419, 1, 1, 1, 6, 2, NULL, 0, '2025-02-28', 0, 1, '2023-08-23 17:12:08', NULL, '2023-08-23 17:12:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (390, 0, 440, 1, 1, 1, 6, 2, NULL, 0, '2026-01-31', 0, 1, '2023-08-23 17:19:02', NULL, '2023-08-23 17:19:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (391, 0, 467, 1, 1, 1, 6, 2, NULL, 0, '2024-06-30', 0, 1, '2023-08-23 17:20:27', NULL, '2023-08-23 17:20:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (392, 0, 525, 1, 1, 1, 4, 6, NULL, 0, '2025-04-30', 0, 1, '2023-08-23 17:21:44', NULL, '2023-08-23 17:21:44', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (393, 0, 526, 1, 1, 1, 4, 6, NULL, 0, '2025-04-30', 0, 1, '2023-08-23 17:22:09', NULL, '2023-08-23 17:22:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (394, 0, 549, 1, 1, 1, 5, 2, NULL, 0, '2028-06-30', 0, 1, '2023-08-23 17:23:03', NULL, '2023-08-23 17:23:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (395, 0, 550, 1, 1, 1, 5, 2, NULL, 0, '2028-04-30', 0, 1, '2023-08-23 17:23:34', NULL, '2023-08-23 17:23:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (396, 0, 1965, 1, 1, 1, 5, 2, NULL, 0, '2026-02-28', 0, 1, '2023-08-23 17:24:33', NULL, '2023-08-23 17:24:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (397, 0, 634, 1, 1, 1, 7, 2, NULL, 0, '2026-12-31', 0, 1, '2023-08-23 17:26:18', NULL, '2023-08-23 17:26:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (398, 0, 646, 1, 1, 1, 7, 2, NULL, 0, '2025-09-30', 0, 1, '2023-08-23 17:28:04', NULL, '2023-08-23 17:28:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (399, 0, 649, 1, 1, 1, 7, 2, NULL, 0, '2026-03-24', 0, 1, '2023-08-23 17:30:01', NULL, '2023-08-23 17:30:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (400, 0, 655, 1, 1, 1, 5, 2, NULL, 0, '2025-05-10', 0, 1, '2023-08-23 17:32:45', NULL, '2023-08-23 17:32:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (401, 0, 656, 1, 1, 1, 5, 2, NULL, 0, '2025-04-13', 0, 1, '2023-08-23 17:34:13', NULL, '2023-08-23 17:34:13', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (402, 0, 339, 1, 1, 1, 6, 1, NULL, 0, '2025-05-31', 0, 1, '2023-08-23 17:37:08', NULL, '2023-08-23 17:37:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (403, 0, 340, 1, 1, 1, 6, 1, NULL, 0, '2025-05-31', 0, 1, '2023-08-23 17:37:25', NULL, '2023-08-23 17:37:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (404, 0, 346, 1, 1, 1, 6, 2, NULL, 0, '2026-01-18', 0, 1, '2023-08-23 17:38:11', NULL, '2023-08-23 17:38:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (405, 0, 350, 1, 1, 1, 4, 6, NULL, 0, '2025-03-31', 0, 1, '2023-08-23 17:40:07', NULL, '2023-08-23 17:40:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (406, 0, 387, 1, 1, 1, 7, 4, NULL, 0, '2025-05-31', 0, 1, '2023-08-23 17:42:40', NULL, '2023-08-23 17:42:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (407, 0, 388, 1, 1, 1, 5, 4, NULL, 0, '2024-07-31', 0, 1, '2023-08-23 17:43:06', NULL, '2023-08-23 17:43:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (408, 0, 396, 1, 1, 1, 6, 2, NULL, 0, '2026-10-31', 0, 1, '2023-08-23 17:45:09', NULL, '2023-08-23 17:45:09', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (409, 0, 398, 1, 1, 1, 6, 2, NULL, 0, '2026-11-30', 0, 1, '2023-08-23 17:45:37', NULL, '2023-08-23 17:45:37', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (410, 0, 1808, 1, 1, 1, 5, 24, NULL, 0, '2028-01-31', 0, 1, '2023-08-23 17:47:19', NULL, '2023-08-23 17:47:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (411, 0, 1812, 1, 1, 1, 5, 24, NULL, 0, '2027-05-31', 0, 1, '2023-08-23 17:47:50', NULL, '2023-08-23 17:47:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (412, 0, 1701, 1, 1, 1, 5, 10, NULL, 0, '2028-09-30', 0, 1, '2023-08-23 17:48:43', NULL, '2023-08-23 17:48:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (413, 0, 2078, 1, 1, 1, 1, 100, NULL, 0, '2025-01-31', 0, 1, '2023-08-25 19:27:51', NULL, '2023-08-25 19:27:51', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (414, 0, 1170, 1, 1, 1, 7, 1, NULL, 0, '2026-06-30', 0, 1, '2023-08-25 19:30:05', NULL, '2023-08-25 19:30:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (415, 0, 683, 1, 1, 1, 1, 100, NULL, 0, '2024-08-31', 0, 1, '2023-08-25 19:36:50', NULL, '2023-08-25 19:36:50', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (416, 0, 684, 1, 1, 1, 2, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-25 19:49:40', NULL, '2023-08-25 19:49:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (417, 0, 687, 1, 1, 1, 1, 200, NULL, 0, '2025-02-28', 0, 1, '2023-08-25 20:04:14', NULL, '2023-08-25 20:04:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (418, 0, 689, 1, 1, 1, 1, 100, NULL, 0, '2025-02-28', 0, 1, '2023-08-25 20:11:15', NULL, '2023-08-25 20:11:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (419, 0, 827, 1, 1, 1, 6, 5, NULL, 0, '2025-07-31', 0, 1, '2023-08-25 20:15:26', NULL, '2023-08-25 20:15:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (420, 0, 2082, 1, 1, 1, 7, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-25 20:24:20', NULL, '2023-08-25 20:24:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (421, 0, 696, 1, 1, 1, 1, 30, NULL, 0, '2025-06-30', 0, 1, '2023-08-25 20:27:53', NULL, '2023-08-25 20:27:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (422, 0, 702, 1, 1, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-25 20:31:35', NULL, '2023-08-25 20:31:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (423, 0, 705, 1, 1, 1, 1, 100, NULL, 0, '2025-05-31', 0, 1, '2023-08-25 20:35:21', NULL, '2023-08-25 20:35:21', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (424, 0, 708, 1, 1, 1, 1, 100, NULL, 0, '2027-01-31', 0, 1, '2023-08-25 20:37:22', NULL, '2023-08-25 20:37:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (425, 0, 2084, 1, 1, 1, 1, 100, NULL, 0, '2026-03-31', 0, 1, '2023-08-25 20:41:00', NULL, '2023-08-25 20:41:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (426, 0, 2086, 1, 1, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-25 20:46:36', NULL, '2023-08-25 20:46:36', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (427, 0, 768, 1, 1, 1, 1, 200, NULL, 0, '2025-04-30', 0, 1, '2023-08-25 20:52:58', NULL, '2023-08-25 20:52:58', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (428, 0, 2087, 1, 1, 1, 1, 100, NULL, 0, '2025-02-28', 0, 1, '2023-08-25 20:56:53', NULL, '2023-08-25 20:56:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (429, 0, 2088, 1, 1, 1, 1, 200, NULL, 0, '2025-01-31', 0, 1, '2023-08-25 21:01:19', NULL, '2023-08-25 21:01:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (430, 0, 2089, 1, 1, 1, 1, 200, NULL, 0, '2025-02-28', 0, 1, '2023-08-25 21:07:45', NULL, '2023-08-25 21:07:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (431, 0, 2090, 1, 1, 1, 1, 200, NULL, 0, '2027-05-31', 0, 1, '2023-08-25 21:17:22', NULL, '2023-08-25 21:17:22', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (432, 0, 2004, 1, 1, 1, 6, 3, NULL, 0, '2025-03-31', 0, 1, '2023-08-25 21:59:00', NULL, '2023-08-25 21:59:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (433, 0, 2091, 1, 1, 1, 1, 50, NULL, 0, '2026-06-30', 0, 1, '2023-08-25 22:15:14', NULL, '2023-08-25 22:15:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (434, 0, 1053, 1, 1, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-25 22:17:19', NULL, '2023-08-25 22:17:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (435, 0, 2092, 1, 1, 1, 1, 100, NULL, 0, '2026-02-28', 0, 1, '2023-08-25 22:19:57', NULL, '2023-08-25 22:19:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (436, 0, 901, 1, 1, 1, 1, 100, NULL, 0, '2026-01-31', 0, 1, '2023-08-25 22:22:47', NULL, '2023-08-25 22:22:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (437, 0, 2093, 1, 1, 1, 1, 100, NULL, 0, '2026-02-28', 0, 1, '2023-08-25 22:25:53', NULL, '2023-08-25 22:25:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (438, 0, 2094, 1, 1, 1, 1, 100, NULL, 0, '2025-12-31', 0, 1, '2023-08-25 22:37:25', NULL, '2023-08-25 22:37:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (439, 0, 852, 1, 1, 1, 1, 50, NULL, 0, '2027-06-30', 0, 1, '2023-08-25 22:38:43', NULL, '2023-08-25 22:38:43', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (440, 0, 853, 1, 1, 1, 1, 100, NULL, 0, '2025-04-30', 0, 1, '2023-08-25 22:41:00', NULL, '2023-08-25 22:41:00', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (441, 0, 875, 1, 1, 1, 1, 100, NULL, 0, '2026-05-31', 0, 1, '2023-08-25 22:42:45', NULL, '2023-08-25 22:42:45', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (442, 0, 874, 1, 1, 1, 1, 100, NULL, 0, '2028-02-29', 0, 1, '2023-08-25 22:44:03', NULL, '2023-08-25 22:44:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (443, 0, 733, 1, 1, 1, 1, 100, NULL, 0, '2027-05-31', 0, 1, '2023-08-26 07:42:25', NULL, '2023-08-26 07:42:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (444, 0, 736, 1, 1, 1, 1, 100, NULL, 0, '2026-05-31', 0, 1, '2023-08-26 07:45:19', NULL, '2023-08-26 07:45:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (445, 0, 2095, 1, 1, 1, 1, 100, NULL, 0, '2027-01-31', 0, 1, '2023-08-26 07:48:04', NULL, '2023-08-26 07:48:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (446, 0, 2096, 1, 1, 1, 1, 100, NULL, 0, '2027-02-28', 0, 1, '2023-08-26 07:50:11', NULL, '2023-08-26 07:50:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (447, 0, 2097, 1, 0, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 07:52:10', NULL, '2023-08-26 07:52:10', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (448, 0, 1250, 1, 1, 1, 7, 5, NULL, 0, '2028-01-31', 0, 1, '2023-08-26 08:21:55', NULL, '2023-08-26 08:21:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (449, 0, 1251, 1, 1, 1, 7, 5, NULL, 0, '2028-02-29', 0, 1, '2023-08-26 08:23:48', NULL, '2023-08-26 08:23:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (450, 0, 747, 1, 1, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 08:25:49', NULL, '2023-08-26 08:25:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (451, 0, 1264, 1, 1, 1, 7, 5, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 08:28:40', NULL, '2023-08-26 08:28:40', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (452, 0, 754, 1, 1, 1, 1, 100, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 08:31:20', NULL, '2023-08-26 08:31:20', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (453, 0, 2098, 1, 1, 1, 1, 50, NULL, 0, '2026-06-30', 0, 1, '2023-08-26 08:34:07', NULL, '2023-08-26 08:34:07', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (454, 0, 2099, 1, 0, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 08:37:03', NULL, '2023-08-26 08:37:03', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (455, 0, 2100, 1, 1, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 08:39:42', NULL, '2023-08-26 08:39:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (456, 0, 767, 1, 1, 1, 1, 100, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 08:41:31', NULL, '2023-08-26 08:41:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (457, 0, 876, 1, 1, 1, 2, 10, NULL, 0, '2027-01-31', 0, 1, '2023-08-26 08:44:54', NULL, '2023-08-26 08:44:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (458, 0, 877, 1, 1, 1, 2, 10, NULL, 0, '2027-01-31', 0, 1, '2023-08-26 08:46:47', NULL, '2023-08-26 08:46:47', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (459, 0, 878, 1, 1, 1, 2, 10, NULL, 0, '2027-10-31', 0, 1, '2023-08-26 08:48:25', NULL, '2023-08-26 08:48:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (460, 0, 880, 1, 1, 1, 2, 20, NULL, 0, '2026-10-31', 0, 1, '2023-08-26 08:50:15', NULL, '2023-08-26 08:50:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (461, 0, 881, 1, 1, 1, 2, 10, NULL, 0, '2027-04-30', 0, 1, '2023-08-26 08:52:02', NULL, '2023-08-26 08:52:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (462, 0, 1120, 1, 1, 1, 2, 10, NULL, 0, '2026-03-31', 0, 1, '2023-08-26 08:55:27', NULL, '2023-08-26 08:55:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (463, 0, 2101, 1, 1, 1, 2, 10, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 09:00:59', NULL, '2023-08-26 09:00:59', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (464, 0, 1163, 1, 1, 1, 6, 2, NULL, 0, '2023-08-31', 0, 1, '2023-08-26 09:03:35', NULL, '2023-08-26 09:03:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (465, 0, 2102, 1, 1, 1, 2, 20, NULL, 0, '2026-12-31', 0, 1, '2023-08-26 09:15:41', NULL, '2023-08-26 09:15:41', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (466, 0, 2103, 1, 0, 1, 2, 20, NULL, 0, '2026-12-31', 0, 1, '2023-08-26 09:17:04', NULL, '2023-08-26 09:17:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (467, 0, 2104, 1, 0, 1, 2, 20, NULL, 0, '2025-01-31', 0, 1, '2023-08-26 09:18:49', NULL, '2023-08-26 09:18:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (468, 0, 2105, 1, 1, 1, 6, 2, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 09:20:35', NULL, '2023-08-26 09:20:35', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (469, 0, 1070, 1, 1, 1, 2, 10, NULL, 0, '2025-02-28', 0, 1, '2023-08-26 09:21:52', NULL, '2023-08-26 09:21:52', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (470, 0, 2106, 1, 1, 1, 2, 10, NULL, 0, '2026-05-31', 0, 1, '2023-08-26 09:23:26', NULL, '2023-08-26 09:23:26', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (471, 0, 891, 1, 1, 1, 2, 10, NULL, 0, '2025-04-30', 0, 1, '2023-08-26 09:25:53', NULL, '2023-08-26 09:25:53', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (472, 0, 1167, 1, 1, 1, 7, 5, NULL, 0, '2026-05-31', 0, 1, '2023-08-26 09:27:01', NULL, '2023-08-26 09:27:01', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (473, 0, 2107, 1, 1, 1, 2, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 09:29:14', NULL, '2023-08-26 09:29:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (474, 0, 2108, 1, 1, 1, 2, 10, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 09:30:48', NULL, '2023-08-26 09:30:48', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (475, 0, 2109, 1, 1, 1, 2, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 09:32:14', NULL, '2023-08-26 09:32:14', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (476, 0, 2110, 1, 1, 1, 2, 10, NULL, 0, '2024-09-30', 0, 1, '2023-08-26 09:33:31', NULL, '2023-08-26 09:33:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (477, 0, 2111, 1, 1, 1, 7, 2, NULL, 0, '2024-04-30', 0, 1, '2023-08-26 09:35:05', NULL, '2023-08-26 09:35:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (478, 0, 2112, 1, 1, 1, 2, 10, NULL, 0, '2026-04-30', 0, 1, '2023-08-26 09:36:27', NULL, '2023-08-26 09:36:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (479, 0, 2113, 1, 1, 1, 6, 3, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 09:38:12', NULL, '2023-08-26 09:38:12', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (480, 0, 2114, 1, 1, 1, 7, 2, NULL, 0, '2027-05-31', 0, 1, '2023-08-26 09:39:54', NULL, '2023-08-26 09:39:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (481, 0, 1224, 1, 1, 1, 7, 5, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 09:41:23', NULL, '2023-08-26 09:41:23', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (482, 0, 2115, 1, 1, 1, 2, 10, NULL, 0, '2025-07-31', 0, 1, '2023-08-26 09:43:02', NULL, '2023-08-26 09:43:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (483, 0, 2116, 1, 1, 1, 6, 2, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 09:44:55', NULL, '2023-08-26 09:44:55', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (484, 0, 2117, 1, 1, 1, 7, 2, NULL, 0, '2026-03-31', 0, 1, '2023-08-26 09:46:15', NULL, '2023-08-26 09:46:15', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (485, 0, 2118, 1, 0, 1, 2, 10, NULL, 0, '2027-05-31', 0, 1, '2023-08-26 09:53:04', NULL, '2023-08-26 09:53:04', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (486, 0, 2119, 1, 1, 1, 2, 10, NULL, 0, '2026-07-31', 0, 1, '2023-08-26 09:54:57', NULL, '2023-08-26 09:54:57', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (487, 0, 2120, 1, 1, 1, 2, 10, NULL, 0, '2026-06-30', 0, 1, '2023-08-26 09:56:49', NULL, '2023-08-26 09:56:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (488, 0, 2121, 1, 1, 1, 2, 10, NULL, 0, '2025-04-30', 0, 1, '2023-08-26 09:58:18', NULL, '2023-08-26 09:58:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (489, 0, 2122, 1, 1, 1, 6, 2, NULL, 0, '2027-03-31', 0, 1, '2023-08-26 10:02:30', NULL, '2023-08-26 10:02:30', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (490, 0, 2123, 1, 1, 1, 2, 10, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 10:04:08', NULL, '2023-08-26 10:04:08', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (491, 0, 2124, 1, 1, 1, 6, 2, NULL, 0, '2027-07-31', 0, 1, '2023-08-26 10:06:29', NULL, '2023-08-26 10:06:29', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (492, 0, 842, 1, 1, 1, 2, 10, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 10:07:49', NULL, '2023-08-26 10:07:49', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (493, 0, 362, 1, 1, 1, 6, 2, NULL, 0, '2026-04-30', 0, 1, '2023-08-26 10:09:05', NULL, '2023-08-26 10:09:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (494, 0, 360, 1, 1, 1, 6, 2, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 10:10:24', NULL, '2023-08-26 10:10:24', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (495, 0, 361, 1, 1, 1, 6, 2, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 10:14:38', NULL, '2023-08-26 10:14:38', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (496, 0, 2125, 1, 1, 1, 2, 10, NULL, 0, '2026-09-30', 0, 1, '2023-08-26 10:16:19', NULL, '2023-08-26 10:16:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (497, 0, 844, 1, 1, 1, 2, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 10:17:25', NULL, '2023-08-26 10:17:25', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (498, 0, 845, 1, 1, 1, 2, 10, NULL, 0, '2025-05-31', 0, 1, '2023-08-26 10:18:32', NULL, '2023-08-26 10:18:32', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (499, 0, 1243, 1, 1, 1, 7, 2, NULL, 0, '2026-06-30', 0, 1, '2023-08-26 10:23:04', NULL, '2023-08-26 10:23:05', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (500, 0, 889, 1, 1, 1, 2, 5, NULL, 0, '2026-06-30', 0, 1, '2023-08-26 10:24:18', NULL, '2023-08-26 10:24:18', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (501, 0, 915, 1, 1, 1, 2, 15, NULL, 0, '2025-07-31', 0, 1, '2023-08-26 10:25:31', NULL, '2023-08-26 10:25:31', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (502, 0, 391, 1, 1, 1, 6, 1, NULL, 0, '2026-05-31', 0, 1, '2023-08-26 10:27:17', NULL, '2023-08-26 10:27:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (503, 0, 942, 1, 1, 1, 2, 10, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 10:28:34', NULL, '2023-08-26 10:28:34', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (504, 0, 2126, 1, 1, 1, 6, 2, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 10:30:11', NULL, '2023-08-26 10:30:11', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (505, 0, 951, 1, 1, 1, 2, 10, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 10:31:17', NULL, '2023-08-26 10:31:17', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (506, 0, 1303, 1, 1, 1, 7, 2, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 10:32:27', NULL, '2023-08-26 10:32:27', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (507, 0, 1305, 1, 1, 1, 7, 2, NULL, 0, '2025-06-30', 0, 1, '2023-08-26 10:33:42', NULL, '2023-08-26 10:33:42', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (508, 0, 2127, 1, 1, 1, 2, 10, NULL, 0, '2027-06-30', 0, 1, '2023-08-26 10:35:19', NULL, '2023-08-26 10:35:19', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_detail` VALUES (509, 0, 1063, 1, 1, 1, 2, 10, NULL, 0, '2026-08-31', 0, 1, '2023-08-26 10:36:25', NULL, '2023-08-26 10:36:25', NULL, NULL, 0);

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
-- Records of tx_produk_stok_mutasi
-- ----------------------------

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
-- Records of tx_produk_stok_mutasi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tx_produk_stok_opname
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_opname`;
CREATE TABLE `tx_produk_stok_opname`  (
  `id_stok_opname` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok` int(11) NULL DEFAULT NULL,
  `tgl_so` datetime(0) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk_stok_opname
-- ----------------------------
INSERT INTO `tx_produk_stok_opname` VALUES (1, 1, '2023-08-01 15:16:41', 11, 1, 'ddfsfdsfdsf', 'y', 1, '2023-08-01 15:15:29', 1, '2023-08-01 16:24:07', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_produk_stok_opname_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_produk_stok_opname_detail`;
CREATE TABLE `tx_produk_stok_opname_detail`  (
  `id_stok_opname_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_stok` int(11) NULL DEFAULT NULL,
  `tgl_so` date NULL DEFAULT NULL,
  `stok_fisik` int(11) NULL DEFAULT NULL,
  `penyesuaian` int(11) NULL DEFAULT NULL,
  `selisih` int(11) NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `verifikasi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_opname_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk_stok_opname_detail
-- ----------------------------
INSERT INTO `tx_produk_stok_opname_detail` VALUES (1, 1, '2023-08-01', 11, 1, NULL, 'dsfsdfds', 'y', 1, '2023-08-01 15:15:29', NULL, '2023-08-01 16:47:39', NULL, NULL, 0);
INSERT INTO `tx_produk_stok_opname_detail` VALUES (2, 1, '2023-08-01', 11, 1, NULL, 'ddfsfdsfdsf', 'y', 1, '2023-08-01 15:16:41', 1, '2023-08-01 16:47:39', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_retur
-- ----------------------------
DROP TABLE IF EXISTS `tx_retur`;
CREATE TABLE `tx_retur`  (
  `id_retur` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) NULL DEFAULT NULL,
  `id_gudang` int(11) NULL DEFAULT NULL,
  `id_penerima` int(11) NULL DEFAULT NULL,
  `no_faktur` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_sp` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `tgl_pesan` date NULL DEFAULT NULL,
  `total_beli` int(11) NULL DEFAULT NULL,
  `metode_pembayaran` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_retur`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_retur
-- ----------------------------
INSERT INTO `tx_retur` VALUES (1, 1, 2, 1, 'REN-01230823001', 'PO-01200823001', '0000-00-00', '0000-00-00', 10, NULL, 1, '2023-08-23 22:46:31', NULL, '2023-08-23 22:46:31', NULL, NULL, 0);
INSERT INTO `tx_retur` VALUES (2, 1, 2, 1, 'REN-01230823001', 'PO-01200823001', '0000-00-00', '0000-00-00', 10, NULL, 1, '2023-08-23 22:47:00', NULL, '2023-08-23 22:47:00', NULL, NULL, 0);
INSERT INTO `tx_retur` VALUES (3, 1, 2, 1, 'REN-01230823002', 'PO-01200823001', '0000-00-00', '0000-00-00', 10, NULL, 1, '2023-08-23 22:48:06', NULL, '2023-08-23 22:49:33', NULL, NULL, 0);
INSERT INTO `tx_retur` VALUES (4, 1, 2, 1, 'REN-01230823003', 'PO-01200823001', '2023-08-23', '2023-09-30', 10, NULL, 1, '2023-08-23 22:56:56', NULL, '2023-08-23 22:58:04', NULL, NULL, 0);
INSERT INTO `tx_retur` VALUES (5, 1, 2, 1, 'REN-01230823004', 'PO-01200823001', '2023-08-24', '2023-08-25', 10, 1, 1, '2023-08-24 00:40:50', NULL, '2023-08-24 00:40:50', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_retur_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_retur_detail`;
CREATE TABLE `tx_retur_detail`  (
  `id_detail_retur` int(11) NOT NULL AUTO_INCREMENT,
  `id_retur` int(11) NULL DEFAULT NULL,
  `kode_ksu` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `tgl_exp` date NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `harga` int(11) NULL DEFAULT NULL,
  `jumlah_produk_beli` int(11) NULL DEFAULT NULL,
  `jumlah_retur` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_selesai` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_detail_retur`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_retur_detail
-- ----------------------------
INSERT INTO `tx_retur_detail` VALUES (1, 5, 'OBPA160723', 28, '2023-09-29', 3, 500, 10, 5, '-', 2, 1, '2023-08-23 21:29:55', NULL, '2023-08-23 22:58:07', NULL, NULL, 0);
INSERT INTO `tx_retur_detail` VALUES (2, 5, 'OBPA989012', 29, '2023-09-30', 3, 100, 10, 3, '-', 2, 1, '2023-08-23 21:32:12', NULL, '2023-08-24 01:14:16', 1, '2023-08-24 01:14:16', 1);
INSERT INTO `tx_retur_detail` VALUES (3, NULL, 'OB-999994', 678, '2023-08-26', 1, 500, 12, 6, '-', 1, 1, '2023-08-24 00:58:55', NULL, '2023-08-27 20:27:26', 1, '2023-08-27 20:27:26', 1);
INSERT INTO `tx_retur_detail` VALUES (4, NULL, 'OBPA160723', 678, '2023-08-24', 1, 500, 10, 5, '-', 1, 1, '2023-08-24 01:02:47', NULL, '2023-08-27 20:27:31', 1, '2023-08-27 20:27:31', 1);
INSERT INTO `tx_retur_detail` VALUES (5, NULL, 'OB-999994', 680, '2023-08-24', 1, 500, 12, 5, '-', 1, 1, '2023-08-24 01:06:40', NULL, '2023-08-27 20:27:35', 1, '2023-08-27 20:27:35', 1);
INSERT INTO `tx_retur_detail` VALUES (6, 5, 'OB-999994', 680, '2023-08-24', 1, 500, 12, 5, '-', 1, 1, '2023-08-24 01:08:25', NULL, '2023-08-27 20:27:38', 1, '2023-08-27 20:27:38', 1);
INSERT INTO `tx_retur_detail` VALUES (7, 5, 'OBPA989012', 29, '2023-08-25', 1, 600, 11, 1, 'Rusak Kemasan', 1, 1, '2023-08-24 01:11:54', NULL, '2023-08-27 20:27:42', 1, '2023-08-27 20:27:42', 1);

SET FOREIGN_KEY_CHECKS = 1;
