🎬 Movie Discovery App

A Flutter-based movie browsing application built using BLoC architecture, TMDB API, and Shared Preferences.
The app allows users to discover popular movies, search movie titles, view detailed descriptions, and mark movies as favorites.

🚀 Features
Feature	Description
Splash Screen: Gradient background + animated loader + auto auth redirect
Login System: Email & password validation + persistent login (SharedPreferences)
Movie Listing: Popular movie list, pagination, search, and pull-to-refresh
Smooth UI: Scrollable grid/list view with loading states
Movie Details: Full info: poster, rating, overview, runtime, release date, genres
Favorite Button: Toggle & store movie ID in local storage
BLoC State Management: Separate BLoCs for Auth, Movie List & Movie Details
API Integration: TMDB REST API using HTTP package
Error Handling:  Graceful UI messaging and retry option


🧠 Clean Architecture
lib/
│
├── core/                   # Global constants & shared utility
├── data/                   # Models + Services (API, Storage)
│   ├── models/
│   └── services/
│
├── logic/                  # Business Logic (BLoC + Events + States)
│   ├── auth/
│   └── movies/
│
└── presentation/           # All UI screens and widgets

🛠 Tech Stack

Flutter & Dart

BLoC + Equatable

HTTP package

Shared Preferences

TMDB API

Android (tested physically)

VSCode / Android Studio

🌐 API Used

The Movie Database (TMDB) API
https://www.themoviedb.org/

⚠ Important Note

Some Indian ISPs (e.g., Jio / BSNL) block TMDB requests.
If API responses fail or movies do not load, enable VPN (Cloudflare WARP).

📦 Installation & Run Instructions
🔧 Clone Repository
git clone https://github.com/isbapatel/movie-discovery.git
cd movie_discovery

📥 Get Dependencies
flutter pub get

▶ Run App
flutter run

📱 Build Release APK
flutter build apk --release


APK path:

build/app/outputs/flutter-apk/app-release.apk

📸 Screenshots

assets/screenshots/splash.png
assets/screenshots/login.png
assets/screenshots/landing.png
assets/screenshots/details.png

📥 APK Download

Drive Link: https://drive.google.com/file/d/1t-u8trYyPBhrFvuWVOqkW8M_PcirP39Q/view?usp=drive_web

🧠 Future Improvements

Hero animations

Shimmer loading placeholders

Movie cast & reviews section

Offline caching & database

Dark mode UI

Recommendation system

👤 Developed By

Isba Patel
Computer Science Undergraduate | Flutter & AI/ML Developer
📍 Pune, India
📱 +91 9309025738
📧 isbapatel1205@gmail.com
