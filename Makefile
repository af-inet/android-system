default: all

platform-tools-latest-darwin.zip:
	wget https://dl.google.com/android/repository/platform-tools-latest-darwin.zip

platform-tools: platform-tools-latest-darwin.zip
	unzip $@

android-ndk-r16b-darwin-x86_64.zip:
	wget https://dl.google.com/android/repository/android-ndk-r16b-darwin-x86_64.zip

android-ndk-r16b-darwin-x86_64: android-ndk-r16b-darwin-x86_64.zip
	unzip $@

ndk: android-ndk-r16b
	mv $^ $@

sdk.txt: platform-tools
	./platform-tools/adb shell getprop ro.build.version.sdk > $@

toolchain: sdk.txt ndk
	./ndk/build/tools/make-standalone-toolchain.sh --platform=android-`cat sdk.txt` --install-dir=$@

.PHONY: default all
