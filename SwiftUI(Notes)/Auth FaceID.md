<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/VSR-black?logo=apple&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# Face ID / Touch ID Authentication in Swift

## » Table of Contents
1. Introduction  
2. Full Code  
3. Step-by-Step Explanation  
   - Function Declaration  
   - Creating Authentication Context  
   - Error Handling Setup  
   - Checking Policy Availability  
   - Reason String for User  
   - Evaluating Policy  
   - Handling Success & Failure  
4. Object Reference (LAContext, NSError)  
5. Real-World Use Case  
6. Author Footer  

---

## » Introduction
This document explains how to implement **biometric authentication** (Face ID or Touch ID) in Swift using the **LocalAuthentication** framework.  
We will go through the code **line by line**, explaining each keyword, object, property, and why it must be written that way.  

---

## » Full Code

```swift
func authenticate() {
    let context = LAContext()
    var error: NSError?

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "We need to unlock your data."

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: reason) { success, authenticationError in
            if success {
                isUnlocked = true
            } else {
                // there was a problem
            }
        }
    }
}
```

---

## » Step-by-Step Explanation

### 1. Function Declaration
```swift
func authenticate() {
```
- **func** → Defines a function in Swift.  
- **authenticate** → Function name. Describes what it does.  
- **()** → No input parameters.  
- **{ }** → Wraps the code block.  

---

### 2. Creating Authentication Context
```swift
let context = LAContext()
```
- **let** → Declares an immutable constant.  
- **context** → Name of the variable.  
- **LAContext()** → Creates an object that manages biometric authentication.  

**About LAContext**  
- Properties:  
  - `biometryType` → Tells if device uses Face ID or Touch ID.  
  - `localizedFallbackTitle` → Customizes fallback button text.  
- Methods:  
  - `canEvaluatePolicy()` → Check availability of authentication.  
  - `evaluatePolicy()` → Perform authentication.  

---

### 3. Error Handling Setup
```swift
var error: NSError?
```
- **var** → Declares a variable (mutable).  
- **NSError?** → Optional error object (could be `nil` if no error).  

**About NSError**  
- `code` → Numeric identifier of the error.  
- `localizedDescription` → Human-readable message.  
- `domain` → Source of error.  

---

### 4. Checking Policy Availability
```swift
if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
```
- **if** → Conditional statement.  
- **canEvaluatePolicy** → Checks if biometrics are available.  
- **.deviceOwnerAuthenticationWithBiometrics** → Policy for Face ID / Touch ID.  
- **error: &error** → Passes memory address so error can be set.  

---

### 5. Reason String for User
```swift
let reason = "We need to unlock your data."
```
- Message shown in the authentication popup.  
- Required by Apple to explain *why* you request Face ID / Touch ID.  

---

### 6. Evaluating Policy
```swift
context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                       localizedReason: reason) { success, authenticationError in
```
- **evaluatePolicy** → Triggers Face ID / Touch ID popup.  
- **localizedReason** → String reason shown to user.  
- **closure** → Callback with `success` and `authenticationError`.  

---

### 7. Handling Success & Failure
```swift
if success {
    isUnlocked = true
} else {
    // there was a problem
}
```
- **if success** → Authentication succeeded.  
- **isUnlocked = true** → App state updated.  
- **else** → Handle errors (user canceled, failed recognition).  

---

## » Object Reference

### LAContext
- **Properties**  
  - `biometryType` → Face ID or Touch ID.  
  - `localizedFallbackTitle` → Change fallback button label.  
- **Methods**  
  - `canEvaluatePolicy` → Checks availability.  
  - `evaluatePolicy` → Requests authentication.  

### NSError
- **Properties**  
  - `code` → Error code number.  
  - `localizedDescription` → Human-readable error message.  
  - `domain` → System domain of error.  

---

## » Real-World Use Case
You can use biometric authentication to:  
- Unlock sensitive data (notes, passwords).  
- Protect user accounts.  
- Confirm actions (like payments).  

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
