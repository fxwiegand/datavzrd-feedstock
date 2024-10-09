#!/bin/bash -eu

# Make sure bindgen passes on our compiler flags.
export BINDGEN_EXTRA_CLANG_ARGS="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
if [ "${target_platform}" = "${build_platform}" ]; then
  export PYO3_PYTHON="${PYTHON}"
fi
cargo install --no-track --locked --verbose --root "${PREFIX}" --path .
