#!/bin/sh

# FOR MAC OS SYSTEMS

# Cleans and refetches all dependencies in preparation for an app build.

rm -rf android/app/build

flutter clean
flutter pub get

flutter pub run build_runner build --delete-conflicting-outputs

cd ios
if [ "$1" == "intel" ]; then
  pod update
else
  arch -x86_64 pod update
fi