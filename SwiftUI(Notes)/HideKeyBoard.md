<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SwiftUI-black?logo=swift&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# CodeBook .Md — Hiding Keyboard with `UIApplication.shared.sendAction`

## » Table of Contents
- [Introduction](#-introduction)
- [Code Example](#-code-example)
- [Step-by-Step Explanation](#-step-by-step-explanation)
- [Concept Highlights](#-concept-highlights)
- [Real-World Use Case](#-real-world-use-case)
- [Quick Reference Table](#-quick-reference-table)
- [Author Footer](#-author-footer)

---

## » Introduction
In SwiftUI, dismissing the iOS keyboard is not as direct as in UIKit.  
One of the most commonly used techniques is:

```swift
UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                to: nil, from: nil, for: nil)
```

This command uses the **UIKit responder chain** to tell the currently focused input (e.g., `TextField`) to resign its active state, which automatically closes the keyboard.

---

## » Code Example

```swift
import SwiftUI

struct ContentView: View {
    @State private var text = ""

    var body: some View {
        TextField("Enter text...", text: $text)
            .submitLabel(.done)     // shows "Done" on keyboard
            .onSubmit {
                hideKeyboard()      // hide keyboard on return
            }
            .padding()
    }
}

// MARK: - Hide Keyboard Extension
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
```

---

## » Step-by-Step Explanation

1. **`UIApplication.shared`**  
   Accesses the shared application instance, the central manager of the app.

2. **`.sendAction()`**  
   Sends an action (method call) down the **responder chain** to see which object can handle it.

3. **`#selector(UIResponder.resignFirstResponder)`**  
   Points to the `resignFirstResponder` method, which tells the active input to give up focus.

4. **`to: nil`**  
   Means “send to whoever can handle it” (the current active responder).

5. **`from: nil`**  
   No specific sender, so left as `nil`.

6. **`for: nil`**  
   No specific UI event associated.

**Result:** The focused text field resigns, and the keyboard disappears.

---

## » Concept Highlights
- **First Responder:** The currently active UI element (like a `TextField`).  
- **Resign First Responder:** Method that removes focus from the control.  
- **Responder Chain:** Hierarchy of objects that can handle user actions.  
- **Why Useful in SwiftUI?** Because SwiftUI doesn’t provide a direct built-in way to dismiss the keyboard in older iOS versions.

---

## » Real-World Use Case
Imagine a form where the user enters their email and presses **Return**.  
You don’t want the keyboard covering the next fields, so you call `hideKeyboard()` after submission, giving a clean user experience.

---

## » Quick Reference Table

| Component                          | Role                                                   |
|-----------------------------------|--------------------------------------------------------|
| `UIApplication.shared`             | Central manager of the app                            |
| `.sendAction()`                    | Dispatches an action to the responder chain           |
| `#selector(resignFirstResponder)`  | The action to resign focus                            |
| `to: nil`                          | Target not specified; system finds the right object   |
| `from: nil`                        | Sender not specified                                  |
| `for: nil`                         | No UI event context                                   |

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS UIKit + SwiftUI)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
