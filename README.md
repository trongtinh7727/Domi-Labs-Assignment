
<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/trongtinh7727/StudentManager/">
  </a>

  <h3 align="center">Flutter Engineering Assignment
 </h3>

  <p align="center">
    Domi Labs
    <br />
    <br />
    <a href="https://github.com/trongtinh7727/StudentManager/">View Demo</a>
    ·
    <a href="https://github.com/trongtinh7727/StudentManager/issues">Report Bug</a>
    ·
    <a href="https://github.com/trongtinh7727/StudentManager/issues">Request Feature</a>
  </p>
</div>

<!--   -->
<details>
  <summary>Table of Contents</summary>
  <ol>
   <li><a href="#project-overview">Project Overview</a></li>
   </li>
    <li><a href="#setup-instructions">Setup Instructions</a></li>
    <li><a href="#architecture-explanation">Architecture Explanation</a></li>
    <li><a href="#state-management">State Management</a></li>
    <li><a href="#screenshots-or-screen-recordings">Screenshots or Screen Recordings</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
# About The Project

## Project Overview
Develop a Flutter application that replicates a complex UI design, showcasing your expertise in creating intricate layouts, custom widgets, and advanced animations. This assignment focuses on your ability to translate a detailed design into a functional app, emphasizing UI craftsmanship and code quality suitable for a senior engineer.

## Setup Instructions
- Clone the repository:

```bash
git clone https://github.com/trongtinh7727/Domi-Labs-Assignment
```

- Navigate to the project directory:
```bash
cd Domi-Labs-Assignment
```
- Install dependencies:
```bash
flutter pub get
```
- Generate Assets:
```bash
flutter pub run build_runner build   
```
- Run the application:
```bash
flutter run
```

# Architecture Explanation:
The Domi ID Flutter Application is designed with a modular and scalable structure, following best practices for clean architecture. This architecture ensures separation of concerns, maintainability, and ease of testing. Below is an overview of each major folder within the lib/ directory:

```
lib─
│   ├───const
│   ├───gen
│   ├───generated
│   │   └───intl
│   ├───l10n
│   ├───model
│   ├───presentation
│   │   ├───common
│   │   └───home
│   │       ├───bloc
│   │       └───widgets
│   └───utils
│       ├───extension
│       └───route
```

# State Management:
The app follows the BLoC (Business Logic Component) pattern for state management, particularly in the presentation/home/bloc/ directory. The BLoC pattern is used to separate the business logic from the presentation layer, ensuring a clean and reactive architecture.

# Screenshots or Screen Recordings:
