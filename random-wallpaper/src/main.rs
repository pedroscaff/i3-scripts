extern crate dirs;
use std::fs;
use rand::prelude::*;

fn main() {
    let home = match dirs::home_dir() {
        Some(path) => path,
        _ => panic!("home path is not defined"),
    };
    let pictures = fs::read_dir(format!("{}/Pictures/wallpapers/", home.display())).unwrap();
    let mut rng = rand::thread_rng();
    let count = pictures.count() as u32;
    let t: u32 = rng.gen_range(0, count);
    let mut pictures = fs::read_dir(format!("{}/Pictures/wallpapers/", home.display())).unwrap();
    let string = format!("{:?}", pictures.nth(t as usize).unwrap().unwrap().path());
    println!("{}", string.replace("\"", ""));
}
