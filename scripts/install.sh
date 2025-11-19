#!/usr/bin/env bash
set -e

REPO="k4misam4/kamisama"
INSTALL_DIR="$HOME/.kamisama/bin"
BIN_NAME="kamisama-x86_64-linux"

detect_platform() {
    case "$(uname -s)" in
        Linux*)   OS="linux" ;;
        Darwin*)  OS="macos" ;;
        *) echo "Sistema operacional não suportado."; exit 1 ;;
    esac

    case "$(uname -m)" in
        x86_64) ARCH="x86_64" ;;
        arm64|aarch64) ARCH="aarch64" ;;
        *) echo "Arquitetura não suportada."; exit 1 ;;
    esac

    echo "${ARCH}-${OS}"
}

download_binary() {
    PLATFORM=$(detect_platform)
    URL="https://raw.githubusercontent.com/${REPO}/main/releases/${BIN_NAME}-${PLATFORM}"

    echo "➡ Baixando ${BIN_NAME} (${PLATFORM})..."
    curl -fsSL "$URL" -o "$INSTALL_DIR/$BIN_NAME"
    chmod +x "$INSTALL_DIR/$BIN_NAME"
}

ensure_path() {
    if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
        echo "➡ Adicionando $INSTALL_DIR ao PATH..."

        SHELL_RC="$HOME/.bashrc"
        [ -n "$ZSH_VERSION" ] && SHELL_RC="$HOME/.zshrc"
        [ -n "$FISH_VERSION" ] && SHELL_RC="$HOME/.config/fish/config.fish"

        echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$SHELL_RC"
        echo "✔ PATH atualizado. Reinicie o terminal."
    fi
}

main() {
    mkdir -p "$INSTALL_DIR"
    download_binary
    ensure_path

    echo
    echo "🎉 Instalação concluída!"
    echo "Use:  kamisama make:slug \"Olá mundo\""
}

main
