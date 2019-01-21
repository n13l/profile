#!/bin/bash
set -e
build_dir="$(pwd)"
cmake .. -DCMAKE_CXX_COMPILER=$HOME/.vim/bin/wrap_cxx_clang.sh \
         -DCMAKE_C_COMPILER=$HOME/.vim/bin/wrap_cc_clang.sh
make "$@"
echo -n "" > $build_dir/../.clang_complete
find . -type f -name .clang_complete -exec cat {} >> $build_dir/../.clang_complete \;
echo "-Wno-unused-parameter" >> $build_dir/../.clang_complete
echo "-Wno-unused-function" >> $build_dir/../.clang_complete
