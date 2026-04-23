**PRODUCT REQUIREMENTS DOCUMENT**

**Interactive Conservation System**

*AI-Vision Edition*

Berbasis Jetson Nano + Logitech C922 \| Versi 1.0 \| 2025

  ------------------ ----------------------------------------------------
  **Versi Dokumen**  1.0

  **Status**         Draft --- Untuk Tinjauan Internal

  **Tanggal Dibuat** 2025

  **Pemilik Produk** \[Nama PIC / Tim\]

  **Hardware Utama** NVIDIA Jetson Nano 4GB / Orin Nano

  **Kamera**         Logitech C922 Pro Stream Webcam

  **Target Rilis**   \[Q --- Tahun\]
  ------------------ ----------------------------------------------------

**1. Ringkasan Eksekutif**

Interactive Conservation System (ICS) adalah instalasi edukasi
interaktif berbasis kecerdasan buatan yang dirancang untuk meningkatkan
kesadaran konservasi lingkungan melalui pengalaman visual generatif yang
imersif. Sistem ini mendeteksi kehadiran dan gerakan pengunjung secara
real-time menggunakan kamera Logitech C922, lalu menerjemahkan interaksi
fisik tersebut menjadi seni visual 3D yang responsif dan konten edukatif
bertahap (progressive disclosure).

Dengan memanfaatkan kemampuan edge computing NVIDIA Jetson Nano dan
teknik akselerasi AI melalui TensorRT, sistem mampu berjalan mandiri
tanpa ketergantungan internet, menjadikannya cocok untuk deployment di
museum, pusat sains, kebun binatang, dan lokasi konservasi terpencil.

**2. Latar Belakang & Konteks**

**2.1 Masalah yang Diselesaikan**

Media edukasi konservasi tradisional (papan display, brosur, video
statis) gagal menciptakan keterlibatan yang bermakna bagi pengunjung
modern, khususnya generasi muda. Studi menunjukkan bahwa pembelajaran
berbasis pengalaman interaktif meningkatkan retensi informasi hingga 75%
dibandingkan metode pasif.

**2.2 Peluang**

- Demand tinggi dari institusi museum dan pusat sains untuk instalasi
  yang engaging

- Ketersediaan hardware edge AI terjangkau (Jetson Nano) yang matang
  secara ekosistem

- Teknologi visualisasi web (Three.js + WebGL) yang semakin powerful
  untuk real-time rendering

- Gap di pasar untuk solusi edukasi konservasi yang bersifat turn-key
  dan offline-capable

**3. Tujuan Produk**

**3.1 Tujuan Bisnis**

1.  Menciptakan instalasi edukasi konservasi yang dapat di-deploy di
    berbagai venue dalam waktu \< 4 jam

2.  Menghasilkan produk yang dapat dijual/lisensi ke institusi
    pendidikan dan konservasi

3.  Membangun portofolio demonstrasi kapabilitas AI-vision interaktif

**3.2 Tujuan Pengguna**

4.  Pengunjung memahami setidaknya 2 fakta konservasi baru per sesi
    interaksi

5.  Pengunjung menghabiskan rata-rata \> 3 menit berinteraksi dengan
    instalasi

6.  Net Promoter Score (NPS) instalasi ≥ 40

**3.3 Tujuan Teknis**

7.  Akurasi deteksi kehadiran pengunjung ≥ 90%

8.  Latency dari deteksi ke respon visual \< 200ms

9.  Sistem mampu berjalan 8 jam kontinu tanpa restart

10. Konsumsi daya total instalasi \< 30W

**4. Ruang Lingkup**

**4.1 Dalam Lingkup (In-Scope)**

- Modul deteksi kehadiran dan tracking gerakan pengunjung via kamera
  Logitech C922

- Pipeline AI pada Jetson Nano dengan akselerasi TensorRT untuk deteksi
  YOLOv8 / MediaPipe

- Server lokal (FastAPI) untuk komunikasi WebSocket antara Jetson Nano
  dan frontend

- Engine visualisasi Three.js dengan particle system GLSL yang responsif
  terhadap input

- Sistem konten edukatif 4-level dengan progressive disclosure berbasis
  durasi interaksi

- Database lokal (PostgreSQL/Supabase) untuk manajemen konten dan
  logging sesi

- Dashboard admin sederhana untuk update konten edukatif tanpa coding

- Dokumentasi deployment dan panduan operasional

**4.2 Di Luar Lingkup (Out-of-Scope)**

- Aplikasi mobile companion (fase berikutnya)

- Konektivitas cloud atau sinkronisasi data jarak jauh (fase berikutnya)

- Dukungan multi-bahasa (hanya Bahasa Indonesia untuk v1.0)

- Gamifikasi dengan sistem poin atau leaderboard

- Integrasi dengan sistem tiket atau CRM venue

**5. Pengguna & Personas**

  -----------------------------------------------------------------------
  **Persona**       **Deskripsi**     **Kebutuhan       **Pain Point**
                                      Utama**           
  ----------------- ----------------- ----------------- -----------------
  Pengunjung Umum   Usia 8--45 tahun, Pengalaman        Bosan dengan
  (Primer)          datang ke         menyenangkan,     display statis,
                    museum/pusat      informasi mudah   informasi terlalu
                    sains             dicerna           teknis

  Pengunjung Anak   Usia 6--12 tahun, Interaksi fisik,  Rentang perhatian
  (Primer)          sering dalam      visual menarik,   pendek, teks
                    kelompok sekolah  gamifikasi ringan terlalu panjang

  Operator Venue    Staf museum /     Sistem mudah      Sistem sering
  (Sekunder)        kurator           dioperasikan,     error, sulit
                                      minim maintenance update konten

  Pengelola Konten  Tim edukasi /     Update konten     Butuh developer
  (Sekunder)        konten creator    mudah tanpa       untuk setiap
                                      keahlian teknis   perubahan konten
  -----------------------------------------------------------------------

**6. Arsitektur Sistem**

**6.1 Diagram Arsitektur (Ringkasan Teks)**

Sistem terdiri dari empat layer utama yang berkomunikasi secara
sequential:

  -----------------------------------------------------------------------
  **Layer**         **Komponen**      **Teknologi**     **Fungsi**
  ----------------- ----------------- ----------------- -----------------
  L1 --- Sensing    Kamera Input      Logitech C922     Menangkap frame
                                      (USB 3.0,         video pengunjung
                                      1080p/60fps)      

  L2 --- Edge AI    Jetson Nano (4GB) JetPack SDK +     Memproses frame,
                                      TensorRT + Python menjalankan model
                                                        deteksi

  L3 --- Komunikasi Local Server      FastAPI +         Mengirim data
                                      WebSocket         koordinat ke
                                      (Socket.io)       frontend
                                                        (\<200ms)

  L4 ---            Web Frontend      Three.js + GLSL + Merender particle
  Visualisasi                         React/Vue.js      art & konten
                                                        edukatif

  L5 ---            Database          PostgreSQL /      Menyimpan konten
  Persistensi                         Supabase (lokal)  & log sesi
                                                        interaksi
  -----------------------------------------------------------------------

**6.2 Hardware Specifications**

  -----------------------------------------------------------------------
  **Komponen**            **Spesifikasi**         **Justifikasi
                                                  Pemilihan**
  ----------------------- ----------------------- -----------------------
  NVIDIA Jetson Nano 4GB  Quad-core ARM A57 @     Edge AI terjangkau,
                          1.43GHz, 128-core       ekosistem matang,
                          Maxwell GPU, 4GB LPDDR4 mendukung TensorRT

  Logitech C922 Pro       1080p/30fps atau        USB plug-and-play,
                          720p/60fps, autofocus,  driver stabil di Linux,
                          low-light correction    FoV 78°

  Storage                 MicroSD 64GB (Class     OS di MicroSD, dataset
                          10) + USB SSD 256GB     & model di USB SSD
                          (opsional)              

  Display                 Monitor/Proyektor HDMI  Output visualisasi
                          ≥ 42 inci, resolusi     utama untuk pengunjung
                          1080p                   

  Power                   Adaptor 5V/4A           Total estimasi \< 30W
                          (Jetson) + USB power    
                          (kamera)                
  -----------------------------------------------------------------------

**7. Fitur & Persyaratan Fungsional**

**7.1 Modul F1: Deteksi Pengunjung**

Deskripsi: Sistem mendeteksi kehadiran dan posisi pengunjung di depan
instalasi menggunakan kamera Logitech C922 yang terhubung ke Jetson
Nano.

  ---------------------------------------------------------------------------
  **ID**            **Requirement**   **Prioritas**     **Kriteria
                                                        Penerimaan**
  ----------------- ----------------- ----------------- ---------------------
  F1-01             Sistem mendeteksi Must Have         Deteksi berhasil ≥
                    manusia dalam                       90% dalam kondisi
                    jangkauan 0.5m --                   pencahayaan normal
                    3m dari kamera                      (\>100 lux)

  F1-02             Sistem mendeteksi Must Have         Koordinat diperbarui
                    koordinat x,y                       ≥ 15 fps dengan error
                    posisi pengunjung                   posisi \< 5% lebar
                    dalam frame                         frame

  F1-03             Sistem mendeteksi Should Have       MediaPipe hand
                    gerakan tangan                      tracking mengenali 5
                    sebagai trigger                     gesture dasar dengan
                    interaksi                           akurasi ≥ 80%
                    (opsional v1)                       

  F1-04             Model berjalan    Must Have         Inference time ≤ 30ms
                    dengan akselerasi                   per frame pada
                    TensorRT di                         resolusi 640x480
                    Jetson Nano                         

  F1-05             Sistem menangani  Must Have         Menampilkan
                    kondisi tidak ada                   screensaver/attract
                    pengunjung (idle                    loop setelah 30 detik
                    state)                              tanpa deteksi
  ---------------------------------------------------------------------------

**7.2 Modul F2: Komunikasi Real-Time**

  -----------------------------------------------------------------------
  **ID**            **Requirement**   **Prioritas**     **Kriteria
                                                        Penerimaan**
  ----------------- ----------------- ----------------- -----------------
  F2-01             FastAPI server    Must Have         Server aktif pada
                    berjalan sebagai                    boot,
                    local WebSocket                     auto-restart jika
                    server                              crash

  F2-02             Data koordinat    Must Have         End-to-end
                    dikirim ke                          latency (deteksi
                    frontend via                        → render) \<
                    WebSocket                           200ms

  F2-03             Koneksi WebSocket Must Have         Reconnect dalam
                    otomatis                            \< 3 detik tanpa
                    reconnect jika                      intervensi manual
                    terputus                            

  F2-04             Format data JSON  Should Have       Payload per frame
                    yang efisien                        \< 1KB
                    untuk minimasi                      
                    payload                             
  -----------------------------------------------------------------------

**7.3 Modul F3: Visualisasi Interaktif**

  -----------------------------------------------------------------------
  **ID**            **Requirement**   **Prioritas**     **Kriteria
                                                        Penerimaan**
  ----------------- ----------------- ----------------- -----------------
  F3-01             Particle system   Must Have         Partikel bergerak
                    3D yang responsif                   mengikuti posisi
                    terhadap posisi                     dalam \< 100ms
                    pengunjung                          

  F3-02             Frame rate        Must Have         ≥ 30 FPS pada
                    visualisasi                         hardware target
                    stabil                              (browser dengan
                                                        WebGL)

  F3-03             Tema visual       Must Have         Setidaknya 3
                    terinspirasi                        tema: Hutan
                    elemen                              Hujan, Terumbu
                    alam/konservasi                     Karang, Satwa
                                                        Liar

  F3-04             Transisi visual   Should Have       Transisi ≤ 1.5
                    yang smooth antar                   detik, tidak ada
                    state (idle →                       popping/glitch
                    aktif → konten)                     
  -----------------------------------------------------------------------

**7.4 Modul F4: Konten Edukatif Progressive Disclosure**

Sistem menyajikan konten dalam 4 level berdasarkan lama interaksi
pengunjung:

  -----------------------------------------------------------------------
  **Level**         **Trigger**       **Konten**        **Contoh Topik**
  ----------------- ----------------- ----------------- -----------------
  Level 1 ---       0--30 detik       Fakta singkat,    \"Hutan hujan
  Awareness         interaksi         visual dominan    menutupi 6% bumi
                                                        namun menampung
                                                        50% spesies\"

  Level 2 ---       30--90 detik      Infografis        Laju deforestasi
  Curiosity         interaksi         sederhana + angka per tahun,
                                      kunci             spesies terancam
                                                        punah

  Level 3 ---       90--180 detik     Narasi penyebab & Rantai makanan,
  Knowledge         interaksi         dampak            dampak perubahan
                                                        iklim terhadap
                                                        ekosistem

  Level 4 ---       \> 180 detik      Call-to-action &  QR code donasi,
  Action            interaksi         info organisasi   langkah nyata
                                                        yang bisa
                                                        dilakukan
  -----------------------------------------------------------------------

**7.5 Modul F5: Manajemen Konten & Data**

  -----------------------------------------------------------------------
  **ID**            **Requirement**   **Prioritas**     **Kriteria
                                                        Penerimaan**
  ----------------- ----------------- ----------------- -----------------
  F5-01             Admin dashboard   Must Have         Non-developer
                    untuk update                        dapat update teks
                    konten edukatif 4                   & gambar tanpa
                    level                               coding

  F5-02             Logging sesi      Must Have         Log tersimpan di
                    interaksi                           database lokal,
                    (durasi, level                      export ke CSV
                    dicapai,                            
                    timestamp)                          

  F5-03             Laporan ringkasan Should Have       Menampilkan total
                    mingguan                            sesi, rata-rata
                    penggunaan                          durasi,
                    instalasi                           distribusi level
  -----------------------------------------------------------------------

**8. Persyaratan Non-Fungsional**

  -----------------------------------------------------------------------
  **Kategori**            **Requirement**         **Target Metrik**
  ----------------------- ----------------------- -----------------------
  Performa                Latency deteksi ke      \< 200ms end-to-end
                          respons visual          

  Performa                Akurasi deteksi         ≥ 90% dalam kondisi
                          pengunjung              standar

  Performa                Frame rate visualisasi  ≥ 30 FPS pada display
                                                  target

  Keandalan               Uptime sistem saat jam  ≥ 99% (\< 5 menit
                          operasional             downtime/hari)

  Keandalan               Operasi kontinyu tanpa  ≥ 8 jam
                          restart                 

  Keandalan               Auto-recovery setelah   \< 60 detik waktu
                          crash                   recovery otomatis

  Keamanan                Akses admin dashboard   Dilindungi password,
                                                  akses hanya via
                                                  jaringan lokal

  Privasi                 Penyimpanan data gambar TIDAK menyimpan
                          pengunjung              gambar/video
                                                  pengunjung, hanya
                                                  koordinat

  Pemeliharaan            Update konten tanpa     Hot-reload konten tanpa
                          restart sistem          downtime

  Lingkungan              Suhu operasional Jetson Thermal throttling
                          Nano                    tidak terjadi saat idle
                                                  pada suhu ruang ≤ 35°C
  -----------------------------------------------------------------------

**9. User Stories Utama**

**Epic 1: Pengunjung Berinteraksi dengan Instalasi**

- US-01: Sebagai pengunjung, saya ingin melihat visualisasi berubah saat
  saya mendekati layar, agar saya merasa tertarik untuk berinteraksi
  lebih lanjut.

- US-02: Sebagai pengunjung, saya ingin menerima informasi konservasi
  yang semakin mendalam semakin lama saya berdiri di depan instalasi,
  agar saya belajar tanpa merasa dipaksa.

- US-03: Sebagai pengunjung anak, saya ingin partikel mengikuti tangan
  saya bergerak, agar saya merasa seperti \'mengontrol alam\'.

- US-04: Sebagai pengunjung, saya ingin mendapatkan saran aksi nyata
  setelah berinteraksi lama, agar saya tahu cara berkontribusi pada
  konservasi.

**Epic 2: Operator & Admin Mengelola Instalasi**

- US-05: Sebagai operator venue, saya ingin sistem menyala otomatis dan
  langsung berfungsi tanpa konfigurasi, agar tidak perlu keahlian teknis
  untuk mengoperasikan.

- US-06: Sebagai pengelola konten, saya ingin mengubah teks dan gambar
  konten edukatif melalui interface web sederhana, agar konten selalu
  relevan tanpa memanggil developer.

- US-07: Sebagai manajer venue, saya ingin melihat laporan seberapa lama
  pengunjung berinteraksi, agar dapat mengevaluasi efektivitas
  instalasi.

**10. Detail Stack Teknis**

**10.1 Edge Computing --- Jetson Nano**

  -----------------------------------------------------------------------
  **Komponen**            **Teknologi**           **Versi / Catatan**
  ----------------------- ----------------------- -----------------------
  Operating System        NVIDIA JetPack SDK (L4T JetPack 5.x atau 6.x
                          --- Linux for Tegra)    (Ubuntu 20.04/22.04
                                                  base)

  Computer Vision         OpenCV + MediaPipe      Gesture detection; atau
                                                  YOLOv8 untuk deteksi
                                                  orang

  AI Acceleration         TensorRT                Optimasi model untuk
                                                  latency \< 30ms/frame

  API Server              FastAPI (Python)        Async WebSocket
                                                  endpoint, auto-restart
                                                  via systemd

  Runtime                 Python 3.8+             Skrip utama pipeline
                                                  deteksi → koordinat
  -----------------------------------------------------------------------

**10.2 Frontend --- Visualisasi**

  -----------------------------------------------------------------------
  **Komponen**            **Teknologi**           **Catatan**
  ----------------------- ----------------------- -----------------------
  3D Engine               Three.js (Web-based)    Berjalan di browser
                                                  Chromium pada display
                                                  output

  Shader                  GLSL (fragment & vertex Particle system
                          shader)                 responsif, efek visual
                                                  alam

  Framework UI            React.js atau Vue.js    Manajemen state konten
                                                  4-level, admin
                                                  dashboard

  Real-time               Socket.io (WebSocket    Terima data koordinat
                          client)                 dari FastAPI Jetson
                                                  Nano
  -----------------------------------------------------------------------

**10.3 Data & Persistensi**

  -----------------------------------------------------------------------
  **Komponen**            **Teknologi**           **Catatan**
  ----------------------- ----------------------- -----------------------
  Database                PostgreSQL atau         Konten edukatif, log
                          Supabase (self-hosted)  sesi, konfigurasi
                                                  sistem

  ORM                     SQLAlchemy (Python) /   Untuk query dari
                          Prisma (JS)             FastAPI dan frontend

  Backup                  Cron job → export CSV   Simpan di USB storage
                          harian                  eksternal
  -----------------------------------------------------------------------

**11. Milestone & Timeline**

  ------------------------------------------------------------------------
  **Fase**          **Milestone**     **Deliverable**    **Estimasi
                                                         Durasi**
  ----------------- ----------------- ------------------ -----------------
  Fase 0 --- Setup  Environment &     Jetson Nano + C922 1 minggu
                    hardware siap     terkonfigurasi,    
                                      JetPack            
                                      ter-install        

  Fase 1 ---        Pipeline deteksi  Model              2 minggu
  Sensing           berjalan          YOLOv8/MediaPipe   
                                      berjalan di        
                                      Jetson, output     
                                      koordinat JSON     

  Fase 2 ---        WebSocket         FastAPI server     1 minggu
  Komunikasi        terhubung         streaming data ke  
                                      browser lokal,     
                                      latency terukur    

  Fase 3 ---        Particle art      Three.js scene     3 minggu
  Visualisasi       responsif         dengan particle    
                                      bereaksi terhadap  
                                      koordinat live     

  Fase 4 --- Konten 4-level content   Progressive        2 minggu
                    system            disclosure         
                                      berfungsi, konten  
                                      sample ter-load    
                                      dari DB            

  Fase 5 ---        Sistem            End-to-end         1 minggu
  Integrasi         terintegrasi      pipeline berjalan, 
                                      latency \< 200ms   
                                      terverifikasi      

  Fase 6 ---        User testing &    5 sesi user        2 minggu
  Testing           evaluasi          testing, ≥ 90%     
                                      deteksi accuracy   
                                      tercapai           

  Fase 7 ---        Deployment ke     Instalasi          1 minggu
  Deployment        venue             terpasang,         
                                      dokumentasi        
                                      lengkap, pelatihan 
                                      operator           
  ------------------------------------------------------------------------

**12. Risiko & Mitigasi**

  --------------------------------------------------------------------------------
  **ID**         **Risiko**     **Probabilitas**   **Dampak**     **Mitigasi**
  -------------- -------------- ------------------ -------------- ----------------
  R01            Akurasi        Sedang             Tinggi         Tambahkan lampu
                 deteksi \< 90%                                   infrared/LED
                 di kondisi                                       fill light;
                 pencahayaan                                      gunakan model
                 rendah                                           low-light
                                                                  variant

  R02            Thermal        Sedang             Sedang         Pasang heatsink
                 throttling                                       aktif (fan);
                 Jetson Nano di                                   monitor suhu
                 ruangan panas                                    dengan alarm di
                                                                  ≥ 80°C

  R03            Latency        Rendah             Sedang         Profiling
                 WebSocket                                        pipeline;
                 melebihi 200ms                                   fallback ke
                 di hardware                                      polling jika
                 lama                                             WebSocket tidak
                                                                  cukup cepat

  R04            Kamera C922    Rendah             Tinggi         Uji
                 tidak dikenali                                   kompatibilitas
                 driver di                                        di awal fase;
                 JetPack                                          siapkan fallback
                                                                  ke Pi Camera V2

  R05            Konten         Tinggi             Sedang         Batasi teks
                 edukatif                                         Level 1-2 maks
                 terlalu                                          20 kata;
                 teks-berat,                                      prioritaskan
                 pengunjung                                       ikon dan angka
                 tidak membaca                                    besar

  R06            Kartu microSD  Sedang             Tinggi         Gunakan overlay
                 corrupt karena                                   filesystem
                 power loss                                       (read-only
                 tiba-tiba                                        root); data di
                                                                  USB SSD terpisah
  --------------------------------------------------------------------------------

**13. Kriteria Penerimaan & Definisi Selesai**

**13.1 Definisi MVP (Minimum Viable Product)**

- Sistem mendeteksi kehadiran pengunjung dengan akurasi ≥ 90%

- Latency end-to-end (deteksi → visualisasi) \< 200ms secara konsisten

- Particle system Three.js merespons posisi pengunjung secara real-time

- Konten Level 1 dan Level 2 tampil berdasarkan durasi interaksi

- Sistem berjalan stabil selama 8 jam dalam sesi pengujian

**13.2 Kriteria Rilis Penuh**

- Semua 4 level konten edukatif tersedia dan terisi konten final

- Admin dashboard fungsional untuk update konten

- Logging sesi dan laporan dasar tersedia

- Dokumentasi deployment, panduan operasional, dan training operator
  selesai

- User testing dengan ≥ 20 partisipan, rata-rata durasi sesi ≥ 3 menit

- NPS ≥ 40 dari kuesioner post-sesi

**14. Appendix --- Referensi Teknis**

**A. Referensi Hardware**

- NVIDIA Jetson Nano Developer Kit:
  developer.nvidia.com/embedded/jetson-nano-developer-kit

- Logitech C922 Pro Stream Specs:
  logitech.com/en-us/products/webcams/c922-pro-stream-webcam.html

- JetPack SDK Documentation: developer.nvidia.com/embedded/jetpack

**B. Referensi Framework**

- YOLOv8 on Jetson Nano: docs.ultralytics.com/guides/nvidia-jetson

- MediaPipe Solutions: developers.google.com/mediapipe

- Three.js Documentation: threejs.org/docs

- FastAPI: fastapi.tiangolo.com

- Socket.io: socket.io/docs

**C. Glosarium**

  -----------------------------------------------------------------------
  **Istilah**                         **Definisi**
  ----------------------------------- -----------------------------------
  Edge Computing                      Pemrosesan data dilakukan di
                                      perangkat lokal (Jetson Nano),
                                      bukan di cloud

  TensorRT                            Library NVIDIA untuk mengoptimasi
                                      dan mengakselerasi model deep
                                      learning pada GPU NVIDIA

  GLSL                                OpenGL Shading Language --- bahasa
                                      pemrograman untuk shader di GPU
                                      yang digunakan Three.js

  Progressive Disclosure              Teknik UX di mana informasi
                                      diberikan secara bertahap sesuai
                                      tingkat keterlibatan pengguna

  WebSocket                           Protokol komunikasi bidirectional
                                      real-time antara server dan
                                      browser/client

  Particle System                     Teknik rendering di mana ribuan
                                      objek kecil (partikel)
                                      disimulasikan untuk membentuk efek
                                      visual

  Idle State                          Kondisi sistem saat tidak ada
                                      pengunjung terdeteksi; menampilkan
                                      attract loop
  -----------------------------------------------------------------------

**15. Persetujuan Dokumen**

  ----------------------------------------------------------------------------------------------------------------------------
  **Peran**         **Nama**                                 **Tanda Tangan**                         **Tanggal**
  ----------------- ---------------------------------------- ---------------------------------------- ------------------------
  Product Owner     \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_

  Tech Lead         \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_

  UX/Content Lead   \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_

  Stakeholder /     \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   \_\_\_\_\_\_\_\_\_\_\_
  Sponsor                                                                                             
  ----------------------------------------------------------------------------------------------------------------------------

*Dokumen ini bersifat hidup (living document) dan akan diperbarui
seiring perkembangan proyek. Setiap perubahan signifikan pada
persyaratan atau arsitektur harus direview oleh semua penandatangan di
atas.*
