use clipboard::{ClipboardContext, ClipboardProvider};

fn read_from_clipboard() -> Result<String, String> {
    let mut ctx: ClipboardContext = ClipboardProvider::new().map_err(|e| e.to_string())?;
    ctx.get_contents().map_err(|e| e.to_string())
}

fn write_to_clipboard(content: &str) -> Result<(), String> {
    let mut ctx: ClipboardContext = ClipboardProvider::new().map_err(|e| e.to_string())?;
    ctx.set_contents(content.to_string())
        .map_err(|e| e.to_string())
}

const AWS_CONSOLE_URL_REGEX: &str =
    r"^https://(\d{12}-[a-z\d]{8}\.)?[a-z\d\-]+\.console.aws.amazon.com/.*$";

fn remove_group_from_url(url: &str, regex: &str) -> Option<String> {
    let re = regex::Regex::new(regex).ok()?;
    if let Some(captures) = re.captures(url) {
        if let Some(group) = captures.get(1) {
            let modified_url = url.replacen(group.as_str(), "", 1);
            return Some(modified_url);
        }
    }
    None
}

fn replace_clipboard() {
    match read_from_clipboard() {
        Ok(content) => {
            if let Some(modified_url) = remove_group_from_url(&content, AWS_CONSOLE_URL_REGEX) {
                if !modified_url.is_empty() && modified_url != content {
                    if let Err(e) = write_to_clipboard(&modified_url) {
                        eprintln!("Failed to write to clipboard: {}", e);
                    }
                }
            }
        }
        Err(e) => eprintln!("Failed to read from clipboard: {}", e),
    }
}

fn main() {
    loop {
        replace_clipboard();
        std::thread::sleep(std::time::Duration::from_secs(1));
    }
}
