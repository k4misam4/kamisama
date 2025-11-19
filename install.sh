#!/bin/bash
set -e

mkdir -p releases

echo "🚀 Iniciando build dos binários..."

build() {
    local target=$1
    local outfile=$2

    echo "▶ Build: $target"
    RUSTFLAGS="-C target-cpu=native" \
    cargo build --release --target $target

    BIN="target/$target/release/kamisama"
    if [ ! -f "$BIN" ]; then
        echo "❌ Erro: binário não encontrado em $BIN"
        exit 1
    fi

    cp "$BIN" "releases/$outfile"
    echo "✔ Gerado: releases/$outfile"
}

build x86_64-unknown-linux-gnu "kamisama-x86_64-linux"
build aarch64-unknown-linux-gnu "kamisama-aarch64-linux"

echo "🎉 Finalizado!"
