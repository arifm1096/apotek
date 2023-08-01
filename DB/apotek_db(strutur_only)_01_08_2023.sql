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

 Date: 01/08/2023 23:02:13
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for tm_kadaluarsa
-- ----------------------------
DROP TABLE IF EXISTS `tm_kadaluarsa`;
CREATE TABLE `tm_kadaluarsa`  (
  `id_kadaluarsa` int NOT NULL AUTO_INCREMENT,
  `nama_kadaluarsa` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kadaluarsa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tx_persediaan
-- ----------------------------
DROP TABLE IF EXISTS `tx_persediaan`;
CREATE TABLE `tx_persediaan`  (
  `id_pesediaan` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_pesediaan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1945 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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

SET FOREIGN_KEY_CHECKS = 1;
