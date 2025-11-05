# Flutter Boilerplate Project

<img width="1970" height="560" alt="readme_phone_mockups" src="https://github.com/user-attachments/assets/9124227d-b2e7-4243-9c6d-689f7ce6eb41" />

A well-structured Flutter boilerplate project with pre-configured routing, theming, error handling, logging, and common utilities.

## Project Structure

### Core Module (`lib/core`)

The core module contains fundamental configurations and utilities used throughout the application.

#### 1. Configs (`lib/core/configs`)
- **Routing Configuration (Go Router)**
  - `router.dart`: Central routing configuration using Go Router. You can add or modify routes here.
  - `route_names.dart`: Constants for route names to maintain consistency
  - `redirection.dart`: Handle route redirection logic (e.g., auth checks)
- **Flavor Configuration**
  - `flavors_config.dart`: Environment-specific configurations for different build flavors

#### 2. Constants (`lib/core/constants`)
Store common constants used across the application:
- `constants.dart`: General application constants
- `key_constant.dart`: Key-related constants
- `preferences_constant.dart`: SharedPreferences keys and constants

#### 3. Enums (`lib/core/enums`)
- `enums.dart`: Central location for all common enumerations used across the application
  - Add new enums here to maintain consistency and avoid duplication

#### 4. Extensions (`lib/core/extension`)
Useful extension methods to enhance functionality:
- `color_extension.dart`: Color manipulation and conversion
- `datetime_extension.dart`: Date formatting and manipulation
- `list_extension.dart`: Additional list operations
- `media_query_extension.dart`: Responsive design utilities
- `spacing_extension.dart`: Layout spacing helpers
- `string_extension.dart`: String manipulation and validation
- `text_style_extension.dart`: Typography utilities
- `widget_extension.dart`: Widget enhancement methods

#### 5. Handlers (`lib/core/handlers`)

##### Error Handling (`error/`)
Comprehensive error handling system:
- `dio_error_handler.dart`: Handle HTTP request errors
- `firebase_error_handler.dart`: Firebase-specific error handling
- `generic_error_handler.dart`: General error handling
- `isar_error_handler.dart`: Local database error handling
- `network_issue_handler.dart`: Network connectivity issues
- `parser_error_handler.dart`: Data parsing errors
- `supabase_error_handler.dart`: Supabase-specific error handling

##### Logging (`log/`)
Structured logging system:
- `base_log.dart`: Base logging configuration
- `log_helper.dart`: Convenient logging methods
- `logger_adapter.dart`: Adapter for different logging implementations

#### 6. Themes (`lib/core/themes`)
Customizable application theming:
- `app_color.dart`: Color palette definitions
- `app_text.dart`: Typography styles
- `app_theme.dart`: Theme configuration
- `dimens_constant.dart`: Dimension constants

Components:
- `app_bar.dart`: Custom AppBar theme
- `app_button.dart`: Button styles
- `app_input.dart`: Input field styles

#### 7. Common Widgets (`lib/core/widgets`)
Reusable UI components:
- Button widgets (`social_button.dart`)
- Image widgets (`avatar_image.dart`)
- State widgets:
  - `empty_state_widget.dart`: Empty state displays
  - `error_state_widget.dart`: Error state displays
- Text Input widgets (`spinner_view.dart`)

## Environment Configuration

The project supports multiple environments:
- Production (`environment_production.env`)
- Staging (`environment_staging.env`)
- Example configuration (`environment.env.example`)

## Getting Started

1. Clone the repository
2. Copy `environment.env.example` to create environment-specific files:
   ```bash
   cp environment.env.example environment_production.env
   cp environment.env.example environment_staging.env
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Choose the appropriate main file to run:
   - `main_prod.dart` for production
   - `main_staging.dart` for staging
   - `main_common.dart` for shared configuration

## Development Tools

### Makefile Commands

The project includes a Makefile for common development tasks:

#### Code Generation
```bash
# Generate code (build_runner)
make build_runner

# Generate app icons
make icon_generate
```

#### Running the App
```bash
# Run staging flavor
make run_staging

# Run production flavor
make run_prod
```

#### Project Maintenance
```bash
# Clean build files
make clean

# Get dependencies
make pub-get

# Build APK
make build

# Clean and get dependencies
make clean-get
```

### VS Code Launch Configuration

Create a `.vscode/launch.json` file with the following configuration to run different flavors:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Flutter (Staging)",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_staging.dart",
            "args": [
                "--flavor",
                "staging"
            ]
        },
        {
            "name": "Flutter (Production)",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_prod.dart",
            "args": [
                "--flavor",
                "production"
            ]
        }
    ]
}
```

After adding this configuration:
1. Open VS Code command palette (Cmd/Ctrl + Shift + P)
2. Select "Run and Debug" or click the debug icon in the sidebar
3. Choose either "Flutter (Staging)" or "Flutter (Production)" from the dropdown
4. Click the play button or press F5 to launch the app with the selected flavor

## Key Libraries

This project uses several powerful libraries to provide a robust development experience:

### State Management & Code Generation
- **Riverpod** (^3.0.3): State management solution with dependency injection
  - `riverpod`, `flutter_riverpod`, `hooks_riverpod`: Core Riverpod packages
  - `riverpod_annotation`, `riverpod_generator`: For code generation
  - `flutter_hooks`: For using React-like hooks in Flutter

### Data Handling & Models
- **Freezed** (^3.2.3): Code generation for data classes
  - `freezed_annotation`: Annotations for Freezed
  - `json_annotation`, `json_serializable`: JSON serialization support
- **Equatable** (^2.0.7): Simplifies equality comparisons
- **Dartz** (^0.1.1): Functional programming features

### Networking & API
- **Dio** (^5.9.0): HTTP client for API requests
- **Chucker Flutter**: Network inspection tool (from GitHub)

### Local Storage
- **Isar Community** (^3.3.0-dev.3): Modern database for Flutter
  - `isar_community_flutter_libs`: Flutter-specific Isar libraries
  - `isar_community_generator`: Code generation for Isar
- **SharedPreferences** (^2.5.3): Key-value storage
- **Path Provider** (^2.1.5): File system path management

### Routing & Navigation
- **Go Router** (^16.3.0): Declarative routing solution

### UI & Styling
- **Google Fonts** (^6.3.2): Google Fonts integration
- **Gap** (^3.0.1): For adding spaces in layouts

### Environment & Configuration
- **Flutter Dotenv** (^6.0.0): Environment configuration
- **Device Info Plus** (^12.2.0): Device information
- **Package Info Plus** (^9.0.0): App package information

### Development & Testing
- **Build Runner** (^2.4.13): Code generation tool
- **Custom Lint** (^0.8.0): Custom lint rules
- **Mockito** (^5.5.0): Mocking for tests
- **Flutter Launcher Icons** (^0.14.4): App icon generation

## Features Demo

The project includes example features demonstrating:
- System Design Page
- Helper Demo for implementing snack bar and dialog
- Widget demo for implementing custom widget
- Api Demo for implementing API calling (using digimon database and mock pagination)

## Contributing

1. Fork the repository
2. Create a new branch for your feature
3. Make your changes
4. Submit a pull request


