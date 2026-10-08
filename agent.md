# Agent

Dua bagian: (A) prompt yang sudah diperbaiki untuk membuat shot list dengan AI, (B) aturan untuk agen yang mengembangkan aplikasi ini.

## A. Prompt perbaikan: generator shot list

```
PERAN: Kamu Sutradara sekaligus Director of Photography profesional.
TUGAS: Buat Storyline & Shot List Breakdown dari data berikut.

DATA PRODUKSI
- Judul proyek: {judul}
- Adegan & lokasi (slugline): {contoh: SCENE 1 - INT. KAMAR TIDUR VITA - PAGI}
- Sinopsis aksi: {aksi berurutan}
- Mood / nuansa: {mood}
- Target durasi total: {min-maks detik}
- Jumlah shot: {min-maks}
- Opsional: rasio layar {16:9/9:16}, kamera/lensa, fps, referensi, aset audio

ATURAN
1. Terminologi:
   Type: ELS, LS, FS, MS, CU, ECU, Drone Aerial.
   Movement: Static (Stay), Pan Left/Right, Tilt Up/Down, Dolly/Tracking, Handheld, Gimbal Follow.
   Angle: Eye Level, Low Angle, High Angle, Bird's Eye View, Worm's Eye, Dutch Angle.
   Keterangan: Hard Cut, J-Cut, L-Cut, Jump Cut, Match Cut, Timelapse, Slow Motion + catatan audio.
2. Pacing: selang-seling shot subjek manusia dengan insert/B-roll lanskap; hindari 3 shot berturut-turut dengan type yang sama.
3. Setiap shot punya durasi (detik). Jumlah shot dan total durasi harus masuk rentang target; hitung total di baris akhir.
4. Penomoran: No Adegan 1.., No Shot per adegan (1.1, 1.2, ...).
5. Jika data ada yang kosong, buat asumsi wajar dan tulis di satu baris sebelum tabel.

OUTPUT: hanya satu tabel Markdown (setelah baris asumsi bila ada), tanpa teks lain:
| No Adegan | Adegan (Slugline & Deskripsi Naratif) | No Shot | Deskripsi Shot (Aksi / Visual) | Type of Shot | Movement | Angle | Durasi | Keterangan Editing / Audio |
Baris terakhir: TOTAL jumlah shot dan total durasi.
```

## B. Aturan agen pengembang
- Jangan menambah dependensi atau build step; tetap vanilla JS satu halaman.
- Pertahankan 9 kolom tabel dan urutannya persis seperti di prd.md.
- Daftar Type/Movement/Angle hanya diubah di konstanta `T`, `M`, `A`.
- Skema data mengikuti database.md; ubah skema = naikkan versi key + migrasi.
- Setelah mengubah berkas inti, naikkan versi cache di `sw.js`.
- Uji: layar 360 px, offline, refresh tidak menghilangkan data, hasil cetak A4 landscape.
