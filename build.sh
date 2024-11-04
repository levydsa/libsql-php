#!/usr/bin/env sh

set -xe

cd libsql-c

cargo zigbuild --target aarch64-unknown-linux-gnu --features encryption
cargo zigbuild --target x86_64-unknown-linux-gnu --features encryption
cargo zigbuild --target universal2-apple-darwin --features encryption

rm -rf ../lib

mkdir -p \
  ../lib/aarch64-unknown-linux-gnu \
  ../lib/x86_64-unknown-linux-gnu \
  ../lib/universal2-apple-darwin \

cp ./libsql.h ../lib/libsql.h
cp ./target/x86_64-unknown-linux-gnu/release/liblibsql.so ../lib/x86_64-unknown-linux-gnu/
cp ./target/aarch64-unknown-linux-gnu/release/liblibsql.so ../lib/aarch64-unknown-linux-gnu/
cp ./target/universal2-apple-darwin/release/liblibsql.dylib ../lib/universal2-apple-darwin/
