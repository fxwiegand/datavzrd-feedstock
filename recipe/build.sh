#!/bin/bash -eu

# Make sure bindgen passes on our compiler flags.
export BINDGEN_EXTRA_CLANG_ARGS="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

export PYO3_PYTHON="${PYTHON}"
if [ "${target_platform}" != "${build_platform}" ]; then
  export PYO3_CROSS_INCLUDE_DIR="${PREFIX}/include"
  export PYO3_CROSS_LIB_DIR="${PREFIX}/lib/python${PY_VER}"
  export PYO3_CROSS_PYTHON_VERSION="${PY_VER}"
fi

cargo install --no-track --locked --verbose --root "${PREFIX}" --path .
