<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SwiftUI-black?logo=swift&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# SwiftUI Property Wrappers — Monochrome Notes
![VSR(3)](https://github.com/user-attachments/assets/9e33c871-cf33-4952-b461-e0a6d1446788)

## » Table of Contents
- Introduction
- Complete Keyword List
- Quick Reference Table
- Author Footer

---

## » Introduction

SwiftUI provides several property wrappers (special keywords with `@`) that help manage state, data flow, and environment values in a declarative way.  
These wrappers are essential for building reactive, maintainable SwiftUI applications.

---

## » Complete Keyword List

- `@State` → Local state storage owned by the current view.  
- `@Binding` → Creates a two-way connection to data owned elsewhere.  
- `@ObservedObject` → Observes external `ObservableObject` and refreshes view when data changes.  
- `@StateObject` → Creates and owns an `ObservableObject` within this view.  
- `@EnvironmentObject` → Accesses shared `ObservableObject` injected into the hierarchy.  
- `@Environment` → Reads values (like color scheme, locale, size category) from the environment.  
- `@AppStorage` → Stores simple values persistently in `UserDefaults`.  
- `@SceneStorage` → Preserves small amounts of state for a scene (e.g., tab selection).  
- `@FetchRequest` → Fetches results from Core Data.  
- `@SectionedFetchRequest` → Fetches Core Data results grouped into sections.  
- `@Query` → Fetches SwiftData results (iOS 17+).  
- `@Namespace` → Enables matched geometry effects across views.  
- `@Bindable` → Provides a `Binding` to properties of an `Observable` (iOS 17+).  
- `@FocusState` → Tracks and controls which input field is focused.  
- `@GestureState` → Tracks transient state during a gesture interaction.  
- `@ScaledMetric` → Scales numeric values according to Dynamic Type.  
- `@UIApplicationDelegateAdaptor` → Bridges UIKit AppDelegate into SwiftUI apps.  
- `@AccessibilityFocusState` → Controls VoiceOver accessibility focus programmatically.  
- `@FocusedObject` → Exposes a focused object to the environment.  
- `@FocusedValue` → Shares a value from the currently focused view.  
- `@FocusedBinding` → Binds to values from a focused element.

---

## » Quick Reference Table

| Keyword                     | Use Case |
|-----------------------------|----------|
| `@State`                    | Local view state |
| `@Binding`                  | Two-way data connection |
| `@ObservedObject`           | Observes external object |
| `@StateObject`              | Owns observable object |
| `@EnvironmentObject`        | Shared object from environment |
| `@Environment`              | Read system/environment values |
| `@AppStorage`               | Persist values in UserDefaults |
| `@SceneStorage`             | Store scene-specific state |
| `@FetchRequest`             | Fetch Core Data results |
| `@SectionedFetchRequest`    | Grouped Core Data results |
| `@Query`                    | Fetch SwiftData results |
| `@Namespace`                | Matched geometry effects |
| `@Bindable`                 | Binding to observable properties |
| `@FocusState`               | Track or set focus |
| `@GestureState`             | Temporary gesture state |
| `@ScaledMetric`             | Scale numbers for accessibility |
| `@UIApplicationDelegateAdaptor` | Use UIKit AppDelegate |
| `@AccessibilityFocusState`  | Manage accessibility focus |
| `@FocusedObject`            | Focused object exposure |
| `@FocusedValue`             | Value from focused element |
| `@FocusedBinding`           | Binding from focused element |

**Total Keywords:** 22

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS SwiftUI)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
