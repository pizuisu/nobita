#!/bin/bash

# Cài đặt libsodium trong thư mục cá nhân
echo "🔧 Cài đặt libsodium..."
wget -q https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz
tar -xzf libsodium-1.0.18.tar.gz
cd libsodium-1.0.18
./configure --prefix=$HOME/.local --quiet
make --quiet && make install --quiet

# Thiết lập môi trường
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

# Tải Hellminer
echo "⚡ Tải Hellminer..."
wget -q https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz
tar -xf hellminer_linux64.tar.gz
chmod +x hellminer

# Chạy Hellminer với ví của bạn (hiển thị trực tiếp)
echo "🛠️ Đang khởi động miner với ví: RW7KCZLNJhHQ6FiTvAtk4DQVrFJrQNtZpm"
echo "📊 Hash rate sẽ hiển thị trực tiếp bên dưới:"
LD_LIBRARY_PATH=$HOME/.local/lib ./hellminer \
  -c stratum+tcp://eu.luckpool.net:3956 \
  -u RW7KCZLNJhHQ6FiTvAtk4DQVrFJrQNtZpm \
  -p x