# Focus Plug 🔥

> Your drug dealer for focus 💊

A native macOS app that blocks distracting websites and apps during focused work sessions, with an integrated music player and productivity tracking.

## Features

### Core Functionality
- **Study Timer**: Customizable focus sessions with visual progress tracking
- **Website Blocker**: Automatically blocks distracting sites during sessions
- **Music Player**: Built-in player for focus music and local tracks
- **Break Mode**: 5-minute unblock periods for quick breaks
- **Productivity Stats**: Track streaks, sessions, and total focus time
- **Native Notifications**: Session start/end reminders

### Design Philosophy
- **Anti-Dopamine Aesthetic**: Bold colors, minimal interface, rebellious tone
- **Native macOS Experience**: Rounded corners, soft shadows, clean typography
- **Dark Mode First**: Optimized for dark mode with excellent contrast
- **Menu Bar Integration**: Quick access without opening the main window

## Installation

### For Users
1. Download `FocusPlug-Installer.dmg`
2. Double-click to mount the disk image
3. Drag Focus Plug to your Applications folder
4. Launch from Applications or Spotlight search
5. Grant notification permissions when prompted

### For Developers

#### Prerequisites
- macOS 13.0+ (Ventura or later)
- Xcode 14.0+
- Swift 5.9+

#### Development Setup
```bash
# Clone the repository
git clone [repository-url]
cd focus-plug

# Make scripts executable
chmod +x scripts/*.sh

# Run in development mode
./scripts/run.sh
```

#### Building for Distribution
```bash
# Build release version
./scripts/build.sh

# Create DMG installer
./scripts/create-dmg.sh
```

## Project Structure

```
FocusPlug/
├── Sources/
│   ├── FocusPlugApp.swift          # Main app entry point
│   ├── Views/
│   │   ├── ContentView.swift       # Main interface
│   │   ├── Components/             # Reusable UI components
│   │   │   ├── TimerCardView.swift
│   │   │   ├── QuickActionsView.swift
│   │   │   ├── MusicPlayerView.swift
│   │   │   └── StatsPreviewView.swift
│   │   ├── TimerSettingsView.swift
│   │   ├── BlockListView.swift
│   │   ├── MusicLibraryView.swift
│   │   └── MenuBarView.swift
│   ├── Models/
│   │   ├── AppState.swift          # App state management
│   │   └── Track.swift             # Music track model
│   └── Services/
│       ├── TimerManager.swift      # Timer logic and notifications
│       ├── WebsiteBlockerService.swift  # Website blocking functionality
│       ├── MusicPlayerService.swift     # Music playback management
│       └── StatsManager.swift      # Productivity statistics
├── scripts/
│   ├── build.sh                    # Build script
│   ├── create-dmg.sh              # DMG creation script
│   └── run.sh                     # Development runner
├── Info.plist                     # App metadata and permissions
├── Package.swift                  # Swift Package Manager configuration
└── README.md                      # This file
```

## Usage

### Starting a Focus Session
1. Open Focus Plug
2. Set your desired timer duration (default: 25 minutes)
3. Click "START" to begin
4. Websites will be automatically blocked
5. Use the music player to stay focused

### Managing Blocked Websites
1. Click "Block List" in Quick Actions
2. Add new websites to block
3. Remove websites you want to allow
4. Changes apply to future sessions

### Break Mode
- Click "Break Mode" for a 5-minute website unblock
- Timer automatically re-enables blocking after break
- Perfect for quick social media checks or research

### Tracking Progress
- View daily stats in the main interface
- Track session streaks and total focus time
- Get motivational notifications for milestones

## Technical Details

### Website Blocking
The app uses macOS's built-in content filtering capabilities to block websites during focus sessions. In development mode, it simulates blocking by logging to console.

**Note**: For full website blocking functionality, the app requires:
- Admin privileges for hosts file modification
- Or integration with macOS Screen Time APIs
- Or a Network Extension for content filtering

### Music Integration
- Scans local music library automatically
- Supports MP3, M4A, WAV, and AIFF formats
- Includes curated focus playlists
- Can be extended to support streaming services

### Data Persistence
- Uses UserDefaults for lightweight data storage
- Tracks productivity statistics locally
- No cloud sync or external data collection

## Development Notes

### Building
The app is built using Swift Package Manager and can be opened in Xcode or built from the command line.

### Code Signing
For distribution, you'll need:
- Apple Developer account
- Code signing certificate
- Notarization for macOS Gatekeeper

### Permissions
The app requests:
- Notification permissions (for session alerts)
- File system access (for local music scanning)
- Network access (for future streaming features)

## Roadmap

- [ ] Advanced website blocking with Network Extension
- [ ] Spotify/Apple Music integration
- [ ] Cloud sync for cross-device statistics
- [ ] Custom focus session templates
- [ ] Team/collaborative focus sessions
- [ ] Screen time integration
- [ ] iOS companion app

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on macOS
5. Submit a pull request

## License

Copyright © 2025 Focus Plug. All rights reserved.

---

**Focus Plug** - Because distraction is the enemy of greatness 🔥