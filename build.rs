use dotenv;
use std::fs;
use std::io::{self, Write};
use std::{fs::File, process::Command};

fn main() -> io::Result<()> {
    println!("cargo:rerun-if-changed=grammar/bertalang.g4");

    let antlr_jar = dotenv::var("ANTLR_JAR").expect("ANTLR_JAR must be set");
    println!("ANTLR_JAR: {}", antlr_jar);
    Command::new("java")
        .args(&[
            "-jar",
            antlr_jar.as_str(),
            "-Dlanguage=Rust",
            "-o",
            "src",
            "-visitor",
            "grammar/bertalang.g4",
        ])
        .output()
        .expect("Failed to execute command");

    Ok(())
}
