# android-system

A simple Makefile for setting up an android system (platform-tools + ndk + toolchain)

**NOTE**: this assumes you have an android plugged in with USB debugging enabled, otherwise
you cannot query the device for the api version which is required to setup the toolchain.

## setup

```
make
```

## environment

(adds `platform-tools`, `toolchain/bin`, and `bin` to your `PATH`)

```
. activate
```

```
deactivate
```
