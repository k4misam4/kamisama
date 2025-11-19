use clap::{Parser, Subcommand};
use regex::Regex;
use unicode_normalization::{UnicodeNormalization, char::is_combining_mark};

const VERSION: &str = "kama-sama v0.0.1";

#[derive(Parser)]
#[command(name = "kamisama")]
#[command(about = "Ferramenta REPL simples para criar slugs", long_about = None)]
struct Cli {
    #[command(subcommand)]
    command: Option<Commands>,
}

#[derive(Subcommand)]
enum Commands {

    #[command(name = "make:slug")]
    MakeSlug {
        text: Vec<String>
    },

    #[command(name = "version")]
    Version,

    #[command(name = "-v")]
    VersionShort
}

fn to_slug(input: &str) -> String {
    let normalized: String = input.nfd()
        .filter(|c| !is_combining_mark(*c))
        .collect();

    let lower = normalized.to_lowercase();

    let re_non_alnum = Regex::new(r"[^a-z0-9]+").unwrap();
    let mut slug = re_non_alnum.replace_all(&lower, "-").to_string();

    let rm_multi_dash = Regex::new(r"-{2,}").unwrap();
    slug = rm_multi_dash.replace_all(&slug, "-").to_string();
    slug = slug.trim_matches('-').to_string();

    // 5) Se ficou vazio, usa "n-a"
    if slug.is_empty() {
        "n-a".to_string()
    } else {
        slug
    }
}

fn main() {
    let cli = Cli::parse();

    if let Some(cmd) = cli.command {
        match cmd {
            Commands::MakeSlug { text } => {
                println!("{}", to_slug(&text.join(" ")));
            },
            Commands::Version | Commands::VersionShort => {
                println!("{VERSION}");
            },
        }
        return;
    }
}
