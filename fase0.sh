#!/usr/bin/env bash
set -euo pipefail

cat <<'EOF'
Fase 0 - Validasi lingkungan Jetson Nano
EOF

echo "1. Memeriksa platform dan sistem operasi..."
uname -a

if [ -f /etc/nv_tegra_release ]; then
  echo "Detected NVIDIA Tegra Linux environment."
else
  echo "WARNING: This does not look like Jetson Nano / L4T." >&2
fi

echo "\n2. Memeriksa Python dan pip..."
command -v python3 >/dev/null 2>&1 && python3 --version || {
  echo "Python3 tidak ditemukan. Silakan install Python 3.10+." >&2
  exit 1
}
command -v pip3 >/dev/null 2>&1 && pip3 --version || echo "pip3 tidak ditemukan. Coba install python3-pip."

echo "\n3. Memeriksa jaringan..."
if command -v ip >/dev/null 2>&1; then
  ip addr show | grep -E 'inet ' | sed -n '1,5p'
else
  ifconfig | grep -E 'inet ' | head -n 5
fi

echo "\n4. Memeriksa kamera dan perangkat video..."
if command -v v4l2-ctl >/dev/null 2>&1; then
  v4l2-ctl --list-devices || true
else
  echo "v4l2-ctl tidak ditemukan. Untuk menginstal: sudo apt update && sudo apt install -y v4l-utils"
fi

if command -v gst-launch-1.0 >/dev/null 2>&1; then
  echo "GStreamer tersedia. Menyusun pipeline kamera sederhana jika perangkat terdeteksi..."
  echo "Gunakan: gst-launch-1.0 v4l2src device=/dev/video0 ! videoconvert ! autovideosink" atau "gst-launch-1.0 nvarguscamerasrc ! nvoverlaysink"
else
  echo "GStreamer tidak ditemukan. Pasang dengan: sudo apt install -y gstreamer1.0-tools gstreamer1.0-plugins-base"
fi

echo "\n5. Memeriksa dependensi Python awal..."
PYTHON_PACKAGES=(opencv-python opencv-python-headless numpy aiohttp fastapi uvicorn)
for pkg in "${PYTHON_PACKAGES[@]}"; do
  python3 -c "import ${pkg%%-*}" >/dev/null 2>&1 && echo "OK: $pkg" || echo "Missing: $pkg"
done

cat <<'EOF'

Selesai. Jika ada dependensi yang hilang, instal sesuai pesan di atas.
EOF
