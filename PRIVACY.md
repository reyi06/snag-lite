# Snag Lite Privacy Policy

Last updated: 2026-10-28

Snag Lite is an on-device Android media downloader. This policy describes what the app handles and where it goes.

## Summary

- Snag Lite has no user accounts, analytics, advertising, telemetry, or backend server.
- Downloaded media, history, settings, bookmarks, and WebView cookies stay on the device.
- The clipboard is read only when you explicitly tap the floating crown or the notification's **Save copied link** action.
- Links are sent directly to the source platform and, when enabled, to the optional TikWM fallback service.

## Clipboard

Snag Lite does not continuously monitor the clipboard. When you tap the crown or **Save copied link**, Snag Lite briefly opens a transparent activity, reads the clipboard, checks for a TikTok URL, and queues the download. The clipboard contents are not sent anywhere except when resolving the copied link with the source platform.

## Media and links

Snag Lite resolves links directly with the source platform. Depending on the link, requests may go to TikTok, Instagram, Facebook, or another host returned by those services. Those services handle data under their own privacy policies.

When **Allow TikWM fallback** is enabled, Snag Lite may send the post URL to TikWM as a fallback when first-party extraction fails. You can disable this in Settings.

## Local data

Snag Lite stores the following locally:

- download history and file metadata;
- saved profile bookmarks;
- app settings;
- WebView cookies used for public pages. Snag Lite has no account sign-in.

Downloaded files are written through Android MediaStore to `Downloads/Snag`.

## Permissions

- Internet and network state: resolve links and download media.
- Notifications: show download and Scroll mode status.
- Display over other apps: show the optional floating crown.
- Foreground service: keep downloads and Scroll mode running.

Snag Lite does not request Accessibility access.

## Data sharing

Snag Lite does not sell data, serve ads, or include third-party analytics. Network requests are limited to the source platform, optional TikWM fallback, and the media hosts needed to download a file.

## Children

Snag Lite is not directed at children under 13 and does not knowingly collect personal information from children.

## Changes

Material changes to this policy will be published in the repository and with the next release.

## Contact

For privacy questions, open an issue at <https://github.com/reyi06/snag/issues>.

