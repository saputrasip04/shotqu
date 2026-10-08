# PRD - Shot List Breakdown PWA

## Tujuan
Membantu sutradara/DoP mengisi dokumen pra-produksi "Storyline & Shot List Breakdown" dalam bentuk tabel standar industri dari handphone, offline, lalu mencetaknya sebagai PDF.

## Pengguna
Sutradara, DoP, asisten produksi, dan kreator video independen. Pemakaian utama: HP di lokasi/rapat, cetak dari laptop.

## Fitur (MVP)
1. Data produksi: judul, mood, target durasi (detik), target jumlah shot.
2. Adegan: slugline + deskripsi naratif; banyak adegan per proyek.
3. Shot per adegan: deskripsi, Type of Shot, Movement, Angle, durasi (detik), keterangan editing/audio.
4. Tabel 9 kolom: No Adegan | Adegan | No Shot | Deskripsi Shot | Type | Movement | Angle | Durasi | Keterangan.
5. Total durasi dan jumlah shot otomatis; dibandingkan dengan target.
6. Cetak PDF (A4 landscape) lewat dialog cetak browser.
7. Simpan otomatis lokal; ekspor/impor JSON; muat contoh; kosongkan data.
8. PWA: bisa di-install dan jalan offline.

## Aturan domain
- Type: ELS, LS, FS, MS, CU, ECU, Drone Aerial.
- Movement: Static (Stay), Pan Left/Right, Tilt Up/Down, Dolly/Tracking, Handheld, Gimbal Follow.
- Angle: Eye Level, Low Angle, High Angle, Bird's Eye View, Worm's Eye, Dutch Angle.
- Keterangan: Hard Cut, J-Cut, L-Cut, Jump Cut, Match Cut, Timelapse, Slow Motion, audio.

## Kriteria penerimaan
- Semua input bisa diisi dari layar 360 px tanpa scroll horizontal di Editor.
- Refresh/tutup browser tidak menghilangkan data.
- PDF memuat judul, mood, tabel utuh, dan baris TOTAL; baris tidak terpotong di tengah halaman.
- Berjalan offline setelah kunjungan pertama.

## Di luar cakupan (v2)
Akun/cloud sync, multi-proyek, storyboard gambar, kolom lensa/fps/aspect ratio, kolaborasi.
