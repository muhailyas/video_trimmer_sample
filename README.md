# 🎬 Video Trimmer App

A simple Flutter app to **pick, trim, and watch videos**.  
Built using `video_trimmer`, `file_picker`, and `video_player`.

---

## Purpose

This app demonstrates how to:

- Pick videos from the device
- Trim videos using a slider (up to 30 seconds)
- Play trimmed segments
- Save trimmed videos locally
- Keep code modular and easy to maintain

Great for learning basic video editing in Flutter!

---

## Features

- Pick video files from your device
- Trim up to **30 seconds** of a video
- Play or pause trimmed section before saving
- Save the output to **temporary storage**
- Preview the final trimmed video

---

## Requirements

- ✅ Flutter **3.22+**
- ✅ Dart (compatible with Flutter version)
- ✅ Platforms:
  - Android
  - iOS

### Dependencies

| Package         | Version  | Purpose             |
|-----------------|----------|---------------------|
| `video_trimmer` | ^3.0.2   | Video trimming      |
| `file_picker`   | ^8.0.0   | Select videos       |
| `video_player`  | ^2.9.1   | Play videos         |

---

## Setup Guide

### 1. Install Dependencies

Add the packages to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  video_trimmer: ^3.0.2
  file_picker: ^8.0.0
  video_player: ^2.9.1

Then run:

flutter pub get

2. Android Configuration

In android/app/build.gradle, ensure:

ndkVersion = "27.0.12077973"


3. iOS Configuration

Add permissions to ios/Runner/Info.plist:

<key>NSCameraUsageDescription</key>
<string>Allow camera to pick videos</string>
<key>NSMicrophoneUsageDescription</key>
<string>Allow audio for videos</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Allow access to photo library for videos</string>

4. Run the App

flutter clean
flutter pub get
flutter run

App Flow
Home Screen: Tap Pick Video to select a video file.

Trimmer Screen: Slide to select the range. Max 30 seconds. Tap Save Trimmed Video.

Preview Screen: Watch and control the trimmed video playback.

Folder Structure

lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   ├── trimmer_screen.dart
│   └── video_preview_screen.dart
├── widgets/
│   ├── video_trimmer.dart
│   └── video_player.dart
├── services/
│   ├── file_picker_service.dart
│   └── trimmer_service.dart
├── models/
│   └── video_file.dart
├── constants/
│   ├── app_strings.dart
│   └── app_colors.dart
└── utils/
    └── snackbar_utils.dart

Useful Tips
Video formats: MP4/MOV are safest for compatibility.

Storage: Trimmed videos save to a temp directory by default (can be changed in TrimmerService).

Common fixes:

Run flutter pub upgrade

Use flutter run --verbose for debugging

Check for package updates on pub.dev

Note: video_trimmer uses FFmpeg internally, which may increase app size.

