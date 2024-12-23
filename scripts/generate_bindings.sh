#! /bin/sh

if ! command -v bindgen 2>&1 >/dev/null; then
    echo "bindgen not found. Install it using `cargo install bindgen-cli`"
    exit 1
fi

: "${CLAY_HEADER_PATH:=clay.h}"

bindgen $CLAY_HEADER_PATH -o src/bindings/bindings.rs
echo "Generated src/bindings/bindings.rs"
bindgen $CLAY_HEADER_PATH -o src/bindings/bindings_debug.rs -- -DCLAY_DEBUG
echo "Generated src/bindings/bindings_debug.rs"
