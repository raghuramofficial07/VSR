<div align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" />
</div>

<div align="center">

![Trees](https://img.shields.io/badge/Trees-Framework_Trees-161b22?style=flat-square&labelColor=161b22&color=161b22&logo=apple&logoColor=white)
![Graphs](https://img.shields.io/badge/Graphs-Dependency_Graph-161b22?style=flat-square&labelColor=161b22&color=161b22&logo=swift&logoColor=orange)
![DP](https://img.shields.io/badge/DP-Pattern_Design-161b22?style=flat-square&labelColor=161b22&color=161b22&logo=xcode&logoColor=blue)
![Recursion](https://img.shields.io/badge/Recursion-Delegate_Chains-161b22?style=flat-square&labelColor=161b22&color=161b22&logo=apple&logoColor=white)
![Sorting](https://img.shields.io/badge/Sorting-Layer_Priority-161b22?style=flat-square&labelColor=161b22&color=161b22&logo=swift&logoColor=orange)

</div>

---

# 🍎 iOS / Swift Frameworks — Complete Notes

> **Purpose:** A clear, concise reference for all major Apple frameworks used in iOS development — what they do, why they exist, and how to use them with minimal example code.

---

## 📑 Table of Contents

1. [SwiftUI](#1-swiftui)
2. [UIKit](#2-uikit)
3. [AVFoundation](#3-avfoundation)
4. [ARKit](#4-arkit)
5. [Core Location](#5-core-location)
6. [Core Data](#6-core-data)
7. [Combine](#7-combine)
8. [MapKit](#8-mapkit)
9. [StoreKit](#9-storekit)
10. [UserNotifications](#10-usernotifications)
11. [Quick Revision Sheet](#-quick-revision-sheet)
12. [Framework Layer Map](#-framework-layer-map)

---

## 1. SwiftUI

### 📌 What is it?
Apple's **declarative UI framework** introduced in 2019. You describe *what* the UI looks like, and SwiftUI figures out *how* to render it.

### 🎯 Why use it?
- Less boilerplate than UIKit
- Live Previews in Xcode
- Automatic support for Dark Mode, Dynamic Type, accessibility
- Seamless integration across iOS, macOS, watchOS, tvOS

### ✅ Example

```swift
import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Taps: \(count)")
                .font(.largeTitle)
            Button("Tap Me") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

> **Key Concepts:** `@State`, `@Binding`, `@ObservedObject`, `@EnvironmentObject`

---

## 2. UIKit

### 📌 What is it?
The **original iOS UI framework** (since iOS 2). Imperative style — you explicitly tell the app what to do and when.

### 🎯 Why use it?
- Maximum control over UI and lifecycle
- Still needed for complex gestures, custom transitions, and legacy codebases
- Many third-party libraries are UIKit-based

### ✅ Example

```swift
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "Hello, UIKit!"
        label.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        view.addSubview(label)
    }
}
```

> **Key Concepts:** `UIViewController`, `UIView`, `Auto Layout`, `Storyboard / Programmatic UI`

---

## 3. AVFoundation

### 📌 What is it?
A framework for **audio and video capture, playback, and editing** on Apple platforms.

### 🎯 Why use it?
- Access device camera and microphone
- Play local or streaming audio/video
- Record and export media files
- Build camera apps, music players, voice recorders

### ✅ Example — Play an Audio File

```swift
import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    guard let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") else { return }
    player = try? AVAudioPlayer(contentsOf: url)
    player?.play()
}
```

### ✅ Example — Camera Capture Session

```swift
import AVFoundation

let session = AVCaptureSession()
let device = AVCaptureDevice.default(for: .video)!
let input = try! AVCaptureDeviceInput(device: device)
session.addInput(input)
session.startRunning()
```

> **Key Classes:** `AVAudioPlayer`, `AVPlayer`, `AVCaptureSession`, `AVSpeechSynthesizer`

---

## 4. ARKit

### 📌 What is it?
Apple's **Augmented Reality framework** that overlays digital content on the real world using the device camera, gyroscope, and depth sensors.

### 🎯 Why use it?
- Place 3D objects in real space
- Face tracking and body tracking
- Build apps like IKEA Place, Measure, games
- Works with SceneKit, RealityKit, or Metal for rendering

### ✅ Example — Basic AR Session

```swift
import ARKit
import RealityKit

class ARViewController: UIViewController {
    @IBOutlet var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)

        // Add a red sphere into AR space
        let sphere = MeshResource.generateSphere(radius: 0.1)
        let material = SimpleMaterial(color: .red, isMetallic: false)
        let entity = ModelEntity(mesh: sphere, materials: [material])

        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        arView.scene.addAnchor(anchor)
    }
}
```

> **Key Classes:** `ARSession`, `ARWorldTrackingConfiguration`, `ARView`, `ARAnchor`

---

## 5. Core Location

### 📌 What is it?
Framework for **accessing the device's geographic location**, heading, and region monitoring.

### 🎯 Why use it?
- Get user's GPS coordinates
- Reverse geocoding (coordinates → address)
- Geofencing (trigger events when entering/leaving a region)
- Compass heading

### ✅ Example

```swift
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last {
            print("Lat: \(loc.coordinate.latitude), Lon: \(loc.coordinate.longitude)")
        }
    }
}
```

> **Key Classes:** `CLLocationManager`, `CLLocation`, `CLGeocoder`, `CLRegion`

---

## 6. Core Data

### 📌 What is it?
Apple's **local persistence framework** — an ORM (Object-Relational Mapper) backed by SQLite (or binary/in-memory stores).

### 🎯 Why use it?
- Save and retrieve structured data offline
- Relationships between data models
- Automatic undo/redo support
- iCloud sync via NSPersistentCloudKitContainer

### ✅ Example — Save & Fetch

```swift
import CoreData

// Save
let context = persistentContainer.viewContext
let task = Task(context: context)
task.title = "Learn Core Data"
task.isDone = false
try? context.save()

// Fetch
let request: NSFetchRequest<Task> = Task.fetchRequest()
let tasks = try? context.fetch(request)
tasks?.forEach { print($0.title ?? "") }
```

> **Key Classes:** `NSManagedObject`, `NSManagedObjectContext`, `NSFetchRequest`, `NSPersistentContainer`

---

## 7. Combine

### 📌 What is it?
Apple's **reactive programming framework** (introduced iOS 13). Lets you work with asynchronous events and data streams in a declarative way.

### 🎯 Why use it?
- React to user input, network responses, or data changes
- Replace callbacks and delegation with clean pipelines
- Deeply integrated with SwiftUI via `@Published` and `ObservableObject`

### ✅ Example

```swift
import Combine

class ViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var results: [String] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { query in
                self.results = ["Result for \(query)"]
            }
            .store(in: &cancellables)
    }
}
```

> **Key Types:** `Publisher`, `Subscriber`, `AnyCancellable`, `@Published`, `PassthroughSubject`

---

## 8. MapKit

### 📌 What is it?
Framework to **embed interactive maps** in your app with annotations, overlays, and routing.

### 🎯 Why use it?
- Show Apple Maps inside your app
- Drop custom pins (annotations)
- Draw routes and overlays
- Search for places (Local Search)

### ✅ Example — SwiftUI Map with Pin

```swift
import MapKit
import SwiftUI

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 16.5, longitude: 80.6), // Vijayawada!
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}
```

> **Key Classes:** `MKMapView`, `MKAnnotation`, `MKOverlay`, `MKLocalSearch`, `Map` (SwiftUI)

---

## 9. StoreKit

### 📌 What is it?
Framework to **implement in-app purchases (IAP)** and subscriptions via the App Store.

### 🎯 Why use it?
- Sell consumables, non-consumables, or subscriptions
- Restore previous purchases
- Request App Store ratings and reviews

### ✅ Example — Request a Review

```swift
import StoreKit

func requestReview() {
    if let scene = UIApplication.shared.connectedScenes
        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
        SKStoreReviewController.requestReview(in: scene)
    }
}
```

> **Key Classes:** `SKProduct`, `SKPayment`, `SKPaymentQueue`, `Product` (new StoreKit 2 API)

---

## 10. UserNotifications

### 📌 What is it?
Framework to **schedule and handle local and remote (push) notifications**.

### 🎯 Why use it?
- Remind users at a specific time or location
- Display alerts, sounds, and badges
- Handle foreground / background notification delivery

### ✅ Example — Schedule a Local Notification

```swift
import UserNotifications

func scheduleNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Study Time!"
    content.body = "Time for your LeetCode session 🚀"
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
    let request = UNNotificationRequest(identifier: "leetcode", content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request)
}
```

> **Key Classes:** `UNUserNotificationCenter`, `UNNotificationRequest`, `UNMutableNotificationContent`, `UNNotificationTrigger`

---

## ⚡ Quick Revision Sheet

| Framework | Layer | Primary Use | SwiftUI Friendly? |
|---|---|---|---|
| **SwiftUI** | UI | Declarative UI building | ✅ Native |
| **UIKit** | UI | Imperative UI, full control | ⚠️ Via `UIViewRepresentable` |
| **AVFoundation** | Media | Audio/Video capture & playback | ⚠️ Via wrapper |
| **ARKit** | AR/3D | Augmented Reality | ⚠️ Via `ARViewContainer` |
| **Core Location** | Hardware | GPS, Geocoding, Geofencing | ✅ With `ObservableObject` |
| **Core Data** | Persistence | Local database (SQLite) | ✅ `@FetchRequest` |
| **Combine** | Reactive | Async streams & event handling | ✅ Powers `@Published` |
| **MapKit** | Maps | Embedded Apple Maps | ✅ `Map` view |
| **StoreKit** | Commerce | In-App Purchases & reviews | ✅ StoreKit 2 |
| **UserNotifications** | Notifications | Local & push notifications | ✅ Via `UNUserNotificationCenter` |

---

## 🗺 Framework Layer Map

```
┌─────────────────────────────────────────────────────┐
│                   YOUR APP                          │
├──────────────┬──────────────┬───────────────────────┤
│   SwiftUI    │    UIKit     │  (UI Layer)            │
├──────────────┴──────────────┴───────────────────────┤
│  Combine  │  Core Data  │  UserNotifications        │
│  (Reactive)  (Persist)    (Alerts)   (Logic Layer)  │
├─────────────────────────────────────────────────────┤
│  AVFoundation  │  ARKit  │  MapKit  │  Core Location│
│  (Media)         (AR)      (Maps)     (GPS)         │
│                   (Hardware / Sensor Layer)          │
├─────────────────────────────────────────────────────┤
│          Apple OS / Darwin Kernel                   │
└─────────────────────────────────────────────────────┘
```

---

> 📝 **Notes by Raghuram** · GitHub: [@RaghuRamOfficial07](https://github.com/RaghuRamOfficial07) · VSR — Vision · Shine · Rule
