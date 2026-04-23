# Fase 0 — Setup Environment & Hardware

## Tujuan
Menyiapkan Jetson Nano, perangkat kamera, dan lingkungan dasar sehingga proyek dapat masuk ke fase pengembangan berikutnya.

## Checklist

1. Perangkat keras
   - [ ] Jetson Nano (4GB atau Orin Nano) tersedia
   - [ ] Raspberry Pi Camera Module V2 atau USB Webcam (Logitech C922) terpasang
   - [ ] Catu daya memadai dan koneksi ke monitor/keyboard/mouse siap

2. Sistem operasi dan perangkat lunak dasar
   - [ ] JetPack SDK (L4T) terpasang pada Jetson Nano
   - [ ] SSH diaktifkan dan akses dari workstation tersedia
   - [ ] Sistem dapat diakses dari jaringan lokal

3. Pengujian awal kamera
   - [ ] Kamera terdeteksi oleh Jetson Nano
   - [ ] `gst-launch-1.0` atau `v4l2-ctl` dapat menangkap frame
   - [ ] Input video dasar berhasil ditampilkan di layar

4. Persiapan lingkungan pengembangan
   - [ ] Python 3.10+ tersedia
   - [ ] OpenCV terpasang
   - [ ] MediaPipe atau YOLOv8 dapat diinstal/ditargetkan
   - [ ] FastAPI/Flask siap untuk pengujian lokal

5. Dokumentasi
   - [ ] Foto/rekaman setup hardware tersimpan
   - [ ] Konfigurasi JetPack dan alamat IP dicatat
   - [ ] Hasil pengujian awal dicatat

## Cara Pakai

1. Pastikan file `fase0.sh` memiliki izin eksekusi:
   ```bash
   chmod +x fase0.sh
   ```
2. Jalankan skrip pada Jetson Nano:
   ```bash
   ./fase0.sh
   ```
3. Ikuti pesan output untuk melengkapi instalasi dan validasi.

## Catatan
Fase 0 adalah basis untuk fase berikutnya. Setelah semua poin selesai, tim dapat lanjut ke pengembangan deteksi dan komunikasi.
