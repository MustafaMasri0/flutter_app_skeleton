# flutter_app_skeleton

A solid Flutter app skeleton with layered architecture, ready-to-use configuration, and example integrations for networking, theming, and state management.

## Features

- **Layered Architecture**: Ensures separation of concerns and scalability.
- **Networking**: Built-in support for API calls using Dio with error handling.
- **State Management**: Utilizes Riverpod for state management.
- **Theming**: Customizable themes with predefined styles and dimensions.
- **Routing**: Navigation using GoRouter with route guards.
- **Environment Configuration**: Supports `.env` files for managing environment-specific configurations.
- **Secure Storage**: Token storage using Flutter Secure Storage.
- **Connectivity**: Network status monitoring with Connectivity Plus.

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.8.1)

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter_app_skeleton
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create a `.env.dev` file in the root directory and configure the required environment variables:
   ```env
   AppName="Your App Name"
   API_BASE_URL="https://api.example.com"
   ```

### Running the App

To run the app in development mode:

```bash
flutter run
```

### Testing

To run the tests:

```bash
flutter test
```

## Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
