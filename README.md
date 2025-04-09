# Ricky & Morty Search App

A SwiftUI-based iOS application that fetches characters from the [Rick and Morty API](https://rickandmortyapi.com/documentation) and displays real-time search results. Built using MVVM architecture, dependency injection, and testable components.

---

## 📱 Features

- 🔍 **Live character search** (updates after each keystroke)
- ⚡️ **Debounced API calls** for better performance
- 📄 **Character detail view** with image, name, species, status, origin, type, and created date
- 🧪 **Unit & UI Testing** with XCTest and XCUITest
- 📦 **MVVM pattern** with separated layers (Models, ViewModels, Services, Utilities)
- 🌗 **Dark mode support**
- ♿️ **Accessibility-ready** (VoiceOver, labels, image hints)
- 🔄 **Landscape orientation** support
- 🔄 **Pull-to-refresh**
- ✨ **Smooth image transitions**

---

## 🧱 Architecture

RickAndMortySearch
├── Models              # Character & Origin structs
├── Services            # APIService + Dependency Container
├── ViewModels          # CharacterViewModel
├── Views               # SwiftUI Views (SearchBar, Detail, List, Row)
├── Utilities           # Constants and reusable utils
├── Tests               # Unit Tests (API + ViewModel)
└── UI Tests            # End-to-end UI flow tests

---

## 📦 Dependencies

- `SwiftUI`
- `Combine`
- `XCTest` / `XCUITest`

---

## 🧪 Running Tests

1. Open the `.xcodeproj` file in **Xcode**
2. Press `Cmd + U` to run all unit and UI tests
3. Use the **Test Navigator** to run individual tests manually

---

## 🛠 Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/<your-username>/RickyAndMortySearch.git
   cd RickyAndMortySearch

2.	Open in Xcode:

open RickyAndMortySearch.xcodeproj


3.	Run on simulator:
	•	Select iPhone 16 Pro (or any simulator)
	•	Hit ⏵ Run

⸻

📷 Screenshots


		
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 04 03 58](https://github.com/user-attachments/assets/c199ef2d-5356-4819-95d6-4149d084dd98)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 04 03 46](https://github.com/user-attachments/assets/51ff9094-cdc4-4633-b5fb-8b990e0c13ef)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 04 03 41](https://github.com/user-attachments/assets/9b4e1c68-a0e2-4974-b32f-0122f36d8c39)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 04 03 23](https://github.com/user-attachments/assets/07bf3728-ea9f-4fe5-8c09-ea73a827e27d)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 04 03 16](https://github.com/user-attachments/assets/7a1d139a-2bdd-4f9c-8306-e92d7e5eb431)



⸻

🔐 Accessibility
	•	accessibilityLabels for text/image content
	•	Works with VoiceOver
	•	Supports dynamic text sizes

⸻

🧪 Tests Included

Test Type	File	Covered
✅ Unit Test	CharacterViewModelTests.swift	ViewModel logic
✅ Unit Test	APIServiceTests.swift	Network call
✅ UI Test	RickyAndMortySearchUITests.swift	Search + tap
✅ Perf Test	RickyAndMortySearchUITestsLaunchTests.swift	App launch



⸻

🚀 Future Enhancements
	•	Favorites tab with persistent storage
	•	Offline mode caching
	•	Filter by species/origin
	•	Support for watchOS/iPad

⸻

👨‍💻 Author

Krishna Kanth Reddy Podduturi
GitHub

⸻

📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---
