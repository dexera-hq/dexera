pub fn status() -> &'static str {
    "tx-builder-ready"
}

#[cfg(test)]
mod tests {
    use super::status;

    #[test]
    fn status_is_non_empty() {
        assert!(!status().is_empty());
    }
}
