import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var isSessionActive = false
    @Published var currentView: ViewType = .timer
    @Published var showingSettings = false
    
    enum ViewType {
        case timer, stats, settings, music
    }
    
    init() {
        // Initialize app state
    }
}