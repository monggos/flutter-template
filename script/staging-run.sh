#!/bin/bash

# clean up..
flutter clean
flutter pub get

# generate app launcher icon..
flutter pub run flutter_launcher_icons -f ./script/yaml/staging-icons.yaml

# generate app splash screen..
flutter pub run flutter_native_splash:create --flavor staging --path=./script/yaml/staging-splash.yaml

# generate framework..
flutter pub run build_runner build --delete-conflicting-outputs

# run..
flutter run --flavor staging --release