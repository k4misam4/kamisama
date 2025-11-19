use clap::{CommandFactory, Parser, Subcommand};
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
        text: Vec<String>,
         #[arg(short = 'c', long = "char", default_value = "-")]
        separator: String
    },

    #[command(name = "version")]
    Version,

    #[command(name = "-v")]
    VersionShort
}

fn to_slug(input: &str, sep: &str) -> String {
    let normalized: String = input.nfd()
        .filter(|c| !is_combining_mark(*c))
        .collect();

    let lower = normalized.to_lowercase();

    let re = Regex::new(r"[^a-z0-9]+").unwrap();
    let mut slug = re.replace_all(&lower, sep).to_string();

    let re_multi = Regex::new(&format!("{}{{2,}}", regex::escape(sep))).unwrap();
    slug = re_multi.replace_all(&slug, sep).to_string();
    
    slug = slug.trim_matches(|c| sep.contains(c)).to_string();

    if slug.is_empty() {
        "n-a".to_string()
    } else {
        slug
    }
}

fn main() {
    let cli = Cli::parse();

    if cli.command.is_none() {
        Cli::command().print_help().unwrap();
        println!("help");
        return;
    }

    if let Some(cmd) = cli.command {
        match cmd {
            Commands::MakeSlug { text, separator } => {
                println!("{}", to_slug(&text.join(" "), &separator));
            },
            Commands::Version | Commands::VersionShort => {
                println!("{VERSION}");
            },
        }
        return;
    }
}
