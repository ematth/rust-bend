use std::io;

fn main() {
    let mut string = String::new();
    io::stdin()
        .read_line(&mut string)
        .expect("how?");

    let (fw, num) = first_word(&string);
    println!("first word -> {}, length -> {}", fw, num);
}

fn first_word(s: &String) -> (&str, usize) {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return (&s[0..i], i);
        }
    }
    return (&s, s.len())
}
