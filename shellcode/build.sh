#!/bin/bash

#! https://stackoverflow.com/a/246128
SHELLCODE_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

echo "Got shellcode directory: $SHELLCODE_DIR"

cd $SHELLCODE_DIR/hello_world
cargo build --release --target x86_64-unknown-linux-gnu
strip -s target/x86_64-unknown-linux-gnu/release/hello_world
objcopy -O binary target/x86_64-unknown-linux-gnu/release/hello_world shellcode.bin

echo "Copying shellcode to $SHELLCODE_DIR/executor/"
cp shellcode.bin $SHELLCODE_DIR/executor/

cd $SHELLCODE_DIR/executor
cargo run --release --target x86_64-unknown-linux-gnu
