<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Calculator-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# Tab Bar Accessory, Glass Effect Container, Background Extension & Inspector — CodeBook .Md

## » Table of Contents
1. » Tab Bar Accessory
2. » Glass Effect Container
3. » Background Extension Effect
4. » Adding an Inspector
5. » Quick Reference Table
6. » Tags
7. » Author Footer

## » Tab Bar Accessory

**Code Example**
```swift
TabView {
    // Your tabs...
}
.tabBarMinimizeBehavior(.onScrollDown)
.tabViewBottomAccessory {
    MusicPlaybackView()
}
```

**Explanation**
`.tabViewBottomAccessory` places `MusicPlaybackView()` above the tab bar and keeps it visible across tabs. `.tabBarMinimizeBehavior(.onScrollDown)` hides/minimizes the tab bar (and accessory) when the user scrolls down, improving content focus.

**Use Case**
Media apps with persistent playback controls (audio or video) that should remain available but unobtrusive while browsing content.

---

## » Glass Effect Container

**Code Example**
```swift
GlassEffectContainer {
    VStack(spacing: 16) {
        if isExpanded {
            ForEach(badges) { badge in
                BadgeLabel(badge: badge)
                    .glassEffect()
                    .glassEffectID(badge.id, in: namespace)
            }
        }
        BadgeToggle()
            .buttonStyle(.glass)
            .glassEffectID("badgeToggle", in: namespace)
    }
}
```

**Explanation**
`GlassEffectContainer` creates a unified "glass" surface. With an `@Namespace`, you can coordinate multiple child `.glassEffect()` modifiers using `.glassEffectID`, ensuring they feel like one surface. Great for smooth animations and consistent visuals.

**Use Case**
Perfect for badge stacks, featured cards, or toggle-based UI elements where multiple controls must share the same glass-like background.

---

## » Background Extension Effect

**Code Example**
```swift
Image(landmark.backgroundImageName)
    .resizable()
    .aspectRatio(contentMode: .fill)
    .backgroundExtensionEffect()
```

**Explanation**
`.backgroundExtensionEffect()` allows images or views to visually extend beyond their bounds and blend with surrounding space. Makes visuals feel immersive and cinematic.

**Use Case**
Ideal for detail screens, immersive hero sections, or full-width cards where a background image should flow naturally into the surrounding UI.

---

## » Adding an Inspector

**Code Example**
```swift
NavigationSplitView {
    // Main content
}
.inspector(isPresented: $presentInspector) {
    LandmarkDetailInspectorView(landmark: landmark)
}
```

**Explanation**
`.inspector` adds a secondary context-specific sidebar to a `NavigationSplitView`. Used for showing extra metadata or actions for the selected content.

**Use Case**
Common in professional Mac apps: e.g., selecting a landmark shows coordinates and details in a side inspector while keeping main content uncluttered.

---

## » Quick Reference Table

| Feature | Modifier / API | Purpose |
|---|---:|---|
| Persistent bottom accessory | `.tabViewBottomAccessory { ... }` | Keep controls (e.g., player) across tabs |
| Minimize tab bar | `.tabBarMinimizeBehavior(.onScrollDown)` | Hide controls on scroll |
| Unified glass effect | `GlassEffectContainer + .glassEffectID` | Create consistent, animated glass surfaces |
| Background extension | `.backgroundExtensionEffect()` | Extend visuals beyond container bounds |
| Inspector panel | `.inspector(isPresented:)` | Show context details in side panel |

---

## » Tags

<p align="left">
  <img src="https://img.shields.io/badge/%23VSRDesigns-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23MonoChromeUI-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23MinimalApps-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23LightDarkMode-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23SwiftUI-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23StudentDeveloper-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS UIKit)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
