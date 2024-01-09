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

    fs::create_dir("src/grammar").ok();
    let mod_rs = "src/grammar/mod.rs";
    let include_commands = "pub use bertalanglexer::*;
                                  pub use bertalangvisitor::*;
                                  pub use bertalanglistener::*;
                                  pub use bertalangparser::*;
                                  #[rustfmt::skip]
                                  pub mod bertalanglexer;
                                  #[rustfmt::skip]
                                  pub mod bertalangvisitor;
                                  #[rustfmt::skip]
                                  pub mod bertalanglistener;
                                  #[rustfmt::skip]
                                  #[allow(unused_parens)]
                                  #[allow(unused_braces)]
                                  pub mod bertalangparser;";
    let mut file = File::create(mod_rs)?;
    file.write_all(include_commands.as_bytes())?;

    Ok(())
}
