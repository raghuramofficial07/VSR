<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/App%20Icon%20Setup-black?logo=flutter&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# » App Icon Setup Guide

## » Table of Contents
1. Introduction
2. Adding `flutter_launcher_icons` Dependency
3. Configuration in `pubspec.yaml`
4. Running the Command
5. Common Notes & Tips
6. Author Footer

---

## » Introduction
This guide explains how to set a **custom app icon** for both Android and iOS using the `flutter_launcher_icons` package.

![Untitled 1](https://github.com/user-attachments/assets/5782594f-4cb0-4a63-b2c5-0438c228f0c8)


---

## » Adding `flutter_launcher_icons` Dependency

Add the following under **`dev_dependencies`** in your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  flutter_launcher_icons: ^0.13.1
```

---

## » Configuration in `pubspec.yaml`

```yaml
flutter_icons:
  android: true
  ios: true
  image_path: "assets/icon.png"
```

- Ensure the icon file is placed at `assets/icon.png`
- The image should be a **1024x1024 PNG** for best results.

---

## » Running the Command

After saving `pubspec.yaml` (**Click Command + S** or **Save** in your editor), run:

```bash
flutter pub get
dart run flutter_launcher_icons
```

---

## » Common Notes & Tips

- If you see **"Could not find package"**, check that you saved the `pubspec.yaml` file.
- Always run `flutter pub get` after changing dependencies.
- Use **`flutter pub outdated`** to check for version updates.

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**Platform:** Flutter (Android & iOS)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
