# Database — Hybrid MySQL (XAMPP) & LocalStorage (PWA Offline)

Aplikasi Pra-Produksi Film & Televisi **ShotQu** menggunakan arsitektur penyimpanan ganda (*Hybrid Database Architecture*):
1. **Lokal Browser (LocalStorage / PWA Cache)**: Menjamin aplikasi dapat digunakan 100% offline saat syuting di lokasi tanpa jaringan internet.
2. **Server XAMPP (MariaDB / MySQL & PHP)**: Menyimpan master data proyek terpusat, mendukung multi-perangkat (komputer guru & smartphone siswa), multi-proyek, dan cadangan data aman.

---

## 1. Koneksi XAMPP (MariaDB / MySQL)

- **Host**: `localhost:3306`
- **Database**: `shotqu_db`
- **User Default**: `root`
- **Password**: *(kosong / bawaan XAMPP)*
- **Junction Apache**: `F:\xampp\htdocs\shotlist` & `F:\xampp\htdocs\shotqu`
- **Alamat Akses**:
  - Desktop: `http://localhost/shotlist` atau `http://localhost/shotqu`
  - phpMyAdmin: `http://localhost/phpmyadmin` (Database: `shotqu_db`)

---

## 2. Struktur Tabel MySQL (`shotqu_db`)

### A. Tabel `shotqu_projects` (Data Naskah & Pra-Produksi)
Menyimpan seluruh data perancangan film mulai dari Tahap 1 hingga Tahap 5:
- `id` (VARCHAR(64) PRIMARY KEY): ID unik proyek (misal `proj_xyz123`).
- `title` (VARCHAR(255)): Judul film / proyek karya.
- `author` (VARCHAR(100)): Nama sutradara / produser / siswa.
- `guru_acc_status` (VARCHAR(20)): Status validasi guru (`none`, `acc`, `revisi`).
- `guru_acc_date` (VARCHAR(50)): Tanggal persetujuan ACC guru.
- `guru_catatan` (TEXT): Catatan revisi atau arahan dari guru pembimbing.
- `data` (LONGTEXT): Objek JSON lengkap seluruh lembar kerja (ide, kru, alat, sinopsis, breakdown, shotlist, artistik, talents).
- `created_at` (DATETIME): Waktu pertama kali dibuat.
- `updated_at` (DATETIME): Waktu pembaruan terakhir.

### B. Tabel `shotqu_settings` (Identitas Sekolah & Kop Surat)
- `setting_key` (VARCHAR(64) PRIMARY KEY): Kunci konfigurasi (misal `kop_config`).
- `setting_value` (LONGTEXT): Nilai JSON (logo base64, nama sekolah, alamat, kontak).
- `updated_at` (DATETIME): Waktu pembaruan terakhir.

### C. Tabel `shotqu_users` (Autentikasi Guru & Administrator)
- `id` (INT AUTO_INCREMENT PRIMARY KEY).
- `username` (VARCHAR(50) UNIQUE): Akun login (`admin`, `guru`).
- `password` (VARCHAR(255)): Kata sandi (bawaan: `smk2026`).
- `role` (VARCHAR(20)): Peran akun (`admin`).
- `display_name` (VARCHAR(100)): Nama lengkap guru pembimbing.
- `created_at` (DATETIME).

---

## 3. Endpoints REST API PHP (`api/`)

Kompatibel dengan PHP 5.5+ hingga PHP 8.x:
- `GET  api/status.php` : Mengecek status aktif server Apache & MySQL.
- `GET  api/projects.php` : Mengambil daftar seluruh proyek (`?id=...` untuk 1 proyek spesifik).
- `POST api/projects.php` : Menyimpan / memperbarui proyek (auto-sync).
- `DELETE api/projects.php?id=...` : Menghapus proyek dari database.
- `GET  api/settings.php?key=...` : Mengambil pengaturan kop surat resmi.
- `POST api/settings.php` : Menyimpan pengaturan kop surat resmi.
- `POST api/auth.php` : Autentikasi akun guru pembimbing / admin.

---

## 4. Mekanisme Sinkronisasi Otomatis

1. **Auto-Save Ganda**: Setiap perubahan input disimpan instan ke LocalStorage browser (debounce 250ms), lalu dikirim ke MySQL XAMPP (debounce 700ms).
2. **Indikator Simpan**:
   - `● Tersimpan (MySQL)`: Data aman di database server XAMPP & lokal browser.
   - `● Tersimpan (Lokal)`: Berjalan dalam mode offline / standalone.
3. **Multi-Proyek (Bank Proyek)**: Pengguna dan guru dapat membuat banyak naskah film berbeda, berganti proyek lewat dialog **Bank Proyek**, serta mengesahkan naskah siswa secara terpusat.
