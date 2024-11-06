#!/usr/bin/env sh

set -xe

cd libsql-c

cargo zigbuild --target universal2-apple-darwin --features encryption --release
cargo build --target x86_64-unknown-linux-musl --features encryption --release
cargo build --target aarch64-unknown-linux-musl --features encryption --release

rm -rf ../lib

mkdir -p \
  ../lib/aarch64-unknown-linux-musl \
  ../lib/x86_64-unknown-linux-musl \
  ../lib/universal2-apple-darwin \

cp ./libsql.h ../lib/libsql.h
cp ./target/x86_64-unknown-linux-musl/release/liblibsql.so ../lib/x86_64-unknown-linux-musl/
cp ./target/aarch64-unknown-linux-musl/release/liblibsql.so ../lib/aarch64-unknown-linux-musl/
cp ./target/universal2-apple-darwin/release/liblibsql.dylib ../lib/universal2-apple-darwin/
