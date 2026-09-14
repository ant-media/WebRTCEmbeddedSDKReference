#!/usr/bin/env bash
set -euo pipefail

make clean all ARCH=x86 TARGET=executables/x86/webrtc_pull_rtsp
make clean all ARCH=arm CROSS_TRIPLE=arm-linux-gnueabihf TARGET=executables/arm/webrtc_pull_rtsp
make clean all ARCH=arm64 CROSS_TRIPLE=aarch64-linux-gnu TARGET=executables/arm64/webrtc_pull_rtsp

file executables/x86/webrtc_pull_rtsp      executables/arm/webrtc_pull_rtsp      executables/arm64/webrtc_pull_rtsp
