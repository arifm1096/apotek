/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : apotek_db

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 22/08/2023 07:40:44
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
-- Table structure for tm_jenis_pembalian
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_pembalian`;
CREATE TABLE `tm_jenis_pembalian`  (
  `id_jenis_pembelian` int(11) NULL DEFAULT NULL,
  `nama_jenis_pembalian` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_jenis_pembalian
-- ----------------------------

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
-- Table structure for tm_satus_stok
-- ----------------------------
DROP TABLE IF EXISTS `tm_satus_stok`;
CREATE TABLE `tm_satus_stok`  (
  `id_status_stok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_satus_stok
-- ----------------------------
INSERT INTO `tm_satus_stok` VALUES (1, 'Masuk');
INSERT INTO `tm_satus_stok` VALUES (2, 'Keluar');

-- ----------------------------
-- Table structure for tm_status_produk
-- ----------------------------
DROP TABLE IF EXISTS `tm_status_produk`;
CREATE TABLE `tm_status_produk`  (
  `id_status_produk` int(11) NULL DEFAULT NULL,
  `nama_status_produk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tm_status_produk
-- ----------------------------
INSERT INTO `tm_status_produk` VALUES (1, 'Stok Tidak Tersedia');
INSERT INTO `tm_status_produk` VALUES (2, 'Produk Belum Terdaftar');

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
INSERT INTO `tm_user` VALUES (1, 'Admin Gudang', 'admin', 'e65b553ec1ba6b20de79', 1, 2, 'y', NULL, NULL, NULL, '2023-08-10 11:08:32', NULL, NULL, 0);
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
INSERT INTO `tm_wilayah` VALUES (1, 'GDP', 'Gudang Pusat ', 'Karanganyar ', NULL, 'Blueprint_M80', 'y', NULL, NULL, NULL, '2023-07-21 11:28:40', NULL, NULL, 0);
INSERT INTO `tm_wilayah` VALUES (2, 'ANK', 'Apotek Nawasena Karanganyar', 'Karanganyar, Solo', '0271-0998121', 'Blueprint_M801', 'y', NULL, NULL, NULL, '2023-07-21 16:51:45', 1, '2023-06-14 16:10:57', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_beli_rencana
-- ----------------------------
INSERT INTO `tx_beli_rencana` VALUES (1, NULL, 678, 1, 1000, 500, 1, '-', 0, 1, NULL, NULL, NULL, '2023-08-15 16:35:53', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (2, NULL, 27, 2, 100, 1500, 1, 'sdfdsf', 0, 1, NULL, NULL, NULL, '2023-08-16 14:40:20', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (3, NULL, 28, 1, 1000, 500, 1, '-', 0, 1, NULL, NULL, NULL, '2023-08-20 07:36:26', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (4, 0, 1174, 1, 100, 100, 1, '-', 0, 2, 1, '2023-08-15 16:39:55', NULL, '2023-08-16 16:56:04', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (5, 2, 29, 1, 20, 100, 1, '-', 0, 2, 1, '2023-08-20 10:36:04', NULL, '2023-08-20 10:37:02', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (6, NULL, 29, 1, 20, 100, 1, '-', 0, 0, 1, '2023-08-20 10:54:05', NULL, '2023-08-20 10:54:06', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (7, 5, 29, 2, 20, 100, 1, '-', 0, 2, 1, '2023-08-20 10:56:20', NULL, '2023-08-20 13:38:08', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (8, 3, 29, 1, 999, 999, 1, '-', 1, 2, 1, '2023-08-20 10:57:10', 1, '2023-08-20 21:46:19', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (9, 4, 29, 1, 111, 111, 1, '1', 1, 2, 1, '2023-08-20 11:01:08', 1, '2023-08-21 10:18:37', NULL, NULL, 0);
INSERT INTO `tx_beli_rencana` VALUES (10, 5, 27, 1, 10, 100, 1, '-', 0, 2, 1, '2023-08-20 13:37:50', NULL, '2023-08-20 13:38:08', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `tx_jual` VALUES (27, 'GDP02020823001', 18, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 0, 2, '2023-07-21 15:30:54', NULL, '2023-08-02 09:33:51', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (28, 'GDP02020823001', 18, 29, 'Paramex', '400', 5000, 4, 1, 2, 5, NULL, 25000, 0, 2, '2023-07-21 15:33:42', 2, '2023-08-02 09:33:51', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (29, NULL, NULL, 835, 'Paracetamol Sirup 60 ml YEKATRIA', NULL, NULL, NULL, NULL, NULL, 8, NULL, 0, 0, 1, '2023-07-31 16:40:21', NULL, '2023-08-08 16:07:43', 1, '2023-08-08 16:07:43', 1);
INSERT INTO `tx_jual` VALUES (30, 'GDP01010823001', 17, 29, 'Paramex', '400', 500, 4, 1, 1, 2, NULL, 1000, 1, 1, '2023-07-31 16:53:38', NULL, '2023-08-01 09:30:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (31, 'GDP01010823001', 17, 27, 'Suntik', '2000', 2500, 4, 2, 2, 3, NULL, 7500, 1, 1, '2023-07-31 16:59:48', 1, '2023-08-01 09:30:32', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (32, 'GDP01040823001', 19, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 1, 1, '2023-08-04 15:49:36', NULL, '2023-08-04 15:49:46', NULL, NULL, 0);
INSERT INTO `tx_jual` VALUES (33, 'ANK01110823001', 20, 27, 'Suntik', '2000', 2500, 4, 2, 2, 1, NULL, 2500, 1, 1, '2023-08-11 09:46:42', NULL, '2023-08-11 09:46:58', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_jual_tolak
-- ----------------------------
DROP TABLE IF EXISTS `tx_jual_tolak`;
CREATE TABLE `tx_jual_tolak`  (
  `id_jual_tolak` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_jual` int(11) NULL DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_jual_tolak`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_jual_tolak
-- ----------------------------

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
  `id_wilayah` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_kasir`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_kasir
-- ----------------------------
INSERT INTO `tx_kasir` VALUES (1, NULL, 'ANK02170723001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '2023-07-17 14:14:53', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (2, NULL, 'ANK02180723001', NULL, 86100, 0, 0, 0, 86100, 100000, 0, NULL, 2, '2023-07-18 08:41:41', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (3, NULL, 'ANK02180723001', NULL, 86100, 0, 0, 0, 86100, 100000, 0, NULL, 2, '2023-07-18 08:42:14', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (4, NULL, 'ANK02180723001', NULL, 9500, 0, 0, 0, 9500, 10000, 0, NULL, 2, '2023-07-18 08:44:23', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (5, NULL, 'ANK02180723001', NULL, 9500, 0, 0, 0, 9500, 10000, 0, NULL, 2, '2023-07-18 08:50:18', NULL, '2023-07-18 13:53:37', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (6, NULL, 'ANK02180723001', '2023-07-18 08:53:55', 9500, 0, 0, 0, 9500, 10000, 0, NULL, 2, '2023-07-18 08:53:55', NULL, '2023-07-18 13:53:53', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (7, NULL, 'ANK02180723002', '2023-07-18 08:54:08', 9500, 0, 0, 0, 9500, 10000, 0, NULL, 2, '2023-07-18 08:54:08', NULL, '2023-07-18 13:54:07', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (8, NULL, 'ANK02180723003', '2023-07-18 08:55:55', 45000, 1000, 1000, 1000, 48000, 50000, 2000, NULL, 2, '2023-07-18 08:55:55', NULL, '2023-07-18 13:55:54', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (9, NULL, 'ANK02190723001', '2023-07-19 10:13:53', 15000, 0, 0, 0, 15000, 20000, 5000, NULL, 2, '2023-07-19 10:13:53', NULL, '2023-07-19 10:13:53', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (10, NULL, 'GDP02190723002', '2023-07-19 17:43:32', 2400, 0, 0, 0, 2400, 3000, 600, NULL, 2, '2023-07-19 17:43:32', NULL, '2023-07-19 17:43:32', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (11, NULL, 'GDP01190723001', '2023-07-19 23:42:26', 129000, 0, 0, 0, 129000, 130000, 1000, NULL, 1, '2023-07-19 23:42:26', NULL, '2023-07-19 23:42:26', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (12, NULL, 'GDP02210723001', '2023-07-21 14:29:46', 7950, 0, 0, 0, 7950, 10000, 2050, NULL, 2, '2023-07-21 14:29:46', NULL, '2023-07-21 14:29:46', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (13, NULL, 'GDP02210723002', '2023-07-21 14:55:13', 18400, 0, 0, 0, 18400, 20000, 1600, NULL, 2, '2023-07-21 14:55:13', NULL, '2023-07-21 14:55:13', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (14, NULL, 'GDP02210723003', '2023-07-21 15:01:32', 12500, 0, 0, 0, 12500, 13000, 500, NULL, 2, '2023-07-21 15:01:32', NULL, '2023-07-21 15:01:32', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (15, NULL, 'GDP02210723004', '2023-07-21 15:31:02', 2500, 0, 0, 0, 2500, 5000, 2500, NULL, 2, '2023-07-21 15:31:02', NULL, '2023-07-21 15:31:02', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (16, NULL, 'GDP02210723005', '2023-07-21 15:34:10', 25000, 0, 0, 0, 25000, 25000, 0, NULL, 2, '2023-07-21 15:34:10', NULL, '2023-07-21 15:34:10', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (17, NULL, 'GDP01010823001', '2023-08-01 09:27:15', 8500, 0, 0, 0, 8500, 10000, 1500, NULL, 1, '2023-08-01 09:27:15', NULL, '2023-08-01 09:27:15', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (18, NULL, 'GDP02020823001', '2023-08-02 09:33:51', 27500, 0, 0, 0, 27500, 30000, 2500, NULL, 2, '2023-08-02 09:33:51', NULL, '2023-08-02 09:33:51', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (19, NULL, 'GDP01040823001', '2023-08-04 15:49:42', 2500, 0, 0, 0, 2500, 3000, 500, 1, 1, '2023-08-04 15:49:42', NULL, '2023-08-04 15:49:42', NULL, NULL, 0);
INSERT INTO `tx_kasir` VALUES (20, NULL, 'ANK01110823001', '2023-08-11 09:46:55', 2500, 0, 0, 0, 2500, 3000, 500, 2, 1, '2023-08-11 09:46:55', NULL, '2023-08-11 09:46:55', NULL, NULL, 0);

-- ----------------------------
-- Table structure for tx_kosinyasi
-- ----------------------------
DROP TABLE IF EXISTS `tx_kosinyasi`;
CREATE TABLE `tx_kosinyasi`  (
  `id_kosinyasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NULL DEFAULT NULL,
  `no_struk` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_supplaier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah_kosinyasi` int(11) NULL DEFAULT NULL,
  `tgl_masuk` date NULL DEFAULT NULL,
  `id_pembayaran` int(11) NULL DEFAULT NULL,
  `id_kas` int(11) NULL DEFAULT NULL,
  `id_gudang` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_kosinyasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_kosinyasi
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1945 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk
-- ----------------------------
INSERT INTO `tx_produk` VALUES (27, 'ALSU', '1231334', 'Suntik', 2, 1, 2, 2, 'kalbe', 2000, '1', NULL, NULL, NULL, '2023-07-22 14:41:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (28, 'OBPA160723', '167098342', 'Panadol', 1, 10, 1, 2, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-07-22 14:41:19', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (29, 'OBPA989012', '09894823', 'Paramex', 1, 10, 1, 0, 'kalbe', 400, '1', NULL, NULL, NULL, '2023-08-01 23:10:41', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (30, NULL, NULL, 'Adem Sari Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (31, NULL, NULL, 'Ambeven', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (32, NULL, NULL, 'Antangin Permen', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (33, NULL, NULL, 'Antangin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (34, NULL, NULL, 'Antimo Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (35, NULL, NULL, 'Asifit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (36, NULL, NULL, 'Astria 4 Tablet mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (37, NULL, NULL, 'Biocalci Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (38, NULL, NULL, 'Biocalci Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (39, NULL, NULL, 'Biogesic Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (40, NULL, NULL, 'Biolysin C 100 Strawberry 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (41, NULL, NULL, 'Biolysin Tablet Hisap Grape 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (42, NULL, NULL, 'Biolysin Tablet Hisap Orange 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (43, NULL, NULL, 'Biolysin Tablet Hisap Strawberry 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (44, NULL, NULL, 'Biolysin Tablet Kunyah Strawberry Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (45, NULL, NULL, 'Biovision Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (46, NULL, NULL, 'Bisolvon Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (47, NULL, NULL, 'Bisolvon Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (48, NULL, NULL, 'Bodrex Extra Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (49, NULL, NULL, 'Bodrex Flu Batuk Tidak Berdahak PE Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (50, NULL, NULL, 'Bodrex Flu Batuk Berdahak PE Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (51, NULL, NULL, 'Bodrex Migra Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (52, NULL, NULL, 'Bodrex Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (53, NULL, NULL, 'Bodrexin Tablet 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (54, NULL, NULL, 'CDR Fortos Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (55, NULL, NULL, 'CDR Orange Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (68, NULL, NULL, 'Combantrin Tablet 250 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (69, NULL, NULL, 'Contrexyn Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (70, NULL, NULL, 'Curcuma FCT Tablet 12', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (71, NULL, NULL, 'Curcuma Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (72, NULL, NULL, 'Curvit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (73, NULL, NULL, 'Custodiol Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (74, NULL, NULL, 'Darsi Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (75, NULL, NULL, 'Darsi Pil', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (76, NULL, NULL, 'Degirol Tablet Hisap 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (77, NULL, NULL, 'Degirol Tablet Hisap 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (78, NULL, NULL, 'Diagit Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (79, NULL, NULL, 'Diagit Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (80, NULL, NULL, 'Diapet Kapsul 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (81, NULL, NULL, 'Diapet Kapsul NR 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (82, NULL, NULL, 'Diapet Kapsul 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (83, NULL, NULL, 'Diarex Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (84, NULL, NULL, 'Diatab Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (85, NULL, NULL, 'Dulcolax Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (86, NULL, NULL, 'Dulcolax Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (87, NULL, NULL, 'Dumin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (88, NULL, NULL, 'Efisol Lozenges', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (89, NULL, NULL, 'Em Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (90, NULL, NULL, 'Enervon Active Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (91, NULL, NULL, 'Enervon Active Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (92, NULL, NULL, 'Enervon C Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (93, NULL, NULL, 'Enervon C Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (94, NULL, NULL, 'Entrostop Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (95, NULL, NULL, 'Enzyplex Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (96, NULL, NULL, 'Ester C Kapsul 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (97, NULL, NULL, 'Ester C Kapsul 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (98, NULL, NULL, 'Ester C Kapsul 90', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (99, NULL, NULL, 'Ester C Plus D3 Kapsul 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (100, NULL, NULL, 'Ester C Tablet Effervescent Blackcurant 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (101, NULL, NULL, 'Ever E 250 mg 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (102, NULL, NULL, 'Ever E 250 mg 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (103, NULL, NULL, 'Eyevit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (104, NULL, NULL, 'Fatigon Putih 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (105, NULL, NULL, 'Fatigon Spirit ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (106, NULL, NULL, 'Feminax Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (107, NULL, NULL, 'Fishermans Friend Original', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (108, NULL, NULL, 'Fishermans Friend SF Aniseed', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (109, NULL, NULL, 'Fishermans Friend SF Blackcurant', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (110, NULL, NULL, 'Fishermans Friend SF Cheery', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (111, NULL, NULL, 'Fishermans Friend SF Citrus', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (112, NULL, NULL, 'Fishermans Friend SF Citrus', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (113, NULL, NULL, 'Fishermans Friend SF Honey Lemon', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (114, NULL, NULL, 'Fishermans Friend SF Lemon', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (115, NULL, NULL, 'Fishermans Friend SF Mandarin Ginger ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (116, NULL, NULL, 'Fishermans Friend SF Mint Hijau Putih', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (117, NULL, NULL, 'Fishermans Friend SF Mint Raspberry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (118, NULL, NULL, 'Fishermans Friend SF Original', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (119, NULL, NULL, 'Fishermans Friend SF Raspberry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (120, NULL, NULL, 'Fishermans Friend SF Spearmint', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (121, NULL, NULL, 'Fishermans Friend Strong Mint Hijau', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (122, NULL, NULL, 'Fishqua Kapsul 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (123, NULL, NULL, 'Fitkom Grape Tablet 21', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (124, NULL, NULL, 'Fitkom Orange Tablet 21', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (125, NULL, NULL, 'Fitkom Strawberry Tablet 21', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (126, NULL, NULL, 'Fitkom Gummy Biru Sachet 12 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (141, NULL, NULL, 'Hemaviton Action Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (142, NULL, NULL, 'Hemaviton Joint Care Max Taplet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (143, NULL, NULL, 'Hemaviton Neuro Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (144, NULL, NULL, 'Hemaviton Stamina Plus Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (145, NULL, NULL, 'Hevit C Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (146, NULL, NULL, 'Imboost Effervescent Grape 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (147, NULL, NULL, 'Imboost Effervescent Orange 2', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (148, NULL, NULL, 'Imboost Effervescent Original 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (149, NULL, NULL, 'Imboost Effervescent Tropical Fruit 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (150, NULL, NULL, 'Imboost Lozenges Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (151, NULL, NULL, 'Inzana Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (152, NULL, NULL, 'Jaguar Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (153, NULL, NULL, 'Jesscool Tablet Effervescent', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (154, NULL, NULL, 'Joint Herbal 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (155, NULL, NULL, 'Joint Herbal 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (156, NULL, NULL, 'Kapsida', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (157, NULL, NULL, 'Kejibeling Borobudur', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (158, NULL, NULL, 'Kejibeling PT Ikong', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (159, NULL, NULL, 'Kejibeling Balatif', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (160, NULL, NULL, 'Kenshin Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (161, NULL, NULL, 'Kuldon Sariawan Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (162, NULL, NULL, 'Lagesil Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (163, NULL, NULL, 'Lancar Asi Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (164, NULL, NULL, 'Laxing Kapsul 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (176, NULL, NULL, 'Mixagip Flu Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (177, NULL, NULL, 'Mucohexin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (178, NULL, NULL, 'My Well D3 Tablet 1000 IU 20', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (179, NULL, NULL, 'Mylanta Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (180, NULL, NULL, 'Naspro Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (181, NULL, NULL, 'Natur Slim Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (182, NULL, NULL, 'Natur E Hijau 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (183, NULL, NULL, 'Natur E Orange 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (184, NULL, NULL, 'Natur E Advance Putih 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (185, NULL, NULL, 'Negatal Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (186, NULL, NULL, 'Neo Hormoviton Pasak Bumi Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (187, NULL, NULL, 'Neo Rheumacyl Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (188, NULL, NULL, 'Neo Rheumacyl Neuro Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (189, NULL, NULL, 'Neosanmag Fast', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (190, NULL, NULL, 'Nitasan ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (191, NULL, NULL, 'Norit', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (202, NULL, NULL, 'Oskadon Sakit Kepala Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (203, NULL, NULL, 'Oskadon SP Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (204, NULL, NULL, 'Pamol Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (205, NULL, NULL, 'Panadol Biru Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (206, NULL, NULL, 'Panadol Chewable Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (207, NULL, NULL, 'Panadol Extra Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (208, NULL, NULL, 'Paramex Nyeri Otot Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (209, NULL, NULL, 'Paramex Tablet (Biru)', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (210, NULL, NULL, 'Paramex SK Tablet (Merah)', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (211, NULL, NULL, 'Pil Tuntas', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (212, NULL, NULL, 'Pilkita Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (213, NULL, NULL, 'Poldanmig Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (214, NULL, NULL, 'Promag Double Action ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (215, NULL, NULL, 'Promag Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (216, NULL, NULL, 'Protecal Defence Effervescent Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (217, NULL, NULL, 'Protecal Defence Effervescent Tube', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (218, NULL, NULL, 'Protecal Solid Effervescent Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (219, NULL, NULL, 'Protecal Solid Effervescent Tube', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (220, NULL, NULL, 'Puyer 16', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (221, NULL, NULL, 'Puyer 19 ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (222, NULL, NULL, 'Redoxon Blackcurrant Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (223, NULL, NULL, 'Redoxon Fortimun Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (224, NULL, NULL, 'Redoxon Orange Effervescent Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (225, NULL, NULL, 'Redoxon Orange Effervescent Tablet 15', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (226, NULL, NULL, 'Redoxon Orange Effervescent Tablet 2', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (227, NULL, NULL, 'Renovit Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (228, NULL, NULL, 'Renovit Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (229, NULL, NULL, 'Renovit Gold Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (230, NULL, NULL, 'Renovit Gold Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (231, NULL, NULL, 'Sakatonik ABC Antariksa Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (232, NULL, NULL, 'Sakatonik ABC Grape Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (233, NULL, NULL, 'Sakatonik ABC Orange Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (234, NULL, NULL, 'Sakatonik ABC Strawberry Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (235, NULL, NULL, 'Sakatonik Liver Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (236, NULL, NULL, 'Sangobion Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (237, NULL, NULL, 'Sanmol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (238, NULL, NULL, 'Saridon Extra Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (239, NULL, NULL, 'Saridon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (240, NULL, NULL, 'SP Troches Melon 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (241, NULL, NULL, 'SP Troches Strawberry 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (242, NULL, NULL, 'Srong Pas Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (243, NULL, NULL, 'Stimuno Forte Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (244, NULL, NULL, 'Strepsil Cool 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (245, NULL, NULL, 'Strepsil Cool 8', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (246, NULL, NULL, 'Strepsil Lemon 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (247, NULL, NULL, 'Strepsil Original 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (248, NULL, NULL, 'Strepsil Original 8', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (249, NULL, NULL, 'Strepsil Vitamin C 8', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (250, NULL, NULL, 'Supertin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (251, NULL, NULL, 'Thermolyte Plus', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (252, NULL, NULL, 'Tolak Angin Permen', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (253, NULL, NULL, 'Tolak Angin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (254, NULL, NULL, 'Ultracap Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (255, NULL, NULL, 'Vege Blend 21 Jr Sayur 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (256, NULL, NULL, 'Vege Blend 21 Jr Sayur 60', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (257, NULL, NULL, 'Vege Blend For Adult Sayur 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (258, NULL, NULL, 'Vicee Grape', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (259, NULL, NULL, 'Vicee Orange ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (260, NULL, NULL, 'Vicee Lemon ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (261, NULL, NULL, 'Vicee Strawberry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (262, NULL, NULL, 'Vidorant Smart Tablet Orange 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (263, NULL, NULL, 'Vidorant Smart Tablet Strawberry 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (264, NULL, NULL, 'Viostin DS Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (265, NULL, NULL, 'Vipro G Tablet Effervescent', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (266, NULL, NULL, 'Vitamin A IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (267, NULL, NULL, 'Vitamin B 12 IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (268, NULL, NULL, 'Vitamin B Complex IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (269, NULL, NULL, 'Vitamin B1 IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (270, NULL, NULL, 'Vitamin C IPI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (271, NULL, NULL, 'Vitamin C IPI 90', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (272, NULL, NULL, 'Vitacimin Blueberry ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (273, NULL, NULL, 'Vitacimin Fruit Punch ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (274, NULL, NULL, 'Vitacimin Lemon ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (275, NULL, NULL, 'Vitacimin Nutriglow ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (276, NULL, NULL, 'Vitacimin Orange ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (277, NULL, NULL, 'Vitacimin White ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (278, NULL, NULL, 'Vitalong C Plus Zinc 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (279, NULL, NULL, 'Vitalong C Tablet 30', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (280, NULL, NULL, 'Vitalong C Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (281, NULL, NULL, 'Vitalong C Plus Zinc 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (282, NULL, NULL, 'Vitamin C Tablet 50 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (283, NULL, NULL, 'Wellmove Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (284, NULL, NULL, 'Woods Lozenges Blackcurrant', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (285, NULL, NULL, 'Woods Lozenges Cherry', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (286, NULL, NULL, 'Woods Lozenges Honey Lemon', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (287, NULL, NULL, 'Woods Lozenges Original', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (288, NULL, NULL, 'Woods Lozenges Sugar Free', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (289, NULL, NULL, 'Xonce 2', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (290, NULL, NULL, 'Xonce Tablet 6', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (291, NULL, NULL, 'Zegavit Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (292, NULL, NULL, 'Acitral Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (293, NULL, NULL, 'Anacetine Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (294, NULL, NULL, 'Antangin Junior 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (295, NULL, NULL, 'Antangin JRG Cair Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (296, NULL, NULL, 'Antimo Anak Cair Orange Sachet 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (297, NULL, NULL, 'Antimo Anak Cair Strawberry Sachet 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (298, NULL, NULL, 'Apialys Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (299, NULL, NULL, 'Apialys Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (300, NULL, NULL, 'Atmacid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (301, NULL, NULL, 'Bejo Jahe Merah 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (302, NULL, NULL, 'Baby Cough Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (303, NULL, NULL, 'Batugin Elixir 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (304, NULL, NULL, 'Batugin Elixir 300 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (305, NULL, NULL, 'Benacol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (306, NULL, NULL, 'Benadryl Batuk Berdahak Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (307, NULL, NULL, 'Benadryl Original Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (308, NULL, NULL, 'Biolysin Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (309, NULL, NULL, 'Biolysin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (310, NULL, NULL, 'Biolysin Smart Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (311, NULL, NULL, 'Biolysin Smart Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (312, NULL, NULL, 'Bisolvon Extra 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (313, NULL, NULL, 'Bisolvon Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (314, NULL, NULL, 'Bodrex Flu Batuk Berdahak PE Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (315, NULL, NULL, 'Bodrex Flu Batuk PE Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (316, NULL, NULL, 'Bodrexin Demam Orange 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (317, NULL, NULL, 'Bodrexin Flu Batuk Berdahak PE Sirup 56 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (318, NULL, NULL, 'Bodrexin Flu Batuk Tidak Berdahak PE Sirup 56 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (319, NULL, NULL, 'Bodrexin Pilek Alergi Sirup 56 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (320, NULL, NULL, 'Bronchitin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (321, NULL, NULL, 'Bronkris Elixir 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (322, NULL, NULL, 'Caviplex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (323, NULL, NULL, 'Cerebrofort Gold Orange Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (335, NULL, NULL, 'Curcuma Plus Grow Orange Sirup 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (336, NULL, NULL, 'Curcuma Plus Grow Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (337, NULL, NULL, 'Curcuma Plus Imuns Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (338, NULL, NULL, 'Curcuma Plus Sharpy Blackcurrant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (339, NULL, NULL, 'Curcuma Plus Sharpy Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (340, NULL, NULL, 'Curcuma Plus Sharpy Strawberry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (341, NULL, NULL, 'Curcuma Support Appetite 60 Sirup ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (342, NULL, NULL, 'Curvit CL Sirup  175 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (343, NULL, NULL, 'Curvit Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (344, NULL, NULL, 'Curvit Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (345, NULL, NULL, 'Decadryl Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (346, NULL, NULL, 'Decadryl Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (347, NULL, NULL, 'De Cough Menthol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (348, NULL, NULL, 'De Cough Strawberry For Children Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (349, NULL, NULL, 'Dexanta Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (350, NULL, NULL, 'Diapet Anak Cair Sachet 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (351, NULL, NULL, 'Diapet Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (352, NULL, NULL, 'Dulcolactol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (353, NULL, NULL, 'Dumin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (354, NULL, NULL, 'Durol Tonik Sirup 225 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (355, NULL, NULL, 'Elkana CL Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (356, NULL, NULL, 'Elkana Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (357, NULL, NULL, 'Eyevit Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (358, NULL, NULL, 'Enervonce Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (359, NULL, NULL, 'Entrostop Herbal Anak Cair Sachet 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (360, NULL, NULL, 'Fasidol Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (361, NULL, NULL, 'Fasidol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (362, NULL, NULL, 'Fasidol Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (363, NULL, NULL, 'Fitbes Force Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (364, NULL, NULL, 'Gastrucid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (365, NULL, NULL, 'Guanistrep Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (366, NULL, NULL, 'H Booster Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (367, NULL, NULL, 'Herbakof Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (368, NULL, NULL, 'Herbakof Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (369, NULL, NULL, 'Herbakof Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (370, NULL, NULL, 'Hufagrip TMP Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (371, NULL, NULL, 'Igastrum Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (372, NULL, NULL, 'Igastrum New Formula Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (373, NULL, NULL, 'Igastrum Plus Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (374, NULL, NULL, 'Ikadryl Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (375, NULL, NULL, 'Ikadryl Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (376, NULL, NULL, 'Imboost Force Kids Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (377, NULL, NULL, 'Imboost Force Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (378, NULL, NULL, 'Imboost Kids Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (379, NULL, NULL, 'Imboost Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (380, NULL, NULL, 'Imunku Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (381, NULL, NULL, 'Imunos Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (382, NULL, NULL, 'Imunos Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (383, NULL, NULL, 'Inadryl Sirup 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (384, NULL, NULL, 'Inzana Cair Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (385, NULL, NULL, 'Itramol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (386, NULL, NULL, 'Komik Kids Madu Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (387, NULL, NULL, 'Komix Herbal 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (388, NULL, NULL, 'Komix Herbal Lemon 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (389, NULL, NULL, 'Komix Herbal Cair Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (390, NULL, NULL, 'Komix OBH PE Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (391, NULL, NULL, 'Kompolax  Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (392, NULL, NULL, 'Lactulax Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (393, NULL, NULL, 'Lactulax Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (394, NULL, NULL, 'Lagesil Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (395, NULL, NULL, 'Lagesil Sirup 170 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (396, NULL, NULL, 'Laserin Sirup 110 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (397, NULL, NULL, 'Laserin Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (398, NULL, NULL, 'Laserin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (399, NULL, NULL, 'Laserin Madu Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (400, NULL, NULL, 'Laserin Madu Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (401, NULL, NULL, 'Laserin Madu Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (402, NULL, NULL, 'Laserin Plus Batuk Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (403, NULL, NULL, 'Laxadine Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (404, NULL, NULL, 'Laxadine Sirup 110 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (405, NULL, NULL, 'Laxadine Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (406, NULL, NULL, 'Magalat Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (407, NULL, NULL, 'Magtral Forte Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (408, NULL, NULL, 'Magtral Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (409, NULL, NULL, 'Mextril Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (410, NULL, NULL, 'Minyak Ikan Tung Hai Kapsul 500', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (411, NULL, NULL, 'Mucohexin Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (412, NULL, NULL, 'Mylanta Sirup 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (413, NULL, NULL, 'Mylanta Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (414, NULL, NULL, 'Naprex Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (415, NULL, NULL, 'Naprex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (416, NULL, NULL, 'Neo Kaolana Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (417, NULL, NULL, 'Neo Kaominal Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (418, NULL, NULL, 'OB Herbal Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (419, NULL, NULL, 'OB Herbal Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (420, NULL, NULL, 'OB Herbal Junior Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (421, NULL, NULL, 'OB Herbal Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (422, NULL, NULL, 'Obat Batuk Ibu Dan Anak Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (423, NULL, NULL, 'Obat Batuk Ibu Dan Anak Sirup 300 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (424, NULL, NULL, 'OBH Combi Dahak Jahe Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (425, NULL, NULL, 'OBH Combi Dahak Menthol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (440, NULL, NULL, 'Panadol 1 6 Years Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (452, NULL, NULL, 'Polysilane Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (453, NULL, NULL, 'Polysilane Sirup 180 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (454, NULL, NULL, 'Praxion Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (455, NULL, NULL, 'Praxion Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (456, NULL, NULL, 'Praxion Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (457, NULL, NULL, 'Promag Gazero Sirup10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (458, NULL, NULL, 'Promag Suspensi Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (459, NULL, NULL, 'Promag Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (460, NULL, NULL, 'Promedex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (461, NULL, NULL, 'Proris Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (462, NULL, NULL, 'Proris Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (463, NULL, NULL, 'Prospan Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (464, NULL, NULL, 'Rexcof Plus Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (465, NULL, NULL, 'Rexcof Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (466, NULL, NULL, 'Sakatonik Active Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (467, NULL, NULL, 'Sakatonik Active Sirup 310 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (468, NULL, NULL, 'Sanadryl Expectorant Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (469, NULL, NULL, 'Sanadryl Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (470, NULL, NULL, 'Sangobion Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (471, NULL, NULL, 'Sangobion Kids Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (472, NULL, NULL, 'Sangobion Sirup 250 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (473, NULL, NULL, 'Sangobion Sirup 400 ml ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (474, NULL, NULL, 'Sanmag Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (475, NULL, NULL, 'Sanmol Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (476, NULL, NULL, 'Sanmol Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (477, NULL, NULL, 'Sanmol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (478, NULL, NULL, 'Scotts Emulsion Orange Sirup 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (479, NULL, NULL, 'Scotts Emulsion Original Sirup 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (480, NULL, NULL, 'Scotts Emulsion Original Sirup 400 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (481, NULL, NULL, 'Scotts Emulsion Orange Sirup 400 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (482, NULL, NULL, 'Seven Seas Kids Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (483, NULL, NULL, 'Siladex Batuk Berdahak Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (484, NULL, NULL, 'Siladex Batuk Berdahak Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (485, NULL, NULL, 'Siladex Batuk Berdahak Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (486, NULL, NULL, 'Silex Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (487, NULL, NULL, 'Sirplus Grape 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (488, NULL, NULL, 'Sirplus Orange 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (489, NULL, NULL, 'Sirplus Melon 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (490, NULL, NULL, 'Sirplus Strawberry 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (491, NULL, NULL, 'Stimuno Grape Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (492, NULL, NULL, 'Stimuno Grape Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (493, NULL, NULL, 'Stimuno Orange Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (494, NULL, NULL, 'Stimuno Orangeberry Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (495, NULL, NULL, 'Stimuno Orangeberry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (496, NULL, NULL, 'Stimuno Original Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (497, NULL, NULL, 'Stimuno Original Sirup 60 mll', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (498, NULL, NULL, 'Tahesta Cuka Apel 300 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (499, NULL, NULL, 'Tay Pin San Cair Sachet 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (500, NULL, NULL, 'Tay pin San Serbuk Sachet 2 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (501, NULL, NULL, 'Tempra Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (502, NULL, NULL, 'Tempra Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (503, NULL, NULL, 'Tempra Drops 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (504, NULL, NULL, 'Tempra Forte Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (505, NULL, NULL, 'Termorex Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (506, NULL, NULL, 'Termorex Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (507, NULL, NULL, 'TJ Joybee Emulsion Orange 200 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (508, NULL, NULL, 'Tolak Angin Anak 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (509, NULL, NULL, 'Tolak Angin Cair 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (510, NULL, NULL, 'Tolak Angin Flu 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (511, NULL, NULL, 'Tolak Angin Bebas Gula 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (512, NULL, NULL, 'Tolak Linu Jahe 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (513, NULL, NULL, 'Tolak Linu Mint 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (514, NULL, NULL, 'Tonikum Bayer Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (515, NULL, NULL, 'Tonikum Bayer Sirup 330 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (516, NULL, NULL, 'Trianta Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (517, NULL, NULL, 'Triocid Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (518, NULL, NULL, 'Ultilox Forte Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (519, NULL, NULL, 'Ultilox Sirup 150 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (520, NULL, NULL, 'Upixon Sirup 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (521, NULL, NULL, 'Vegeta Herbal Sachet 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (522, NULL, NULL, 'Vegeta Orange Sachet 7 1 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (523, NULL, NULL, 'Vidoran Smart Orange Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (524, NULL, NULL, 'Vitabumin Sirup 130 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (525, NULL, NULL, 'Vitamin C 1000 Sido Muncul Lemon Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (526, NULL, NULL, 'Vitamin C 1000 Sido Muncul Orange Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (527, NULL, NULL, 'Waisan New Formula Sachet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (528, NULL, NULL, 'Woods Expectorant Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (529, NULL, NULL, 'Woods Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (545, NULL, NULL, 'Balpirik Hijau 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (546, NULL, NULL, 'Balpirik Kuning 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (547, NULL, NULL, 'Balpirik Lavender 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (548, NULL, NULL, 'Balpirik Merah 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (549, NULL, NULL, 'Balsem Geliga 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (550, NULL, NULL, 'Balsem Geliga 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (551, NULL, NULL, 'Balsem Geliga 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (552, NULL, NULL, 'Balsem Kaki Tiga 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (553, NULL, NULL, 'Balsem Lang 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (554, NULL, NULL, 'Balsem Lang 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (555, NULL, NULL, 'Balsem Lang 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (556, NULL, NULL, 'Balsem Lion Head 13 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (557, NULL, NULL, 'Balsem Lion Head 31 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (558, NULL, NULL, 'Balsem Telon TJ 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (559, NULL, NULL, 'Balsem Telon TJ 40 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (560, NULL, NULL, 'Balsem Tiger Red Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (561, NULL, NULL, 'Balsem Tiger White Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (562, NULL, NULL, 'Balsem Tjin Tjau 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (563, NULL, NULL, 'Balsem Tjin Tjau 36 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (564, NULL, NULL, 'Betadine Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (565, NULL, NULL, 'Betadine Ointment 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (566, NULL, NULL, 'Betadine Ointment 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (567, NULL, NULL, 'Biocream 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (568, NULL, NULL, 'Canesten 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (569, NULL, NULL, 'Canesten 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (570, NULL, NULL, 'Copal Balsem 36 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (571, NULL, NULL, 'Copal Tube 25 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (572, NULL, NULL, 'Counterpain 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (573, NULL, NULL, 'Counterpain 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (574, NULL, NULL, 'Counterpain 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (575, NULL, NULL, 'Counterpain 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (576, NULL, NULL, 'Counterpain 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (577, NULL, NULL, 'Counterpain Cool 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (578, NULL, NULL, 'Counterpain Cool 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (579, NULL, NULL, 'Counterpain Cool 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (580, NULL, NULL, 'Counterpain Cool 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (581, NULL, NULL, 'Cussons Baby Cream 50 Gram Fresh Nourish', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (582, NULL, NULL, 'Cussons Baby Cream 50 Gram Mild Gentle', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (583, NULL, NULL, 'Cussons Baby Cream 50 Gram Soft Smooth', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (584, NULL, NULL, 'Daktarin Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (585, NULL, NULL, 'Daktarin Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (586, NULL, NULL, 'Daktarin Diaper Ointment 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (587, NULL, NULL, 'Fungiderm 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (588, NULL, NULL, 'Fungiderm 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (589, NULL, NULL, 'Geliga Balsem Stick 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (590, NULL, NULL, 'Geliga Krim Otot 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (591, NULL, NULL, 'Geliga Krim Otot 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (592, NULL, NULL, 'Hot In Balsem Otot 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (593, NULL, NULL, 'Hot In Cream Aromatherapy Botol 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (594, NULL, NULL, 'Hot In Cream Aromatherapy Botol 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (595, NULL, NULL, 'Hot In Cream Aromatherapy Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (596, NULL, NULL, 'Hot In Cream Aromatherapy Tube 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (597, NULL, NULL, 'Hot In Cream Original Botol 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (598, NULL, NULL, 'Hot In Cream Original Botol 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (599, NULL, NULL, 'Hot In Cream Original Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (600, NULL, NULL, 'Hot In Cream Original Tube 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (601, NULL, NULL, 'Hot In Cream Strong Botol 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (602, NULL, NULL, 'Hot In Cream Strong Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (603, NULL, NULL, 'Hot In Cream Strong Tube 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (604, NULL, NULL, 'Hot In DCL Tube 120 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (605, NULL, NULL, 'Hot In DCL Tube 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (606, NULL, NULL, 'Hot In DCL Tube 60 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (607, NULL, NULL, 'Ichtyol Salep 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (608, NULL, NULL, 'Kalpanax Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (609, NULL, NULL, 'Kalpanax Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (610, NULL, NULL, 'Kalpanax Salep 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (621, NULL, NULL, 'Nellco Rheumason Classic Cream 18 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (622, NULL, NULL, 'Nosib Salep 14 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (623, NULL, NULL, 'Nourish Beauty Care Acne Gel 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (624, NULL, NULL, 'Pagoda Salep Extra 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (625, NULL, NULL, 'Painkila 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (626, NULL, NULL, 'Salep 2 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (627, NULL, NULL, 'Salep Kembang Bulan 7 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (628, NULL, NULL, 'Salep Kulit 88', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (629, NULL, NULL, 'Salep Levertran 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (630, NULL, NULL, 'Salonpas Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (631, NULL, NULL, 'Salonpas Cream 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (632, NULL, NULL, 'Salonpas Cream Hot 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (633, NULL, NULL, 'Salonpas Cream Hot 30 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (634, NULL, NULL, 'Salonpas Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (646, NULL, NULL, 'Transpulmin Baby 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (647, NULL, NULL, 'Transpulmin Kids 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (648, NULL, NULL, 'Ultraderma Gel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (649, NULL, NULL, 'Ultrasiline Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (650, NULL, NULL, 'Vaseline Jelly 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (651, NULL, NULL, 'Vaseline Jelly Aloe 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (652, NULL, NULL, 'Vaseline Jelly Baby 50 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (653, NULL, NULL, 'Veril Acne Gel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (654, NULL, NULL, 'Vicks Vaporub 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (655, NULL, NULL, 'Vicks Vaporub 25 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (656, NULL, NULL, 'Vicks Vaporub 50 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (657, NULL, NULL, 'Virugon 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (658, NULL, NULL, 'Voltadex Gel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (659, NULL, NULL, 'Voltaren Balsem 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (660, NULL, NULL, 'Voltaren Emulgel 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (661, NULL, NULL, 'Voltaren Emulgel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (662, NULL, NULL, 'Voltaren Emulgel 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (663, NULL, NULL, 'Madu Rasa Jeruk Nipis Sachet 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (664, NULL, NULL, 'Madu Rasa Original Sachet 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (665, NULL, NULL, 'Madu TJ Extra 150 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (666, NULL, NULL, 'Madu TJ Extra 250 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (667, NULL, NULL, 'Madu TJ Joybee Orange 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (668, NULL, NULL, 'Madu TJ Joybee Original 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (669, NULL, NULL, 'Madu TJ Joybee Strawberry 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (670, NULL, NULL, 'Madu TJ Kurma 150 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (671, NULL, NULL, 'Madu TJ Kurma 250 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (672, NULL, NULL, 'Madu Tj Murni 150 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (673, NULL, NULL, 'Madu Tj Murni 250 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (674, NULL, NULL, 'Madu Tj Panas Dalam 150 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (675, NULL, NULL, 'Madu TJ Orange Sachet 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (676, NULL, NULL, 'Madu TJ Strawberry Sachet 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (677, NULL, NULL, 'Madu Tj Kurma 500 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (678, NULL, NULL, 'Acarbose Tablet 100 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (679, NULL, NULL, 'Acarbose Tablet 50 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (680, NULL, NULL, 'Acetylcistein Tablet 200 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (681, NULL, NULL, 'Acyclovir Tablet 200 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (682, NULL, NULL, 'Allopurinol Tablet 100 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (683, NULL, NULL, 'Allopurinol Tablet 300 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (684, NULL, NULL, 'Ambroxol tablet 30 mg YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (685, NULL, NULL, 'Amlodipine Tablet 10 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (686, NULL, NULL, 'Amlodipine Tablet 5 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (687, NULL, NULL, 'Amoxicillin Tablet 500 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (688, NULL, NULL, 'Ampicillin Tablet 500 mg MERSI', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (689, NULL, NULL, 'Antasida Doen Tablet ERELA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (690, NULL, NULL, 'Asam Mefenamat Tablet 500 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (691, NULL, NULL, 'Asam Traneksamat Tablet 500 mg BERNOFARM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (692, NULL, NULL, 'Atorvastatin Tablet 10 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (693, NULL, NULL, 'Atorvastatin Tablet 20 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (694, NULL, NULL, 'Azithromycin Tablet 500 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (695, NULL, NULL, 'Betahistine Tablet 6 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (696, NULL, NULL, 'Bisoprolol Tablet 5 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (697, NULL, NULL, 'Candesartan Tablet 16 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (698, NULL, NULL, 'Candesartan Tablet 8 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (699, NULL, NULL, 'Captopril Tablet 12 5 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (700, NULL, NULL, 'Captopril Tablet 25 mg ERRITA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (701, NULL, NULL, 'Captopril Tablet 50 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (702, NULL, NULL, 'Cefadroxil Tablet 500 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (703, NULL, NULL, 'Cefixime Tablet 100 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (704, NULL, NULL, 'Cefixime Tablet 200 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (705, NULL, NULL, 'Cetirizin Tablet 10 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (706, NULL, NULL, 'Chloramphenicol Tablet 250 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (707, NULL, NULL, 'Cimetidine Tablet 200 mg KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (708, NULL, NULL, 'Ciprofloxacin Tablet 500 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (733, NULL, NULL, 'Glibenclamide Tablet 5 mg FM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (734, NULL, NULL, 'Glibenclamide Tablet 5 mg INDOFARMA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (735, NULL, NULL, 'Glimepiride Tablet 1 mg DEXA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (736, NULL, NULL, 'Glimepiride Tablet 1 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (747, NULL, NULL, 'Ibuprofen Tablet 400 mg NOVAPHARIN', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (748, NULL, NULL, 'Irbesartan Tablet 150 mg OTTO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (749, NULL, NULL, 'Irbesartan Tablet 300 mg OTTO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (750, NULL, NULL, 'Isosorbid Dinitrat Tablet 5 mg YARINDO', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (751, NULL, NULL, 'Ivermectin Tablet 12 mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (752, NULL, NULL, 'Kalium Diclofenac Tablet 25 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (753, NULL, NULL, 'Kalium Diclofenac Tablet 50 mg NOVEL', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (754, NULL, NULL, 'Ketoconazol Tablet 200 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (767, NULL, NULL, 'Meloxicam Tablet 7 5 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (768, NULL, NULL, 'Metformin Tablet 500 mg HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (827, NULL, NULL, 'Antasida Doen Sirup 60 ml ERELA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (842, NULL, NULL, 'Fasidol Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (843, NULL, NULL, 'Farsobid Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (844, NULL, NULL, 'Faxiden Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (845, NULL, NULL, 'Faxiden Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (846, NULL, NULL, 'FG Troches Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (847, NULL, NULL, 'Fitbon Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (848, NULL, NULL, 'Fitbon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (849, NULL, NULL, 'Fituno Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (850, NULL, NULL, 'Flamar Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (851, NULL, NULL, 'Flamar Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (852, NULL, NULL, 'Flamigra Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (853, NULL, NULL, 'Floxigra Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (874, NULL, NULL, 'Grafachlor Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (875, NULL, NULL, 'Grafadon Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (876, NULL, NULL, 'Grafadon Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (877, NULL, NULL, 'Grafamic Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (878, NULL, NULL, 'Grafazol Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (879, NULL, NULL, 'Grahabion Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (880, NULL, NULL, 'Grathazon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (881, NULL, NULL, 'Gratheos Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (882, NULL, NULL, 'Gravask Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (883, NULL, NULL, 'Gravask Tablet 5 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (884, NULL, NULL, 'Grazeo Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (885, NULL, NULL, 'Grazeo Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (886, NULL, NULL, 'Hemobion Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (887, NULL, NULL, 'Heptasan Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (888, NULL, NULL, 'Histapan Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (889, NULL, NULL, 'Histigo Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (890, NULL, NULL, 'Hp Pro Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (891, NULL, NULL, 'Hufadextamin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (892, NULL, NULL, 'Imboost Force ES Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (893, NULL, NULL, 'Imboost Force Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (894, NULL, NULL, 'Imboost Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (895, NULL, NULL, 'Imodium HCL Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (896, NULL, NULL, 'Imunos Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (897, NULL, NULL, 'Imunos Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (898, NULL, NULL, 'Inbion Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (899, NULL, NULL, 'Incidal OD Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (900, NULL, NULL, 'Indexon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (901, NULL, NULL, 'Infalgin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (915, NULL, NULL, 'Kaditic Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (942, NULL, NULL, 'Lerzin Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (943, NULL, NULL, 'Levitra Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (944, NULL, NULL, 'Licokalk Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (945, NULL, NULL, 'Licokalk Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (946, NULL, NULL, 'Limoxin Tablet 30 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (947, NULL, NULL, 'Lipitor Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (948, NULL, NULL, 'Lipitor Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (949, NULL, NULL, 'Lipitor Tablet 40 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (950, NULL, NULL, 'Lodia Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (951, NULL, NULL, 'Lokev Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (990, NULL, NULL, 'Neurobion 5000 Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (991, NULL, NULL, 'Neurobion Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1023, NULL, NULL, 'Polysilane Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1053, NULL, NULL, 'Renadinac Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1054, NULL, NULL, 'Romuz Tablet 2 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1055, NULL, NULL, 'Rozgra Tablet 100 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1056, NULL, NULL, 'Rozgra Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1057, NULL, NULL, 'Ryvel Tablet 4 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1058, NULL, NULL, 'Sanmetidin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1059, NULL, NULL, 'Sanprima Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1060, NULL, NULL, 'Scanaflam Tablet 25 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1061, NULL, NULL, 'Scanaflam Tablet 50 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1062, NULL, NULL, 'Scandexon Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1063, NULL, NULL, 'Scopma Plus Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1064, NULL, NULL, 'Selvim Tablet 10 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1065, NULL, NULL, 'Selvim Tablet 20 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1066, NULL, NULL, 'Sistenol Kaplet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1067, NULL, NULL, 'Solinfec Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1068, NULL, NULL, 'Spasmal Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1069, NULL, NULL, 'Spasminal Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1070, NULL, NULL, 'Stanza Tablet 500 Mg', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1120, NULL, NULL, 'Vosea Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1163, NULL, NULL, 'Vosea Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1164, NULL, NULL, 'Yusimox Dry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1165, NULL, NULL, 'Yusimox Forte Dry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1166, NULL, NULL, 'Zibramax Dry Sirup 15 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1167, NULL, NULL, 'Acifar Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1168, NULL, NULL, 'Aclonac Emulgel 20 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1169, NULL, NULL, 'Acyclovir Cream 5 Gram ERELA', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1170, NULL, NULL, 'Acyclovir Cream 5 Gram FM', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1224, NULL, NULL, 'Dexigen Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1243, NULL, NULL, 'Genalten Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1244, NULL, NULL, 'Genoint Salep Kulit 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1245, NULL, NULL, 'Gentamicin Cream 5 Gram KF', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1246, NULL, NULL, 'Gentasolon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1247, NULL, NULL, 'Haemocain Cream 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1248, NULL, NULL, 'Hercume Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1249, NULL, NULL, 'Hico Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1250, NULL, NULL, 'Hydrocortison 1 percent Cream 5 Gram KALBE', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1251, NULL, NULL, 'Hydrocortison 2 5 percent Cream 5 Gram KALBE', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1264, NULL, NULL, 'Ketoconazole Cream 2 percent  10 Gram HJ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1303, NULL, NULL, 'Neocenta Gel 15 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1304, NULL, NULL, 'Nerisona Combi Cream 10 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1305, NULL, NULL, 'Nisagon Cream 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1342, NULL, NULL, 'Anakonidin OBH Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1343, NULL, NULL, 'Anakonidin OBH Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1344, NULL, NULL, 'Anakonidin Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1357, NULL, NULL, 'Decolgen Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1358, NULL, NULL, 'Decolsin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1359, NULL, NULL, 'Decolsin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1376, NULL, NULL, 'Hufagrip BP Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1377, NULL, NULL, 'Hufagrip Flu Batuk Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1378, NULL, NULL, 'Hufagrip Pilek Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1379, NULL, NULL, 'Ikadryl Sirup Flu 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1380, NULL, NULL, 'Intunal Forte Tablet 10', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1381, NULL, NULL, 'Intunal Forte Tablet 4', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1382, NULL, NULL, 'Intunal Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1383, NULL, NULL, 'Intunal Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1384, NULL, NULL, 'Inza Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1385, NULL, NULL, 'Lacoldin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1386, NULL, NULL, 'Lacoldin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1387, NULL, NULL, 'Lapifed DM Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1388, NULL, NULL, 'Lapifed Expectorant Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1389, NULL, NULL, 'Lapifed Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1390, NULL, NULL, 'Lapifed Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1391, NULL, NULL, 'Lapisiv Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1392, NULL, NULL, 'Mixagrip Flu Batuk Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1393, NULL, NULL, 'Molexflu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1394, NULL, NULL, 'Nalgestan Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1395, NULL, NULL, 'Neo Napacin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1396, NULL, NULL, 'Neozep Forte Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1397, NULL, NULL, 'OBH Combi Kids Apel Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1398, NULL, NULL, 'OBH Combi Kids Madu Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1399, NULL, NULL, 'OBH Combi Kids Orange Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1400, NULL, NULL, 'OBH Combi Kids Strawberry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1401, NULL, NULL, 'OBH Combi Plus Madu Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1402, NULL, NULL, 'OBH Combi Plus Menthol Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1403, NULL, NULL, 'OBH Combi Plus Menthol Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1425, NULL, NULL, 'Paramex Flu Batuk Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1426, NULL, NULL, 'Paratusin Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1427, NULL, NULL, 'Paratusin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1428, NULL, NULL, 'PimTraKol Cherry Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1429, NULL, NULL, 'PimTraKol Kids Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1430, NULL, NULL, 'PimTraKol Lemon Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1431, NULL, NULL, 'PK Permanganas Kalium 5 Gram', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1432, NULL, NULL, 'Procold Flu Batuk Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1433, NULL, NULL, 'Procold Flu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1434, NULL, NULL, 'Rhinofed Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1435, NULL, NULL, 'Rhinofed Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1436, NULL, NULL, 'Rhinos Junior Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1437, NULL, NULL, 'Rhinos Neo Drops 10 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1438, NULL, NULL, 'Rhinos SR Kapsul', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1439, NULL, NULL, 'Sanaflu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1440, NULL, NULL, 'Siladex Batuk Pilek Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1441, NULL, NULL, 'Siladex Batuk Pilek Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1442, NULL, NULL, 'Siladex Batuk Pilek Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1443, NULL, NULL, 'Stop Cold Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1444, NULL, NULL, 'Tera F Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1445, NULL, NULL, 'Termorex Plus Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1456, NULL, NULL, 'Ultraflu Extra Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1457, NULL, NULL, 'Ultraflu Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1458, NULL, NULL, 'Benacol DTM Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1459, NULL, NULL, 'Grantusif Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1460, NULL, NULL, 'Halmezin Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1461, NULL, NULL, 'Komix Jahe Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1462, NULL, NULL, 'Komix Jeruk Nipis Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1463, NULL, NULL, 'Komix Kid Strawberry Sachet 5 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1464, NULL, NULL, 'Komix Peppermint Sachet 7 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1465, NULL, NULL, 'Konidin Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1466, NULL, NULL, 'Lapisiv T Tablet', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1467, NULL, NULL, 'Mextril Tablet ', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1468, NULL, NULL, 'Sanadryl DMP Sirup 120 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1469, NULL, NULL, 'Sanadryl DMP Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1470, NULL, NULL, 'Siladex Antitussive Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1471, NULL, NULL, 'Siladex Antitussive Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1472, NULL, NULL, 'Siladex Antitussive Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1473, NULL, NULL, 'Siladex DMP Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1474, NULL, NULL, 'Siladex DMP Sirup 30 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1475, NULL, NULL, 'Siladex DMP Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1476, NULL, NULL, 'Vicks F44 Anak Sirup 27 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1477, NULL, NULL, 'Vicks F44 Anak Sirup 54 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1478, NULL, NULL, 'Vicks F44 Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1479, NULL, NULL, 'Vicks F44 Sirup 27 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1480, NULL, NULL, 'Vicks F44 Sirup 54 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1481, NULL, NULL, 'Woods Antitussive Sirup 100 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1482, NULL, NULL, 'Woods Antitussive Sirup 60 ml', NULL, NULL, NULL, 2, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:42:14', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1506, NULL, NULL, 'Byebye Fever Anak Sachet', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1507, NULL, NULL, 'Byebye Fever Bayi Sachet', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1518, NULL, NULL, 'Charm Extra Maxi 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1519, NULL, NULL, 'Charm Extra Maxi 30', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1520, NULL, NULL, 'Charm Extra Maxi 5', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1521, NULL, NULL, 'Charm Extra Maxi 8', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1522, NULL, NULL, 'Charm Extra Maxi Wings 2', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1523, NULL, NULL, 'Charm Night Wings 2', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1538, NULL, NULL, 'Confidence Premium Biru L 1 ', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1588, NULL, NULL, 'Fiesta Grape 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1589, NULL, NULL, 'Fiesta Banana 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1590, NULL, NULL, 'Fiesta Bubble Gum 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1607, NULL, NULL, 'Hansaplast', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1622, NULL, NULL, 'Hansaplast Koyo Hangat 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1623, NULL, NULL, 'Hansaplast Koyo Panas 1', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1624, NULL, NULL, 'Hansaplast Koyo Panas 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1625, NULL, NULL, 'Hansaplast Mix 10', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1626, NULL, NULL, 'Hansaplast Roll 1 25 cm X 1 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1627, NULL, NULL, 'Hansaplast Roll 1 25 cm X 5 M', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1661, NULL, NULL, 'Kapas Selection 35 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1662, NULL, NULL, 'Kapas selection 50 Gram', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1663, NULL, NULL, 'Kasa Darma Husada', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1664, NULL, NULL, 'Kasa Keyko Orange', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1665, NULL, NULL, 'Kasa Steril Indah Medika', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1666, NULL, NULL, 'Kasa Steril Three Med', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1667, NULL, NULL, 'Kassa Keyko Biru', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1668, NULL, NULL, 'Kemiriku 100 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1669, NULL, NULL, 'Kertas Puyer 100', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1670, NULL, NULL, 'Kinoki Gold', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1671, NULL, NULL, 'Kinoki White', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1672, NULL, NULL, 'Kondom Arjuna Extra Tipis 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1673, NULL, NULL, 'Kondom Arjuna Jempol 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1674, NULL, NULL, 'Koolfever Adult Sachet', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1675, NULL, NULL, 'Koolfever Anak Sachet', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1676, NULL, NULL, 'Koolfever Baby Sachet', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1701, NULL, NULL, 'Magic Power Hitam', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1806, NULL, NULL, 'Sutra Classic Merah 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1807, NULL, NULL, 'Sutra Classic Merah 24', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1808, NULL, NULL, 'Sutra Classic Merah 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1809, NULL, NULL, 'Sutra Lubricant 50 ml', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1810, NULL, NULL, 'Sutra OK Hitam 12', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1811, NULL, NULL, 'Sutra OK Hitam 24', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1812, NULL, NULL, 'Sutra OK Hitam 3', NULL, NULL, NULL, 1, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
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
INSERT INTO `tx_produk` VALUES (1931, NULL, NULL, 'Polident Fresh Mint 20 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1932, NULL, NULL, 'Polident Fresh Mint 60 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1933, NULL, NULL, 'Sensodyne Cool Gel 160 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1934, NULL, NULL, 'Sensodyne Coolgel 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1935, NULL, NULL, 'Sensodyne Freshmint 160 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1936, NULL, NULL, 'Sensodyne Freshmint 50 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1937, NULL, NULL, 'Sensodyne Fresmint 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1938, NULL, NULL, 'Sensodyne Gen White 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1939, NULL, NULL, 'Sensodyne Gen White 50 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1940, NULL, NULL, 'Sensodyne Gentle White 160 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1941, NULL, NULL, 'Sensodyne Original 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1942, NULL, NULL, 'Sensodyne Rapid Relief 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1943, NULL, NULL, 'Sensodyne Repair Prot Ext Fresh 100 Gram', NULL, NULL, NULL, 3, NULL, NULL, '1', NULL, NULL, NULL, '2023-07-22 14:48:57', NULL, NULL, 0);
INSERT INTO `tx_produk` VALUES (1944, 'UM - ZINSHABOT170ML', '8781230901', 'Zinc Shampoo Botol 170 ml', 2, 1, 2, 0, 'Lion', 400, '1', NULL, NULL, NULL, '2023-08-01 16:52:41', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_produk_stok
-- ----------------------------
INSERT INTO `tx_produk_stok` VALUES (1, 27, 1, 1, NULL, 12, NULL, '2023-07-31', NULL, '2023-07-26 10:11:55', 1, '2023-07-26 15:11:54', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (2, 14, 2, 0, NULL, 144, NULL, '2023-07-20', 2, '2023-07-10 10:05:07', NULL, '2023-07-10 15:05:02', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (3, 13, 2, 1, NULL, 10, NULL, '2023-07-22', 2, '2023-07-10 11:02:11', NULL, '2023-07-10 16:02:06', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (4, 15, 2, 1, NULL, 13, NULL, '2023-07-19', 2, '2023-07-10 11:02:39', NULL, '2023-07-10 16:02:33', NULL, NULL, 0);
INSERT INTO `tx_produk_stok` VALUES (5, 29, 1, 1, NULL, 0, NULL, '2023-07-31', 1, '2023-07-26 10:11:28', NULL, '2023-07-31 16:54:45', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_retur
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tx_retur_detail
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
