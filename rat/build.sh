#!/bin/bash

#! https://stackoverflow.com/a/246128
RAT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

echo "Got rat directory: $RAT_DIR"

cd $RAT_DIR
cargo build --release --target x86_64-unknown-linux-gnu
cp target/x86_64-unknown-linux-gnu/release/agent target/agent.linux_x86_64

rm -rf bundle.zip
zip -j bundle.zip target/agent.linux_x86_64
