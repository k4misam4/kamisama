#!/usr/bin/env bash
set -e

echo "🚀 Gerando binários para release..."

mkdir -p releases

# ============================
#  Linux x86_64
# ============================
echo "▶ Build: x86_64-unknown-linux-gnu"
rustup target add x86_64-unknown-linux-gnu >/dev/null 2>&1 || true
cargo build --release --target x86_64-unknown-linux-gnu

cp target/x86_64-unknown-linux-gnu/release/kamisama releases/kamisama-x86_64-linux
chmod +x releases/kamisama-x86_64-linux

# ============================
#  Linux ARM64
# ============================
echo "▶ Build: aarch64-unknown-linux-gnu"
rustup target add aarch64-unknown-linux-gnu >/dev/null 2>&1 || true
cargo build --release --target aarch64-unknown-linux-gnu

cp target/aarch64-unknown-linux-gnu/release/kamisama releases/kamisama-aarch64-linux
chmod +x releases/kamisama-aarch64-linux

# ============================
#  macOS x86_64
# ============================
echo "▶ Build: x86_64-apple-darwin"
rustup target add x86_64-apple-darwin >/dev/null 2>&1 || true
cargo build --release --target x86_64-apple-darwin

cp target/x86_64-apple-darwin/release/kamisama releases/kamisama-x86_64-macos
chmod +x releases/kamisama-x86_64-macos

# ============================
#  macOS ARM (Apple Silicon)
# ============================
echo "▶ Build: aarch64-apple-darwin"
rustup target add aarch64-apple-darwin >/dev/null 2>&1 || true
cargo build --release --target aarch64-apple-darwin

cp target/aarch64-apple-darwin/release/kamisama releases/kamisama-aarch64-macos
chmod +x releases/kamisama-aarch64-macos

echo ""
echo "🎉 Todos os binários foram gerados com sucesso!"
echo "Arquivos na pasta releases/:"
ls -lh releases
