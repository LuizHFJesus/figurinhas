# 🏆 Figurinhas (sticker manager) application

A modern, high-performance, and feature-rich **World Cup Sticker Album Tracker** built with Flutter. Keep track of your progress, manage duplicates, filter missing stickers, view detailed completion statistics, and effortlessly share lists with friends to coordinate trades!

---

## 📲 Download on Google Play

You can download the official published version of the application directly from the Google Play Store:

<a href="https://play.google.com/store/apps/details?id=dev.luizhfj.figurinhas">
  <img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" alt="Get it on Google Play" height="80">
</a>

---

## ✨ Features

- **📊 Comprehensive Progress Tracker:** Monitor your overall completion, total stickers obtained, missing counts, and foil/shiny specific completion in real-time.
- **⚡ Intuitive Interaction Gestures:**
  - **Tap** to mark a sticker as obtained.
  - **Tap again** to increment duplicates (ideal for keeping track of traders).
  - **Long Press** or use the quantity dialog to decrement or completely unmark a sticker.
- **🔍 Flexible Search & Filter Bar:**
  - Search dynamically across groups, team names, or sticker codes/names.
  - Filter down to **All**, **Missing**, **Obtained**, or **Duplicates** with instant chip-based toggle.
- **📈 Advanced Statistics Panel:** View a complete visual breakdown of your album progress including total stickers, foils, duplicates, and completion percentages.
- **📤 Smart Share Utility:**
  - Generate neatly formatted, categorized text lists of your **Missing stickers** or **Duplicate stickers** (e.g., `FWC: 1, 2, 3 | ARG: 5, 8, 12`) to share on WhatsApp, Telegram, or SMS.
  - Share global stats or invite friends to download the app directly.
- **📂 Multi-Album & Customization:** Rename active albums, clear marked stickers, or fill the album entirely for demonstration.
- **🌍 Universal Localization (i18n):** Fully localized out of the box with automatic locale detection.
- **📱 Premium Visuals & Material 3:** Seamless Light & Dark mode support designed with consistent layouts, smooth visual indicators, tactile physics, and beautiful SVG flag icons.
- **💵 Monetization Ready:** Integrated with Google Mobile Ads (AdMob) banners and In-App Purchases (IAP) to easily remove ads and restore purchases.

---

## 🛠 Tech Stack & Core Libraries

- **Framework:** [Flutter](https://flutter.dev) (Dart, Null-Safe, Declarative UI)
- **State Management & DI:** [GetX](https://pub.dev/packages/get) (Used for lightweight dependency injection, reactive bindings, and global translations).
- **Reactive Performance:** Custom `StickerQtyStore` leveraging Flutter's `ValueNotifier` for granular, real-time widget builds without redrawing the entire list.
- **Local Storage Database:** [Isar Community](https://pub.dev/packages/isar_community) (An ultra-fast, local transactional NoSQL database for Flutter).
- **Declarative Navigation:** [GoRouter](https://pub.dev/packages/go_router) (With stateful shell branches to manage tabs and nested routes seamlessly).
- **Assets:** [Flutter SVG](https://pub.dev/packages/flutter_svg) for vector flags, Google Fonts for clean typography.
- **Services:** `google_mobile_ads` (AdMob integration), `in_app_purchase` (monetization support), `share_plus` (native sharing utility), and `url_launcher`.
- **Quality & Code Style:** Adheres to strict static analysis and formatting using the [Very Good Analysis](https://pub.dev/packages/very_good_analysis) linter package.

---

## 📐 Architecture

The project strictly follows **Clean Architecture** principles to separate concerns, facilitate updates, and guarantee code maintainability:

```
lib/
├── main.dart                      # Application Entrypoint & Global Configuration
├── di/                            # Dependency Injection Bootstrappers
├── common/                        # Shared modules, utility, and Isar DB configuration
│
├── core/                          # Cross-cutting concerns (Theme, i18n, Ads, Navigation)
│   ├── ads/                       # Ad configuration & ID setup
│   ├── i18n/                      # Global translation & localization catalogs
│   ├── navigation/                # Declarative routes & paths via GoRouter
│   └── theme/                     # Light/Dark palettes & typographical style guides
│
├── data/                          # Data Layer (Database Schemas, Repositories, APIs)
│   ├── datasources/               # Raw Isar database connectors
│   ├── entities/                  # Generated Isar schema definitions (*.g.dart)
│   ├── mappers/                   # Pure mappers converting Entities ↔ Domain models
│   ├── repositories/              # Concrete implementations of Domain repositories
│   └── services/                  # Platform services (IAP, Active Album tracking, Ads)
│
├── domain/                        # Domain Layer (Pure Dart Business Logic - Independent)
│   ├── models/                    # Plain Data models
│   ├── repositories/              # Abstract repository definitions
│   └── usecases/                  # Single-responsibility Business Rules / Interactors
│
└── ui/                            # Presentation Layer (Organized cleanly by specific feature folders, with: pages, widgets, controllers, DI, UI models)
```

---

## 🚀 Getting Started & Local Setup

### 📋 Prerequisites

Ensure you have the following installed on your local development machine:
- [FVM (Flutter Version Management)](https://fvm.app/) (recommended, as this project uses FVM to manage Flutter versions)
- [Git](https://git-scm.com/)

---

### 💻 Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/figurinhas.git
   cd figurinhas
   ```

2. **Set up Flutter environment using FVM:**
   The project has an active `.fvmrc` configured to use the latest `stable` SDK.
   ```bash
   fvm install
   ```

3. **Install project dependencies:**
   ```bash
   fvm flutter pub get
   ```

4. **Run Code Generation:**
   This project relies on Isar database model generation. Run the build runner to generate the database schema and mapper models (`*.g.dart` files):
   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the Application:**
   Run the project on your connected device or simulator:
   ```bash
   fvm flutter run
   ```

---

## 📄 License

This project is proprietary and confidential. All rights reserved. Refer to `PRIVACY_POLICY.md` for information regarding user data security.
