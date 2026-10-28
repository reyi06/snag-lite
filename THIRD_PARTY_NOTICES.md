# Third-Party Notices

Snag Lite is licensed under GPL-3.0 because it includes `youtubedl-android`,
which is GPL-3.0. The full source for Snag Lite is published under the same
license.

## youtubedl-android

- Project: https://github.com/yausername/youtubedl-android
- License: GNU General Public License v3.0
- Bundles the Python runtime, QuickJS, and the yt-dlp zipapp (Unlicense).
- The Android FFmpeg AAR is not used by Snag Lite.

## FFmpeg

- Project: https://ffmpeg.org/
- Version: 7.1 (n7.1)
- License: GNU Lesser General Public License 2.1 or later. The full text is in
  `app/src/main/assets/licenses/FFmpeg-LGPL-2.1.txt`.
- Snag Lite ships a minimal static `ffmpeg` executable, renamed to
  `libffmpeg.so`, for stream copy and MP4 remuxing.
- The build disables networking, encoders, devices, and most filters. It enables
  the mov/matroska/webm demuxers and muxers, AAC/H.264/HEVC/VP9/AV1/Opus/Vorbis
  parsers, the AAC/Opus/Vorbis/H.264/HEVC/VP9/AV1 decoders needed for stream
  metadata, and the AAC/AV1/VP9 bitstream filters.
- Source code is available from the FFmpeg project. Snag Lite does not modify
  FFmpeg's source. The exact build is recorded in
  `tools/build-ffmpeg-android.sh` and can be reproduced with the Android NDK.

## tt-dlp

The public-profile protocol used by Snag (creator embed, post embed, creator item-list pagination) is informed by and validated against [tt-dlp](https://github.com/bajaam/tt-dlp), copyright 2026 tt-dlp contributors, licensed under the MIT License.

```
MIT License

Copyright (c) 2026 tt-dlp contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Fonts

Host Grotesk and Instrument Sans are distributed under the SIL Open Font License. Their license texts are included in `app/src/main/assets/licenses/`.
