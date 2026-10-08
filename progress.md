# ShotQu — Progress & Status Proyek

Terakhir diperbarui: 2026-10-08T10:30:00+07:00 (v2.7.0)

## Ringkasan Proyek
Aplikasi Pra-Produksi Film & Televisi **ShotQu** untuk Program Keahlian Broadcasting & Perfilman SMKN Ihya Ulummudin Singojuruh:
- **Format Baku 6 Tahapan Pra-Produksi**:
  1. **💡 Ide, Konsep & Pembagian Kru Syuting** (Fondasi awal cerita, tema, visi sutradara, sasaran penonton, pembagian kru, dan rencana peralatan).
  2. **📝 Sinopsis Film** (Logline, premis filosofis, profil karakter utama, dan alur dramatis 3 babak).
  3. **📑 Breakdown Naskah** (Pembedahan skenario per adegan: nomor scene, cast, lokasi INT./EXT., dan kontinuitas).
  4. **🎬 Shotlist** (Rencana teknis kamera DoP & Sutradara: Type, Movement, Angle, Durasi, Audio, dan kalkulator durasi otomatis).
  5. **🎨 Breakdown Tata Artistik** (Perencanaan set dressing, properti hand/set props, kostum/wardrobe, dan tata rias/makeup).
  6. **📖 Production Book** (Master Dokumen Eksekutif Pra-Produksi: Cover resmi, Lembar Pengesahan Terpadu 4 tanda tangan, Resume Spesifikasi, dan kompilasi seluruh babak).
- **Progressive Web App (PWA) & XAMPP Server**: Terintegrasi langsung dengan XAMPP (Apache, PHP, dan MariaDB/MySQL `shotqu_db`), 100% offline-ready di smartphone Android & komputer, auto-save ganda (MySQL & LocalStorage), bank proyek film, serta ekspor cetak PDF A4 Lanskap resmi hemat tinta.

---

## Pembaruan Terkini (v2.7.0): Integrasi Penuh dengan Server Lokal XAMPP (Apache, PHP & MariaDB/MySQL)

Sesuai instruksi: *"aplikasi ini koneksikan dengan xampp yang ada di PC saya"*:

### 1. 🔗 Junction Direktori Apache XAMPP
- Direktori aplikasi `F:\APPPSPT\shotlist` telah dihubungkan langsung ke dalam web root XAMPP (`F:\xampp\htdocs\`) melalui Windows Directory Junction:
  - `F:\xampp\htdocs\shotlist` ➔ `F:\APPPSPT\shotlist`
  - `F:\xampp\htdocs\shotqu` ➔ `F:\APPPSPT\shotlist`
- Aplikasi dapat langsung diakses melalui server Apache XAMPP di:
  - Komputer / Laptop: `http://localhost/shotlist` atau `http://localhost/shotqu`
  - Perangkat HP / Tablet: `http://<IP-PC>/shotlist` (dalam jaringan Wi-Fi lokal yang sama).

### 2. 🗄️ Database Terpusat MariaDB / MySQL (`shotqu_db`)
- Basis data baru `shotqu_db` telah dibuat otomatis di MariaDB/MySQL XAMPP (port 3306).
- Skema tabel terstruktur:
  1. `shotqu_projects`: Menyimpan seluruh lembar kerja pra-produksi (Tahap 1–5), status ACC guru, catatan revisi, dan metadata pembaruan.
  2. `shotqu_settings`: Menyimpan konfigurasi kop surat resmi dan logo instansi sekolah.
  3. `shotqu_users`: Menyimpan kredensial autentikasi akun Guru Pembimbing dan Administrator.
- Skema cadangan tersedia di berkas `database.sql` untuk kebutuhan backup atau impor manual di phpMyAdmin (`http://localhost/phpmyadmin`).

### 3. ⚡ REST API Backend PHP (`api/`)
- Modul backend tanpa framework, kompatibel dengan PHP 5.5+ hingga PHP 8.x:
  - `api/db.php`: Koneksi aman PDO MySQL dengan *auto-migration* tabel otomatis.
  - `api/status.php`: Health-check status koneksi Apache & database MySQL.
  - `api/projects.php`: CRUD naskah dan lembar kerja proyek film (*upsert, list, load, delete*).
  - `api/settings.php`: Sinkronisasi logo dan identitas sekolah.
  - `api/auth.php`: Autentikasi guru pembimbing langsung ke tabel database.

### 4. 🔄 Sinkronisasi Ganda & Bank Proyek (Frontend UI)
- **Indikator Koneksi**: Badge status XAMPP pada header aplikasi (`🟢 XAMPP MySQL` atau `🟡 Mode Lokal`).
- **Penyimpanan Ganda (Hybrid)**: Setiap perubahan disimpan secara otomatis ke browser (LocalStorage) dan database MySQL secara bersamaan.
- **Bank Proyek Film**: Fitur multi-proyek untuk memuat, menyimpan sebagai proyek baru, atau mengelola naskah-naskah film siswa langsung dari database XAMPP.
- **Peluncur Cepat**: Disediakan berkas `buka-di-xampp.bat` dan `buka-di-laptop.bat` untuk membuka aplikasi secara instan.

---

## Pembaruan Terkini: Penambahan Tahapan "Ide & Konsep" Serta "Pembagian Kru Syuting"

Sesuai instruksi: *"tambahkan tahapan sebelum pembuatan sinopsis, yaitu ide dan konsep. didalam menu ide dan konsep juga ada pembagian kru syuting"*:

### 1. 💡 Modul Baru: Tahap 1 • Ide & Konsep Cerita Film
- Ditempatkan sebagai **Tahap 1** sebelum pembuatan Sinopsis (`activeTab === 'ide'` atau `?tab=ide`).
- **Top Banner Resmi**:
  - Badge: `Tahap 1 • Fondasi Ide, Konsep & Kru Syuting`
  - 4 Pilar Utama Edukasi:
    - 💡 **Gagasan & Tema Pokok**: Pesan filosofis orisinal dan latar belakang cerita.
    - 🎯 **Visi Sutradara & Visual**: *Director's statement & treatment* (pencahayaan, komposisi frame, tone warna).
    - 👥 **Target Audiens & Format**: Segmen demografis penonton sasaran, rasio 16:9, dan estimasi durasi.
    - 🎬 **Pembagian Kru Syuting**: Struktur organisasi kerja per departemen produksi.
- **Formulir Interaktif Bagian A (Perumusan Ide & Konsep)**:
  - Judul Film / Proyek (`title`)
  - Tema Sentral & Filosofi Cerita (`ide_tema`)
  - Genre, Format & Estimasi Durasi (`ide_genre`)
  - Target Audiens / Sasaran Penonton (`ide_audiens`)
  - Gagasan / Ide Pokok Cerita / Premis Utama (`ide_gagasan`)
  - Visi Sutradara & Konsep Visual (*Director's Treatment*) (`ide_statement`)

---

### 2. 👥 Modul Khusus: Pembagian Kru Syuting (*Production Crew Division*)
Diintegrasikan langsung ke dalam lembar kerja **Ide & Konsep**, membagi tanggung jawab personil ke dalam 6 divisi standar industri perfilman & uji kompetensi broadcasting:
1. **💼 Divisi Manajemen & Produksi**:
   - **Produser (Producer)**: Anggaran, perizinan lokasi, logistik, konsumsi (`kru_produser`).
   - **Asisten Sutradara / Astrada (1st AD)**: Manajemen set, call sheet jadwal syuting, disiplin aktor (`kru_astrada`).
   - **Pencatat Adegan (Clapper / Script Continuity)**: Membunyikan clapper board, mencatat take/scene/durasi, log book kontinuitas (`kru_clapper`).
2. **🎬 Divisi Penyutradaraan & Naskah**:
   - **Sutradara (Film Director)**: Pemegang visi kreatif, pengarah akting pemain & visual kamera (`kru_sutradara`).
   - **Penulis Naskah (Scriptwriter)**: Riset ide, penyusunan dialog skenario & sinopsis (`kru_penulis`).
3. **🎥 Divisi Kamera & Pencahayaan (Camera & Lighting)**:
   - **Penata Kamera / DoP (Director of Photography)**: Komposisi framing, angle, lensa, tata lampu kamera (`kru_dop`).
   - **Asisten Kamera / Focus Puller / Gaffer**: Menjaga fokus lensa, baterai/media storage, penataan lampu set (`kru_ast_kamera`).
4. **🎙️ Divisi Tata Suara (Sound Recordist)**:
   - **Penata Suara (Boom Operator & Audio Recordist)**: Perekaman audio dialog, boom pole mic, wireless clip-on (`kru_sound`).
5. **🎨 Divisi Tata Artistik & Kostum**:
   - **Penata Artistik (Art Director)**: Set dressing, dekorasi lokasi, properti hand props pemain (`kru_art`).
   - **Penata Busana & Rias (Wardrobe & Makeup)**: Kostum busana karakter per adegan, rias wajah & rambut (`kru_wardrobe_makeup`).
6. **💻 Divisi Pasca-Produksi & Logistik Teknis**:
   - **Editor Film & Colorist**: Editing video (rough & fine cut), audio sync, color grading (`kru_editor`).
   - **Catatan Khusus Kru / Daftar Alat Syuting**: Daftar kamera, lensa, gimbal, mic, lampu, transportasi operasional (`kru_catatan`).

---

### 3. 📋 Contoh Studi Kasus Resmi: "Lentera Singojuruh"
- Disediakan tombol **`📋 Muat Contoh "Lentera Singojuruh"`** (`loadSampleIde()`) untuk langsung mengisi data contoh realistis karya siswa broadcasting SMKN Ihya Ulummudin Singojuruh.
- Tombol **`📄 Salin Teks Ide & Kru`** (`copyIdeText()`) untuk menyalin format teks siap kirim ke WhatsApp kru atau printout tim.
- Tombol **`🗑️ Kosongkan`** (`clearIde()`) untuk reset formulir.

---

### 4. 🔄 Penyelarasan Alur 5 Tahapan Pra-Produksi
- **[index.html](file:///f:/APPPSPT/shotlist/index.html)**:
  - Beranda menampilkan 5 Kartu Alur Kerja Pra-Produksi:
    1. **Tahap 1**: 💡 Ide, Konsep & Kru (`goTab('ide')`)
    2. **Tahap 2**: 📝 Sinopsis (`goTab('sinopsis')`)
    3. **Tahap 3**: 📑 Breakdown Naskah (`goTab('naskah')`)
    4. **Tahap 4**: 🎬 Shotlist (9 Kolom) (`goTab('edit')`)
    5. **Tahap 5**: 🎨 Breakdown Tata Artistik (`goTab('artistik')`)
  - Navigasi antar-tab (tombol "Kembali" dan "Lanjut") diselaraskan berurutan dari Tahap 1 hingga Tahap 5.
  - Startup URL query parameter mengenali `?tab=ide`.
- **[landing.html](file:///f:/APPPSPT/shotlist/landing.html)**:
  - Header nav, hero summary ("5 Pilar Pra-Produksi"), 5 menu card grid, dan footer links disinkronkan.
- **Penyembunyian Menu Atas Header Tetap Berlaku**:
  - Tab navigasi atas header (`.nav-tabs`) tetap disembunyikan (`display: none !important`), navigasi bersih berfokus pada kartu beranda dan tombol alur kerja in-page.

---

### 5. 📦 Pembaruan Cache Service Worker
- Versi cache Service Worker di [sw.js](file:///f:/APPPSPT/shotlist/sw.js) dinaikkan ke **`shotqu-v2.2.0`** agar modul baru langsung aktif di seluruh perangkat siswa dan guru.

---

## Pembaruan Terkini (v2.2.0): Rencana Alat Syuting, Tabel Dokumen Resmi & Cetak PDF di Setiap Menu

Sesuai instruksi:
1. *"pada menu Ide, Konsep & Pembagian Kru Syuting tambahkan rencana alat yang akan digunakan."*
2. *"pada setiap menu tambahkan feature tabel dan menu cetak pdf"*

### 1. 🛠️ Rencana Alat Syuting (*Equipment & Gear Planning*) pada Tahap 1
Ditambahkan sebagai **Bagian C: Rencana Peralatan Syuting (Equipment & Gear Plan)** pada lembar kerja Tahap 1 (`tab=ide`), terbagi ke dalam 6 divisi teknis broadcasting:
1. 📷 **Kamera & Optik**: Bodi kamera (DSLR/Mirrorless/Cinema), set lensa (prime/zoom), filter ND, memory card (SD/CFexpress), card reader (`alat_kamera`).
2. 🎙️ **Tata Suara (Audio Gear)**: Boom mic shotgun, boom pole, blimp windshield, wireless lavalier kit, field audio recorder, monitor headphone (`alat_audio`).
3. 💡 **Tata Cahaya (Lighting & Modifiers)**: Lampu LED continuous (COB key/fill), softbox/dome, reflector 5-in-1, c-stand, light stand, diffuser scrim (`alat_lighting`).
4. 🎬 **Rig, Grip & Stabilizer**: Tripod fluid head, slider, gimbal stabilizer 3-axis, shoulder rig, sandbag penyeimbang (`alat_grip`).
5. 🔋 **Power & Manajemen Daya**: Baterai cadangan kamera, baterai V-Mount, charger dock multi-slot, roll kabel extension tahan panas, powerbank monitor (`alat_power`).
6. 🚚 **Logistik, Support & K3**: Hardcase safety box pelindung alat, lens cleaning kit, clapper board akrilik, gaffer tape, p3k lapangan, payung lokasi (`alat_logistik`).

Data alat terintegrasi langsung dengan:
- Auto-save LocalStorage real-time (`data-k`).
- Fitur Muat Contoh resmi *"Lentera Singojuruh"*.
- Salin teks format WA kru syuting (`copyIdeText()`).
- Tampilan live di Tabel Dokumen Resmi Tahap 1.

---

### 2. 📊 Fitur Tabel Dokumen Resmi di Setiap Menu (Tahap 1 s/d Tahap 5)
Setiap tahapan pra-produksi kini dilengkapi **Tampilan Lembar Kerja Dokumen Resmi** (`.formal-sheet-wrapper`) dengan Kop Surat Sekolah Resmi, data terstruktur rapi, dan kolom tanda tangan pengesahan:
- **Kop Surat Resmi SMKN Ihya Ulummudin Singojuruh**:
  - Logo & Identitas Lembaga: PEMERINTAH PROVINSI JAWA TIMUR, DINAS PENDIDIKAN, SMK NEGERI IHYA ULUMMUDIN SINGOJURUH, Jurusan Broadcasting & Perfilman.
  - Alamat: Jl. KH. Abdullah Fatih No. 01 Singojuruh - Banyuwangi, NPSN: 20554477.
- **5 Lembar Kerja Tabel Dokumen**:
  1. **Tahap 1 (Ide, Konsep, Kru & Alat)**:
     - Tabel Identitas & Konsep Cerita (Judul, Tema, Genre/Durasi, Audiens, Gagasan Pokok, Director's Treatment).
     - Tabel Struktur Personil Kru Produksi (6 Divisi kerja).
     - Tabel Rencana Peralatan Syuting (6 Divisi alat teknis).
     - Tanda Tangan: Guru Pembimbing, Sutradara, Produser.
  2. **Tahap 2 (Sinopsis & Struktur 3 Babak)**:
     - Tabel Identitas Proyek & Premis Dramatis.
     - Tabel Profil Karakter Utama (Tokoh, Usia/Peran, Deskripsi & Karakter).
     - Tabel Struktur Alur Cerita Tiga Babak (Babak I Orientasi, Babak II Konflik/Klimaks, Babak III Resolusi).
     - Tanda Tangan: Guru Pembimbing, Sutradara, Penulis Naskah.
  3. **Tahap 3 (Breakdown Naskah Skenario)**:
     - Tabel Identitas Naskah & Lokasi INT/EXT.
     - Tabel Rincian Adegan (*Script Breakdown Sheet*): No. Scene, Setting Tempat/Waktu, Tokoh Terlibat, Ringkasan Aksi/Peristiwa, Estimasi Durasi, Estimasi Shot.
     - Baris Ringkasan Total Adegan, Total Durasi, dan Total Shot.
     - Tanda Tangan: Guru Pembimbing, Sutradara, Astrada / Script Continuity.
  4. **Tahap 4 (Shotlist 9 Kolom Standar Industri)**:
     - Tabel 9 Kolom Standar: No, Scene, Shot, Size/Type, Angle, Camera Movement, Visual Description, Audio/Dialog, Durasi.
     - Baris Ringkasan Total Shot & Total Durasi Menit:Detik.
     - Tanda Tangan: Guru Pembimbing, Sutradara, Penata Kamera (DoP).
  5. **Tahap 5 (Breakdown Tata Artistik)**:
     - Tabel Identitas Proyek & Konsep Visual Artistik.
     - Tabel 4 Pilar Departemen Artistik: Set Dressing/Dekorasi Lokasi, Properti Hand Props, Kostum/Wardrobe, dan Tata Rias/Makeup Karakter.
     - Tanda Tangan: Guru Pembimbing, Sutradara, Penata Artistik (Art Director).

---

### 3. 🖨️ Fitur & Menu Cetak PDF di Setiap Menu
- Di **setiap menu** disediakan tombol aksi cetak:
  - Tombol **`🖨️ Cetak PDF`** di Header Banner atas setiap tahapan.
  - Tombol **`🖨️ Cetak Lembar Ini (PDF/Print)`** tepat di atas tabel dokumen resmi.
  - Tombol **`🖨️ Cetak PDF Shotlist`** di dalam menu Editor Shotlist (Tahap 4) yang secara otomatis mengarahkan ke tampilan tabel 9 kolom sebelum membuka dialog cetak.
- **Dual-Mode `@media print` Hemat Tinta & Presisi A4**:
  - Formulir input interaktif, kartu editor gelap, tombol aksi, dan navigasi otomatis disembunyikan saat mencetak.
  - Hanya lembar kerja tabel formal berlatar putih bersih dengan garis tabel hitam tegas, teks hitam pekat, kop surat resmi, dan kolom tanda tangan yang dicetak.
  - Hasil cetak dijamin rapi, profesional, dan siap diarsip atau diserahkan ke guru penguji/pembimbing.

---

### 4. ✍️ Penyesuaian Teks Hero & Judul Hub (v2.2.1)
Sesuai arahan:
- Menghapus frasa **"5 Pilar"** pada kalimat deskripsi hero:
  *Menjadi*: `Media Pembelajaran Terintegrasi Pra-Produksi Film & Televisi Standar Industri:`
- Memindahkan rincian tahapan **`Ide & Konsep, Sinopsis, ...`** ke baris baru tepat setelah tanda titik dua (`:`).
- Menghapus angka **`5`** sebelum kata *Menu*, sehingga judul hub menjadi:
  **`Menu Utama Perencanaan Film`**.
- Versi Service Worker diperbarui ke **`shotqu-v2.2.1`** agar perubahan langsung tampil segar di browser.

---

### 5. ✍️ Pemisahan Baris Klausa "Siap Eksekusi..." (v2.2.2)
Sesuai arahan:
- Memindahkan frasa `— siap eksekusi di set lokasi syuting dan 100% offline.` ke baris baru tepat setelah `Breakdown Tata Artistik`.
- Menghindari kata "siap" menggantung di ujung baris kedua, menghasilkan tata letak 3 baris yang simetris dan rapi di semua resolusi layar:
  1. *Baris 1:* `Media Pembelajaran Terintegrasi Pra-Produksi Film & Televisi Standar Industri:`
  2. *Baris 2:* `Ide & Konsep, Sinopsis, Breakdown Naskah, Shotlist 9 Kolom, dan Breakdown Tata Artistik`
  3. *Baris 3:* `— siap eksekusi di set lokasi syuting dan 100% offline.`
- Cache Service Worker dinaikkan ke **`shotqu-v2.2.2`**.

---

## Pembaruan Terkini (v2.3.0): Tahap 6 • Production Book (Buku Produksi Lengkap)

Sesuai instruksi: *"buatkan tahap 6 yaitu book production, rekap jadi 1 mulai tahap 1-5 yang siap dicetak di PDF"*

### 1. 📖 Modul Baru: Tahap 6 • Production Book (Buku Produksi Master)
- Ditempatkan sebagai **Tahap 6** (`activeTab === 'book'` atau `?tab=book`).
- Berfungsi sebagai **Production Book** resmi perfilman standar industri & kurikulum kejuruan SMK, mengintegrasikan seluruh lembar kerja dari **Tahap 1 hingga Tahap 5** ke dalam satu berkas master yang tertata rapi, terpadu, dan siap dicetak ke PDF A4.

### 2. 📑 Struktur Dokumen Buku Produksi Resmi:
1. **Bagian 1: Sampul Depan Resmi (*Formal Production Cover Book*)**:
   - Border ganda formal standar dokumen industri perfilman & dinas pendidikan.
   - Logo resmi SMKN Ihya Ulummudin Singojuruh.
   - Identitas Lembaga & Konsentrasi Keahlian Broadcasting & Perfilman.
   - Judul Dokumen: **BUKU PRODUKSI FILM (PRODUCTION BOOK & SHOOTING MASTER PLAN)**.
   - Kotak Judul Karya Besar: Judul Film, Genre, Nuansa, Estimasi Durasi, dan Logline Cerita.
   - Identitas Tim Inti Produksi: Sutradara, Produser, DoP, Penulis Naskah, Penata Artistik, Penata Suara.
   - Tahun Ajaran: 2025/2026, Banyuwangi - Jawa Timur.
2. **Bagian 2: Lembar Pengesahan Terpadu (*Master Approval Sheet*)**:
   - Naskah verifikasi dan pengesahan resmi.
   - Matriks 6 Kolom Tanda Tangan:
     1. Sutradara (Film Director)
     2. Produser (Producer)
     3. Penata Kamera (Director of Photography)
     4. Penata Artistik (Art Director)
     5. Guru Pembimbing Praktik
     6. Kepala Program Keahlian Broadcasting & Perfilman
3. **Bagian 3: Resume Eksekutif & Spesifikasi Karya Film**:
   - Matriks rekapitulasi data: Total Durasi Aktual, Target Durasi, Total Scene, Total Shot, Rasio Aspek (16:9), Target Audiens.
   - Rekapitulasi Daftar Adegan (*Scene Directory*): Nomor Scene, Slugline/Lokasi, Deskripsi, Jumlah Shot, dan Durasi Scene.
4. **BAB I: Perumusan Ide, Konsep, Kru Syuting & Rencana Peralatan (Tahap 1)**:
   - Tabel 1.1: Identitas & Konsep Filosofis Cerita (Tema, Gagasan Pokok, Director's Treatment).
   - Tabel 1.2: Struktur Organisasi Kru Produksi (6 Divisi Kerja).
   - Tabel 1.3: Rencana Peralatan Syuting (6 Divisi Alat: Kamera, Audio, Lighting, Grip/Rig, Power, Logistik/K3).
5. **BAB II: Sinopsis Cerita, Profil Karakter & Struktur Tiga Babak (Tahap 2)**:
   - Tabel 2.1: Logline & Premis Filosofis.
   - Tabel 2.2: Profil Karakter & Penokohan Utama.
   - Tabel 2.3: Alur Tiga Babak (Babak 1 Beginning, Babak 2 Middle, Babak 3 Ending).
6. **BAB III: Script Breakdown Sheet Analisis Skenario Per Adegan (Tahap 3)**:
   - Tabel Script Breakdown Sheet Rinci (Scene, Slugline INT/EXT, Cast, Aksi Naratif, Shot, Durasi).
   - Rekapitulasi Total Scene, Total Shot, dan Total Durasi.
7. **BAB IV: Shotlist 9 Kolom Standar Industri (Tahap 4)**:
   - Tabel 9 Kolom Panduan Sutradara & DoP: No, Scene, Shot, Size/Type, Movement, Angle, Visual Description, Audio, Durasi Detik.
   - Baris Total Rencana Shot & Total Durasi Menit:Detik.
8. **BAB V: Breakdown Tata Artistik & Desain Produksi (Tahap 5)**:
   - Tabel 5.1: Konsep Visual & Nuansa Ruang (Mood).
   - Tabel 5.2: 4 Pilar Kebutuhan Departemen Artistik (Set Dressing, Properti Hand Props, Busana/Wardrobe, Rias/Makeup Karakter).

### 3. 🖨️ Optimalisasi Cetak PDF Multihalaman (*Page Break Engine*):
- Pengaturan CSS `@media print`:
  - `.book-cover-page`: Menghasilkan sampul depan ukuran penuh satu halaman A4 (`min-height: 92vh; page-break-after: always !important; break-after: page !important`).
  - `.book-chapter`: Setiap Bab otomatis dimulai pada lembar kertas baru (`page-break-before: always !important; break-before: page !important`).
  - Tombol-tombol navigasi layar, header UI gelap, dan bilah tombol otomatis disembunyikan.
  - Tabel dan teks dicetak dengan garis hitam tegas dan latar putih bersih hemat tinta.

### 4. 🔄 Integrasi Alur Kerja Antar-Menu:
- Tombol **`📖 Lanjut ke Tahap 6: Production Book ➔`** di bagian bawah Tahap 5 Tata Artistik.
- Kartu ke-6 **`Production Book`** di Beranda Hub ([index.html](file:///f:/APPPSPT/shotlist/index.html)) dan Landing Page ([landing.html](file:///f:/APPPSPT/shotlist/landing.html)).
- Link navigasi di header nav dan footer.
- Bilah navigasi lompat bab (*Quick Chapter Jump*) di bagian atas lembar kerja untuk akses instan ke Sampul, Pengesahan, Resume, dan Bab 1-5.
- Versi Service Worker dinaikkan ke **`shotqu-v2.3.0`**.

---

## 🎨 Perbaikan Tampilan & Penataan 6 Menu Utama Pra-Produksi (v2.3.1)

### 1. 📐 Masalah yang Diperbaiki:
- **Ketidakseimbangan Grid (4 di atas, 2 di bawah):** Sebelumnya container `.four-menus-grid` menggunakan `repeat(auto-fit, minmax(230px, 1fr))` sehingga pada resolusi layar laptop/desktop (1100px - 1400px), kartu Tahap 1 s/d 4 berada di baris pertama dan hanya Tahap 5 & 6 di baris kedua dengan **ruang kosong/bolong besar di sisi kanan**.

### 2. ✨ Solusi Tata Letak Simetris & Responsif:
- **Desktop/Laptop (≥ 1025px):** Menggunakan `grid-template-columns: repeat(3, 1fr)` sehingga tercipta proporsi **3 Kolom × 2 Baris** yang simetris, seimbang, dan kokoh:
  - **Baris 1 (Fase Konsep & Cerita):** Tahap 1 (Ide, Kru & Alat), Tahap 2 (Sinopsis Cerita), Tahap 3 (Breakdown Naskah).
  - **Baris 2 (Fase Teknis & Master Rekapitulasi):** Tahap 4 (Shotlist 9 Kolom), Tahap 5 (Breakdown Tata Artistik), Tahap 6 (Production Book).
- **Tablet (641px - 1024px):** `repeat(2, 1fr)` (3 baris rapi berisi masing-masing 2 kartu).
- **Mobile (≤ 640px):** `1fr` (tumpukan 1 kolom vertikal yang nyaman diakses via ponsel).

### 3. 🌟 Peningkatan Estetika & Micro-Interactions (WOW Factor):
- **Tinggi Seragam & Rata:** `.menu-card` menggunakan `min-height: 320px`, layout `display: flex; flex-direction: column; justify-content: space-between`, dan `.menu-desc { flex: 1; }` sehingga semua tombol footer dan panah aksi di baris kartu selalu **sejajar presisi secara horizontal**.
- **Top Accent Line Per Departemen:** Garis aksen berpendar halus 3px di bagian atas kartu yang menyala saat di-hover:
  - 💡 **Tahap 1:** Amber (`#f59e0b`)
  - 📝 **Tahap 2:** Sky Blue (`#38bdf8`)
  - 📑 **Tahap 3:** Purple (`#c084fc`)
  - 🎬 **Tahap 4:** Gold Accent (`#f59e0b` / `#eab308`)
  - 🎨 **Tahap 5:** Emerald Green (`#34d399`)
  - 📖 **Tahap 6:** Indigo/Sapphire Multi-gradient (`#38bdf8` -> `#818cf8` -> `#eab308`)
- **Icon Squircles Modern:** Emoji di dalam kotak squircle 48×48px dengan background lembut dan border translusen, membesar halus (`scale(1.14)`) saat kartu disentuh/di-hover.
- **Badge Tahap Terstruktur:** Format konsisten `Tahap X • [Kategori]`:
  - `Tahap 1 • Konsep & Kru`
  - `Tahap 2 • Cerita`
  - `Tahap 3 • Skenario`
  - `Tahap 4 • Teknis Kamera`
  - `Tahap 5 • Tata Artistik`
  - `Tahap 6 • Master Book`
- **Nomor Monospaced Elegan:** Angka watermark `01` s/d `06` berfont geometris monospaced di sudut kanan atas.
- **Action Strip Footer:** Tombol footer terisolasi rapi dengan background pill subtle, teks bertema warna departemen, dan panah geser mikro (`menu-arrow: translateX(4px)`).
- **Tata Letak Ikon & Judul 1 Baris (.menu-title-row):** Ikon squircle dan judul kartu disatukan dalam satu baris horizontal (`display: flex; align-items: center; gap: 0.85rem`) sehingga lebih kompak, proporsional, dan menghilangkan ruang kosong di sisi kanan ikon.
- **Penggantian Istilah:** Seluruh istilah *"Production Bible"* diganti menjadi *"Production Book"*.
- **Sinkronisasi File:** Diterapkan identik di [index.html](file:///f:/APPPSPT/shotlist/index.html) dan [landing.html](file:///f:/APPPSPT/shotlist/landing.html).
- **Penambahan Copyright Footer:** Menambahkan teks *"Copyright © 2026 Saputra Indra Purnama"* pada bagian footer aplikasi dan landing page.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.3.4`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 🏛️ Pembaruan Kop Surat Resmi Standar Sekolah (v2.3.5)

### 1. 🖼️ Referensi & Format Baku Baru:
Kop surat resmi di seluruh lembar kerja cetak PDF dan Production Book diperbarui 100% mengikuti format instansi resmi sesuai gambar screenshot:
- **Logo Sekolah (Kiri):** Logo resmi lingkaran Broadcasting & Perfilman SMKN Ihya Ulummudin Singojuruh (`logo.png`).
- **Teks Header (Tengah, Rata Tengah / Centered Simetris):**
  - **Baris 1:** `SEKOLAH MENENGAH KEJURUAN NEGERI` (Bold tebal, Uppercase)
  - **Baris 2:** `IHYA ULUMMUDIN SINGOJURUH BANYUWANGI` (Extra bold, Uppercase)
  - **Baris 3:** `PROGRAM KEAHLIAN BROADCASTING DAN PERFILMAN` (Bold, Uppercase)
  - **Baris 4:** `KONSENTRASI KEAHLIAN PRODUKSI DAN SIARAN PROGRAM TELEVISI` (Semibold, Uppercase)
  - **Baris 5:** `Jalan KH. Abdullah Hasbullah Nomor 8 Padang, Singojuruh, Banyuwangi, Jawa Timur 68464`
  - **Baris 6:** `Telepon/Faksimile (0333) 635754, Laman smkniu.sch.id, Pos-el smkn.ius@gmail.com`
- **Garis Pembatas Bawah:** Garis tebal formal hitam (`border-bottom: 2.5px solid #000000`).
- **Penyeimbang Sisi Kanan (`.formal-kop-spacer`):** Blok spacer transparan dengan lebar yang sama dengan logo kiri (82px) sehingga blok teks kop di tengah berada **tepat simetris di sumbu tengah halaman kertas A4**.

### 2. 📑 Sinkronisasi di Seluruh Modul:
1. **Tahap 1:** Lembar Kerja Ide, Konsep, Pembagian Kru & Rencana Alat Syuting.
2. **Tahap 2:** Lembar Kerja Sinopsis Cerita & Struktur Tiga Babak.
3. **Tahap 3:** Lembar Kerja Breakdown Naskah Skenario (Script Breakdown Sheet).
4. **Tahap 4:** Lembar Kerja Shotlist 9 Kolom Standar Industri.
5. **Tahap 5:** Lembar Kerja Breakdown Tata Artistik & Desain Produksi.
6. **Tahap 6 (Helper `kopHtml`):** Otomatis muncul seragam di seluruh bab Master Production Book (Lembar Pengesahan, Resume Eksekutif, Bab 1 hingga Bab 5).
7. **Cover Sampul Depan Resmi:** Identitas sekolah dan alamat diperbarui selaras.

### 3. 📱 Responsivitas Mobile & Cetak:
- **Tampilan Mobile (≤ 640px):** Logo di atas, teks di bawah, spacer disembunyikan agar tidak overflow di layar smartphone.
- **Mode Cetak PDF (`@media print`):** Tetap horizontal 1 baris logo kiri, teks tengah rata, dan garis bawah tebal tajam.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.3.5`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 🛠️ Perbaikan Masif Tabel Shotlist 9 Kolom & Judul Kolom (v2.3.6)

### 1. 🔍 Akar Masalah yang Ditemukan:
- **Judul Kolom Bertumpuk di Sisi Kiri:** Pada CSS cetak (`@media print`), selector `.shotlist-table th` memiliki aturan `display: table-header-group !important;`. Akibatnya, browser memperlakukan setiap tag `<th>` sebagai header group independen (bukan `table-cell`), sehingga seluruh 9 judul kolom runtuh dan bertumpuk secara vertikal di dalam kolom pertama, sementara kolom 2 sampai 9 kehilangan judulnya.
- **Konflik Kelas Tabel di Bab IV:** Tabel Bab IV di Production Book sebelumnya menggabungkan kelas `.shotlist-table` dan `.formal-table`, yang menyebabkan tabrakan gaya visual antara dark mode web dan formal document putih.

### 2. 🚀 Solusi & Pembaruan Komprehensif:
- **Koreksi Aturan CSS Cetak (`@media print`):**
  - Mengubah deklarasi agar `display: table-header-group !important;` hanya berlaku pada `thead` (untuk mengulang header saat berpindah halaman cetak PDF).
  - Memastikan seluruh `th` dan `td` mendapatkan `display: table-cell !important;` dengan latar belakang `#e2e8f0`, border hitam tegas `1px solid #000000`, dan teks hitam tebal `font-weight: 800`.
- **Standarisasi Kelas `.formal-shotlist-table`:**
  - Menerapkan `table-layout: fixed; width: 100%;` untuk presisi batas kolom A4.
  - Membagi lebar 9 kolom secara proporsional dan matematis (Total = 100%):
    1. **No Adegan:** `4.5%` (Center)
    2. **Adegan & Slugline:** `19%` (Left)
    3. **Shot:** `6.5%` (Center)
    4. **Deskripsi Visual & Komposisi:** `26%` (Left)
    5. **Type / Size:** `8.5%` (Center)
    6. **Movement:** `11%` (Center)
    7. **Angle:** `10%` (Center)
    8. **Durasi:** `5.5%` (Center)
    9. **Audio & Catatan:** `9%` (Left)
- **Baris Total Rekapitulasi Footer:**
  - Menyelaraskan `colspan="7"` untuk teks total, 1 kolom Durasi (`${totalDur}s`), dan 1 kolom Catatan/Format Waktu (`${formatTime(totalDur)} (${totalDur}s)`).
- **Format Tag Badge / Pill Rapi:**
  - Menghilangkan bingkai kotak tebal yang kaku di mode cetak, digantikan dengan badge cetak yang bersih, tegas, dan mudah dibaca.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.3.6`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 📄 Pengaturan Cetak PDF Terpadu: Cover A4 Portrait & Bab A4 Landscape (v2.3.7)

### 1. 🎯 Kebutuhan & Spesifikasi:
- **Halaman Sampul Depan (Cover):** Harus dicetak dalam format **A4 Portrait (Tegak)** sebagai jilid/halaman muka standar dokumen resmi sekolah dan industri perfilman.
- **Isi Buku (Lembar Pengesahan, Resume, Bab I s/d Bab V):** Harus dicetak dalam format **A4 Landscape (Mendatar)** agar seluruh tabel (terutama Master Shotlist 9 Kolom Standar Industri dan Breakdown Naskah) muat secara optimal dengan lebar maksimal tanpa terpotong atau terdesak.

### 2. ⚙️ Implementasi Teknis CSS Paged Media Level 3:
- **Aturan `@page` Global & Named Pages:**
  ```css
  /* Orientasi default cetak adalah Landscape */
  @page {
    size: A4 landscape;
    margin: 8mm 10mm;
  }

  /* Named page khusus Sampul Depan Buku Produksi (A4 Portrait) */
  @page cover-page {
    size: A4 portrait;
    margin: 10mm 12mm;
  }

  /* Named page khusus Seluruh Bab, Pengesahan & Tabel Master (A4 Landscape) */
  @page landscape-page {
    size: A4 landscape;
    margin: 8mm 10mm;
  }
  ```
- **Binding Elemen Cover (`.book-cover-page`):**
  - Menerapkan `page: cover-page !important;`
  - Memaksa pemisah halaman setelah cover: `break-after: page !important; page-break-after: always !important;`
  - Tinggi proporsional presisi kertas A4: `height: 260mm !important; max-height: 265mm !important; box-sizing: border-box !important;`
  - Reset `min-height: 0 !important;` pada kontainer dalam agar unit viewport (`86vh`) tidak menimbulkan lembar kosong kedua.
- **Binding Elemen Seluruh Bab (`.book-chapter`):**
  - Menerapkan `page: landscape-page !important;`
  - Memaksa setiap bab baru dimulai pada lembar baru: `break-before: page !important; page-break-before: always !important;`
  - Lebar penuh landscape: `width: 100% !important; box-sizing: border-box !important;`
- **Pembersihan Konflik Fallback Selector:**
  - Menghapus selektor `@page :first` global agar saat pengguna mencetak lembar kerja tabel mandiri (Tahap 4 Shotlist saja atau Tahap 5 Artistik saja), halaman pertama tabel tidak ikut berubah menjadi portrait secara tidak disengaja.

### 3. 🚀 Pengalaman Pengguna (UX & Print PDF):
- Tombol cetak diperbarui menjadi **`🖨️ Cetak Buku Produksi (Cover Portrait + Bab Landscape)`** dengan instruksi otomatis.
- Pada browser modern (Google Chrome, Microsoft Edge, dll.), dialog print PDF secara cerdas dan otomatis mendeteksi halaman 1 tegak (Portrait) dan halaman 2 dst mendatar (Landscape) tanpa perlu setting manual orientasi.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.3.7`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 🎨 Pembersihan Durasi & Estimasi Durasi pada Sampul Depan (v2.3.8)

### 1. 🔍 Kebutuhan Pengguna:
- Menghilangkan teks durasi dan estimasi durasi pada kotak **"JUDUL KARYA PRODUKSI:"** di halaman sampul depan (*Cover Production Book*).
- Menghilangkan duplikasi tampilan format durasi mentah (`... • Estimasi Durasi: 31s (0m 31s (31s))`) yang sebelumnya otomatis tersemat di bawah judul film.

### 2. 🛠️ Solusi & Pembaruan:
- **Helper `cleanCoverGenre(str)`:**
  - Membersihkan string genre secara otomatis dari frasa durasi seperti `(Durasi 7 Menit, ...)`, `Durasi ...`, maupun `Estimasi Durasi: ...`.
  - Mempertahankan murni nama **Genre & Format Produksi** (contoh: `Dokumenter Drama Fiksi / Film Pendek Edukasi (16:9 4K)`).
- **Penyesuaian Tampilan Cover (`sec-cover`):**
  - Menghapus sambungan otomatis `• Estimasi Durasi: ${totalDur}s (...)` pada baris subtitle cover.
  - Subtitle kini tampil bersih dan elegan hanya menyajikan Genre & Format Rasio/Resolusi film.
- **Standarisasi Form Tahap 1 & Sample Data:**
  - Label form disederhanakan menjadi **"Genre & Format Produksi"** dengan placeholder `Contoh: Drama Pendek / Dokumenter Edukasi (16:9 4K)`.
  - Data contoh resmi *"Lentera Singojuruh"* diselaraskan menjadi `Dokumenter Drama Fiksi / Film Pendek Edukasi (16:9 4K)`.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.3.8`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 🎭 Penambahan Daftar Dinamis Artis / Talent Pemeran Film (v2.3.9)

### 1. 🔍 Kebutuhan Pengguna:
- Menambahkan daftar **Artis / Talent / Pemain Film** pada modul Pembagian Kru Syuting (Tahap 1, Bagian B).
- Daftar talent harus bersifat dinamis sehingga pengguna dapat menambah (*expandable*) atau menghapus jumlah talent sesuai kebutuhan skenario film.

### 2. 🛠️ Solusi & Pembaruan Fitur:
- **Model Data Terstruktur (`S.talents`):**
  - Setiap talent memiliki atribut: `id`, `name` (Nama Siswa / Pemeran), `role` (Karakter / Tokoh dalam Cerita), dan `desc` (Karakteristik & Catatan Kostum).
- **Antarmuka Interaktif di Tahap 1 (Bagian B):**
  - Sub-bagian baru: **🎭 Daftar Artis & Talent Pemeran (Cast & Talent List)** dengan indikator jumlah talent.
  - Tombol **`➕ Tambah Artis / Talent`** untuk menambah baris pemeran baru seketika.
  - Setiap item dilengkapi input 3 kolom responsif (Nama Siswa, Karakter/Peran, Deskripsi & Kostum) serta tombol hapus **`🗑️ Hapus`**.
  - Delegasi event `input` dengan atribut `data-t="[id]"` untuk auto-save instan tanpa kehilangan fokus ketikan (*debounced auto-save*).
  - Tampilan *empty-state* ramah ketika belum ada talent yang didaftarkan.
- **Integrasi Cetak PDF Dokumen Resmi Tahap 1:**
  - Ditambahkan **Tabel II. DAFTAR ARTIS / TALENT / PEMERAN (CAST & TALENT ROSTER)** berformat kop formal sekolah dengan 4 kolom proporsional (No, Nama Artis/Talent, Karakter/Peran, Karakteristik & Kostum).
  - Penomoran tabel peralatan syuting otomatis disesuaikan menjadi **Tabel III**.
- **Integrasi Master Production Book (Tahap 6):**
  - Ditambahkan sub-bab **1.3 DAFTAR ARTIS / TALENT / PEMERAN (CAST & TALENT ROSTER)** pada Bab I Production Book, sebelum sub-bab Rencana Peralatan Syuting (1.4).
- **Data Contoh Resmi & Fitur Salin:**
  - Data contoh resmi *"Lentera Singojuruh"* kini mencakup 4 pemeran: Muhammad Fajar (Tokoh Utama), Drs. H. Ahmad Harun (Guru Pembimbing), Mbah Buyut Suto (Sesepuh Adat), serta figuran kru sahabat.
  - Fitur **Salin Teks** (`copyIdeText()`) otomatis menyertakan rekap daftar artis/talent.
  - Fitur **Kosongkan** (`clearIde()`) menyetel ulang array talent.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.3.9`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 📄 Pemindahan Judul Daftar Artis / Talent ke Lembar Berikutnya Saat Cetak PDF (v2.4.0)

### 1. 🔍 Kendala Layout yang Ditemukan:
- Pada mode cetak PDF lembar kerja Tahap 1, judul sub-bab **`II. DAFTAR ARTIS / TALENT / PEMERAN (CAST & TALENT ROSTER)`** sebelumnya terdorong ke bagian paling bawah Halaman 1 sebagai baris yatim (*orphan heading*), sementara tabel datanya terpisah dan tercetak di Halaman 2.

### 2. 🛠️ Solusi & Pembaruan:
- **Penerapan Page-Break Khusus (`.print-break-before`):**
  - Menerapkan `page-break-before: always !important; break-before: page !important;` pada judul **Tabel II (Daftar Artis / Talent)** di Lembar Kerja Tahap 1.
  - Memastikan Halaman 1 terisi rapi oleh: Kop Surat Sekolah, Judul Lembar Kerja, Tabel Identitas Proyek, dan Tabel I (Struktur Pembagian Kru 11 Baris).
  - Halaman 2 diawali langsung di bagian atas oleh judul **II. DAFTAR ARTIS / TALENT / PEMERAN**, Tabel Artis/Talent, dilanjutkan Tabel III (Rencana Peralatan), dan Kolom Tanda Tangan Pengesahan.
- **Pencegahan Orphan Header (`.print-avoid-break-after`):**
  - Menerapkan `page-break-after: avoid !important; break-after: avoid !important;` pada seluruh heading dokumen formal dan sub-bab Production Book agar judul bab/tabel tidak pernah lagi terpisah dari isi tabel di bawahnya.
  - Menerapkan pemisahan halaman yang sama pada sub-bab **1.3 DAFTAR ARTIS / TALENT** di Master Production Book (Tahap 6).
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.4.0`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 📅 Penambahan Isian Dinamis Tahun Pelajaran pada Menu Production Book (v2.4.1)

### 1. 🔍 Kebutuhan Pengguna:
- Menambahkan kolom isian (*input field*) **Tahun Pelajaran** pada menu **Tahap 6: Production Book (Buku Produksi Lengkap)**.
- Nilai tahun pelajaran yang diinput harus dapat disesuaikan secara fleksibel (misal: `2025/2026`, `2026/2027`, dll.), tersimpan otomatis (*auto-save*), dan langsung tercetak pada Halaman Sampul Depan (*Cover Page*) dan Lembar Resume Eksekutif (*Executive Summary*).

### 2. 🛠️ Solusi & Pembaruan Fitur:
- **Form Input Interaktif di Toolbar Menu Production Book:**
  - Ditambahkan panel formulir pengaturan non-cetak (`.no-print`) pada bilah atas Production Book dengan label:
    **"📅 Tahun Pelajaran:"** dan input ber-atribut `data-k="book_tapel"`.
  - Dilengkapi teks penjelas bantuan dan status penyimpanan instan.
- **Integrasi Cetak Halaman Sampul Depan (`#sec-cover`):**
  - Teks yang sebelumnya *hardcoded* (`TAHUN PELAJARAN 2025/2026`) diubah menjadi dinamis terhubung ke data `S.book_tapel`:
    `<span class="cover-tapel-text">TAHUN PELAJARAN ${esc(S.book_tapel || '2025/2026')}</span>`.
  - Ditambahkan tombol pintas non-cetak **`✏️ Ubah`** di dekat teks sampul untuk mempermudah pengguna melompat dan fokus ke input field.
- **Penyelarasan Lembar Resume Eksekutif (`#sec-resume`):**
  - Ditambahkan baris baru pada tabel spesifikasi produksi:
    **Tahun Pelajaran:** `<strong class="resume-tapel-text">${esc(S.book_tapel || '2025/2026')}</strong>` berdampingan dengan Konsentrasi Keahlian.
- **Manajemen State & Auto-Save Real-Time:**
  - `loadStorage()`: Memastikan inisialisasi default `'2025/2026'` jika proyek lama belum memiliki properti `book_tapel`.
  - `initDefaultProject()`: Menyertakan `book_tapel: '2025/2026'`.
  - `loadSampleIde()`: Menyertakan `book_tapel: '2025/2026'`.
  - *Live DOM Updates*: Pada event listener `input`, perubahan nilai `book_tapel` langsung memperbarui `.cover-tapel-text` dan `.resume-tapel-text` secara *real-time* tanpa merusak fokus kursor.
- **Cache Service Worker:** Dinaikkan ke **`shotqu-v2.4.1`** di [sw.js](file:///f:/APPPSPT/shotlist/sw.js).

---

## 🔐 Portal Login Admin & Dashboard Guru Pembimbing Resmi (v2.5.0)

### 1. 🔍 Kebutuhan & Spesifikasi Pengguna:
- Pembuatan antarmuka dan endpoint login admin khusus di server lokal, seperti `http://10.245.19.29:8080/login` atau `http://localhost:8080/login` (sesuai IP WiFi sekolah / laptop guru).
- Autentikasi akun Guru / Admin Pembimbing yang aman, dapat digunakan 100% offline (tersimpan di `localStorage`), dapat berganti password, serta terintegrasi langsung dengan instansi SMKN Ihya Ulummudin Singojuruh.
- Panel Dashboard Guru khusus untuk melakukan supervisi dan validasi naskah/buku produksi siswa:
  1. Penentuan **Status Validasi / ACC Naskah**:
     - `🟡 Belum Diperiksa (Menunggu Review)`
     - `🟠 Perlu Revisi / Catatan Perbaikan`
     - `🟢 ACC & Disetujui (Siap Masuk Tahap Produksi / Syuting)`
  2. Identitas Resmi Guru Pembimbing (Nama Lengkap & NIP).
  3. Tanda Tangan & Stempel Digital Resmi Sekolah yang otomatis tersemat pada lembar cetak dokumen:
     - Lembar Kerja Tahap 1 (Konsep & Kru)
     - Lembar Pengesahan Tahap 6 (Production Book)
     - Lembar Resume Eksekutif (Tahap 6)
  4. Kolom Catatan Evaluasi & Catatan Bimbingan Naskah dari Guru.
  5. Manajemen Akun (Ubah Password Admin/Guru).
  6. Kontrol Cepat Master Data (Ekspor Master JSON, Impor, Reset Proyek).

---

### 2. 🚀 Arsitektur & Komponen yang Diimplementasikan:

#### A. Routing Server Lokal ([server.ps1](file:///f:/APPPSPT/shotlist/server.ps1))
- **Dukungan Path `/login` & `/admin`:**
  - Ditambahkan penanganan rute khusus: jika request mengarah ke `/login`, `/login/`, `/admin`, atau `/admin/`, server otomatis menyajikan berkas [login.html](file:///f:/APPPSPT/shotlist/login.html) dengan MIME type `text/html`.
  - Ditambahkan fallback cerdas: jika path diminta tanpa ekstensi file dan ada file `.html` yang sesuai di folder workspace, server langsung menyajikannya.
- **Log Banner Konsol Interaktif:**
  - Menampilkan tautan langsung login di konsol PowerShell:
    - `Login Admin:     http://localhost:8080/login`
    - `Login Admin Tab: http://10.245.19.29:8080/login`

#### B. Halaman Login Sinematik ([login.html](file:///f:/APPPSPT/shotlist/login.html))
- **Desain Glassmorphism Dark Mode:**
  - Tema visual sinematik khas industri perfilman dengan aksen Gold & Sapphire, logo resmi lingkaran SMKN Ihya Ulummudin Singojuruh, dan identitas keahlian PSPT.
- **Kredensial Default Baku:**
  - **Username:** `admin` (juga menerima `guru`)
  - **Password:** `smk2026`
- **Fitur Interaktif:**
  - Tombol intip sandi (toggle *show/hide password* dengan ikon mata).
  - Kotak panduan kredensial default yang jelas dan ramah pengguna.
  - Notifikasi pesan error/sukses beranimasi halus.
  - Deteksi sesi aktif: jika pengguna sudah login sebelumnya, otomatis menampilkan kartu status "Sesi Guru / Admin Aktif" beserta tombol langsung **Buka Dashboard Guru** dan opsi keluar.
  - Kompatibel penuh dengan browser tablet, smartphone, maupun laptop desktop.

#### C. Integrasi Dashboard Guru & Validasi ([index.html](file:///f:/APPPSPT/shotlist/index.html))
- **Navigasi Tab Baru (`🔐 Panel Guru`):**
  - Ditambahkan tombol tab admin khusus `.tab-btn-admin` di bilah navigasi utama dengan indikator badge status login (warna hijau saat aktif, abu-abu saat belum login).
  - Tautan cepat di header kanan (`.auth-header-btn-wrap`) yang menampilkan status nama guru dan tombol login/keluar.
  - Spanduk Portal Guru (`.admin-portal-banner`) di halaman awal (Landing view) yang dapat diklik untuk login atau langsung membuka panel guru.
  - Proteksi Akses: Jika pengguna belum login dan mengklik tab Guru, sistem secara otomatis mengarahkan ke halaman `/login.html`.
- **Fasilitas Panel Dashboard Guru (`renderAdminDashboard()`):**
  1. **Pengaturan Status Validasi (ACC):** Pilihan dropdown dengan badge warna visual seketika.
  2. **Identitas Guru Pembimbing:** Input Nama Guru dan NIP yang tersimpan persisten ke data proyek (`S.guru_nama` & `S.guru_nip`). Default: *Drs. H. Ahmad Harun, M.Pd* / *NIP. 19780512 200501 1 008*.
  3. **Stempel Digital Otomatis:** Preview stempel resmi berstempel tinta emas/biru lengkap dengan tanggal persetujuan.
  4. **Catatan Bimbingan & Evaluasi Naskah:** Kolom catatan terstruktur yang otomatis tersimpan ke `S.guru_catatan`.
  5. **Ganti Password Guru:** Formulir mandiri untuk memperbarui password guru dari default `smk2026` ke password baru sesuai preferensi guru yang tersimpan di `localStorage['shotqu_admin_pwd']`.
  6. **Aksi Cepat Data Master:** Tombol Ekspor JSON, Impor Proyek, dan Cetak Buku Produksi.
- **Sinergi ke Lembar Kerja Cetak PDF:**
  - **Tahap 1:** Blok tanda tangan guru otomatis mengambil Nama Guru Pembimbing, NIP, serta membubuhkan cap badge ACC jika status sudah disetujui.
  - **Tahap 6 (Lembar Pengesahan):** Nama Guru Pembimbing dan NIP otomatis sinkron di kolom tanda tangan resmi.
  - **Tahap 6 (Lembar Resume Eksekutif):** Status ACC dan Catatan Bimbingan Guru otomatis tampil rapi dalam kotak catatan resmi.
  - Seluruh tombol kontrol, formulir, dan bilah admin otomatis disembunyikan (`display: none !important`) saat dokumen dicetak ke PDF (`@media print`).

#### D. Penyelarasan Navigasi Landing & PWA Offline
- [landing.html](file:///f:/APPPSPT/shotlist/landing.html): Menambahkan tombol `🔐 Login Guru` di navbar atas dan footer navigasi.
- [sw.js](file:///f:/APPPSPT/shotlist/sw.js): Menambahkan `'./login.html'` ke dalam daftar cache assets PWA dan menaikkan versi cache menjadi **`shotqu-v2.5.0`** untuk performa offline penuh.

---

### 3. 🧪 Hasil Pengujian & Verifikasi:
- Seluruh verifikasi skrip [verify_admin_login.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_admin_login.ps1) dinyatakan **LULUS 100%**:
  - `HTTP GET /login` -> Status `200 OK`.
  - `HTTP GET /admin` -> Status `200 OK`.
  - Struktur HTML: 594 Div buka = 594 Div tutup, 30 Table buka = 30 Table tutup.
  - Server aktif beroperasi di background via [server.ps1](file:///f:/APPPSPT/shotlist/server.ps1) pada port 8080.

---

## 🏛️ Sembunyikan Spanduk Portal Beranda & Panel Kustomisasi Kop Surat/Logo di Menu Admin (v2.5.1)

### 1. 🎯 Latar Belakang & Permintaan Pengguna:
1. **Sembunyikan Menu/Spanduk pada Gambar:**
   - Menghilangkan sepenuhnya banner *"Portal Guru Pembimbing & Administrator"* (`.admin-portal-banner`) dari halaman beranda/landing page agar tampilan menu utama tetap bersih, minimalis, dan terfokus pada 6 alur produksi siswa.
2. **Kustomisasi Lengkap di Menu Admin:**
   - Memfungsikan Menu Admin (`renderAdminDashboard`) sebagai pusat kendali identitas instansi untuk:
     - **Ganti Logo Sekolah:** Unggah logo kustom (format file gambar PNG/JPG/SVG/WebP) yang otomatis diubah ke Base64, disimpan di memori lokal, dan opsi reset ke logo default (`logo.png`).
     - **Ganti Nama Sekolah:** Mengubah Jenjang/Instansi (Baris 1) dan Nama Sekolah Utama (Baris 2).
     - **Ganti Keterangan dalam Kop Surat Resmi:** Mengubah Program Keahlian (Baris 3), Konsentrasi Keahlian (Baris 4), Alamat Sekolah Lengkap (Baris 5), serta Kontak/Telepon/Web/Email (Baris 6).
     - **Pratinjau Langsung (Live Preview):** Menampilkan kotak pratinjau interaktif kop surat formal secara *real-time* saat admin mengetik atau mengunggah logo baru.

---

### 2. 🚀 Arsitektur & Implementasi Teknis:

#### A. Penyembunyian Spanduk Beranda ([index.html](file:///f:/APPPSPT/shotlist/index.html))
- Blok markup `.admin-portal-banner` dihapus dari fungsi `renderLanding()`.
- Ditambahkan aturan proteksi pada CSS: `.admin-portal-banner { display: none !important; }` sehingga banner dipastikan tidak lagi muncul di layar beranda.
- Akses ke Menu Admin tetap mudah dijangkau via tautan langsung `/login` atau tombol gear pengaturan di sudut atas saat sesi admin aktif.

#### B. Unified Kop Configuration Engine ([index.html](file:///f:/APPPSPT/shotlist/index.html))
- Dibuat konfigurasi standar `DEFAULT_KOP` dan fungsi manajemen kop:
  - `getKopConfig()`: Membaca pengaturan dari `localStorage['shotqu_kop_config']` dengan fallback ke data bawaan SMKN Ihya Ulummudin Singojuruh.
  - `saveKopConfig(cfg)`: Menyimpan konfigurasi ke `localStorage['shotqu_kop_config']` dan `S.kop`.
  - `resetKopConfig()`: Mengembalikan logo dan 6 baris teks ke pengaturan bawaan sekolah.
  - `renderFormalKop(extraStyle)`: Fungsi generator HTML terpusat untuk merender logo, teks kop 6 baris rata tengah, spacer penyeimbang 82px, dan garis tebal pembatas bawah.

#### C. Integrasi Menyeluruh ke Semua Lembar Kerja & Dokumen Cetak PDF
- **Tahap 1, 2, 3, 5:** Seluruh kop statis diganti dengan pemanggilan dinamis `${renderFormalKop()}`.
- **Tahap 4 (Shotlist 9 Kolom):** Terintegrasi langsung dengan format dinamis `${renderFormalKop('...')}`.
- **Tahap 6 (Master Production Book):**
  - Helper `kopHtml` di `renderBook()` langsung memanggil `renderFormalKop()`.
  - Sampul Depan resmi (`#sec-cover`) otomatis menampilkan logo kustom dan teks identitas sekolah kustom.
  - Header bar, Lembar Pengesahan, dan Catatan Akhir otomatis menyesuaikan nama sekolah dan program keahlian kustom.
- **Halaman Login ([login.html](file:///f:/APPPSPT/shotlist/login.html)):**
  - Logo dan nama sekolah di halaman login otomatis membaca `shotqu_kop_config` via JavaScript saat dimuat.

#### D. Panel Admin Interaktif (`renderAdminDashboard()`)
- Kartu utama selebar 2 kolom bertajuk **🏛️ Ganti Logo, Nama Sekolah & Keterangan Kop Surat**:
  - Pratinjau logo aktif (`#adm-logo-preview-img`).
  - Tombol unggah logo dengan input file tersembunyi (`#adm-logo-file-input`) dan fungsi `handleLogoUpload(e)` via `FileReader.readAsDataURL()`.
  - Tombol reset logo cepat (`handleLogoReset()`).
  - 6 bidang input teks terstruktur dengan penanganan *event* `oninput="handleKopInput(...)"`.
  - Wadah pratinjau hidup (`#adm-live-kop-container`) yang otomatis ter-update seketika (*live reactive preview*).
  - Tombol *Simpan Perubahan* dan *Reset ke Bawaan Sekolah*.

#### E. Pembaruan Cache PWA ([sw.js](file:///f:/APPPSPT/shotlist/sw.js))
- Menaikkan versi cache PWA menjadi **`shotqu-v2.5.1`** agar seluruh aset dan konfigurasi baru terdistribusi sempurna secara offline.

---

### 3. 🧪 Hasil Pengujian & Verifikasi:
- Pengujian struktur HTML: Div seimbang (555 buka / 555 tutup), Tabel seimbang (30 buka / 30 tutup).
- Verifikasi otomatis via skrip [verify_kop_settings.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_kop_settings.ps1):
  - Uji 1 (Banner Tersembunyi): LULUS.
  - Uji 2 (Engine Kop & Default): LULUS.
  - Uji 3 (Panel Admin & File Uploader): LULUS.
  - Uji 4 (Integrasi Lembar Kerja Tahap 1–6): LULUS.
  - Uji 5 (Sinkronisasi Halaman Login): LULUS.
  - Uji 6 (Koneksi HTTP & Status Server): LULUS (HTTP 200 pada `/` dan `/login`).

---

## 🧼 Penyempurnaan Teks Klausa Hero & Penyederhanaan Menu Admin (v2.5.2)

### 1. 🎯 Latar Belakang & Permintaan Pengguna:
1. **Hilangkan tanda `-` (strip/dash) sebelum kata `siap`:**
   - Menghapus tanda strip panjang (`— `) sebelum frasa `siap eksekusi di set lokasi syuting dan 100% offline.` pada paragraf deskripsi hero halaman beranda ([index.html](file:///f:/APPPSPT/shotlist/index.html) dan [landing.html](file:///f:/APPPSPT/shotlist/landing.html)).
2. **Sembunyikan Kartu "Validasi Dokumen Resmi":**
   - Menghilangkan kartu status pengesahan ACC & identitas guru dari Menu Admin agar tampilan fokus pada kustomisasi identitas sekolah dan kop surat.
3. **Sembunyikan Kartu "Lembar Evaluasi Siswa":**
   - Menghilangkan kartu catatan bimbingan & evaluasi naskah guru dari Menu Admin.

---

### 2. 🚀 Rincian Implementasi:
- **Pembersihan Teks Hero:**
  - [index.html](file:///f:/APPPSPT/shotlist/index.html): Menjadi `siap eksekusi di set lokasi syuting dan 100% offline.` tanpa tanda strip pembuka.
  - [landing.html](file:///f:/APPPSPT/shotlist/landing.html): Menjadi `siap eksekusi di lokasi syuting dan 100% offline.` tanpa tanda strip pembuka.
- **Penyederhanaan Menu Admin (`renderAdminDashboard()`):**
  - Menghapus blok Kartu 2 ("Validasi Dokumen Resmi") dan Kartu 3 ("Lembar Evaluasi Siswa").
  - Menu Admin kini hanya menampilkan 3 kartu esensial yang proporsional:
    1. **🏛️ Ganti Logo, Nama Sekolah & Keterangan Kop Surat** (lebar 2 kolom / span 2).
    2. **🔑 Ganti Kata Sandi Admin** (kolom 1).
    3. **💾 Cadangan & Cetak Master** (kolom 2).
- **Sinkronisasi Teks Portal Login ([login.html](file:///f:/APPPSPT/shotlist/login.html)):**
  - Mengubah tombol aksi menjadi `⚙️ Buka Menu Admin`.
  - Mengubah petunjuk keterangan menjadi `Sesi login aktif. Anda dapat mengelola logo, nama sekolah, dan kop surat resmi.`.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.2`**.

---

### 3. 🧪 Hasil Pengujian & Verifikasi:
- Uji script [verify_hide_cards.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_hide_cards.ps1):
  - Uji tanda strip sebelum "siap": Terhapus bersih (`False` untuk dash, `True` untuk teks bersih).
  - Uji keberadaan kartu validasi & evaluasi: Berhasil disembunyikan total (`False` untuk kedua kartu).
  - Uji struktur HTML: 531 Div buka / 531 Div tutup (seimbang 100%), 30 Table buka / 30 Table tutup.
  - Uji Server HTTP: `HTTP GET /` status 200 OK, `HTTP GET /login` status 200 OK.

---

## 🗃️ Sembunyikan Kartu "Alat Administrasi" (Cadangan & Cetak Master) di Menu Admin (v2.5.3)

### 1. 🎯 Permintaan Pengguna:
- Menyembunyikan kartu **Alat Administrasi** (*Cadangan & Cetak Master*) dari Menu Admin sesuai gambar screenshot yang dikirim pengguna.

### 2. 🚀 Rincian Implementasi:
- **Penghapusan Kartu Alat Administrasi:**
  - Blok markup kartu *"Alat Administrasi — Cadangan & Cetak Master"* (tombol Cetak Master PDF, Ekspor JSON, dan Impor Proyek) dihapus sepenuhnya dari `renderAdminDashboard()` di [index.html](file:///f:/APPPSPT/shotlist/index.html).
- **Penataan Ulang Menu Admin:**
  - Kartu **Keamanan Akun (Ganti Kata Sandi Admin)** ditata rapi secara terpusat (`max-width: 640px; margin: 0 auto`) di bawah panel utama kustomisasi Kop Surat Sekolah.
  - Menu Admin kini 100% terfokus pada:
    1. **🏛️ Ganti Logo, Nama Sekolah & Keterangan Kop Surat** (Panel Utama Lengkap dengan Pratinjau Interaktif Langsung).
    2. **🔑 Keamanan Akun & Ganti Kata Sandi Admin** (Formulir kata sandi baru).
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.3`** untuk sinkronisasi offline.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_hide_admin_menu.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_hide_admin_menu.ps1):
  - Kartu *Alat Administrasi* & *Cadangan & Cetak Master* terhapus bersih (`False`).
  - Keseimbangan tag HTML: 525 Div buka / 525 Div tutup (Seimbang 100%), 30 Table buka / 30 Table tutup.
  - Koneksi Server: HTTP 200 OK pada `/` dan `/login`.

---

## 🎬 Penyederhanaan Istilah Judul: "Shotlist" Tanpa "9 Kolom" (v2.5.4)

### 1. 🎯 Permintaan Pengguna:
- Mengubah judul pada kartu menu Tahap 4 dari sebelumnya **"Shotlist (9 Kolom)"** menjadi **"Shotlist"** saja (tanpa kata 9 kolom), sesuai screenshot yang dikirim pengguna.

### 2. 🚀 Rincian Implementasi:
- **Penyelarasan Kartu Menu Tahap 4:**
  - [index.html](file:///f:/APPPSPT/shotlist/index.html): Judul kartu menu diubah menjadi `<h4 class="menu-name">Shotlist</h4>`.
  - [landing.html](file:///f:/APPPSPT/shotlist/landing.html): Judul kartu menu diubah menjadi `<h3 class="menu-name">Shotlist</h3>`.
- **Penyelarasan Teks & Navigasi:**
  - Tombol aksi dan navigasi CTA: `Buka Editor Shotlist ➔`.
  - Paragraf ringkasan hero di beranda: `Ide & Konsep, Sinopsis, Breakdown Naskah, Shotlist, Breakdown Tata Artistik, dan Production Book`.
  - Tombol pratinjau tabel di editor: `📊 Tabel Shotlist (PDF)` dan `📊 Pratinjau Tabel Shotlist (PDF) ➔`.
  - Bab IV Buku Produksi: `BAB IV: SHOTLIST STANDAR INDUSTRI`.
  - Bilah akses cepat Lompat Bab: `🎬 Bab IV: Shotlist`.
  - Tautan navigasi footer di [landing.html](file:///f:/APPPSPT/shotlist/landing.html): `🎬 Shotlist`.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.4`**.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_shotlist_title.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_shotlist_title.ps1):
  - Teks "Shotlist (9 Kolom)" terhapus dari `index.html` dan `landing.html` (`False`).
  - Judul kartu Tahap 4 bernilai `True` untuk `<h4 class="menu-name">Shotlist</h4>` dan `<h3 class="menu-name">Shotlist</h3>`.
  - Keseimbangan tag HTML: 525 Div buka / 525 Div tutup (100% seimbang), 30 Table buka / 30 Table tutup.
  - Server HTTP: HTTP 200 OK untuk `/` dan `/landing.html`.

---

## 🏛️ Penataan Posisi Logo Kop Surat Rapat Berdampingan dengan Teks (v2.5.5)

### 1. 🎯 Permintaan Pengguna:
- Mendekatkan posisi logo sekolah dengan teks kop surat instansi agar tidak ada lagi celah kosong lebar (ruang kosong berlebih ~200px) di antara logo sisi kiri dan teks tengah kop surat, sesuai screenshot yang dikirim pengguna.

### 2. 🚀 Rincian Implementasi:
- **Analisis Tata Letak & Penyebab:**
  - Sebelumnya, `.formal-kop-box` menggunakan `justify-content: space-between` dengan `.formal-kop-center` disetel `flex: 1` dan elemen penyeimbang `.formal-kop-spacer` disetel selebar logo (82px).
  - Pada layar lebar (seperti pratinjau desktop kartu admin, pratinjau lembar A4 landscape, dsb.), properti `flex: 1` membentangkan kontainer teks ke seluruh sisa lebar, mendesak logo jauh ke pinggir kiri dan meninggalkan celah kosong besar di sebelah kirinya teks.
- **Pembaruan CSS Fleksibel & Rapat (`.formal-kop-box`):**
  - Mengubah `.formal-kop-box` menjadi `display: flex; align-items: center; justify-content: center; gap: 16px;`.
  - Mengubah `.formal-kop-logo-side` menjadi `flex-shrink: 0; display: flex; align-items: center; justify-content: center;`.
  - Mengubah `.formal-kop-center` menjadi `flex: 0 1 auto; text-align: center; padding: 0;`.
  - Menonaktifkan spacer sisi kanan (`.formal-kop-spacer { display: none !important; }`) dan menghapus tag spacer dari fungsi generator HTML `renderFormalKop()`.
  - Dengan susunan ini, logo dan 6 baris teks kop instansi bersatu dalam satu kesatuan kompak yang saling berdampingan rapat dengan jarak proporsional 16px, dan keseluruhan blok berada terpusat simetris di atas garis pembatas tebal hitam (`border-bottom: 2.5px solid #000000`).
- **Penyelarasan Mode Cetak (`@media print`):**
  - Menerapkan aturan identik pada CSS cetak: `.formal-kop-box { justify-content: center !important; gap: 16px !important; }` serta `.formal-kop-center { flex: 0 1 auto !important; }`.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.5`** untuk memastikan browser memuat gaya CSS terbaru secara instan.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_kop_gap.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_kop_gap.ps1):
  - `.formal-kop-box` justify-content center & gap 16px: LULUS (`True`).
  - `.formal-kop-center` flex `0 1 auto`: LULUS (`True`).
  - Keseimbangan tag HTML: 524 Div buka / 524 Div tutup (100% seimbang), 30 Table buka / 30 Table tutup.
  - Server HTTP: HTTP 200 OK untuk `/`.

---

## ✍️ Pembaruan Tata Letak Tanda Tangan Lembar Pengesahan Buku Produksi (v2.5.6)

### 1. 🎯 Permintaan Pengguna:
- Mengubah tata letak tanda tangan pada Lembar Pengesahan Master Production Book (`#sec-pengesahan`) dari sebelumnya 6 tanda tangan (3 kolom × 2 baris) menjadi 4 tanda tangan (2 kolom × 2 baris) dengan posisi spesifik:
  - **Atas Kiri:** Produser (Producer)
  - **Atas Kanan:** Sutradara (Film Director)
  - **Bawah Kiri:** Mengesahkan, Kepala Program Keahlian
  - **Bawah Kanan:** Mengetahui, Guru Pembimbing / Instruktur

### 2. 🚀 Rincian Implementasi:
- **Restrukturisasi Grid (`.book-sign-grid-4`):**
  - Mengubah matriks CSS Grid tanda tangan dari 3 kolom (`repeat(3, 1fr)`) menjadi 2 kolom proporsional (`grid-template-columns: repeat(2, 1fr)`).
  - Memberikan batas lebar maksimal elegan (`max-width: 820px; margin: 24px auto 0 auto; gap: 22px 60px;`) agar posisi tanda tangan terpusat seimbang di lembar A4 landscape.
  - Memastikan kompatibilitas responsif di perangkat smartphone (`grid-template-columns: 1fr` pada `@media (max-width: 640px)`).
  - Menyelaraskan aturan cetak PDF `@media print` dengan proteksi `break-inside: avoid !important;`.
- **Penataan Posisi 4 Penandatangan:**
  1. **Baris 1 - Kiri:**
     - Peran: `Disetujui Oleh,<br>Produser (Producer)`
     - Nama: Dinamis dari `S.kru_produser` (Pimpinan Manajemen Produksi).
  2. **Baris 1 - Kanan:**
     - Peran: `Disetujui Oleh,<br>Sutradara (Film Director)`
     - Nama: Dinamis dari `S.kru_sutradara` (Pemegang Visi Kreatif).
  3. **Baris 2 - Kiri:**
     - Peran: `Mengesahkan,<br>Kepala Program Keahlian`
     - Nama & NIP: Format resmi garis titik penandatanganan/stempel resmi.
  4. **Baris 2 - Kanan:**
     - Peran: `Mengetahui,<br>Guru Pembimbing / Instruktur`
     - Nama & NIP: Dinamis dari `S.guru_nama` dan `S.guru_nip`, lengkap dengan badge indikator stempel ACC/Revisi.
- **Pembersihan Elemen:**
  - Menghapus tanda tangan DoP dan Penata Artistik dari Lembar Pengesahan Master Buku Produksi agar dokumen tampil lebih ringkas dan berorientasi pada pimpinan produksi serta pengesahan pejabat sekolah.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.6`**.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_signatures_layout.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_signatures_layout.ps1):
  - Keseimbangan tag HTML: 516 Div buka / 516 Div tutup (100% seimbang), 30 Table buka / 30 Table tutup.
  - Urutan posisi tanda tangan: Produser (Atas Kiri) < Sutradara (Atas Kanan) < Kepala Program (Bawah Kiri) < Guru Pembimbing (Bawah Kanan) -> LULUS (`True`).
  - Tidak ada DoP dan Penata Artistik di blok Lembar Pengesahan: LULUS (`False`).
  - Cache Service Worker: `shotqu-v2.5.6`.
  - Server HTTP: HTTP 200 OK.

---

## 🏛️ Penambahan Awalan "SMKN" Sebelum Teks "IHYA" di Lembar Pengesahan (v2.5.7)

### 1. 🎯 Permintaan Pengguna:
- Menambahkan teks **"SMKN"** tepat sebelum teks nama sekolah **"IHYA"** pada paragraf naskah pengesahan resmi di Lembar Pengesahan Master Buku Produksi (`#sec-pengesahan`), sesuai gambar screenshot yang dikirim pengguna.

### 2. 🚀 Rincian Implementasi:
- **Analisis Kalimat:**
  - Sebelumnya, kalimat pengesahan berbunyi:
    `... dewan guru pembimbing PROGRAM KEAHLIAN BROADCASTING DAN PERFILMAN IHYA ULUMMUDIN SINGOJURUH BANYUWANGI.`
    (Nama instansi melompat langsung dari Program Keahlian `k.line3` ke `k.line2` tanpa mencantumkan singkatan jenjang sekolah).
- **Pembaruan Format Teks ([index.html](file:///f:/APPPSPT/shotlist/index.html)):**
  - Pada paragraf utama `#sec-pengesahan`:
    Menggunakan logika interpolasi dinamis `${(/^SMK/i.test(k.line2 || '') ? '' : 'SMKN ')}${esc(k.line2 || 'IHYA ULUMMUDIN SINGOJURUH BANYUWANGI')}` sehingga kalimat kini berbunyi resmi dan utuh:
    `... dewan guru pembimbing PROGRAM KEAHLIAN BROADCASTING DAN PERFILMAN SMKN IHYA ULUMMUDIN SINGOJURUH BANYUWANGI.`
  - Menyelaraskan teks pada header bar Master Book (`.formal-sheet-header-bar`) dan catatan penutup dokumen (`#sec-artistik-breakdown` / akhir buku).
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.7`**.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_smkn_ihya.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_smkn_ihya.ps1):
  - Keseimbangan tag HTML: 516 Div buka / 516 Div tutup (100% seimbang), 30 Table buka / 30 Table tutup.
  - Memiliki awalan `SMKN ` sebelum `IHYA` di Lembar Pengesahan: LULUS (`True`).
  - Cache Service Worker: `shotqu-v2.5.7`.
  - Server HTTP: HTTP 200 OK.

---

## 👨‍🏫 Penambahan Form Isian Guru Pembimbing & Kepala Program Keahlian beserta NIP (v2.5.8)

### 1. 🎯 Permintaan Pengguna:
- Menambahkan formulir isian untuk **Nama Guru Pembimbing beserta NIP** dan **Nama Kepala Program Keahlian beserta NIP** pada bilah pengaturan menu **Tahap 6: Production Book (Buku Produksi Lengkap)**, sesuai gambar screenshot yang dikirim pengguna.

### 2. 🚀 Rincian Implementasi:
- **Pembaruan Panel Toolbar Pengaturan ([index.html](file:///f:/APPPSPT/shotlist/index.html)):**
  - Mengembangkan bilah formulir non-cetak (`.no-print`) pada menu Production Book menjadi wadah pengaturan terintegrasi dengan 2 baris terstruktur:
    1. **Baris 1:** Input *Tahun Pelajaran* (misal: `2026/2027`) beserta indikator auto-save.
    2. **Baris 2:** Grid 2 kolom kartu pengesahan instansi:
       - **Kolom Guru Pembimbing / Instruktur:**
         - Input `Nama Lengkap & Gelar` (`data-k="guru_nama"`, default: *Drs. H. Ahmad Harun*).
         - Input `NIP Guru` (`data-k="guru_nip"`, default: *19750812 200501 1 003*).
       - **Kolom Kepala Program Keahlian:**
         - Input `Nama Lengkap & Gelar` (`data-k="kaproli_nama"`, placeholder: *Nama Kaproli, S.Pd*).
         - Input `NIP Kepala Program` (`data-k="kaproli_nip"`, placeholder: *Contoh: 19800101 200801 1 005*).
- **Integrasi Dokumen Cetak Lembar Pengesahan (`#sec-pengesahan`):**
  - Kotak tanda tangan Kepala Program Keahlian kini dinamis:
    - Nama: `<div class="formal-sign-name book-kaproli-name-text">${esc(S.kaproli_nama || '( ............................................ )')}</div>`
    - NIP: `<div class="book-kaproli-nip-text">${S.kaproli_nip ? 'NIP. ' + esc(S.kaproli_nip) : 'NIP. ........................................'}</div>`
  - Kotak tanda tangan Guru Pembimbing / Instruktur:
    - Dilengkapi kelas `.book-guru-name-text` dan `.book-guru-nip-text`.
- **Reaktivitas Live Input & Auto-Save:**
  - Event listener `input` secara cerdas memperbarui elemen tanda tangan di Lembar Pengesahan (dan Tahap 1) secara instan (*real-time reactive updates*) tanpa refresh halaman dan tanpa merusak fokus kursor ketikan.
  - Nilai tersimpan persisten ke memori `localStorage` melalui fungsi `save()`.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.8`**.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_guru_kaproli_inputs.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_guru_kaproli_inputs.ps1):
  - Keseimbangan tag HTML: 528 Div buka / 528 Div tutup (100% seimbang), 30 Table buka / 30 Table tutup.
  - Keberadaan input form `guru_nama`, `guru_nip`, `kaproli_nama`, `kaproli_nip`: LULUS (`True`).
  - Penanda kelas reaktif `book-kaproli-name-text`, `book-kaproli-nip-text`, `book-guru-name-text`, `book-guru-nip-text`: LULUS (`True`).
  - Cache Service Worker: `shotqu-v2.5.8`.
  - Server HTTP: HTTP 200 OK.

---

## 🎨 Penyempurnaan Tata Letak Pernyataan Pengesahan & Lembar Verifikasi Master (v2.5.9)

### 1. 🎯 Kebutuhan Pengguna:
- Memperbaiki tata letak kotak pernyataan pengesahan (*approval statement box*) pada **Lembar Pengesahan Master Production Book** (`#sec-pengesahan`), yang sebelumnya tampak seperti satu paragraf teks datar panjang yang melebar penuh tanpa hierarki visual yang jelas.
- Menyelaraskan lebar kotak pernyataan dengan grid 4 tanda tangan (`.book-sign-grid-4`) agar seimbang secara simetris di tengah halaman A4 Lanskap.
- Meningkatkan wibawa dan estetika formal dokumen standar industri perfilman dan instansi pendidikan.

### 2. 🚀 Rincian Implementasi & Perbaikan Tata Letak:
- **Hierarki Visual & Tipografi Pernyataan Terpusat:**
  - Menghilangkan teks datar yang bertumpuk kapital semua.
  - Memisahkan elemen menjadi 3 tingkat hierarki yang elegan:
    1. **Teks Pengantar:** `Buku Produksi (Production Book) untuk karya film berjudul:` (font sedang, warna seimbang `#475569`).
    2. **Judul Film Utama:** Ditonjolkan di baris tersendiri dengan font tebal 13pt, huruf kapital tegap, dan kelas reaktif `.pengesahan-title-text`.
    3. **Kalimat Pernyataan & Identitas Lembaga:** Diformat rapi dengan jarak antar baris proporsional, serta memisahkan nama Program Keahlian dan nama SMKN ke baris tersendiri menggunakan helper `formatTitleCase` formal.
- **Penyelarasan Kolom Simetris (Max-Width 820px):**
  - Kotak pernyataan `.pengesahan-statement-box` disetel dengan `max-width: 820px; margin: 0 auto 24px auto;` sehingga lebarnya sejajar presisi dengan kotak 4 tanda tangan di bawahnya.
  - Tampilan cetak A4 Lanskap (`@media print`) dan tampilan layar desktop kini membentuk satu kolom dokumen resmi yang harmonis dan proporsional.
- **Pembersihan Garis Tanda Tangan (.book-sign-grid-4):**
  - Mengatur `border-top: none;` untuk tanda tangan di dalam `.book-sign-grid-4` (baik di layar maupun saat dicetak) sehingga tidak ada garis putus-putus acak di atas gelar tanda tangan.
- **Dukungan Reaktivitas Real-Time:**
  - Perubahan pada judul film (`data-k="title"`), produser (`data-k="kru_produser"`), dan sutradara (`data-k="kru_sutradara"`) langsung memperbarui teks di Lembar Pengesahan secara instan tanpa perlu reload.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.5.9`**.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_pengesahan_v259.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_pengesahan_v259.ps1):
  - Keseimbangan tag HTML: 531 Div buka / 531 Div tutup (100% seimbang).
  - Keberadaan kelas `pengesahan-statement-box`, `pengesahan-title-text`, `formatTitleCase`: LULUS.
  - Penanda kelas reaktif `book-produser-name-text`, `book-sutradara-name-text`, `book-kaproli-name-text`, `book-guru-name-text`: LULUS.
  - Penyelarasan print style `border-top: none !important`: LULUS.
  - Cache Service Worker: `shotqu-v2.5.9`.
  - Server HTTP: HTTP 200 OK.

---

## 🔒 Penyembunyian Tombol Login Guru di Navigasi Utama (v2.6.0)

### 1. 🎯 Kebutuhan Pengguna:
- Menyembunyikan tombol navigasi `🔐 Login Guru` (ikon gembok kuning berkilau dengan border emas) yang sebelumnya tampil mencolok di bilah navigasi atas (*navbar header*).

### 2. 🚀 Rincian Implementasi:
- **Pembersihan di Halaman Beranda ([landing.html](file:///f:/APPPSPT/shotlist/landing.html)):**
  - Menghapus tautan tombol `🔐 Login Guru` dari wadah `.nav-actions` pada header atas.
  - Header beranda kini hanya menampilkan tombol aksi utama `🎬 Buka ShotQu ➔` yang bersih dan fokus pada siswa.
- **Pembersihan di Aplikasi Utama ([index.html](file:///f:/APPPSPT/shotlist/index.html)):**
  - Mengubah fungsi `updateHeaderAuth()` agar saat pengguna belum login sebagai guru/admin (`!isAdmin()`), elemen `#auth-header-btn-wrap` tetap kosong (`authWrap.innerHTML = ''`), sehingga tombol `🔐 Login Guru` tidak muncul di header aplikasi.
  - Akun guru yang telah login tetap dapat mengakses dashboard dan tombol logout (`👑 [Nama] 🚪`) secara normal.
  - Halaman login mandiri tetap dapat diakses secara langsung oleh guru/admin melalui URL `/login.html`.
- **Pembaruan Service Worker ([sw.js](file:///f:/APPPSPT/shotlist/sw.js)):**
  - Versi cache dinaikkan menjadi **`shotqu-v2.6.0`**.

### 3. 🧪 Hasil Pengujian:
- Verifikasi skrip [verify_hide_login_guru.ps1](file:///C:/Users/SIP/.gemini/antigravity-ide/brain/ca11dadf-8837-4e49-847b-4add49b65dc5/scratch/verify_hide_login_guru.ps1):
  - Tombol `🔐 Login Guru` di navbar `landing.html`: Terhapus/Tersembunyi (LULUS).
  - Tombol `Login Guru` di header `index.html`: Tersembunyi saat belum login (LULUS).
  - Keseimbangan tag HTML di `landing.html` (40 Div) dan `index.html` (531 Div): 100% seimbang (LULUS).
  - Cache Service Worker: `shotqu-v2.6.0`.
  - Respon HTTP: 200 OK untuk `landing.html` dan `index.html`.


