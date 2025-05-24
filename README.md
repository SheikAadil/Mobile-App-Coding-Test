# mobile_app_coding_test

# Mobile App Coding Test

## 📱 Project Overview

This Flutter application integrates Firebase Authentication for Google sign-in and displays a list of hotels fetched from a remote API. Users can view hotel details and see their locations on a map. The app follows a structured architecture using Provider for state management.

---

## 🔍 Assumptions

1. **Firebase Configuration**: The `firebase_options.dart` file is correctly generated and configured with the Firebase project settings.
2. **API Endpoint**: The provided hotel data API endpoint is publicly accessible and returns valid JSON.
3. **Permissions**: Users will grant location permissions when prompted for the map functionality.
4. **Dependencies**: All required packages (e.g., firebase_auth, http, flutter_map) are listed in `pubspec.yaml` and resolvable via `pub get`.
5. **Device Compatibility**: The app is tested on Android and iOS devices with Flutter SDK compatibility.

---

## ✨ Improvements Implemented

### 1. State Management

- Utilized Provider to decouple UI and business logic, enhancing scalability.

### 2. Error Handling

- Added try-catch blocks and null checks for API calls and Firebase operations.

### 3. UI Enhancements

- Loading indicators during data fetch
- Responsive design for various screen sizes
- Safe parsing of latitude/longitude strings to doubles

### 4. Navigation

- Streamlined navigation between screens with proper context management.

### 5. Security

- Google Sign-In follows Firebase best practices, and sensitive data (e.g., API keys) is omitted from the codebase.

---

## 🧪 How to Test the Project

### Prerequisites

- Flutter SDK (version 3.0.0 or higher)
- Firebase project with Android/iOS apps configured
- Google Sign-In enabled in Firebase Authentication
- An emulator or physical device with internet access

### Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/SheikAadil/Mobile-App-Coding-Test.git
   cd mobile_app_coding_test
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   - Download your Firebase config files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS).
   - Place them in the appropriate directories:
     - **Android**: `android/app/google-services.json`
     - **iOS**: `ios/Runner/GoogleService-Info.plist`

4. **Run the App**
   ```bash
   flutter run
   ```

### Testing Steps

#### 1. Authentication

- Tap "Sign in with Google" and complete the login flow.
- Verify the Home Screen displays your user name and email.

#### 2. Hotel List

- Ensure the list of hotels loads with images, titles, and addresses.

#### 3. Detail Screen

- Tap a hotel tile to navigate to the Detail Screen.
- Confirm all details (title, description, image, address) are displayed correctly.

#### 4. Map Integration

- Tap the map icon on the Detail Screen.
- Grant location permissions if prompted.
- Verify the map centers on the hotel's coordinates.

#### 5. Logout

- Tap the "Logout" button on the Home Screen.
- Confirm navigation back to the Authentication Screen.

---

## 📦 Dependencies

```yaml
firebase_core: ^3.13.1
firebase_auth: ^5.5.4
google_sign_in: ^6.3.0
authentication_buttons: ^0.0.5
http: ^1.4.0
flutter_map: ^8.1.1
latlong2: ^0.9.0
permission_handler: ^12.0.0+1
provider: ^6.1.5
```

---

## 📁 Folder Structure

```
lib/
├── models/           # Data models (e.g., HotelInfoModel)
├── services/         # API and authentication services
├── view_models/      # State management classes
├── views/
│   ├── screens/      # UI screens
│   └── widgets/      # Reusable components
└── main.dart         # App entry point
```

---

## 📝 Notes

- The app uses mock latitude/longitude values if parsing fails.
- Network images display a placeholder if loading fails (via NetworkImageWidget).
- Location permissions are requested only when accessing the map view.
