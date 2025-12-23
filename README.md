📱 Flutter Booking.com Clone + Logical Judgment App

A Flutter project that combines:

🧠 Logical Judgment Screen (Bubble Physics Game)

🏨 Booking.com Clone UI (Modern booking interface)

This project demonstrates Flutter UI design, navigation, animations, and clean project structure — built without any external packages.

🚀 How to Run This Project
✅ Prerequisites

Make sure you have the following installed:

Flutter SDK (version 3.0+)

Android Studio or VS Code (with Flutter extension)

Android Emulator or Physical Android Device

🧩 Step 1: Clone the Repository
git clone https://github.com/nabil17-2/cis_flutter_task1.git
cd cis_flutter_task1

🔍 Step 2: Check Flutter Installation
flutter doctor


✔️ Ensure all required items show green checkmarks.

📦 Step 3: Install Dependencies
flutter pub get


If you face any issues, try:

flutter clean
flutter pub get

▶️ Step 4: Run the Application
flutter run


Run on a specific device:

flutter run -d <device_id>


See available devices:

flutter devices

🔀 Step 5: App Navigation
Screens Included

Logical Judgment Screen (Default start screen)

Interactive bubble physics game

Button: Go to Booking.com Clone

Booking.com Clone Screen

Complete UI replica

Back navigation via app bar or device back button

📱 Platform-Specific Instructions
📲 Android (Physical Device)

Enable Developer Options

Enable USB Debugging

Connect device via USB

Run:

flutter run

🤖 Android Emulator

Open Android Studio

Go to Tools → AVD Manager

Start an emulator

Run:

flutter run

🌐 Web (Chrome)

Enable web support (if not enabled):

flutter config --enable-web


Run in Chrome:

flutter run -d chrome

⚠️ Troubleshooting Common Issues
❌ No Connected Devices
flutter devices


Ensure emulator is running

Ensure USB debugging is enabled (for physical devices)

❌ Dart SDK Not Found

Ensure Flutter is added to PATH

Run:

flutter doctor -v

❌ Package Get Failed
flutter clean
flutter pub cache repair
flutter pub get

❌ Images Not Loading

Check internet connection

Images are loaded from Unsplash (online images)

🏗️ Project Structure
cis_flutter_task1/
├── lib/
│   ├── main.dart                       # App entry point
│   ├── logical_judgment_screen.dart    # First screen (game)
│   ├── screens/
│   │   └── property_info_screen.dart   # Booking.com clone UI
│   ├── widgets/                        # Custom UI widgets
│   ├── components/                     # Reusable components
│   ├── constants/                      # Colors & constants
├── pubspec.yaml                        # Project dependencies

🔧 Development Commands
🔥 Hot Reload

While the app is running:

Press r in terminal

Or save files in IDE (auto hot reload)

📦 Build for Release
Android APK
flutter build apk --release

Android App Bundle
flutter build appbundle --release

Web
flutter build web --release

🧪 Code Quality
flutter analyze
flutter format lib/
flutter test

📦 Dependencies

✅ No external packages used
Built entirely with Flutter’s built-in widgets
