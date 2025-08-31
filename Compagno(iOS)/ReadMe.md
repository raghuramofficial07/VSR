<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Calculator-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# » Compagno  

![VSR(3)](https://github.com/user-attachments/assets/5f22d73c-fa2a-4a06-9ce0-cb042eb45c04)

---

## » Introduction  

**Compagno** (derived from the Italian word for *Companion*) is a minimal yet powerful iOS application built using **SwiftUI**.  

This project marks the **new beginning of my Swift journey** —  
> *“The One First Dance with SwiftUI… leaving Storyboards behind to embrace declarative design.”*  

---

## » Features  

- 📊 **GPA Calculator** – Computes GPA.  
- 📅 **Attendance Calculator** – Track attendance percentage and requirements.  
- ➗ **Math Utilities** – Sin, Cos, π values and quick trigonometric computations.  
- ⚡ **C++ Computation Engine** – Mathematical calculations powered by **bridging Swift ↔ C++** for faster performance.  

---

## » Technical Highlights  

- ✅ **SwiftUI for UI** (modern declarative design).  
- ✅ **Bridging Header Integration**: Swift ↔ C++ to leverage native speed.  
- ✅ Modular SwiftUI views for **scalable calculators**.  
- ✅ Built with Xcode, optimized for iOS.  

---

## » Real-World Use Cases  

- Students can quickly calculate **CGPA/GPA**.  
- Attendance tracker helps in **academic planning**.  
- Engineers/learners get **fast trigonometric computations** using the C++ engine.  

---

## » Tags  

- #BeyondCertifications  
- #IndustryOriented  
- #CodeWithRaghuRam  
- #VSRDesigns  
- #MonoChromeUI  
- #MinimalApps  
- #AppleInspired  

---

## » Author Footer  

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS SwiftUI, with C++ bridging)  

---

## » Example SwiftUI Tab Structure  

Here’s a **SwiftUI TabView code snippet** you can add in your project root (`ContentView.swift`), which will serve as the entry point to different calculators:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GPACalculator()
                .tabItem {
                    Label("GPA", systemImage: "graduationcap.fill")
                }
            
            AttendanceCalculator()
                .tabItem {
                    Label("Attendance", systemImage: "calendar")
                }
            
            MathUtilities()
                .tabItem {
                    Label("Math", systemImage: "function")
                }
        }
    }
}

#Preview {
    ContentView()
}

```

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
