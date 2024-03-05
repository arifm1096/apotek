/*
 Navicat Premium Data Transfer

 Source Server         : SERVER 192.168.71.6
 Source Server Type    : MySQL
 Source Server Version : 100339
 Source Host           : 192.168.71.6:3306
 Source Schema         : apotek_db

 Target Server Type    : MySQL
 Target Server Version : 100339
 File Encoding         : 65001

 Date: 05/03/2024 16:13:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tm_akun
-- ----------------------------
DROP TABLE IF EXISTS `tm_akun`;
CREATE TABLE `tm_akun`  (
  `id_akun` int(11) NOT NULL AUTO_INCREMENT,
  `kd_akun` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_akun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jenis_transaksi` int(11) NULL DEFAULT NULL,
  `aktif` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_dokter
-- ----------------------------
DROP TABLE IF EXISTS `tm_dokter`;
CREATE TABLE `tm_dokter`  (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `kode_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_dokter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `klinik_rs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_print` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_dokter`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_hak_akses12
-- ----------------------------
DROP TABLE IF EXISTS `tm_hak_akses12`;
CREATE TABLE `tm_hak_akses12`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_jenis_pesanan
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_pesanan`;
CREATE TABLE `tm_jenis_pesanan`  (
  `id_jenis_pesanan` int(11) NOT NULL,
  `nama_jenis_pesanan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_pesanan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_jenis_transaksi_akun
-- ----------------------------
DROP TABLE IF EXISTS `tm_jenis_transaksi_akun`;
CREATE TABLE `tm_jenis_transaksi_akun`  (
  `id_jenis_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_transaksi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_transaksi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_kadaluarsa
-- ----------------------------
DROP TABLE IF EXISTS `tm_kadaluarsa`;
CREATE TABLE `tm_kadaluarsa`  (
  `id_kadaluarsa` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kadaluarsa` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kadaluarsa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tm_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `tm_pembayaran`;
CREATE TABLE `tm_pembayaran`  (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pembayaran` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_satus_stok
-- ----------------------------
DROP TABLE IF EXISTS `tm_satus_stok`;
CREATE TABLE `tm_satus_stok`  (
  `id_status_stok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_in_out` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_satus_stok_lama
-- ----------------------------
DROP TABLE IF EXISTS `tm_satus_stok_lama`;
CREATE TABLE `tm_satus_stok_lama`  (
  `id_status_stok` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_shif
-- ----------------------------
DROP TABLE IF EXISTS `tm_shif`;
CREATE TABLE `tm_shif`  (
  `id_shif` int(11) NOT NULL AUTO_INCREMENT,
  `nama_shif` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jam_masuk` time(0) NULL DEFAULT NULL,
  `status_masuk` int(11) NULL DEFAULT NULL,
  `jam_pulang` time(0) NULL DEFAULT NULL,
  `status_pulang` int(11) NULL DEFAULT NULL,
  `aktif` int(11) NOT NULL DEFAULT 1,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_shif`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_status_konsinyasi
-- ----------------------------
DROP TABLE IF EXISTS `tm_status_konsinyasi`;
CREATE TABLE `tm_status_konsinyasi`  (
  `id_status_konsinyasi` int(11) NOT NULL,
  `nama_status_konsinyasi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_konsinyasi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_status_resep
-- ----------------------------
DROP TABLE IF EXISTS `tm_status_resep`;
CREATE TABLE `tm_status_resep`  (
  `id_status_resep` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status_resep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status_resep`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tm_supplier`;
CREATE TABLE `tm_supplier`  (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_supplier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `logo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `ppn` int(11) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12900 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_jual_tolak
-- ----------------------------
DROP TABLE IF EXISTS `tx_jual_tolak`;
CREATE TABLE `tx_jual_tolak`  (
  `id_jual_tolak` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NULL DEFAULT NULL,
  `nama_produk` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `satuan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` int(11) NULL DEFAULT NULL,
  `harga_jual` int(11) NULL DEFAULT NULL,
  `status_produk` int(11) NULL DEFAULT NULL,
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
-- Table structure for tx_kasir
-- ----------------------------
DROP TABLE IF EXISTS `tx_kasir`;
CREATE TABLE `tx_kasir`  (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `id_shif` int(11) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 5383 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_konsinyasi_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_konsinyasi_detail`;
CREATE TABLE `tx_konsinyasi_detail`  (
  `id_konsinyasi_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsinyasi` int(11) NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `kode_ksu` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_exp` date NULL DEFAULT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `jumlah_konsinyasi` int(11) NULL DEFAULT NULL,
  `id_satuan` int(11) NULL DEFAULT NULL,
  `harga_beli` int(11) NULL DEFAULT NULL,
  `harga_pokok` int(11) NULL DEFAULT NULL,
  `ppn` float(15, 2) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_selesai` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_konsinyasi_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_log_shif
-- ----------------------------
DROP TABLE IF EXISTS `tx_log_shif`;
CREATE TABLE `tx_log_shif`  (
  `id_log_shif` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NULL DEFAULT NULL,
  `id_shif` int(11) NULL DEFAULT NULL,
  `tgl_masuk` datetime(0) NULL DEFAULT NULL,
  `close` int(11) NOT NULL DEFAULT 0,
  `tgl_close` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_log_shif`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_persediaan
-- ----------------------------
DROP TABLE IF EXISTS `tx_persediaan`;
CREATE TABLE `tx_persediaan`  (
  `id_pesediaan` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_pesediaan`) USING BTREE
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
  `margin` float(25, 2) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2579 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1259 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `status_op_ed` int(11) NOT NULL DEFAULT 0,
  `ket_op_ed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_stok_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12445 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_racik
-- ----------------------------
DROP TABLE IF EXISTS `tx_racik`;
CREATE TABLE `tx_racik`  (
  `id_racik` int(11) NOT NULL AUTO_INCREMENT,
  `nama_racikan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_racikan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `aktif` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_racik`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_racik_obat
-- ----------------------------
DROP TABLE IF EXISTS `tx_racik_obat`;
CREATE TABLE `tx_racik_obat`  (
  `id_racik_obat` int(11) NOT NULL AUTO_INCREMENT,
  `id_racik` int(11) NULL DEFAULT NULL,
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
  PRIMARY KEY (`id_racik_obat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_remik
-- ----------------------------
DROP TABLE IF EXISTS `tx_remik`;
CREATE TABLE `tx_remik`  (
  `id_remik` int(11) NOT NULL AUTO_INCREMENT,
  `kode_remik` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_pelanggan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tekanan_darah` float NULL DEFAULT NULL,
  `tekanan_nafas` float NULL DEFAULT NULL,
  `denyut_nadi` float NULL DEFAULT NULL,
  `suhu_tubuh` float NULL DEFAULT NULL,
  `kadar_oksigen` float NULL DEFAULT NULL,
  `skala_nyeri` float NULL DEFAULT NULL,
  `lokasi_nyeri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `alergi_obat` int(11) NULL DEFAULT NULL,
  `alergi_makanan` int(11) NULL DEFAULT NULL,
  `alergi_suhu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_remik`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_resep
-- ----------------------------
DROP TABLE IF EXISTS `tx_resep`;
CREATE TABLE `tx_resep`  (
  `id_resep` int(11) NOT NULL AUTO_INCREMENT,
  `kode_resep` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_dokter` int(11) NULL DEFAULT NULL,
  `id_pelanggan` int(11) NULL DEFAULT NULL,
  `id_shif` int(11) NULL DEFAULT NULL,
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
  `status` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_resep`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tx_resep_detail
-- ----------------------------
DROP TABLE IF EXISTS `tx_resep_detail`;
CREATE TABLE `tx_resep_detail`  (
  `id_resep_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_resep` int(11) NULL DEFAULT NULL,
  `id_produk` int(11) NULL DEFAULT NULL,
  `no_nota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
  `status` int(11) NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_resep_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for tx_trans_keu
-- ----------------------------
DROP TABLE IF EXISTS `tx_trans_keu`;
CREATE TABLE `tx_trans_keu`  (
  `id_trans_keu` int(11) NOT NULL AUTO_INCREMENT,
  `id_akun` int(11) NULL DEFAULT NULL,
  `nominal` bigint(20) NULL DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tgl_trans` date NULL DEFAULT NULL,
  `insert_by` int(11) NULL DEFAULT NULL,
  `insert_date` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_by` int(11) NULL DEFAULT NULL,
  `delete_date` datetime(0) NULL DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_trans_keu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
