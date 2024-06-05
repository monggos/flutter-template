#!/bin/bash

flutter clean
flutter pub get
flutter pub run flutter_launcher_icons -f ./script/yaml/dev-icons.yaml
flutter pub run flutter_native_splash:create --flavor dev --path=./script/yaml/dev-splash.yaml
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --flavor dev --release