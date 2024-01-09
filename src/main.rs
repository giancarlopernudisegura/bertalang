use clap::Parser;
use std::{fs::File, io::Read};

const AUTHOR: &str = "Giancarlo Pernudi Segura";
const VERSION: &str = "0.1.0";
const ABOUT: &str = "A simple command line tool to transform JSON files.";

#[derive(Parser, Debug)]
#[command(author=AUTHOR, version=VERSION, about=ABOUT, long_about=None, arg_required_else_help=true)]
struct Args {
    filename: String,
    #[clap(short, long, help = "Output file name")]
    output: Option<String>,
}

fn main() -> std::io::Result<()> {
    let args = Args::parse();
    let mut input = String::new();
    File::open(args.filename)?.read_to_string(&mut input)?;
    let output_filename = args.output.unwrap_or("a.out".to_string());
    Ok(())
}
