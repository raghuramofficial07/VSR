<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/iOS%20Version%20Check-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# iOS Version Checking and Conditional Screens in Swift

## » Table of Contents
1. Introduction  
2. Using `#available` (Compile-time Check)  
3. Using `ProcessInfo` (Runtime Check)  
4. UIKit Example – Show Different ViewControllers  
5. SwiftUI Example – Show Different Views  
6. Quick Reference Table  
7. Author Footer  

---

## » Introduction
When building apps that support multiple iOS versions, you may want to:
- Display a **modern UI** for iOS 16+ users.  
- Fall back to a **simpler UI** for older iOS versions.  

Swift provides safe APIs for this using **`#available`** and **runtime checks**.

---

## » Using `#available` (Compile-time Check)

```swift
if #available(iOS 16.0, *) {
    // Code for iOS 16 and above
} else {
    // Code for earlier versions
}
```

✔ Compiler checks API safety  
✔ Prevents accidental crashes on unsupported versions  

---

## » Using `ProcessInfo` (Runtime Check)

```swift
let systemVersion = ProcessInfo().operatingSystemVersion

if systemVersion.majorVersion >= 16 {
    print("Running on iOS 16 or later")
} else {
    print("Running on older iOS")
}
```

✔ Useful for **exact version numbers**  

---

## » UIKit Example – Different ViewControllers

```swift
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        if #available(iOS 16.0, *) {
            // New screen for iOS 16+
            window?.rootViewController = NewHomeViewController()
        } else {
            // Fallback screen for older iOS
            window?.rootViewController = OldHomeViewController()
        }
        
        window?.makeKeyAndVisible()
    }
}
```

---

## » SwiftUI Example – Conditional View

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            ModernScreen()   // Shown on iOS 16+
        } else {
            LegacyScreen()   // Shown on earlier iOS
        }
    }
}

struct ModernScreen: View {
    var body: some View {
        Text("Welcome to iOS 16 Experience")
            .font(.title)
    }
}

struct LegacyScreen: View {
    var body: some View {
        Text("Welcome to Legacy iOS Experience")
            .font(.headline)
    }
}
```

---

## » Quick Reference Table

| Method          | Use Case | Example |
|-----------------|----------|---------|
| `#available`    | Best for **API-safe conditional code** | `if #available(iOS 16.0, *) { ... }` |
| `ProcessInfo`   | Check **exact version numbers** | `ProcessInfo().operatingSystemVersion` |
| `UIDevice`      | Get iOS version as a string | `UIDevice.current.systemVersion` |

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS UIKit & SwiftUI)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
