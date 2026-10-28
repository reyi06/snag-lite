#!/usr/bin/env bash
#
# Build the minimal static FFmpeg used by Snag Lite.
#
# Required:
#   ANDROID_NDK_HOME  path to Android NDK r27 or newer
#   FFMPEG_SRC        path to an FFmpeg n7.1 source tree
#
# Optional:
#   ARCH=arm64|armv7|x86_64|x86 (default: arm64)
#   API=29                       (default: 29)
#   OUT=/path/to/install         (default: ./ffmpeg-out)
#
# The result is $OUT/bin/ffmpeg. Copy it to
# app/src/main/jniLibs/<abi>/libffmpeg.so and rebuild the app.
#
# This build is intentionally not a general-purpose FFmpeg: it only provides
# the demuxers, muxers, parsers, decoders, and bitstream filters needed for
# stream-copy remuxing in Snag Lite.

set -euo pipefail

: "${ANDROID_NDK_HOME:?Set ANDROID_NDK_HOME to the Android NDK directory}"
: "${FFMPEG_SRC:?Set FFMPEG_SRC to the FFmpeg n7.1 source directory}"

ARCH="${ARCH:-arm64}"
API="${API:-29}"
OUT="${OUT:-$PWD/ffmpeg-out}"

case "$ARCH" in
  arm64)  FF_ARCH=aarch64; FF_CPU=armv8-a;   TOOL=aarch64-linux-android ;;
  armv7)  FF_ARCH=arm;     FF_CPU=armv7-a;   TOOL=armv7a-linux-androideabi ;;
  x86_64) FF_ARCH=x86_64;  FF_CPU=x86-64;    TOOL=x86_64-linux-android ;;
  x86)    FF_ARCH=x86;     FF_CPU=i686;      TOOL=i686-linux-android ;;
  *) echo "Unsupported ARCH: $ARCH" >&2; exit 2 ;;
esac

case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) HOST=windows-x86_64 ;;
  Darwin)               HOST=darwin-x86_64 ;;
  *)                    HOST=linux-x86_64 ;;
esac

TOOLCHAIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST"
SYSROOT="$TOOLCHAIN/sysroot"
CC="$TOOLCHAIN/bin/${TOOL}${API}-clang"
CXX="$TOOLCHAIN/bin/${TOOL}${API}-clang++"

for exe in "$CC" "$CXX" "$TOOLCHAIN/bin/llvm-ar" "$TOOLCHAIN/bin/llvm-ranlib" \
           "$TOOLCHAIN/bin/llvm-strip" "$TOOLCHAIN/bin/llvm-nm"; do
  if [ ! -e "$exe" ]; then
    echo "Missing tool: $exe" >&2
    exit 1
  fi
done

cd "$FFMPEG_SRC"
./configure \
  --prefix="$OUT" \
  --target-os=android \
  --arch="$FF_ARCH" \
  --cpu="$FF_CPU" \
  --enable-cross-compile \
  --sysroot="$SYSROOT" \
  --cc="$CC" \
  --cxx="$CXX" \
  --ar="$TOOLCHAIN/bin/llvm-ar" \
  --ranlib="$TOOLCHAIN/bin/llvm-ranlib" \
  --strip="$TOOLCHAIN/bin/llvm-strip" \
  --nm="$TOOLCHAIN/bin/llvm-nm" \
  --enable-static \
  --disable-shared \
  --enable-small \
  --disable-doc \
  --disable-debug \
  --disable-autodetect \
  --disable-network \
  --disable-everything \
  --enable-ffmpeg \
  --enable-demuxer=mov,matroska,webm \
  --enable-muxer=mp4,matroska,webm \
  --enable-parser=aac,h264,hevc,av1,vp9,opus,vorbis \
  --enable-bsf=aac_adtstoasc,av1_frame_merge,av1_metadata,vp9_superframe \
  --enable-protocol=file,pipe \
  --disable-avdevice \
  --disable-postproc \
  --disable-encoders \
  --disable-decoders \
  --enable-decoder=aac,opus,vorbis,h264,hevc,vp9,av1 \
  --disable-hwaccels \
  --disable-devices \
  --disable-asm \
  --disable-inline-asm \
  --extra-cflags="-Os -fPIC" \
  --extra-ldflags="-static" \
  --extra-ldexeflags="-static"

make -j"${JOBS:-$(nproc 2>/dev/null || echo 4)}"
make install

echo "Built $OUT/bin/ffmpeg"
