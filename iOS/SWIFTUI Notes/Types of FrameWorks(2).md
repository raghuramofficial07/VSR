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

# 🍎 iOS / Swift — ALL Frameworks Complete Notes

> **Purpose:** A comprehensive reference for every major Apple framework used in iOS/Swift development — grouped by category, with what it does, why it exists, and concise example code.

---

## 📑 Table of Contents

### 🖼 UI Frameworks
1. [SwiftUI](#1-swiftui)
2. [UIKit](#2-uikit)
3. [AppKit](#3-appkit) *(macOS)*
4. [WatchKit](#4-watchkit)
5. [TVUIKit](#5-tvuikit)

### 🎵 Media & Graphics
6. [AVFoundation](#6-avfoundation)
7. [AVKit](#7-avkit)
8. [CoreImage](#8-coreimage)
9. [CoreGraphics (Quartz 2D)](#9-coregraphics-quartz-2d)
10. [CoreAnimation](#10-coreanimation)
11. [SceneKit](#11-scenekit)
12. [RealityKit](#12-realitykit)
13. [Metal](#13-metal)
14. [ModelIO](#14-modelio)
15. [PhotoKit](#15-photokit)
16. [Vision](#16-vision)

### 📍 Location, Maps & AR
17. [CoreLocation](#17-corelocation)
18. [MapKit](#18-mapkit)
19. [ARKit](#19-arkit)

### 🌐 Networking
20. [Foundation / URLSession](#20-foundation--urlsession)
21. [Network (NWPathMonitor)](#21-network-nwpathmonitor)
22. [WebKit](#22-webkit)
23. [MultipeerConnectivity](#23-multipeerconnectivity)
24. [GameKit (Networking)](#24-gamekit)

### 💾 Data & Persistence
25. [Core Data](#25-core-data)
26. [SwiftData](#26-swiftdata)
27. [CloudKit](#27-cloudkit)
28. [FileManager / Foundation IO](#28-filemanager--foundation-io)

### 🔔 System & Notifications
29. [UserNotifications](#29-usernotifications)
30. [BackgroundTasks](#30-backgroundtasks)
31. [EventKit](#31-eventkit)
32. [Contacts / ContactsUI](#32-contacts--contactsui)

### 🔐 Security & Privacy
33. [Security (Keychain)](#33-security-keychain)
34. [CryptoKit](#34-cryptokit)
35. [LocalAuthentication (FaceID/TouchID)](#35-localauthentication-faceidtouchid)
36. [AppTrackingTransparency](#36-apptracking-transparency)

### 🤖 Machine Learning & AI
37. [CoreML](#37-coreml)
38. [CreateML](#38-createml)
39. [NaturalLanguage](#39-naturallanguage)
40. [Speech](#40-speech)
41. [SoundAnalysis](#41-soundanalysis)

### 🎮 Games & Motion
42. [SpriteKit](#42-spritekit)
43. [GameplayKit](#43-gameplaykit)
44. [CoreMotion](#44-coremotion)
45. [CoreHaptics](#45-corehaptics)

### 💳 Commerce & App Services
46. [StoreKit](#46-storekit)
47. [PassKit (Wallet)](#47-passkit-wallet)
48. [AuthenticationServices (Sign in with Apple)](#48-authenticationservices-sign-in-with-apple)

### 🔗 Connectivity & Hardware
49. [CoreBluetooth](#49-corebluetooth)
50. [CoreNFC](#50-corenfc)
51. [ExternalAccessory](#51-externalaccessory)
52. [HealthKit](#52-healthkit)
53. [HomeKit](#53-homekit)
54. [SensorKit](#54-sensorkit)

### ⚡ Concurrency & Reactive
55. [Combine](#55-combine)
56. [Swift Concurrency (async/await)](#56-swift-concurrency-asyncawait)

### 🛠 Developer Tools & Diagnostics
57. [XCTest](#57-xctest)
58. [OSLog](#58-oslog)
59. [MetricKit](#59-metrickit)

### 📊 Quick Revision Sheet
60. [Master Quick Reference Table](#-master-quick-reference-table)
61. [Framework Layer Map](#-framework-layer-map)

---

## 🖼 UI FRAMEWORKS

---

## 1. SwiftUI

### 📌 What is it?
Apple's **declarative UI framework** (iOS 13+). You describe *what* the UI looks like — SwiftUI handles rendering, state, and layout automatically.

### 🎯 Why use it?
- Minimal boilerplate, maximum productivity
- Live Previews in Xcode
- Works across iOS, macOS, watchOS, tvOS, visionOS
- Built-in support for Dark Mode, accessibility, Dynamic Type

### ✅ Example

```swift
import SwiftUI

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(count)").font(.largeTitle)
            Button("Increment") { count += 1 }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
```

> **Key Property Wrappers:** `@State`, `@Binding`, `@ObservedObject`, `@EnvironmentObject`, `@StateObject`

---

## 2. UIKit

### 📌 What is it?
The **original imperative UI framework** for iOS (since iOS 2). You explicitly manage view hierarchies, lifecycle, and updates.

### 🎯 Why use it?
- Full control over every pixel and lifecycle event
- Required for complex custom gestures, transitions, and legacy apps
- Huge ecosystem of UIKit-based third-party libraries

### ✅ Example

```swift
import UIKit

class HomeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = "Hello UIKit"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
```

> **Key Classes:** `UIViewController`, `UIView`, `UITableView`, `UICollectionView`, `UINavigationController`

---

## 3. AppKit

### 📌 What is it?
The **macOS counterpart to UIKit** — the native UI framework for building Mac applications.

### 🎯 Why use it?
- Build native macOS apps with menus, windows, toolbars
- Access macOS-specific UI patterns (Dock, Finder integration)
- Required for Mac Catalyst or pure macOS targets

### ✅ Example

```swift
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentRect: NSMakeRect(0, 0, 480, 300),
                          styleMask: [.titled, .closable, .resizable],
                          backing: .buffered, defer: false)
        window.title = "My Mac App"
        window.makeKeyAndOrderFront(nil)
    }
}
```

> **Key Classes:** `NSWindow`, `NSViewController`, `NSButton`, `NSTextField`, `NSMenu`

---

## 4. WatchKit

### 📌 What is it?
Framework for building **Apple Watch apps**. In modern watchOS 7+, SwiftUI is the recommended approach, but WatchKit still handles lifecycle and complications.

### 🎯 Why use it?
- Build watchOS apps and complications (watch face widgets)
- Handle Digital Crown, Taptic Engine, heart rate sensor
- Communicate with the paired iPhone app via WatchConnectivity

### ✅ Example

```swift
import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    @IBOutlet var label: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        label.setText("Hello Watch!")
    }
}
```

> **Key Classes:** `WKInterfaceController`, `WKInterfaceLabel`, `WKInterfaceButton`, `WCSession`

---

## 5. TVUIKit

### 📌 What is it?
A framework extending UIKit for **Apple TV (tvOS)** apps, providing focus-driven UI components optimized for remote navigation.

### 🎯 Why use it?
- Build tvOS apps with TV-standard focus engine
- Lockup views (image + text card style) for content browsing
- TV-specific layout patterns (shelves, banners)

### ✅ Example

```swift
import TVUIKit

let card = TVMonogramView()
card.personNameComponents = PersonNameComponents()
card.image = UIImage(named: "avatar")
```

> **Key Classes:** `TVCardView`, `TVMonogramView`, `TVDigitEntryViewController`

---

## 🎵 MEDIA & GRAPHICS

---

## 6. AVFoundation

### 📌 What is it?
The core framework for **audio and video — capture, playback, editing, and streaming** on all Apple platforms.

### 🎯 Why use it?
- Access camera & microphone
- Play audio/video files or streams
- Record video, compose media timelines
- Text-to-speech via `AVSpeechSynthesizer`

### ✅ Example — Play Audio

```swift
import AVFoundation

var player: AVAudioPlayer?

func playSound(named name: String) {
    guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
    player = try? AVAudioPlayer(contentsOf: url)
    player?.play()
}
```

### ✅ Example — Text to Speech

```swift
let synth = AVSpeechSynthesizer()
let utterance = AVSpeechUtterance(string: "Hello Raghuram!")
utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
synth.speak(utterance)
```

> **Key Classes:** `AVAudioPlayer`, `AVPlayer`, `AVCaptureSession`, `AVSpeechSynthesizer`, `AVAsset`

---

## 7. AVKit

### 📌 What is it?
A **higher-level UI layer on top of AVFoundation** — provides ready-made video player UI (`AVPlayerViewController`).

### 🎯 Why use it?
- Drop-in video player with standard controls (play/pause, scrubber, PiP)
- No need to build custom player UI from scratch
- Supports Picture-in-Picture automatically

### ✅ Example

```swift
import AVKit

let url = URL(string: "https://example.com/video.mp4")!
let player = AVPlayer(url: url)
let playerVC = AVPlayerViewController()
playerVC.player = player
present(playerVC, animated: true) {
    player.play()
}
```

> **Key Classes:** `AVPlayerViewController`, `AVPlayerView` (macOS), `AVRoutePickerView`

---

## 8. CoreImage

### 📌 What is it?
A **image processing and filtering framework** that applies effects to images using the GPU.

### 🎯 Why use it?
- Apply filters: blur, sepia, color correction, vignette, etc.
- Face detection in images
- Chain multiple filters in a pipeline
- High performance via Metal/GPU acceleration

### ✅ Example

```swift
import CoreImage
import UIKit

func applySepia(to image: UIImage) -> UIImage? {
    let ci = CIImage(image: image)
    let filter = CIFilter(name: "CISepiaTone")!
    filter.setValue(ci, forKey: kCIInputImageKey)
    filter.setValue(0.8, forKey: kCIInputIntensityKey)

    let context = CIContext()
    if let output = filter.outputImage,
       let cgImg = context.createCGImage(output, from: output.extent) {
        return UIImage(cgImage: cgImg)
    }
    return nil
}
```

> **Key Classes:** `CIFilter`, `CIImage`, `CIContext`, `CIColor`, `CIVector`

---

## 9. CoreGraphics (Quartz 2D)

### 📌 What is it?
Apple's **2D drawing engine** — draw paths, shapes, gradients, PDFs, and images at a low level.

### 🎯 Why use it?
- Custom UIView drawing via `draw(_ rect:)`
- Generate PDFs programmatically
- Draw charts, graphs, custom shapes
- Pixel-level image manipulation

### ✅ Example

```swift
import UIKit

class CircleView: UIView {
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillEllipse(in: CGRect(x: 40, y: 40, width: 100, height: 100))
    }
}
```

> **Key Types:** `CGContext`, `CGPath`, `CGColor`, `CGRect`, `CGPoint`, `CGSize`

---

## 10. CoreAnimation

### 📌 What is it?
The **animation engine** underlying UIKit and SwiftUI. It composites layers and animates their properties on the GPU.

### 🎯 Why use it?
- Animate any `CALayer` property (position, opacity, transform)
- Keyframe and spring animations
- Layer masking, shadows, and gradients
- Particle emitters via `CAEmitterLayer`

### ✅ Example

```swift
import QuartzCore
import UIKit

let animation = CABasicAnimation(keyPath: "position.x")
animation.fromValue = 50
animation.toValue = 300
animation.duration = 1.0
animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
myView.layer.add(animation, forKey: "moveX")
myView.layer.position.x = 300
```

> **Key Classes:** `CALayer`, `CABasicAnimation`, `CAKeyframeAnimation`, `CAShapeLayer`, `CAEmitterLayer`

---

## 11. SceneKit

### 📌 What is it?
A **high-level 3D rendering framework** for building 3D scenes, games, and visualizations without needing Metal or OpenGL directly.

### 🎯 Why use it?
- Display and animate 3D models (.dae, .usdz)
- 3D games with physics simulation
- Used as ARKit's rendering backend (before RealityKit)
- Easier than Metal for most 3D use cases

### ✅ Example

```swift
import SceneKit

let scene = SCNScene()
let sphere = SCNSphere(radius: 0.5)
let node = SCNNode(geometry: sphere)
node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
scene.rootNode.addChildNode(node)

let sceneView = SCNView(frame: view.bounds)
sceneView.scene = scene
sceneView.autoenablesDefaultLighting = true
view.addSubview(sceneView)
```

> **Key Classes:** `SCNScene`, `SCNNode`, `SCNGeometry`, `SCNCamera`, `SCNLight`, `SCNPhysicsBody`

---

## 12. RealityKit

### 📌 What is it?
Apple's **modern AR/3D rendering framework** (iOS 13+), designed to work natively with ARKit. Replaces SceneKit for AR use cases.

### 🎯 Why use it?
- Physically based rendering (PBR) out of the box
- Built-in AR anchoring and plane detection
- Entity-Component-System (ECS) architecture
- Simpler API than SceneKit for AR apps

### ✅ Example

```swift
import RealityKit
import ARKit

let arView = ARView(frame: .zero)

let box = MeshResource.generateBox(size: 0.2)
let material = SimpleMaterial(color: .orange, isMetallic: true)
let entity = ModelEntity(mesh: box, materials: [material])

let anchor = AnchorEntity(plane: .horizontal)
anchor.addChild(entity)
arView.scene.addAnchor(anchor)
```

> **Key Classes:** `ARView`, `ModelEntity`, `AnchorEntity`, `MeshResource`, `SimpleMaterial`, `Entity`

---

## 13. Metal

### 📌 What is it?
Apple's **low-level GPU programming framework** — direct access to the graphics and compute hardware for maximum performance.

### 🎯 Why use it?
- Custom shaders (written in Metal Shading Language, MSL)
- High-performance rendering, image processing, ML inference
- Powers ARKit, CoreML, CoreImage, SceneKit under the hood
- Real-time visual effects and compute tasks

### ✅ Example — Setup Metal Device

```swift
import Metal
import MetalKit

guard let device = MTLCreateSystemDefaultDevice() else {
    fatalError("Metal not supported")
}

let commandQueue = device.makeCommandQueue()!
print("Metal device: \(device.name)")
// From here: create pipelines, buffers, textures, shaders
```

> **Key Types:** `MTLDevice`, `MTLCommandQueue`, `MTLRenderPipelineState`, `MTLBuffer`, `MTLTexture`

---

## 14. ModelIO

### 📌 What is it?
A framework to **import, export, and manipulate 3D assets** (OBJ, USD, USDZ, STL, ABC formats).

### 🎯 Why use it?
- Load and convert 3D models
- Generate procedural meshes and materials
- Bridge between file formats and SceneKit/Metal/RealityKit

### ✅ Example

```swift
import ModelIO
import SceneKit

let url = Bundle.main.url(forResource: "model", withExtension: "obj")!
let asset = MDLAsset(url: url)
let scnScene = SCNScene(mdlAsset: asset)
```

> **Key Classes:** `MDLAsset`, `MDLMesh`, `MDLMaterial`, `MDLCamera`, `MDLLight`

---

## 15. PhotoKit

### 📌 What is it?
Framework for **accessing and editing the user's photo and video library** on device.

### 🎯 Why use it?
- Browse, fetch, and display photos/videos from the Photo Library
- Create albums, save images/videos
- Observe library changes in real time
- Edit photos non-destructively

### ✅ Example

```swift
import Photos

PHPhotoLibrary.requestAuthorization { status in
    guard status == .authorized else { return }

    let fetchOptions = PHFetchOptions()
    let photos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
    print("Total photos: \(photos.count)")
}
```

> **Key Classes:** `PHAsset`, `PHFetchResult`, `PHImageManager`, `PHPhotoLibrary`, `PHChange`

---

## 16. Vision

### 📌 What is it?
Apple's **computer vision framework** — detect faces, barcodes, text, objects, body poses, and more in images or video.

### 🎯 Why use it?
- Face detection and recognition
- Text recognition (OCR) in images
- Barcode / QR code scanning
- Object tracking, saliency detection, body pose
- Works on-device, privacy preserving

### ✅ Example — Text Recognition (OCR)

```swift
import Vision
import UIKit

func recognizeText(in image: UIImage) {
    guard let cgImage = image.cgImage else { return }
    let request = VNRecognizeTextRequest { req, _ in
        let observations = req.results as? [VNRecognizedTextObservation] ?? []
        for obs in observations {
            print(obs.topCandidates(1).first?.string ?? "")
        }
    }
    request.recognitionLevel = .accurate
    try? VNImageRequestHandler(cgImage: cgImage).perform([request])
}
```

> **Key Classes:** `VNRequest`, `VNRecognizeTextRequest`, `VNDetectFaceRectanglesRequest`, `VNImageRequestHandler`

---

## 📍 LOCATION, MAPS & AR

---

## 17. CoreLocation

### 📌 What is it?
Framework for **GPS location, heading, geofencing, and iBeacon** detection.

### 🎯 Why use it?
- Get user's real-time coordinates
- Reverse geocoding (lat/lon → address)
- Geofencing: trigger events on region enter/exit
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
        guard let loc = locations.last else { return }
        print("📍 \(loc.coordinate.latitude), \(loc.coordinate.longitude)")
    }
}
```

> **Key Classes:** `CLLocationManager`, `CLLocation`, `CLGeocoder`, `CLRegion`, `CLBeaconRegion`

---

## 18. MapKit

### 📌 What is it?
Framework to **embed fully interactive Apple Maps** in your app with annotations, overlays, routing, and local search.

### 🎯 Why use it?
- Show maps with custom pins and overlays
- Get driving/walking directions
- Local search for points of interest
- SwiftUI `Map` view for quick embedding

### ✅ Example

```swift
import MapKit
import SwiftUI

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 16.5062, longitude: 80.6480), // Vijayawada
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}
```

> **Key Classes:** `MKMapView`, `MKAnnotation`, `MKPolyline`, `MKDirections`, `MKLocalSearch`

---

## 19. ARKit

### 📌 What is it?
Apple's **Augmented Reality framework** — overlays virtual content on the real world using camera, LiDAR, gyroscope, and depth sensors.

### 🎯 Why use it?
- World tracking and plane detection
- Face tracking and body tracking
- Object scanning and occlusion
- Used in apps like Measure, IKEA Place, Snapchat filters

### ✅ Example

```swift
import ARKit
import RealityKit

class ARViewController: UIViewController {
    @IBOutlet var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config)

        let sphere = MeshResource.generateSphere(radius: 0.1)
        let entity = ModelEntity(mesh: sphere,
                                 materials: [SimpleMaterial(color: .red, isMetallic: false)])
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        arView.scene.addAnchor(anchor)
    }
}
```

> **Key Classes:** `ARSession`, `ARWorldTrackingConfiguration`, `ARFaceTrackingConfiguration`, `ARAnchor`

---

## 🌐 NETWORKING

---

## 20. Foundation / URLSession

### 📌 What is it?
`URLSession` is the **standard networking API** in Foundation for HTTP/HTTPS requests, file downloads, and WebSocket connections.

### 🎯 Why use it?
- Fetch JSON from REST APIs
- Upload files and data
- Background downloads that persist app suspension
- WebSocket real-time communication

### ✅ Example

```swift
import Foundation

struct Post: Decodable { let id: Int; let title: String }

func fetchPost() async throws -> Post {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(Post.self, from: data)
}

// Call it:
Task {
    let post = try await fetchPost()
    print(post.title)
}
```

> **Key Classes:** `URLSession`, `URLRequest`, `URLResponse`, `URLSessionWebSocketTask`

---

## 21. Network (NWPathMonitor)

### 📌 What is it?
The **Network framework** provides low-level networking using `NWConnection` and monitors connectivity with `NWPathMonitor`.

### 🎯 Why use it?
- Detect if the device is on WiFi, cellular, or offline
- Build custom TCP/UDP connections
- Replace Reachability for network status checks

### ✅ Example

```swift
import Network

let monitor = NWPathMonitor()
monitor.pathUpdateHandler = { path in
    if path.status == .satisfied {
        print("Online — via \(path.usesInterfaceType(.wifi) ? "WiFi" : "Cellular")")
    } else {
        print("No connection")
    }
}
monitor.start(queue: DispatchQueue.global())
```

> **Key Classes:** `NWPathMonitor`, `NWPath`, `NWConnection`, `NWListener`

---

## 22. WebKit

### 📌 What is it?
Framework for **embedding a full web browser engine** (`WKWebView`) inside your app.

### 🎯 Why use it?
- Render HTML/CSS/JavaScript content
- Build hybrid apps (web + native)
- Display web-based documentation, OAuth login flows
- Intercept and customize web navigation

### ✅ Example

```swift
import WebKit

let webView = WKWebView(frame: view.bounds)
view.addSubview(webView)

let url = URL(string: "https://apple.com")!
webView.load(URLRequest(url: url))
```

> **Key Classes:** `WKWebView`, `WKNavigationDelegate`, `WKUIDelegate`, `WKUserScript`

---

## 23. MultipeerConnectivity

### 📌 What is it?
Framework for **peer-to-peer networking** between nearby iOS/macOS devices over WiFi, Bluetooth, or Apple Wireless Direct Link (AWDL).

### 🎯 Why use it?
- AirDrop-style file sharing in your app
- Multiplayer games between nearby devices
- Offline collaboration without internet

### ✅ Example

```swift
import MultipeerConnectivity

let peerID = MCPeerID(displayName: UIDevice.current.name)
let session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
let advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "my-app")
advertiser.startAdvertisingPeer()
```

> **Key Classes:** `MCSession`, `MCPeerID`, `MCNearbyServiceAdvertiser`, `MCNearbyServiceBrowser`

---

## 24. GameKit

### 📌 What is it?
Framework for **Game Center integration** — leaderboards, achievements, matchmaking, real-time and turn-based multiplayer.

### 🎯 Why use it?
- Add Game Center leaderboards and achievements to games
- Matchmake players for online multiplayer
- Peer-to-peer game networking via `GKMatch`

### ✅ Example

```swift
import GameKit

GKLocalPlayer.local.authenticateHandler = { vc, error in
    if let vc = vc {
        self.present(vc, animated: true)
    } else if GKLocalPlayer.local.isAuthenticated {
        print("Signed into Game Center: \(GKLocalPlayer.local.displayName)")
    }
}
```

> **Key Classes:** `GKLocalPlayer`, `GKLeaderboard`, `GKAchievement`, `GKMatch`, `GKTurnBasedMatch`

---

## 💾 DATA & PERSISTENCE

---

## 25. Core Data

### 📌 What is it?
Apple's **local persistence ORM** — stores structured data to SQLite (or binary/in-memory stores) with relationships, undo, and iCloud sync.

### 🎯 Why use it?
- Offline-first structured data storage
- Complex data relationships and queries
- Built-in undo/redo stack
- iCloud sync via `NSPersistentCloudKitContainer`

### ✅ Example

```swift
import CoreData

// Save
let ctx = persistentContainer.viewContext
let item = TodoItem(context: ctx)
item.title = "Build VSR Portfolio"
item.isDone = false
try? ctx.save()

// Fetch
let req: NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
req.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
let items = try? ctx.fetch(req)
```

> **Key Classes:** `NSManagedObject`, `NSManagedObjectContext`, `NSFetchRequest`, `NSPersistentContainer`

---

## 26. SwiftData

### 📌 What is it?
Apple's **modern replacement for Core Data** (iOS 17+), fully Swift-native with `@Model` macro and SwiftUI integration.

### 🎯 Why use it?
- Zero boilerplate compared to Core Data
- Declarative model definition using `@Model`
- Automatic SwiftUI binding with `@Query`
- iCloud sync built-in

### ✅ Example

```swift
import SwiftData
import SwiftUI

@Model
class Task {
    var title: String
    var isDone: Bool = false
    init(title: String) { self.title = title }
}

struct TaskListView: View {
    @Query var tasks: [Task]
    @Environment(\.modelContext) private var ctx

    var body: some View {
        List(tasks) { task in Text(task.title) }
        Button("Add") {
            ctx.insert(Task(title: "New Task"))
        }
    }
}
```

> **Key Macros/Types:** `@Model`, `@Query`, `ModelContext`, `ModelContainer`

---

## 27. CloudKit

### 📌 What is it?
Framework to **store and sync data in iCloud** using Apple's CloudKit servers.

### 🎯 Why use it?
- Sync user data across their Apple devices
- Store data in private (per-user) or public (shared) databases
- Push notifications when cloud data changes
- No backend server needed

### ✅ Example

```swift
import CloudKit

let record = CKRecord(recordType: "Note")
record["title"] = "CloudKit Note" as CKRecordValue

CKContainer.default().privateCloudDatabase.save(record) { saved, error in
    if let error = error { print("Error: \(error)"); return }
    print("Saved record: \(saved?.recordID.recordName ?? "")")
}
```

> **Key Classes:** `CKContainer`, `CKDatabase`, `CKRecord`, `CKQuery`, `CKSubscription`

---

## 28. FileManager / Foundation IO

### 📌 What is it?
`FileManager` is the standard API for **reading, writing, moving, and deleting files** in the app sandbox and shared containers.

### 🎯 Why use it?
- Save files to Documents, Caches, or temp directories
- Read/write JSON, images, or any binary data
- Manage app-generated files and directories

### ✅ Example

```swift
import Foundation

// Write
let text = "Hello, FileManager!"
let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
             .appendingPathComponent("notes.txt")
try? text.write(to: url, atomically: true, encoding: .utf8)

// Read
let content = try? String(contentsOf: url, encoding: .utf8)
print(content ?? "")
```

> **Key Classes:** `FileManager`, `URL`, `Data`, `UserDefaults` (for small key-value storage)

---

## 🔔 SYSTEM & NOTIFICATIONS

---

## 29. UserNotifications

### 📌 What is it?
Framework to **schedule local notifications and handle remote (push) notifications**.

### 🎯 Why use it?
- Alert users at a specific time or location
- Display alerts, sounds, and badge counts
- Handle rich notifications (images, action buttons)

### ✅ Example

```swift
import UserNotifications

func scheduleNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }

    let content = UNMutableNotificationContent()
    content.title = "LeetCode Time 🚀"
    content.body = "Solve your daily problem!"
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: false)
    let req = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(req)
}
```

> **Key Classes:** `UNUserNotificationCenter`, `UNMutableNotificationContent`, `UNNotificationRequest`, `UNNotificationTrigger`

---

## 30. BackgroundTasks

### 📌 What is it?
Framework to **schedule background work** that runs when the app is not in the foreground — for data refresh, maintenance, and processing.

### 🎯 Why use it?
- Refresh app content before the user opens it
- Run long data processing tasks in the background
- BGAppRefreshTask: short periodic work
- BGProcessingTask: longer work (charging, on WiFi)

### ✅ Example

```swift
import BackgroundTasks

BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.vsr.refresh",
                                using: nil) { task in
    self.handleRefresh(task: task as! BGAppRefreshTask)
}

func scheduleRefresh() {
    let req = BGAppRefreshTaskRequest(identifier: "com.vsr.refresh")
    req.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)
    try? BGTaskScheduler.shared.submit(req)
}
```

> **Key Classes:** `BGTaskScheduler`, `BGAppRefreshTask`, `BGProcessingTask`

---

## 31. EventKit

### 📌 What is it?
Framework to **access and edit Calendar events and Reminders** on the user's device.

### 🎯 Why use it?
- Add, edit, delete calendar events
- Create and manage reminders
- Read upcoming events for scheduling features

### ✅ Example

```swift
import EventKit

let store = EKEventStore()
store.requestAccess(to: .event) { granted, _ in
    guard granted else { return }

    let event = EKEvent(eventStore: store)
    event.title = "VSR App Launch"
    event.startDate = Date()
    event.endDate = Date().addingTimeInterval(3600)
    event.calendar = store.defaultCalendarForNewEvents

    try? store.save(event, span: .thisEvent)
    print("Event saved!")
}
```

> **Key Classes:** `EKEventStore`, `EKEvent`, `EKReminder`, `EKCalendar`

---

## 32. Contacts / ContactsUI

### 📌 What is it?
Framework to **read, create, and update contacts** in the user's Contacts app, with `ContactsUI` providing a standard contact picker UI.

### 🎯 Why use it?
- Access contacts for messaging/calling features
- Display native contact picker sheet
- Create new contacts programmatically

### ✅ Example

```swift
import Contacts
import ContactsUI

// Fetch contacts
let store = CNContactStore()
store.requestAccess(for: .contacts) { granted, _ in
    guard granted else { return }
    let req = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor,
                                                  CNContactFamilyNameKey as CNKeyDescriptor])
    try? store.enumerateContacts(with: req) { contact, _ in
        print("\(contact.givenName) \(contact.familyName)")
    }
}
```

> **Key Classes:** `CNContact`, `CNContactStore`, `CNContactPickerViewController`, `CNMutableContact`

---

## 🔐 SECURITY & PRIVACY

---

## 33. Security (Keychain)

### 📌 What is it?
The Security framework provides the **Keychain** — Apple's encrypted, hardware-backed secure storage for passwords, tokens, and certificates.

### 🎯 Why use it?
- Store auth tokens and passwords securely (not UserDefaults!)
- Encrypted even if device is accessed physically
- Survives app reinstallation (with proper access group)

### ✅ Example

```swift
import Security

// Save to Keychain
let data = "mySecretToken".data(using: .utf8)!
let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                               kSecAttrAccount: "authToken",
                               kSecValueData: data]
SecItemAdd(query as CFDictionary, nil)

// Read from Keychain
var result: AnyObject?
let readQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                   kSecAttrAccount: "authToken",
                                   kSecReturnData: true]
SecItemCopyMatching(readQuery as CFDictionary, &result)
```

> **Key Functions:** `SecItemAdd`, `SecItemCopyMatching`, `SecItemUpdate`, `SecItemDelete`

---

## 34. CryptoKit

### 📌 What is it?
Apple's **modern cryptography framework** (iOS 13+) for hashing, encryption, signing, and key exchange in pure Swift.

### 🎯 Why use it?
- Hash data with SHA-256, SHA-384, SHA-512
- Encrypt/decrypt data with AES-GCM or ChaCha20
- Sign and verify with ECDSA / Ed25519
- Diffie-Hellman key exchange (P256, P384)

### ✅ Example — SHA-256 Hash

```swift
import CryptoKit

let data = Data("Hello VSR".utf8)
let hash = SHA256.hash(data: data)
print(hash.compactMap { String(format: "%02x", $0) }.joined())
// → deterministic 64-char hex string
```

### ✅ Example — AES Encryption

```swift
import CryptoKit

let key = SymmetricKey(size: .bits256)
let message = Data("Secret message".utf8)
let sealed = try! AES.GCM.seal(message, using: key)
let decrypted = try! AES.GCM.open(sealed, using: key)
print(String(data: decrypted, encoding: .utf8)!)
```

> **Key Types:** `SHA256`, `AES.GCM`, `Curve25519`, `SymmetricKey`, `HMAC`, `P256`

---

## 35. LocalAuthentication (FaceID/TouchID)

### 📌 What is it?
Framework to **authenticate users with Face ID, Touch ID, or device passcode** without handling biometric data directly.

### 🎯 Why use it?
- Gate sensitive features behind biometric auth
- Works with Apple Watch's wrist detection too
- Privacy-safe: biometric data never leaves the Secure Enclave

### ✅ Example

```swift
import LocalAuthentication

func authenticate() {
    let context = LAContext()
    var error: NSError?

    guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
        print("Biometrics unavailable: \(error!.localizedDescription)")
        return
    }

    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                            localizedReason: "Unlock VSR App") { success, err in
        DispatchQueue.main.async {
            print(success ? "Authenticated ✅" : "Failed ❌")
        }
    }
}
```

> **Key Classes:** `LAContext`, `LAPolicy`, `LABiometryType`

---

## 36. AppTracking Transparency

### 📌 What is it?
Framework to **request user permission for app tracking** (IDFA), required by Apple's App Tracking Transparency policy (iOS 14+).

### 🎯 Why use it?
- Legally required to show the ATT prompt before accessing IDFA
- Users can opt out of cross-app tracking
- Submit with usage description in Info.plist

### ✅ Example

```swift
import AppTrackingTransparency

ATTrackingManager.requestTrackingAuthorization { status in
    switch status {
    case .authorized: print("Tracking allowed")
    case .denied:     print("Tracking denied")
    case .restricted: print("Restricted")
    case .notDetermined: print("Not asked yet")
    @unknown default: break
    }
}
```

> **Key Class:** `ATTrackingManager`, `ATTrackingManager.AuthorizationStatus`

---

## 🤖 MACHINE LEARNING & AI

---

## 37. CoreML

### 📌 What is it?
Apple's **on-device Machine Learning inference framework** — run ML models (.mlmodel) locally without any server or internet.

### 🎯 Why use it?
- Image classification, object detection, NLP on-device
- Fast inference with Neural Engine (Apple Silicon)
- Privacy-safe: data never leaves the device
- Convert models from TensorFlow/PyTorch via coremltools

### ✅ Example

```swift
import CoreML
import Vision

guard let model = try? MobileNetV2(configuration: .init()).model,
      let vnModel = try? VNCoreMLModel(for: model) else { return }

let request = VNCoreMLRequest(model: vnModel) { req, _ in
    let results = req.results as? [VNClassificationObservation] ?? []
    print(results.first?.identifier ?? "Unknown")
}

let handler = VNImageRequestHandler(cgImage: cgImage)
try? handler.perform([request])
```

> **Key Classes:** `MLModel`, `VNCoreMLModel`, `VNCoreMLRequest`, `MLFeatureValue`

---

## 38. CreateML

### 📌 What is it?
Framework for **training custom ML models directly on Mac** — create image classifiers, text classifiers, recommendation systems, and more.

### 🎯 Why use it?
- Train models without Python/cloud infrastructure
- Works in Xcode's CreateML app or Swift Playgrounds
- Exports .mlmodel directly ready for CoreML

### ✅ Example

```swift
import CreateML
import Foundation

let trainingData = try! MLDataTable(contentsOf: URL(fileURLWithPath: "data.csv"))
let classifier = try! MLTextClassifier(trainingData: trainingData,
                                       textColumn: "text",
                                       labelColumn: "label")
try! classifier.write(to: URL(fileURLWithPath: "MyClassifier.mlmodel"))
```

> **Key Classes:** `MLImageClassifier`, `MLTextClassifier`, `MLDataTable`, `MLSoundClassifier`

---

## 39. NaturalLanguage

### 📌 What is it?
Framework for **Natural Language Processing (NLP)** on-device — tokenization, language detection, sentiment analysis, named entity recognition.

### 🎯 Why use it?
- Detect the language of any text
- Tokenize sentences into words/sentences
- Tag named entities (person, place, organization)
- Sentiment scoring without a server

### ✅ Example

```swift
import NaturalLanguage

// Language detection
let recognizer = NLLanguageRecognizer()
recognizer.processString("Namaste, how are you?")
print(recognizer.dominantLanguage?.rawValue ?? "Unknown")

// Sentiment analysis
let tagger = NLTagger(tagSchemes: [.sentimentScore])
tagger.string = "I love building iOS apps!"
let (sentiment, _) = tagger.tag(at: tagger.string!.startIndex,
                                  unit: .paragraph, scheme: .sentimentScore)
print(sentiment?.rawValue ?? "") // → positive score
```

> **Key Classes:** `NLLanguageRecognizer`, `NLTagger`, `NLTokenizer`, `NLEmbedding`

---

## 40. Speech

### 📌 What is it?
Framework for **Speech-to-Text (STT)** — transcribe live microphone input or pre-recorded audio to text using Apple's on-device or server-based recognition.

### 🎯 Why use it?
- Voice input for your app
- Real-time live transcription
- Dictation features
- Supports 50+ languages

### ✅ Example

```swift
import Speech

let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
let request = SFSpeechURLRecognitionRequest(url: audioFileURL)

recognizer.recognitionTask(with: request) { result, error in
    if let transcription = result?.bestTranscription.formattedString {
        print("Transcribed: \(transcription)")
    }
}
```

> **Key Classes:** `SFSpeechRecognizer`, `SFSpeechURLRecognitionRequest`, `SFSpeechAudioBufferRecognitionRequest`

---

## 41. SoundAnalysis

### 📌 What is it?
Framework to **analyze audio and classify sounds** using CoreML models or built-in classifiers (dog barking, siren, speech, etc.).

### 🎯 Why use it?
- Identify environmental sounds in real time
- Classify music, speech, noise
- Use built-in `SNClassifySoundRequest` with Apple's model

### ✅ Example

```swift
import SoundAnalysis

let analyzer = try! SNAudioStreamAnalyzer(format: audioFormat)
let request = try! SNClassifySoundRequest(classifierIdentifier: .version1)
try! analyzer.add(request, withObserver: myObserver)
// Feed audio buffers: analyzer.analyze(buffer, atAudioFramePosition: framePos)
```

> **Key Classes:** `SNAudioStreamAnalyzer`, `SNClassifySoundRequest`, `SNResultsObserving`

---

## 🎮 GAMES & MOTION

---

## 42. SpriteKit

### 📌 What is it?
Apple's **2D game framework** — sprites, physics, particles, actions, and a scene graph for casual 2D games.

### 🎯 Why use it?
- Build 2D games like Angry Birds, Flappy Bird style
- Built-in physics engine (collision, gravity, joints)
- Particle effects (fire, snow, sparks)
- Integrated with GameKit for leaderboards

### ✅ Example

```swift
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let ball = SKShapeNode(circleOfRadius: 30)
        ball.fillColor = .red
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        addChild(ball)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
}
```

> **Key Classes:** `SKScene`, `SKNode`, `SKSpriteNode`, `SKPhysicsBody`, `SKAction`, `SKEmitterNode`

---

## 43. GameplayKit

### 📌 What is it?
Framework providing **game AI and logic tools** — pathfinding, state machines, decision trees, randomization, and rule systems.

### 🎯 Why use it?
- A* pathfinding for enemy navigation
- Finite State Machines for game logic
- Procedural content generation (noise, randomness)
- Works with SpriteKit, SceneKit, or custom renderers

### ✅ Example — State Machine

```swift
import GameplayKit

class IdleState: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == RunState.self
    }
}

class RunState: GKState { }

let machine = GKStateMachine(states: [IdleState(), RunState()])
machine.enter(IdleState.self)
machine.enter(RunState.self)
```

> **Key Classes:** `GKStateMachine`, `GKAgent`, `GKObstacleGraph`, `GKRuleSystem`, `GKNoise`

---

## 44. CoreMotion

### 📌 What is it?
Framework to **access device motion sensors** — accelerometer, gyroscope, magnetometer, barometer, and step counter.

### 🎯 Why use it?
- Detect device orientation and tilt
- Build pedometers and fitness apps
- Shake gestures and motion-based controls
- Altitude from barometer

### ✅ Example

```swift
import CoreMotion

let motionManager = CMMotionManager()
motionManager.accelerometerUpdateInterval = 0.1
motionManager.startAccelerometerUpdates(to: .main) { data, _ in
    guard let acc = data?.acceleration else { return }
    print("X: \(acc.x), Y: \(acc.y), Z: \(acc.z)")
}
```

> **Key Classes:** `CMMotionManager`, `CMAccelerometerData`, `CMGyroData`, `CMAltimeter`, `CMPedometer`

---

## 45. CoreHaptics

### 📌 What is it?
Framework to **create custom haptic (vibration) feedback patterns** using the Taptic Engine on iPhone and Apple Watch.

### 🎯 Why use it?
- Design precise haptic patterns (tap, thump, buzz)
- Sync haptics with audio for immersive UX
- Beyond simple `UIImpactFeedbackGenerator` — fully customizable

### ✅ Example

```swift
import CoreHaptics

var engine: CHHapticEngine?

func playHaptic() {
    engine = try? CHHapticEngine()
    try? engine?.start()

    let event = CHHapticEvent(eventType: .hapticTransient,
                               parameters: [CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                                            CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)],
                               relativeTime: 0)
    let pattern = try! CHHapticPattern(events: [event], parameters: [])
    let player = try! engine!.makePlayer(with: pattern)
    try! player.start(atTime: 0)
}
```

> **Key Classes:** `CHHapticEngine`, `CHHapticPattern`, `CHHapticEvent`, `CHHapticEventParameter`

---

## 💳 COMMERCE & APP SERVICES

---

## 46. StoreKit

### 📌 What is it?
Framework for **In-App Purchases (IAP), subscriptions, and App Store interactions**.

### 🎯 Why use it?
- Sell consumable, non-consumable, or subscription products
- Restore purchases across devices
- Prompt users for App Store ratings
- StoreKit 2 (iOS 15+): modern async Swift API

### ✅ Example — StoreKit 2

```swift
import StoreKit

func purchase(productID: String) async throws {
    let products = try await Product.products(for: [productID])
    guard let product = products.first else { return }
    let result = try await product.purchase()
    switch result {
    case .success(let verification):
        print("Purchased: \(verification)")
    case .userCancelled:
        print("Cancelled")
    default: break
    }
}
```

> **Key Types (StoreKit 2):** `Product`, `Transaction`, `StoreKit.AppStore`

---

## 47. PassKit (Wallet)

### 📌 What is it?
Framework to **create and manage Apple Wallet passes** — boarding passes, tickets, loyalty cards, coupons, and Apple Pay.

### 🎯 Why use it?
- Add digital passes to Apple Wallet
- Implement Apple Pay in your app
- Show time/location-based pass notifications

### ✅ Example

```swift
import PassKit

func addPassToWallet(passData: Data) {
    guard PKAddPassesViewController.canAddPasses(),
          let pass = try? PKPass(data: passData),
          let vc = PKAddPassesViewController(pass: pass) else { return }
    present(vc, animated: true)
}
```

> **Key Classes:** `PKPass`, `PKAddPassesViewController`, `PKPaymentRequest`, `PKPaymentAuthorizationController`

---

## 48. AuthenticationServices (Sign in with Apple)

### 📌 What is it?
Framework providing **Sign in with Apple** and ASWebAuthenticationSession for OAuth-based authentication flows.

### 🎯 Why use it?
- Required if your app uses any third-party login (Apple's guideline)
- Privacy-friendly: hide real email with relay addresses
- Single tap login with Face ID / Touch ID
- No password management needed

### ✅ Example

```swift
import AuthenticationServices

class LoginVC: UIViewController, ASAuthorizationControllerDelegate {
    func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }

    func authorizationController(controller: ASAuthorizationController,
                                  didCompleteWithAuthorization authorization: ASAuthorization) {
        if let cred = authorization.credential as? ASAuthorizationAppleIDCredential {
            print("User: \(cred.user), Email: \(cred.email ?? "hidden")")
        }
    }
}
```

> **Key Classes:** `ASAuthorizationAppleIDProvider`, `ASAuthorizationController`, `ASWebAuthenticationSession`

---

## 🔗 CONNECTIVITY & HARDWARE

---

## 49. CoreBluetooth

### 📌 What is it?
Framework for **Bluetooth Low Energy (BLE)** communication — connect to and exchange data with BLE peripherals (wearables, sensors, etc.).

### 🎯 Why use it?
- Communicate with fitness trackers, smart devices, IoT sensors
- Build BLE peripherals (your iPhone as a BLE server)
- Transfer data wirelessly between nearby devices

### ✅ Example

```swift
import CoreBluetooth

class BLEManager: NSObject, CBCentralManagerDelegate {
    var centralManager: CBCentralManager!

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                         advertisementData: [String: Any], rssi RSSI: NSNumber) {
        print("Found: \(peripheral.name ?? "Unknown") RSSI: \(RSSI)")
    }
}
```

> **Key Classes:** `CBCentralManager`, `CBPeripheral`, `CBService`, `CBCharacteristic`, `CBPeripheralManager`

---

## 50. CoreNFC

### 📌 What is it?
Framework to **read NFC (Near Field Communication) tags** — NDEF tags, ISO 15693, FeliCa, MIFARE, and more.

### 🎯 Why use it?
- Scan NFC tags (product labels, transit cards, smart posters)
- Write NDEF messages to writable NFC tags
- QR-code-free product authentication

### ✅ Example

```swift
import CoreNFC

class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?

    func beginScanning() {
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session?.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for record in messages.flatMap(\.records) {
            print(String(data: record.payload, encoding: .utf8) ?? "")
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {}
}
```

> **Key Classes:** `NFCNDEFReaderSession`, `NFCTagReaderSession`, `NFCNDEFMessage`, `NFCNDEFPayload`

---

## 51. ExternalAccessory

### 📌 What is it?
Framework to **communicate with MFi-certified hardware accessories** connected via Lightning, USB-C, or Bluetooth.

### 🎯 Why use it?
- Talk to barcode scanners, medical devices, POS hardware
- Receive streams of accessory data
- Required for MFi (Made for iPhone) hardware partners

### ✅ Example

```swift
import ExternalAccessory

let manager = EAAccessoryManager.shared()
manager.registerForLocalNotifications()

let accessories = manager.connectedAccessories
accessories.forEach { print($0.name, $0.protocolStrings) }
```

> **Key Classes:** `EAAccessoryManager`, `EAAccessory`, `EASession`

---

## 52. HealthKit

### 📌 What is it?
Framework to **read and write health and fitness data** from the centralized HealthKit store (shared with the Health app).

### 🎯 Why use it?
- Read steps, heart rate, sleep, workouts, nutrition data
- Write workout sessions and health metrics
- Build fitness and wellness apps

### ✅ Example

```swift
import HealthKit

let store = HKHealthStore()
let stepType = HKQuantityType(.stepCount)

store.requestAuthorization(toShare: [], read: [stepType]) { granted, _ in
    guard granted else { return }

    let query = HKStatisticsQuery(quantityType: stepType,
                                   quantitySamplePredicate: nil,
                                   options: .cumulativeSum) { _, stats, _ in
        let steps = stats?.sumQuantity()?.doubleValue(for: .count()) ?? 0
        print("Steps today: \(Int(steps))")
    }
    store.execute(query)
}
```

> **Key Classes:** `HKHealthStore`, `HKQuantityType`, `HKWorkout`, `HKStatisticsQuery`, `HKSampleQuery`

---

## 53. HomeKit

### 📌 What is it?
Framework to **control HomeKit-compatible smart home accessories** — lights, locks, thermostats, cameras, and more.

### 🎯 Why use it?
- Build apps that control smart home devices
- Automate scenes and schedules
- Integrate with Siri for voice control of accessories

### ✅ Example

```swift
import HomeKit

let manager = HMHomeManager()
// After delegate setup:
// manager.homes → [HMHome]
// home.accessories → [HMAccessory]
// accessory.services → [HMService]
// service.characteristics → [HMCharacteristic] (brightness, on/off, etc.)
```

> **Key Classes:** `HMHomeManager`, `HMHome`, `HMAccessory`, `HMService`, `HMCharacteristic`

---

## 54. SensorKit

### 📌 What is it?
Framework to **access high-fidelity sensor streams** (requires user consent and entitlement) for health research apps — ambient light, device usage, on-wrist detection, etc.

### 🎯 Why use it?
- Research studies needing fine-grained sensor access
- Ambient light, keyboard usage, phone usage patterns
- Requires special entitlement from Apple

### ✅ Example

```swift
import SensorKit

let reader = SRSensorReader(sensor: .ambientLightSensor)
reader.requestAuthorization { error in
    if error == nil { reader.startRecording() }
}
```

> **Key Classes:** `SRSensorReader`, `SRDevice`, `SRAmbientLightSample`

---

## ⚡ CONCURRENCY & REACTIVE

---

## 55. Combine

### 📌 What is it?
Apple's **reactive programming framework** (iOS 13+) — compose and transform asynchronous event streams declaratively.

### 🎯 Why use it?
- Replace callback hell with clean pipelines
- Power `@Published` and `ObservableObject` in SwiftUI
- Debounce search input, merge network responses

### ✅ Example

```swift
import Combine

class SearchViewModel: ObservableObject {
    @Published var query = ""
    @Published var results: [String] = []
    private var bag = Set<AnyCancellable>()

    init() {
        $query
            .debounce(for: 0.4, scheduler: RunLoop.main)
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .sink { [weak self] text in
                self?.results = ["Result for '\(text)'"]
            }
            .store(in: &bag)
    }
}
```

> **Key Types:** `Publisher`, `Subscriber`, `AnyCancellable`, `PassthroughSubject`, `CurrentValueSubject`

---

## 56. Swift Concurrency (async/await)

### 📌 What is it?
Swift's **built-in structured concurrency system** (Swift 5.5 / iOS 15+) — async functions, Tasks, actors, and AsyncStream.

### 🎯 Why use it?
- Replace DispatchQueue/closures with readable linear async code
- `async/await` for sequential async operations
- `async let` for parallel concurrent tasks
- Actors for data-race-safe shared state

### ✅ Example

```swift
import Foundation

func fetchUserData() async throws -> String {
    let url = URL(string: "https://api.example.com/user")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return String(data: data, encoding: .utf8) ?? ""
}

// Parallel tasks
async let profile = fetchUserData()
async let posts   = fetchPosts()
let (userData, userPosts) = try await (profile, posts)
```

> **Key Concepts:** `async`, `await`, `Task`, `async let`, `actor`, `AsyncStream`, `MainActor`

---

## 🛠 DEVELOPER TOOLS & DIAGNOSTICS

---

## 57. XCTest

### 📌 What is it?
Apple's **testing framework** for unit tests, integration tests, and UI automation tests in Xcode.

### 🎯 Why use it?
- Write unit tests for your business logic
- UI tests that simulate real user interactions
- Performance measurement with `measure {}`
- CI/CD pipeline integration with `xcodebuild test`

### ✅ Example

```swift
import XCTest

class MathTests: XCTestCase {
    func testAddition() {
        XCTAssertEqual(2 + 2, 4)
    }

    func testPerformance() {
        measure {
            _ = (0..<10_000).reduce(0, +)
        }
    }
}
```

> **Key Classes:** `XCTestCase`, `XCTAssert*`, `XCUIApplication`, `XCUIElement`

---

## 58. OSLog

### 📌 What is it?
Apple's **structured, privacy-respecting logging system** for debugging and diagnostics — replaces `print()` and `NSLog` for production apps.

### 🎯 Why use it?
- Categorized, filterable logs in Xcode Console and Console.app
- Privacy redaction (mask sensitive data in logs)
- Levels: debug, info, notice, error, fault
- Near-zero performance overhead (lazy evaluation)

### ✅ Example

```swift
import OSLog

let logger = Logger(subsystem: "com.vsr.app", category: "network")

func fetchData() async {
    logger.debug("Starting fetch...")
    do {
        let data = try await URLSession.shared.data(from: url)
        logger.info("Fetched \(data.0.count) bytes")
    } catch {
        logger.error("Fetch failed: \(error.localizedDescription)")
    }
}
```

> **Key Types:** `Logger`, `OSLog`, `OSSignposter` (for performance intervals)

---

## 59. MetricKit

### 📌 What is it?
Framework to **receive on-device app performance metrics** — CPU, memory, disk I/O, hang rate, launch time, and crash reports.

### 🎯 Why use it?
- Get production performance data without Instruments
- Detect regressions in launch time or memory
- Receive diagnostic crash payloads for analysis
- Reports delivered to `MXMetricManagerSubscriber`

### ✅ Example

```swift
import MetricKit

class MetricsSubscriber: NSObject, MXMetricManagerSubscriber {
    override init() {
        super.init()
        MXMetricManager.shared.add(self)
    }

    func didReceive(_ payloads: [MXMetricPayload]) {
        for payload in payloads {
            print("Launch time avg: \(payload.applicationLaunchMetrics?.histogrammedTimeToFirstDraw)")
        }
    }
}
```

> **Key Classes:** `MXMetricManager`, `MXMetricPayload`, `MXDiagnosticPayload`, `MXCrashDiagnostic`

---

## ⚡ Master Quick Reference Table

| # | Framework | Category | Primary Use | iOS Since | SwiftUI Ready |
|---|---|---|---|---|---|
| 1 | **SwiftUI** | UI | Declarative UI | 13 | ✅ Native |
| 2 | **UIKit** | UI | Imperative UI | 2 | ⚠️ `UIViewRepresentable` |
| 3 | **AppKit** | UI | macOS native UI | macOS | ⚠️ macOS only |
| 4 | **WatchKit** | UI | Apple Watch apps | watchOS 1 | ⚠️ Use SwiftUI on watchOS 7+ |
| 5 | **TVUIKit** | UI | tvOS UI components | tvOS 12 | ⚠️ Via wrapper |
| 6 | **AVFoundation** | Media | Audio/Video capture & playback | 4 | ⚠️ Wrapper |
| 7 | **AVKit** | Media | Ready-made video player UI | 8 | ✅ `VideoPlayer` |
| 8 | **CoreImage** | Media | Image filters & processing | 5 | ⚠️ Wrapper |
| 9 | **CoreGraphics** | Media | 2D drawing, PDFs | 2 | ⚠️ `Canvas` in SwiftUI |
| 10 | **CoreAnimation** | Media | GPU layer animation | 2 | ⚠️ `withAnimation` in SwiftUI |
| 11 | **SceneKit** | 3D | High-level 3D scenes | 8 | ⚠️ `SceneView` |
| 12 | **RealityKit** | 3D/AR | AR rendering & ECS | 13 | ⚠️ `RealityView` (iOS 18) |
| 13 | **Metal** | Graphics | Low-level GPU programming | 8 | ⚠️ Via `MetalView` |
| 14 | **ModelIO** | 3D | 3D asset import/export | 9 | ⚠️ Indirect |
| 15 | **PhotoKit** | Media | Photo library access | 8 | ✅ `PhotosPicker` |
| 16 | **Vision** | AI/CV | Face/text/object detection | 11 | ⚠️ Wrapper |
| 17 | **CoreLocation** | Location | GPS, geocoding, geofencing | 2 | ✅ `ObservableObject` |
| 18 | **MapKit** | Maps | Embedded Apple Maps | 3 | ✅ `Map` view |
| 19 | **ARKit** | AR | Augmented Reality | 11 | ⚠️ `ARViewContainer` |
| 20 | **URLSession** | Network | HTTP/REST networking | 7 | ✅ async/await |
| 21 | **Network** | Network | BG connectivity monitor | 12 | ✅ `ObservableObject` |
| 22 | **WebKit** | Network | Embedded web browser | 8 | ⚠️ `WebView` wrapper |
| 23 | **MultipeerConnectivity** | Network | P2P device networking | 7 | ⚠️ Wrapper |
| 24 | **GameKit** | Games | Game Center, multiplayer | 4 | ⚠️ Wrapper |
| 25 | **Core Data** | Persistence | Local SQLite ORM | 3 | ✅ `@FetchRequest` |
| 26 | **SwiftData** | Persistence | Modern Core Data replacement | 17 | ✅ `@Query` |
| 27 | **CloudKit** | Persistence | iCloud data sync | 8 | ✅ `@CloudStorage` |
| 28 | **FileManager** | Persistence | File system I/O | 2 | ✅ Direct |
| 29 | **UserNotifications** | System | Local & push notifications | 10 | ✅ Direct |
| 30 | **BackgroundTasks** | System | Background processing | 13 | ✅ Direct |
| 31 | **EventKit** | System | Calendar & Reminders | 4 | ⚠️ Wrapper |
| 32 | **Contacts** | System | Address book access | 9 | ⚠️ Wrapper |
| 33 | **Security (Keychain)** | Security | Encrypted credential storage | 2 | ✅ Direct |
| 34 | **CryptoKit** | Security | Hashing, encryption, signing | 13 | ✅ Direct |
| 35 | **LocalAuthentication** | Security | Face ID / Touch ID | 8 | ✅ Direct |
| 36 | **AppTrackingTransparency** | Privacy | IDFA tracking consent | 14 | ✅ Direct |
| 37 | **CoreML** | ML/AI | On-device ML inference | 11 | ✅ Direct |
| 38 | **CreateML** | ML/AI | Train ML models on Mac | macOS 10.14 | macOS only |
| 39 | **NaturalLanguage** | ML/AI | NLP, sentiment, entity tagging | 12 | ✅ Direct |
| 40 | **Speech** | ML/AI | Speech-to-text (STT) | 10 | ✅ Direct |
| 41 | **SoundAnalysis** | ML/AI | Environmental sound classification | 13 | ✅ Direct |
| 42 | **SpriteKit** | Games | 2D games & physics | 7 | ✅ `SpriteView` |
| 43 | **GameplayKit** | Games | Game AI & pathfinding | 9 | ⚠️ Indirect |
| 44 | **CoreMotion** | Hardware | Accelerometer, gyro, pedometer | 4 | ✅ `ObservableObject` |
| 45 | **CoreHaptics** | Hardware | Custom haptic patterns | 13 | ✅ Direct |
| 46 | **StoreKit** | Commerce | In-App Purchases | 3 | ✅ StoreKit 2 |
| 47 | **PassKit** | Commerce | Apple Wallet & Apple Pay | 6 | ⚠️ `PaymentButton` |
| 48 | **AuthenticationServices** | Auth | Sign in with Apple / OAuth | 13 | ✅ `SignInWithAppleButton` |
| 49 | **CoreBluetooth** | Hardware | BLE device communication | 5 | ⚠️ `ObservableObject` |
| 50 | **CoreNFC** | Hardware | NFC tag reading/writing | 11 | ⚠️ Wrapper |
| 51 | **ExternalAccessory** | Hardware | MFi hardware accessories | 3 | ⚠️ Wrapper |
| 52 | **HealthKit** | Health | Health & fitness data | 8 | ⚠️ `ObservableObject` |
| 53 | **HomeKit** | IoT | Smart home accessory control | 8 | ⚠️ Wrapper |
| 54 | **SensorKit** | Research | Fine-grained sensor streams | 14 | ⚠️ Research only |
| 55 | **Combine** | Reactive | Async event streams | 13 | ✅ Powers `@Published` |
| 56 | **Swift Concurrency** | Concurrency | async/await, actors, Tasks | 15 | ✅ Native |
| 57 | **XCTest** | Dev Tools | Unit & UI testing | 7 | ✅ Direct |
| 58 | **OSLog** | Dev Tools | Structured production logging | 10 | ✅ Direct |
| 59 | **MetricKit** | Dev Tools | App performance metrics | 13 | ✅ Direct |

---

## 🗺 Framework Layer Map

```
╔══════════════════════════════════════════════════════════════════════╗
║                          YOUR iOS APP                               ║
╠══════════════════╦═══════════════════╦════════════════════════════  ║
║  SwiftUI         ║  UIKit / AppKit   ║  WatchKit / TVUIKit          ║
║  (Declarative)   ║  (Imperative)     ║  (Platform-specific UI)      ║
╠══════════════════╩═══════════════════╩════════════════════════════  ║
║  LOGIC / SERVICE LAYER                                              ║
║  Combine │ Swift Concurrency │ Core Data │ SwiftData │ CloudKit     ║
║  URLSession │ Network │ UserNotifications │ BackgroundTasks         ║
╠═════════════════════════════════════════════════════════════════════╣
║  MEDIA & GRAPHICS LAYER                                             ║
║  AVFoundation │ AVKit │ PhotoKit │ CoreImage │ CoreGraphics         ║
║  CoreAnimation │ SceneKit │ RealityKit │ Metal │ ModelIO            ║
╠═════════════════════════════════════════════════════════════════════╣
║  INTELLIGENCE LAYER (On-Device AI)                                  ║
║  CoreML │ Vision │ NaturalLanguage │ Speech │ SoundAnalysis         ║
╠═════════════════════════════════════════════════════════════════════╣
║  HARDWARE / SENSOR LAYER                                            ║
║  CoreLocation │ MapKit │ ARKit │ CoreMotion │ CoreHaptics           ║
║  CoreBluetooth │ CoreNFC │ HealthKit │ HomeKit │ SensorKit          ║
╠═════════════════════════════════════════════════════════════════════╣
║  SECURITY & AUTH LAYER                                              ║
║  Security (Keychain) │ CryptoKit │ LocalAuthentication              ║
║  AuthenticationServices │ AppTrackingTransparency                   ║
╠═════════════════════════════════════════════════════════════════════╣
║  PLATFORM SERVICES LAYER                                            ║
║  StoreKit │ PassKit │ EventKit │ Contacts │ GameKit │ WebKit        ║
║  MultipeerConnectivity │ ExternalAccessory │ SpriteKit              ║
╠═════════════════════════════════════════════════════════════════════╣
║  DIAGNOSTICS LAYER                                                  ║
║  XCTest │ OSLog │ MetricKit                                         ║
╠═════════════════════════════════════════════════════════════════════╣
║                    Apple OS / Darwin Kernel                         ║
║          (XNU Kernel │ libdispatch │ Foundation │ libc)             ║
╚═════════════════════════════════════════════════════════════════════╝
```

---

> 📝 **Notes by Raghuram** · GitHub: [@RaghuRamOfficial07](https://github.com/RaghuRamOfficial07) · VSR — Vision · Shine · Rule
