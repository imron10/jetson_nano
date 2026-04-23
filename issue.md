# 🛠️ Tech Stack: Interactive Conservation System (AI-Vision Edition)

## 1. Sensing & Interaction (The "Eyes")

**Hardware:** 
- Jetson Nano (4GB/Orin Nano) + Raspberry Pi Camera Module V2 atau USB Webcam (Logitech C922)

**Vision Framework:** 
- OpenCV dengan MediaPipe (untuk deteksi tangan/gestur) atau YOLOv8 (untuk deteksi kehadiran pengunjung)

**Interaction Logic:** 
- Python-based script untuk memproses input kamera menjadi pemicu (trigger) visual

## 2. Edge Computing (The "Brain")

**OS:** 
- NVIDIA JetPack SDK (L4T - Linux for Tegra)

**Acceleration:** 
- TensorRT (untuk optimasi model AI agar deteksi mencapai akurasi $\ge 90\%$ dengan latency rendah)

**Communication:** 
- FastAPI atau Flask (sebagai local server untuk mengirimkan data koordinat deteksi ke frontend via WebSockets)

## 3. Visual & Generative Art (The "Experience")

**Engine:** 
- Three.js (Web-based 3D)

**Rendering:** 
- Shader Programming (GLSL) untuk particle system yang responsif

**Real-time Protocol:** 
- WebSockets (Socket.io) untuk memastikan data dari Jetson Nano ke visualisasi memiliki latency $<200ms$

## 4. Data & Content Management

**Database:** 
- Supabase atau PostgreSQL (untuk menyimpan konten edukatif 4-level dan hasil evaluasi user testing)

**Frontend Framework:** 
- React.js atau Vue.js untuk mengelola progressive disclosure konten
