# Spotify Clone 🎧
 
A cross-platform Spotify UI clone built with [Flutter](https://flutter.dev). This project targets Android, iOS, Web, Windows, macOS, and Linux from a single codebase.
 
> The project currently contains the default Flutter starter setup and platform folders for all six targets. UI screens, audio playback, and API integration are still to be built. 
 
## Tech Stack
 
- **Framework:** Flutter (Dart)
- **Platforms:** Android, iOS, Web, Windows, macOS, Linux
- **State management / packages:** TBD as features are implemented
## Getting Started
 
### Prerequisites
 
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK `^3.11.4` or later, as specified in `pubspec.yaml`)
- A configured editor (VS Code or Android Studio with the Flutter/Dart plugins)
- A device, emulator, or simulator — or a browser/desktop target for Web/Windows/macOS/Linux builds
### Installation
 
1. Clone the repository
```bash
   git clone https://github.com/visneeb/spotify-clone.git
   cd spotify-clone
```
2. Install dependencies
```bash
   flutter pub get
```
3. Run the app
```bash
   flutter run
```
   To target a specific platform:
```bash
   flutter run -d chrome    # Web
   flutter run -d windows   # Windows
   flutter run -d macos     # macOS
   flutter run -d linux     # Linux
```
 
## Project Structure
 
```
spotify-clone/
├── android/     # Android platform code
├── ios/         # iOS platform code
├── lib/         # Dart application source code
├── linux/       # Linux platform code
├── macos/       # macOS platform code
├── test/        # Unit and widget tests
├── web/         # Web platform code
├── windows/     # Windows platform code
└── pubspec.yaml # Project dependencies and metadata
```
 
## Contributing
 
Contributions are welcome! If you'd like to help build out this clone:
 
1. Fork the repo
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes
4. Push to your branch and open a Pull Request
## License
 
No license has been specified yet for this project.
 
## Acknowledgements
 
Built with [Flutter](https://flutter.dev), inspired by the [Spotify](https://www.spotify.com) app UI, created purely for educational purposes.
