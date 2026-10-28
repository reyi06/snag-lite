# Snag Lite

Snag Lite is a lightweight, side-by-side fork of [Snag](https://github.com/reyi06/snag). It resolves public social links on-device and saves the media to `Downloads/Snag` without ads, an account, a backend, or an API key.

Current Lite build: **0.9.0**

## Why Lite

- **One copy of the media runtime.** The old FFmpeg Android package was replaced with a small static FFmpeg 7.1 build that supports H.264, HEVC, VP9, AV1, AAC, and Opus stream copy. The arm64 APK is about **23 MB**, down from about **100 MB**.
- **No account or sign-in flow.** Snag Lite has no TikTok or Instagram login, no cookie export, and no session UI. Public posts work without an account; posts that require a login fail with a clear message.
- **Installs beside Snag.** The package is `com.snag.downloader.lite`, so it does not replace the original Snag.
- **No duplicated runtime assets.** yt-dlp is stored once as the app's raw resource and installed into the private runtime on first use.

## What it does

- Saves public TikTok videos, photo carousels, and audio.
- Loads public TikTok profiles and creator batches without an account.
- Saves YouTube videos, audio, and playlists, including 1080p, 1440p, and 2160p adaptive streams merged on-device.
- Saves public Instagram reels, video posts, and photos, including carousel images.
- Supports Facebook post links through the existing extractors.
- Accepts multiple pasted links as one batch and uses one queue, history, progress bar, and file manager.
- Shows download percentage, transferred/total size, transfer speed, and a merge stage in the in-app bar.
- Keeps a local library and download history.
- Provides an optional **Scroll mode** floating crown for saving a copied TikTok link while browsing.

## What Lite does not do

- It does not support account sign-in.
- It cannot download Instagram posts that require a logged-in session.
- It cannot download private, removed, or otherwise restricted posts from any platform.

## Install

1. Download `Snag-Lite-0.9.0.apk`.
2. Allow installs from unknown sources for the browser or file manager you use.
3. Android 10 or newer on a 64-bit ARM device is required. The published APK is `arm64-v8a`.

The APK is signed with the Snag release key. The signing key is not stored in this repository. Snag Lite and Snag can be installed at the same time because they use different package names.

### Play Protect

Because Snag Lite is installed from a signed APK rather than Google Play, Android or Play Protect may warn about an unknown source. Verify the SHA-256 checksum published with the release before installing. Only install it if you trust the source.

## Legal

- [Privacy policy](PRIVACY.md)
- [Disclaimer and legal notice](DISCLAIMER.md)
- [Security policy](SECURITY.md)
- [GPL-3.0 license](LICENSE)

Snag Lite is not affiliated with TikTok, ByteDance, YouTube, Google, Instagram, Meta, or Facebook. Use it only for media you are allowed to save, and follow the source platform's terms. Snag Lite does not grant any rights to downloaded content.

## Scroll mode

Scroll mode is optional and off by default.

1. Open **Settings → Scroll mode** and enable it.
2. Allow **Display over other apps**.
3. Choose the default maroon/gold crown or the smaller black/white low-profile button, and set its opacity.
4. Scroll TikTok normally and copy a video link from TikTok's Share sheet.
5. Tap the floating button; it shows an in-progress animation, then a green success pulse.

If your phone denies Display over other apps, Scroll mode keeps its notification active. Use the notification's **Save copied link** action instead.

Snag Lite reads the clipboard only when you tap the floating button or **Save copied link**. It does not continuously monitor the clipboard, automate TikTok, or require Accessibility access.

The persistent notification provides **Save copied link** and **Stop** actions.

## Privacy

Snag Lite has no accounts, analytics, ads, or server of its own. Links are resolved directly from the source platform. WebView data and download history stay on the device. Files are written through Android MediaStore.

Snag Lite does not grant rights to media you do not own. Use it only for content you are allowed to save, and follow the source platform's terms.

## Build

Requirements:

- JDK 17 or newer
- Android SDK 36
- Gradle wrapper included in the repository

```powershell
.\gradlew.bat assembleDebug
```

For a release build, create your own signing setup and sign `app/build/outputs/apk/release/app-arm64-v8a-release-unsigned.apk` with `apksigner`. The project's release key and password are intentionally kept outside the repository.

The static FFmpeg binary is checked into `app/src/main/jniLibs/<abi>/libffmpeg.so`. Its LGPL source and build configuration are documented in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). The reproducible build script is [tools/build-ffmpeg-android.sh](tools/build-ffmpeg-android.sh).

## Project layout

- `app/src/main/java/com/snag/downloader/core` — models, HTTP, extraction contracts
- `app/src/main/java/com/snag/downloader/extract` — TikTok, YouTube, Instagram, Facebook, OpenGraph
- `app/src/main/java/com/snag/downloader/data` — repository, history, settings
- `app/src/main/java/com/snag/downloader/download` — MediaStore download queue
- `app/src/main/java/com/snag/downloader/scroll` — Scroll mode overlay and clipboard relay
- `app/src/main/java/com/snag/downloader/ui` — Compose screens

## Changelog

See [CHANGELOG.md](CHANGELOG.md). Release notes for this build are in [docs/releases/0.9.0.md](docs/releases/0.9.0.md).

## Credits

Public-profile protocol informed by [tt-dlp](https://github.com/bajaam/tt-dlp) under the MIT License. Full notices are in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## License

Snag Lite is free software licensed under the **GNU General Public License v3.0**. The source is available under that license; redistribution and modification must comply with the GPL. See [LICENSE](LICENSE). The yt-dlp Android wrapper (`youtubedl-android`) is GPL-3.0; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
