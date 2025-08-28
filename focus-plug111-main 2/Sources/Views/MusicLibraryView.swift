import SwiftUI

struct MusicLibraryView: View {
    @EnvironmentObject var musicPlayer: MusicPlayerService
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Music Library")
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Done") {
                    dismiss()
                }
                .foregroundColor(.orange)
            }
            
            // Music categories
            ScrollView {
                LazyVStack(spacing: 16) {
                    CategorySection(title: "Focus Playlists", tracks: musicPlayer.focusPlaylists)
                    CategorySection(title: "Local Music", tracks: musicPlayer.localTracks)
                    CategorySection(title: "Recently Played", tracks: musicPlayer.recentTracks)
                }
            }
            
            Spacer()
        }
        .padding(24)
        .frame(width: 500, height: 600)
        .background(Color.black)
    }
}

struct CategorySection: View {
    let title: String
    let tracks: [Track]
    @EnvironmentObject var musicPlayer: MusicPlayerService
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline.weight(.semibold))
                .foregroundColor(.gray)
            
            ForEach(tracks) { track in
                HStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "music.note")
                                .foregroundColor(.gray)
                                .font(.caption)
                        )
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(track.title)
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.medium))
                        Text(track.artist)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        musicPlayer.selectTrack(track)
                    }) {
                        Image(systemName: musicPlayer.currentTrack?.id == track.id ? "pause.circle.fill" : "play.circle.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
            }
        }
    }
}