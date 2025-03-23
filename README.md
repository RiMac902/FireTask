# FireTask

A modern task management application built with Flutter and Firebase, supporting multiple platforms including Android, iOS, Web, Windows, and macOS.

## Project Structure

```
lib/
├── core/
│   ├── config/
│   │   ├── app_config.dart
│   │   ├── routes.dart
│   │   └── theme.dart
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── network_info.dart
│   └── utils/
│       ├── constants.dart
│       └── helpers.dart
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   └── remote/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── bloc/
│   ├── pages/
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── tasks/
│   │   └── settings/
│   └── widgets/
│       ├── common/
│       └── responsive/
└── main.dart
```

## Features

- Firebase Authentication
- Firebase Realtime Database
- Firebase Storage
- Cloud Functions
- Responsive UI for all platforms
- Clean Architecture
- BLoC State Management
- Go Router Navigation
- Dependency Injection with GetIt and Injectable
- Code Generation with Freezed

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Set up Firebase:
   - Create a new Firebase project
   - Add your platform-specific Firebase configuration files
   - Enable Authentication, Realtime Database, Storage, and Cloud Functions
4. Run code generation:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Architecture

This project follows Clean Architecture principles with the following layers:

1. **Presentation Layer** (UI)
   - Pages
   - Widgets
   - BLoC (State Management)

2. **Domain Layer** (Business Logic)
   - Entities
   - Use Cases
   - Repository Interfaces

3. **Data Layer** (Data Sources)
   - Repository Implementations
   - Data Sources (Remote/Local)
   - Models

4. **Core Layer** (Common Functionality)
   - Configuration
   - Error Handling
   - Network Info
   - Utils

## Responsive Design

The app uses `flutter_screenutil` for responsive design, ensuring proper layout across different screen sizes and platforms. The UI components are organized in the `presentation/widgets/responsive` directory.

## State Management

BLoC pattern is used for state management, with the following structure:
- Events
- States
- BLoC classes

## Navigation

Go Router is used for navigation, with routes defined in `core/config/routes.dart`.

## Dependency Injection

GetIt and Injectable are used for dependency injection. Run code generation after adding new dependencies.

## Code Generation

The project uses several code generation tools:
- Freezed for immutable models
- JSON Serializable for JSON serialization
- Injectable for dependency injection

Run the following command to generate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
