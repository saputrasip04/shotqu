-- ========================================================
-- Database Schema: shotqu_db
-- Aplikasi Pra-Produksi Film & Televisi ShotQu
-- SMKN Ihya Ulummudin Singojuruh - XAMPP (MySQL / MariaDB)
-- ========================================================

CREATE DATABASE IF NOT EXISTS `shotqu_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shotqu_db`;

-- 1. Tabel Proyek Pra-Produksi (Menyimpan seluruh babak kerja naskah, shotlist, artistik, kru, ide)
CREATE TABLE IF NOT EXISTS `shotqu_projects` (
    `id` VARCHAR(64) NOT NULL PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `author` VARCHAR(100) DEFAULT '',
    `guru_acc_status` VARCHAR(20) DEFAULT 'none',
    `guru_acc_date` VARCHAR(50) DEFAULT '',
    `guru_catatan` TEXT,
    `data` LONGTEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    INDEX (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 2. Tabel Pengaturan Sistem & Identitas Sekolah
CREATE TABLE IF NOT EXISTS `shotqu_settings` (
    `setting_key` VARCHAR(64) NOT NULL PRIMARY KEY,
    `setting_value` LONGTEXT NOT NULL,
    `updated_at` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 3. Tabel Akun Guru & Administrator
CREATE TABLE IF NOT EXISTS `shotqu_users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `role` VARCHAR(20) NOT NULL DEFAULT 'admin',
    `display_name` VARCHAR(100) NOT NULL,
    `created_at` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data Akun Default
INSERT IGNORE INTO `shotqu_users` (`id`, `username`, `password`, `role`, `display_name`, `created_at`) 
VALUES 
(1, 'admin', 'smk2026', 'admin', 'Drs. H. Ahmad Harun (Guru Pembimbing)', NOW()),
(2, 'guru', 'smk2026', 'admin', 'Guru Pembimbing Broadcasting', NOW());
