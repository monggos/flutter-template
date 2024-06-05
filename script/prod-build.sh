#!/bin/bash

# clean up..
flutter clean
flutter pub get

# generate app launcher icon..
flutter pub run flutter_launcher_icons -f ./script/yaml/prod-icons.yaml

# generate app splash screen..
flutter pub run flutter_native_splash:create --flavor prod --path=./script/yaml/prod-splash.yaml

# generate framework..
flutter pub run build_runner build --delete-conflicting-outputs

# build apk..
flutter build apk --flavor prod --release