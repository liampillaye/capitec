# Capitec iOS

Capitec is an **iOS Swift reference app** showcasing production-grade engineering practices—clean architecture, testing, CI/CD, and modular code quality.


## Demo

Simulator Demo of the Loan Eligilibity Simulator 

https://github.com/user-attachments/assets/950d8ddd-6646-4b66-9734-2f1422f8513b

[Project Reference](Demo/Capitec-Load-Eligiblity-Simulator-Demo.mp4)

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

## CHANGELOG.md

[CHANGELOG.md](CHANGELOG.md)

### Version 1.0.0 - 2025-09-29

#### Added

- Project Scaffolding using Clean Architecture
- Created Products View offering using Mock / Stubbed Data
- Create Product Detail View using Mock / Stubbed Data
- Created Loans Details (Step 1) using Mock / Stubbed Data
- Created Personal Information (Step 2) using Mock / Stubbed Data
- Created Financial Information (Step 3) using Mock / Stubbed Data
- Created Custom Form Validation and apply validation rules using Mocked / Stubbed Data
- Check Eligiblity and Present Eligiblity View using Mock / Stubbed Data
- Calculate Rate and Present view using Mock / Stubbed Data
- Create Reset (Start Again) process
- Added ViewModel Unit Test for basic test coverage
