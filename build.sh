#!/bin/sh

QT_VERSION="6.9.1"

if [ ! -d $QT_VERSION ]; then
  echo "installing QT $QT_VERSION"
  ./aqt-macos install-qt mac desktop $QT_VERSION
fi

export Qt6_DIR="$(pwd)/$QT_VERSION/macos/"
export PATH="$(pwd)/$QT_VERSION/macos/bin:$PATH"

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DBUILD_DOCS=OFF -DBUILD_INSTALLER=ON
cmake --build build --config Release -j8 --target package