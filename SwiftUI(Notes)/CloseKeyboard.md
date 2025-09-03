<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Calculator-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# Compagno iOS App

## » Table of Contents
- Introduction  
- Features  
- Screens Explained  
  - Attendance Screen  
  - Calc Screen  
  - Home Screen  
- Keyboard Management with `@FocusState`  
- Real-World Use Cases  
- Quick Reference Table  
- Author Footer  

---

## » Introduction
**Compagno** is an iOS app built with **SwiftUI + C++ integration**.  
It helps students perform quick academic-related calculations:
- GPA prediction  
- Attendance planning  
- Scientific calculations  

The app emphasizes **clean SwiftUI architecture**, **segmented controls for modes**, and **a smooth keyboard-dismiss experience**.

---

## » Features
- **Attendance Screen** → Predict classes needed to maintain or reach attendance targets.  
- **Calc Screen** → Perform log, sin, cos computations using C++ backend.  
- **Home Screen** → Predict required semester GPA to achieve a target CGPA.  
- **Keyboard Handling** → Uses SwiftUI’s `@FocusState` to gracefully dismiss the keyboard when alerts appear.  

---

## » Screens Explained

### 1. Attendance Screen
- Takes **Present %** and **Target %**.  
- Lets you choose mode: `Present` or `Absent`.  
- Calls `AttendanceEngine_compute` from C++.  
- Shows required days in alert.  

### 2. Calc Screen
- Input a numeric value.  
- Choose a mode (`log`, `sin`, `cos`).  
- Calls `CalcEngine_compute` from C++.  
- Displays computed result in alert.  

### 3. Home Screen
- Input **Present GPA**, **Remaining Semesters**, and **Target CGPA**.  
- Calls `GPAEngine_predict` from C++.  
- Displays required semester GPA in alert.  

---

## » Keyboard Management with `@FocusState`

We use SwiftUI’s **focus system** to dismiss the keyboard when the user taps **OK** in an alert:

```swift
@FocusState private var isInputActive: Bool

TextField("Enter Value", text: $inputValue)
    .focused($isInputActive)

Button("OK", role: .cancel) {
    isInputActive = false   // resigns focus → hides keyboard
}
```
## » Keyboard Dismissal in SwiftUI

In SwiftUI, the keyboard is controlled by **focus state bindings**.  
By attaching `.focused($isInputActive)` to a `TextField`, its keyboard visibility depends on the Boolean flag `isInputActive`.  

- When `isInputActive = true` → the text field is focused, and the keyboard appears.  
- When `isInputActive = false` → the text field loses focus, and the keyboard is dismissed.  

This means setting the bound `@FocusState` variable to `false` is enough to close the keyboard across all linked text fields, without extra UIKit extensions or hacks.

## » Keyboard Dismissal in SwiftUI

In SwiftUI, the keyboard is controlled by **focus state bindings**.  
By attaching `.focused($isInputActive)` to a `TextField`, its keyboard visibility depends on the Boolean flag `isInputActive`.  

- When `isInputActive = true` → the text field is focused, and the keyboard appears.  
- When `isInputActive = false` → the text field loses focus, and the keyboard is dismissed.  

This means setting the bound `@FocusState` variable to `false` is enough to close the keyboard across all linked text fields, without extra UIKit extensions or hacks.  

---

## » Senior Developer Best Practice with Multiple Fields

Senior developers often use an **enum-based `@FocusState`** when multiple fields exist in a form.  
This makes it easier to manage which field is active, and to dismiss the keyboard cleanly.  

Example:  

```swift
struct LoginView: View {
    enum Field { case username, password }
    @FocusState private var focusedField: Field?
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)
            
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
            
            Button("Login") {
                focusedField = nil   // dismisses keyboard for all fields
            }
        }
        .padding()
    }
}
```
