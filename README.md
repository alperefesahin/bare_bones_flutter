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
  - Incorporates `Riverpod` for state management.
- **Firebase Integration (firebase-bloc branch)**: 
  - Functional Sign In, Sign Out, and Sign Up using Firebase.
  - Built on top of the main branch's features.
  - Incorporates `BLoC` for state management.

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
    │  ├─ design_system/
    │  ├─ di/
    │  ├─ init/
    ├─ features/
    │  ├─ auth/
    │  │  ├─ sign_in/
    │  │  ├─ sign_up/
    │  ├─ dashboard/
    │  ├─ navigation/
    │  ├─ profile/
    │  ├─ search/
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

