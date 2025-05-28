# Flutter Template Project

A cross-platform Flutter template project with support for Android, iOS, and desktop, featuring modular architecture, code generation, and a rich set of optional integrations.

## Features

- **Flutter**: Modern UI toolkit for building natively compiled applications.
- **Modular Architecture**: Easily extendable and maintainable codebase.
- **Code Generation**: Automated asset, color, and icon generation.
- **Optional Integrations**: In-app purchases, maps, notifications, RTC, and more (see `pubspec.yaml` for available packages).
- **Platform Support**: Android, iOS, and desktop (Windows, macOS, Linux).

## Concepts

### Essential

* [derry](https://pub.dev/packages/derry) is a script manager for Dart, helps you define shortcut scripts, and save you from having to type very long and forgettable long lines of scripts, again and again.
* [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr) is a tool to manage multiple flavors of your Flutter app, allowing you to define different configurations for development, staging, and production environments.
* [flutter_gen](https://pub.dev/packages/flutter_gen) is a code generator for Flutter that helps you manage assets, colors, and icons in a type-safe way.
* [envied](https://pub.dev/packages/envied) is a package for managing environment variables in Flutter applications, allowing you to define and access environment-specific configurations easily.
* [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) is a package that simplifies the process of generating app icons for Flutter applications across different platforms.
* [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) is a package that helps you create a native splash screen for your Flutter app, providing a smooth transition from the splash screen to the main app interface.
* [build_runner](https://pub.dev/packages/build_runner) is a build system for Dart that allows you to run code generation tasks, such as generating code from annotations or assets.

### Development

* [flutter_bloc](https://pub.dev/packages/flutter_bloc) is a package that provides a way to manage state in Flutter applications using the BLoC (Business Logic Component) pattern, promoting separation of concerns and testability.
* [dio](https://pub.dev/packages/dio) is a powerful HTTP client for Dart that supports interceptors, global configuration, form data, request cancellation, and file downloading.
* [retrofit](https://pub.dev/packages/retrofit) is a type-safe HTTP client for Dart that simplifies API calls by generating code based on annotations, making it easier to work with RESTful APIs.
* [get_it](https://pub.dev/packages/get_it) is a service locator for Dart and Flutter, allowing you to easily manage dependencies and access them throughout your application.
* [go_router](https://pub.dev/packages/go_router) is a declarative routing package for Flutter that simplifies navigation and deep linking, providing a clear and concise way to define routes in your app.

## Project Structure

### Root Directory

- `assets/` - Images, fonts, audio, video, and JSON assets
- `lib/` - Main Dart source code
- `derry.yaml` - Script definitions for common tasks
- `flavorizr.yaml` - Configuration for app flavors
- `flutter_launcher_icons.yaml` - Configuration for app icons
- `flutter_native_splash.yaml` - Configuration for splash screen
- `l10n.yaml` - Localization configuration
- `pubspec.yaml` - Project dependencies and metadata

### Lib Directory

Use data, domain, and presentation layers to separate concerns and improve maintainability. 

- `data/` - Data layer, including models, repositories, and data sources
- `domain/` - Domain layer, including use cases, entities, and repositories
- `presentation/` - Presentation layer, including UI components, pages, and widgets

Use feature-first architecture, where each feature has its own directory under `lib/presentation/features/`. Each feature directory contains:

- `views/` - UI components for the feature
- `viewmodels/` - ViewModels for managing state and business logic
- `widgets/` - Reusable widgets specific to the feature

Essential features:

- `app/` - Main app entry point and configuration
- `theme/` - Theme configuration and styles
- `network/` - Network configuration and API clients

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio or VS Code (recommended)
- Xcode (for iOS development)
- Java & Gradle (for Android development)

### Before installation

1. Open the `flavorizr.yaml` file and configure your app's name, bundle ID, and flavors. Change the `ide` field to your preferred IDE (`vscode` for VS Code or `idea` for Android Studio). This file defines the different environments (e.g., development, staging, production) for your Flutter application. Comment the ios flavors if you are not developing on macOS. `flutter_flavorizr` needs macOS to generate iOS flavors.
   - Example configuration:
     ```yaml
     ide: "idea" # "vscode" or "idea"
     flavors:
       dev:
         app:
           name: "Template Flutter (Dev)"

         android:
           applicationId: "com.example.dev.template_flutter"
           firebase:
             config: ".firebase/dev/google-services.json"
         # ios:
           # bundleId: "com.example.dev.template_flutter"
           # firebase:
             # config: ".firebase/dev/GoogleService-Info.plist"
         # macos:
           # bundleId: "com.example.dev.template_flutter"

       # staging:
         # app:
           # name: "Template Flutter (Staging)"

         # android:
           # applicationId: "com.example.staging.template_flutter"
           # firebase:
             # config: ".firebase/staging/google-services.json"
         # ios:
           # bundleId: "com.example.staging.template_flutter"
           # firebase:
             # config: ".firebase/staging/GoogleService-Info.plist"
         # macos:
           # bundleId: "com.example.staging.template_flutter"

       prod:
         app:
           name: "Template Flutter"

         android:
           applicationId: "com.example.template_flutter"
           firebase:
             config: ".firebase/prod/google-services.json"
         # ios:
           # bundleId: "com.example.template"
           # firebase:
             # config: ".firebase/prod/GoogleService-Info.plist"
         # macos:
           # bundleId: "com.example.template"
     ```
2. Create a `.firebase` directory in the root of your project. In this folder create folders for each flavor (e.g., `dev`, `staging`, `prod`) and place your Firebase configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) in the respective folders. This setup allows you to manage Firebase configurations for different environments easily.
3. Create `.env.dev` and `.env.prod` file in the `assets/env/` directory and copy the contents of `.env.example` into them. It is required for fast starting the project with environment variables. You can add your own environment variables in these files, which will be used by the `envied` package to generate Dart code for accessing these variables. You can change and use `Env` class (`lib/utils/constants/env/env.dart`) in your code to access these variables.

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/ilham-asgarli/template-flutter.git
   cd template-flutter
   ```

2. **Configure the project (activate derry, install dependencies, generate code and assets, configure flavors):**
   ```sh
   dart pub global activate derry
   derry start
   ```

### After installation

`flutter_flavorizr` creates a basic structure for your Flutter app. However, you may need to customize some files to fit your project's needs.

1. Copy the `AndroidManifest.xml` file from template github repository to `android/app/src/main/AndroidManifest.xml`.
2. Copy the `main.dart` file from template github repository to `lib/main.dart`.
3. Delete the `lib/pages` directory and `app.dart` file from the `lib/` directory created by `flutter_flavorizr`.

## Customization and Code Generation

- **Assets & Colors**: Managed via [flutter_gen](https://pub.dev/packages/flutter_gen)
    - After adding or modifying assets, run:
      ```sh
      derry gen new
      ```

- **Icons**: Managed via [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
    - There a 2 png files in the `assets/image/` directory. You can change them to your own icons.
    - After changing icons, run:
      ```sh
      derry icon
      ```

- **Splash Screen**: Managed via [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
    - There a 2 png files in the `assets/image/` directory. You can change them to your own splash screen images.
    - After changing icons, run:
      ```sh
      derry splash
      ```

- **Localization**: Managed via [intl](https://pub.dev/packages/intl) and [flutter_localizations](https://pub.dev/packages/flutter_localizations)
  - Add your translations in the `lib/l10n/` directory.
  - Update `l10n.yaml` if necessary.
  - Run:
    ```sh
    derry l10n
    ```

- **Environment Variables**: Managed via [envied](https://pub.dev/packages/envied)
    - After adding or modifying environment variables, run:
      ```sh
      derry gen new
      ```

To regenerate code after asset or config changes:
```sh
deery gen clean
```

## Enabling Optional Packages

Many packages are commented out in `pubspec.yaml`. To enable a feature:
1. Uncomment the relevant package line.
2. Run `flutter pub get`.
3. Follow the package documentation for setup.

## Assets

Assets are organized in the `assets/` directory and registered in `pubspec.yaml`:
- `assets/animation/`
- `assets/audio/`
- `assets/font/`
- `assets/image/`
- `assets/json/`
- `assets/video/`

## Testing

- Unit tests: Place in `test/` directory.
- Run tests:
  ```sh
  flutter test
  ```

## Useful Commands

- **Clean build**:
  ```sh
  flutter clean
  ```
- **Upgrade dependencies**:
  ```sh
  flutter pub upgrade
  ```
- **Run on specific device**:
  ```sh
  flutter run -d <device_id>
  ```

Check `derry.yaml` for available scripts and commands.

---

**Note:** For more details on each package, refer to their documentation on [pub.dev](https://pub.dev/).
