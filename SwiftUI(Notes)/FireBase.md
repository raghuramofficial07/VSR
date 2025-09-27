<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Firebase-black?logo=firebase&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/Built%20by-RaghuRam-black?labelColor=black&color=black">
</p>

# Firebase Implementation Guide – SuchJaano

## » Introduction
This guide documents how Firebase is integrated into the **SuchJaano** iOS application, covering setup, authentication, Firestore configuration, and deployment notes.

## » Firebase Setup in Xcode
1. Add Firebase SDK to your Xcode project using Swift Package Manager or CocoaPods.  
2. Configure your project with the `GoogleService-Info.plist` file.  
3. Initialize Firebase in `SuchJaanoApp.swift`:

```swift
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct SuchJaanoApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
```

## » Authentication (Email/Password)
- **Enable**: Go to Firebase Console → Authentication → Sign-in method → Enable **Email/Password**.  
- **Usage**: Implement sign up / login in SwiftUI using FirebaseAuth.

```swift
import FirebaseAuth

// Sign Up
Auth.auth().createUser(withEmail: email, password: password) { result, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        print("User registered: \(result?.user.uid ?? "")")
    }
}

// Login
Auth.auth().signIn(withEmail: email, password: password) { result, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
    } else {
        print("User logged in: \(result?.user.uid ?? "")")
    }
}
```

## » Firestore Database
1. Enable Firestore in the Firebase Console.  
2. Example rules (temporary open access until Oct 27, 2025):

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if
          request.time < timestamp.date(2025, 10, 27);
    }
  }
}
```

3. Example Swift code for storing and retrieving posts:

```swift
import FirebaseFirestore

let db = Firestore.firestore()

// Save post
db.collection("posts").addDocument(data: [
    "text": "Hello World",
    "timestamp": Timestamp()
])

// Retrieve posts
db.collection("posts").getDocuments { snapshot, error in
    if let snapshot = snapshot {
        for doc in snapshot.documents {
            print("\(doc.documentID) => \(doc.data())")
        }
    }
}
```

## » Notes
- For production, always **update Firestore rules** for authenticated access.  
- Always test on real devices in addition to simulator.  
- Firebase Console helps track authentication, database usage, and app analytics.

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Swift (iOS UIKit)  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23VSRDesigns-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23MonoChromeUI-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23MinimalApps-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23LightDarkMode-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23SwiftUI-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CGPAApp-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23StudentDeveloper-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23AppleInspired-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
