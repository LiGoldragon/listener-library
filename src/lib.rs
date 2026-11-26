//! The generated Listener contract.
#![forbid(unsafe_code)]
#[rustfmt::skip]
#[path = "generated.rs"]
mod generated;
pub use generated::*;

#[cfg(test)]
mod tests {
    use super::{BackendName, Options};

    #[test]
    fn options_carry_the_generated_backend_name_vector() {
        let name = BackendName("example".to_owned());
        let options = Options {
            delivery_option: None,
            backend_name_vector_option: Some(vec![name.clone()]),
        };

        assert_eq!(options.backend_name_vector_option, Some(vec![name]));
    }
}
