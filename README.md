# Capitec iOS

Capitec is an **iOS Swift reference app** showcasing production-grade engineering practices—clean architecture, testing, CI/CD, and modular code quality.


## Demo


---

## Features
- Clean SwiftUI + MVVM-C architecture
- Combine-based networking
- Dependency injection
- Storage & config management
- Modularized feature layers (Eligiblity, Products)
- Localization
- XCTest
- GitHub Actions CI/CD ready

---

## Requirements
- macOS 13+
- Xcode 16+
- Swift 5.6+
- iOS 18+
- Swift Package Manager for dependencies

---

## Getting Started
```bash
git clone https://github.com/liampillaye/capitec.git
cd capitec
open Capitec.xcodeproj
```

---

## Build & Run

Select Capitec scheme

Target a simulator (e.g. iPhone 15)

Cmd+R to launch

---

## Testing

Run all tests:

```bash
xcodebuild test -scheme Capitec -destination 'platform=iOS Simulator,name=iPhone 15'
```

Includes:
Unit tests (business logic)

---

## Project Structure
```bash
Capitec/
 ├─ App/                  # AppDelegate, SceneDelegate
 ├─ Presentation/         # Views, ViewModels, & Common
 │   ├─ Common/
 │   ├─ LaunchScreen/
 │   └─ LoanEligiblitySimulator/
 ├─ Core/                 # Business logic & Use cases
 │   ├─ Application/
 │   ├─ Domain/
 ├─ Infrastucture/        # Networking, Persistence
 │   ├─ Infrastucture/
 │   ├─ Persistence/
 ├─ Assets/               # Images, Colors
 ├─ Tests/                # XCTest & mocks
```

---

## Contributing 

Fork & branch ```(feature/my-feature)```

Write tests, docs

Submit PR with descriptive commits

---

