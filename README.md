Aqui está o seu README bem mais bonito, organizado e profissional em Markdown:

# 🐾 kamisama

[![Release](https://img.shields.io/github/v/release/k4misam4/kamisama?color=blue&label=release)](https://github.com/k4misam4/kamisama/releases)
[![Rust](https://img.shields.io/badge/Rust-1.72%2B-orange?logo=rust)](https://www.rust-lang.org)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Stars](https://img.shields.io/github/stars/k4misam4/kamisama?style=social)](https://github.com/k4misam4/kamisama)

> **Uma CLI multiuso escrita em Rust — simples, rápida e feita para o seu terminal.**

**Autor:** Kami Sama  
**Lançamento:** 19 de novembro de 2025

---

## 📌 Sobre o projeto

**kamisama** é uma ferramenta de linha de comando poderosa e leve, criada para agrupar várias utilidades do dia a dia em um único binário veloz e confiável — tudo escrito em **Rust**.

### Funcionalidades atuais
- `make:slug` → Geração de slugs limpos e URL-friendly

### Em breve
- Consulta de cotações de criptomoedas em tempo real
- Envio rápido de SMS via API
- Mais ferramentas práticas do cotidiano

Feito com foco em **simplicidade, performance extrema e fácil extensibilidade**.

---

## 📦 Instalação

### Opção 1: Instalador rápido (recomendado)

```bash
curl -fsSL https://github.com/k4misam4/kamisama/raw/main/scripts/install.sh | sh
```

### Opção 2: Compilar do código-fonte

```bash
git clone https://github.com/k4misam4/kamisama.git
cd kamisama
cargo build --release
sudo cp target/release/kamisama /usr/local/bin/
```

## ⚡ Como usar

### `make:slug` — Gere slugs perfeitos instantaneamente

Transforma qualquer texto em um slug limpo, minúsculo, sem acentos ou caracteres especiais.

```bash
$ kamisama make:slug "Criação de Slug Super Útil! @2025"
# → criacao-de-slug-super-util-2025
```

#### Recursos
- Aceita múltiplos argumentos
- Totalmente compatível com comandos do shell

```bash
$ echo "ÁÉÍÓÚ çãõ ÇÃÕ" | kamisama make:slug
# → aeiou-cao-cao
```

```bash
$ kamisama make:slug "Olá Mundo Cruel 2025"
# → ola-mundo-cruel-2025
```

```bash
$ kamisama make:slug "Olá Mundo Cruel 2025" -c "+"
# → ola+mundo+cruel+2025
```

#### Ajuda integrada
```bash
$ kamisama --help
$ kamisama make:slug --help
$ kamisama help
$ kamisama version
```

---

## 🚀 Performance & Qualidade

| Característica                  | Detalhe                                      |
|----------------------------------|-----------------------------------------------|
| **Compilação**                   | LTO + otimizações agressivas (`opt-level = "z"`) |
| **Tamanho do binário**           | Extremamente pequeno                          |
| **Panic strategy**               | `panic = "abort"` (menor footprint)           |
| **PGO**                          | Suporte a Profile-Guided Optimization         |
| **Arquitetura**                  | Código modular, funções puras e testáveis     |
| **Extensibilidade**              | Novos subcomandos em poucos minutos           |

---

---

## 📄 Licença

Distribuído sob a licença **MIT**. Veja o arquivo [`LICENSE`](LICENSE) para mais detalhes.

---

Feito com ❤️ por **Kami Sama**  
Dê uma ⭐ no repositório se curtiu! → [github.com/k4misam4/kamisama](https://github.com/k4misam4/kamisama)
