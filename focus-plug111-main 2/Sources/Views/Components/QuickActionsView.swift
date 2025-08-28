import SwiftUI

struct QuickActionsView: View {
    @EnvironmentObject var blockerService: WebsiteBlockerService
    @State private var showingBlockList = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("QUICK ACTIONS")
                .font(.caption.weight(.bold))
                .foregroundColor(.gray)
                .tracking(1)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
                ActionButton(
                    title: "Block Sites",
                    subtitle: "Manually block distractions",
                    icon: "shield.slash",
                    color: .red
                ) {
                    blockerService.blockWebsites()
                }
                
                ActionButton(
                    title: "Break Mode",
                    subtitle: "5 min unblock",
                    icon: "cup.and.saucer",
                    color: .green
                ) {
                    blockerService.breakMode()
                }
                
                ActionButton(
                    title: "Block List",
                    subtitle: "Manage websites",
                    icon: "list.bullet",
                    color: .blue
                ) {
                    showingBlockList = true
                }
                
                ActionButton(
                    title: "Stats",
                    subtitle: "View progress",
                    icon: "chart.bar",
                    color: .purple
                ) {
                    // Navigate to stats
                }
            }
        }
        .sheet(isPresented: $showingBlockList) {
            BlockListView()
        }
    }
}

struct ActionButton: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(color)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.white)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(16)
            .frame(height: 80)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(color.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}