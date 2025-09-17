<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Calculator-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# Sheets and Presentation Detents, Tab Bar Accessory, Toolbars & UI Modifiers — CodeBook .Md

## » Table of Contents
1. » Introduction
2. » Sheets and Presentation Detents
3. » Tab Bar Accessory
4. » Toolbar Menus
5. » Hard Scroll Edge Effect
6. » Glass Effect
7. » Shared Glass Background Visibility
8. » Searchable Modifiers
9. » Toolbar Item Badge
10. » Quick Reference Table
11. » » Tags
12. » Author Footer

## » Introduction
This document collects compact, production-ready SwiftUI snippets and clear explanations for modern iOS UI patterns: modal sheets with detents, persistent tab accessories (music bar), toolbar menus, scroll edge behavior, glass effect, shared background visibility, searchable modifiers and toolbar badges.

All examples are presented in **Mono Chrome** style, with runnable code blocks and practical use cases. Use these as copy-paste-ready templates for your projects.

## » Sheets and Presentation Detents

**Code Example**
```swift
CollectionView()
    .sheet(isPresented: $isShowingLandmarksSelection) {
        LandmarksSelectionList()
            .presentationDetents([.height(180), .medium, .large])
    }
```

**Explanation**
This presents `LandmarksSelectionList()` as a modal when `isShowingLandmarksSelection` is `true`. The `.presentationDetents` modifier specifies three allowed sizes:
- `.height(180)`: fixed 180pt height.
- `.medium`: system-defined medium height (commonly ~half screen).
- `.large`: full-screen height.

**Use Case**
Use when you want a compact options list that the user can drag to expand for more details — e.g., quick selection of landmarks, filters, or actions without leaving the current context.

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
`.tabViewBottomAccessory` places `MusicPlaybackView()` above the tab bar and keeps it visible across tabs. `.tabBarMinimizeBehavior(.onScrollDown)` hides/minimizes the tab bar (and accessory) when user scrolls down, improving content focus.

**Use Case**
Media apps with persistent playback controls (audio or video) that should remain available but unobtrusive while browsing content.

## » Toolbar Menus

**Code Example**
```swift
LandmarkDetailView()
    .toolbar {
        ToolbarItemGroup {
            Button(action: { /* ... */ }) {
                Image(systemName: "square.and.arrow.up")
            }
            Menu("Collections", systemImage: "book.closed") {
                Button("Add to Favorites") { /* ... */ }
                Button("Create Collection") { /* ... */ }
            }
        }
    }
```

**Explanation**
Use `.toolbar` with `ToolbarItemGroup` to place multiple controls in the navigation bar. `Menu` groups related actions under a single tappable item, saving space and keeping the UI clean.

**Use Case**
Action-heavy detail screens where users expect contextual actions like share, add-to-collection, and edit.

## » Hard Scroll Edge Effect

**Code Example**
```swift
ScrollView {
    // content
}
.scrollEdgeEffectStyle(.hard, for: .top)
```

**Explanation**
`.scrollEdgeEffectStyle(.hard, for: .top)` disables the gentle bounce at the top and makes the top edge feel rigid. This communicates a stable header or calendar top that shouldn't stretch.

**Use Case**
Calendar views, lists with pinned headers, or any UI where the top edge must stay visually fixed.

## » Glass Effect

**Code Example**
```swift
Label("Desert", systemImage: "sun.max.fill")
    .padding()
    .glassEffect()
```

**Explanation**
`.glassEffect()` adds a translucent frosted-glass backdrop to the view, blurring underlying content and giving a layered depth. Great for floating badges or small controls.

**Use Case**
Floating action badges, context labels, and overlay controls that should contrast with content while preserving background context.

## » Shared Glass Background Visibility

**Code Example**
```swift
ContentView {
    // content
}
.toolbar {
    ToolbarItem { ProfileButton() }
}
.sharedBackgroundVisibility(.hidden)
```

**Explanation**
`.sharedBackgroundVisibility(.hidden)` disables the shared blurred background behind toolbars/navigation for that view, producing a cleaner, transparent header area.

**Use Case**
When you need a minimal chrome appearance or want content to visually extend behind the navigation area (e.g., immersive hero header).

## » Searchable Modifiers

### Searchable Tab
**Code Example**
```swift
TabView {
    Tab(role: .search) {
        NavigationView {
            SearchTabContent()
        }
    }
}
.searchable(text: $searchText)
```

**Explanation**
Designate a tab as a search hub using `Tab(role: .search)` and attach `.searchable` to bind search text. The search flow becomes first-class within the tab.

**Use Case**
Apps where search is a primary discovery mechanism: health, media libraries, or large catalogs.

### Minimized Toolbar Search
**Code Example**
```swift
NavigationView {
    DetailContent()
}
.searchable(text: $searchText)
.searchToolbarBehavior(.minimize)
```

**Explanation**
`.searchToolbarBehavior(.minimize)` shows a compact search icon in the toolbar that expands when tapped, keeping the UI uncluttered.

**Use Case**
Views where search is secondary but should be accessible, such as document viewers or inbox screens.

## » Toolbar Item Badge

**Code Example**
```swift
.toolbar {
    ToolbarItemGroup {
        Button(action: { /* open notifications */ }) {
            Image(systemName: "bell")
        }
        .badge(modelData.notifications.count)

        Button(action: { /* add */ }) {
            Image(systemName: "plus")
        }
    }
}
```

**Explanation**
`.badge()` decorates toolbar items with a numeric indicator derived from your model, signaling pending items or counts.

**Use Case**
Notification centers, message inboxes, or any actionable UI where counts matter.

## » Quick Reference Table

| Feature | Modifier / API | Purpose |
|---|---:|---|
| Modal sheet sizes | `.presentationDetents([.height(), .medium, .large])` | Allow draggable modal sizes |
| Persistent bottom accessory | `.tabViewBottomAccessory { ... }` | Keep controls (e.g., player) across tabs |
| Minimize tab bar | `.tabBarMinimizeBehavior(.onScrollDown)` | Hide controls on scroll to maximize content |
| Toolbar menu | `Menu("Title", systemImage:)` | Group related actions in toolbar |
| Hard scroll edge | `.scrollEdgeEffectStyle(.hard, for: .top)` | Rigid top edge behavior |
| Glass effect | `.glassEffect()` | Frosted, translucent background |
| Shared background | `.sharedBackgroundVisibility(.hidden)` | Control shared blurred backgrounds |
| Search behavior | `.searchable(...).searchToolbarBehavior(.minimize)` | Configurable search UI |
| Toolbar badges | `.badge(Int)` | Show counts on toolbar items |

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

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS UIKit)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
