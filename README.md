# bare_bones_flutter

A Flutter project that serves as a template with essential features for building a robust mobile application.

## Features

- **Localization**: Supports multiple languages to cater to a global audience.
- **MVVM Architecture**: Follows the Model-View-ViewModel architecture for a clean and maintainable codebase.
- **Authentication Pages**: Includes Sign In and Sign Up pages with text form fields validated using regular expressions.
- **Navigation**: Utilizes `go_router` for navigation and `shell_route` for nested routing.
- **Main Branch**: No state management, providing the most general case. No ViewModel since there is no functionality yet.
- **Firebase Integration (firebase-riverpod branch)**: 
  - Functional Sign In, Sign Out, and Sign Up using Firebase.
  - Built on top of the main branch's features.
  - Incorporates `riverpod` for state management.

## Branches

- **main**: Contains the basic template with the features listed above. No state management or ViewModel.
- **firebase-riverpod**: Builds on the main branch with Firebase integration and additional functionalities for user authentication.

## Getting Started

To get started with this project, clone the repository and switch to your desired branch.

## Project Structure

The project follows a modular structure with a focus on separation of concerns:

    lib/
    ├─ core/
    │  ├─ constants/
    │  │  ├─ enums/
    │  │  │  ├─ router_enums.dart
    │  ├─ design_system/
    │  │  ├─ colors/
    │  │  │  ├─ colors.dart
    │  │  ├─ components/
    │  │  │  ├─ bare_bones_scaffold.dart
    │  ├─ di/
    │  │  ├─ dependency_injector.dart
    │  ├─ init/
    │  │  ├─ app/
    │  │  │  ├─ app.dart
    │  │  ├─ router/
    │  │  │  ├─ app_router.dart
    │  │  │  ├─ custom_page_builder_widget.dart
    ├─ features/
    │  ├─ auth/
    │  │  ├─ sign_in/
    │  │  │  ├─ view/
    │  │  │  │  ├─ sign_in_view.dart
    │  │  ├─ sign_up/
    │  │  │  ├─ view/
    │  │  │  │  ├─ sign_up_view.dart
    │  ├─ dashboard/
    │  │  ├─ view/
    │  │  │  ├─ dashboard_view.dart
    │  ├─ navigation/
    │  │  ├─ view/
    │  │  │  ├─ navigation_view.dart
    │  ├─ profile/
    │  │  ├─ view/
    │  │  │  ├─ profile_view.dart
    │  ├─ search/
    │  │  ├─ view/
    │  │  │  ├─ search_view.dart
    ├─ l10/
    │  ├─ en.arb
    │  ├─ tr.arb
    ├─ main.dart


## Makefile

The project includes a Makefile to manage tasks such as generating localization files and cleaning the project.

### Generate the localization files

```sh
make -f Makefile localization
```

