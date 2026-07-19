#!/bin/bash
set -euo pipefail

if [ ! -d "flutter-sdk" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter-sdk
fi

export PATH="$PATH:$(pwd)/flutter-sdk/bin"

flutter config --no-analytics --no-cli-animations
flutter pub get
flutter build web --release
