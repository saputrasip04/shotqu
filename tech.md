# Tech Stack & Arsitektur Sistem

## Stack Teknologi
- **Frontend**: HTML5 Semantik, CSS3 Vanilla (Responsive Cinema Modern UI), JavaScript Vanilla (ES6+), Tanpa Build Step / Bundler.
- **Backend & Database Server**: XAMPP (Apache 2.4, PHP 5.5+, MariaDB / MySQL 3306).
- **Penyimpanan Data**: Hybrid (LocalStorage Browser + MySQL `shotqu_db`).
- **PWA (Progressive Web App)**: `manifest.json`, Service Worker `sw.js` (Cache-first dengan network-bypass khusus `/api/`).
- **Dokumen & Cetak**: `@media print` CSS A4 Landscape / Portrait hemat tinta & print-ready.

---

## Struktur Berkas
```
├── api/
│   ├── db.php           # Koneksi PDO MySQL & migrasi tabel otomatis
│   ├── status.php       # Health-check status server XAMPP
│   ├── projects.php     # REST API CRUD naskah & proyek film
│   ├── settings.php     # API pengaturan identitas sekolah & kop surat
│   └── auth.php         # API autentikasi akun guru pembimbing / admin
├── database.sql         # Skema database MySQL cadangan (phpMyAdmin)
├── index.html           # Single Page Application (SPA), State S, 6 Tahap Kerja
├── login.html           # Portal login guru pembimbing & admin sekolah
├── landing.html         # Halaman beranda presentasi kurikulum perfilman
├── buka-di-xampp.bat    # Peluncur otomatis ShotQu via XAMPP
├── buka-di-laptop.bat   # Shortcut peluncur cepat desktop
├── start-server.bat     # Peluncur alternatif server PowerShell port 8080
├── sw.js                # Service Worker PWA offline
├── manifest.json        # Metadata instalasi aplikasi Android & Desktop
├── icon.svg & logo.png  # Identitas visual & aset ikon
├── tech.md              # Dokumentasi arsitektur teknologi
├── database.md          # Dokumentasi skema basis data
└── progress.md          # Log status dan riwayat pengembangan
```

---

## Cara Menjalankan dengan XAMPP
1. Buka **XAMPP Control Panel** di PC Anda.
2. Pastikan modul **Apache** dan **MySQL** berstatus **Running**.
3. Akses aplikasi:
   - **Komputer/Laptop**: `http://localhost/shotlist` atau `http://localhost/shotqu`
   - **Login Guru / Admin**: `http://localhost/shotlist/login.html`
   - **phpMyAdmin**: `http://localhost/phpmyadmin` (Database: `shotqu_db`)
   - **HP Android / Tablet**: `http://<IP-PC>/shotlist` (dalam jaringan Wi-Fi lokal yang sama).
4. Atau cukup klik ganda berkas `buka-di-xampp.bat` di folder proyek.
