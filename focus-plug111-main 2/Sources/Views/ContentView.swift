import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var timerManager: TimerManager
    @EnvironmentObject var blockerService: WebsiteBlockerService
    @EnvironmentObject var musicPlayer: MusicPlayerService
    @EnvironmentObject var statsManager: StatsManager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HeaderView()
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                // Main Content
                ScrollView {
                    VStack(spacing: 24) {
                        // Timer Section
                        TimerCardView()
                        
                        // Quick Actions
                        QuickActionsView()
                        
                        // Music Player
                        MusicPlayerView()
                        
                        // Stats Preview
                        StatsPreviewView()
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .frame(minWidth: 400, minHeight: 600)
        .background(Color.black.ignoresSafeArea())
    }
}

struct HeaderView: View {
    @EnvironmentObject var statsManager: StatsManager
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("FOCUS")
                    .font(.title.bold())
                    .foregroundColor(.white) +
                Text("PLUG")
                    .font(.title.bold())
                    .foregroundColor(.red)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "gearshape")
                        .foregroundColor(.gray)
                        .font(.title2)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Text("Your drug dealer for focus 💊")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Streak indicator
            HStack {
                Image(systemName: "flame")
                    .foregroundColor(.orange)
                Text("\(statsManager.currentStreak) day streak")
                    .font(.caption.weight(.medium))
                    .foregroundColor(.orange)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
        .environmentObject(TimerManager())
        .environmentObject(WebsiteBlockerService())
        .environmentObject(MusicPlayerService())
        .environmentObject(StatsManager())
}