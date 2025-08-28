import SwiftUI

struct TimerSettingsView: View {
    @EnvironmentObject var timerManager: TimerManager
    @Environment(\.dismiss) var dismiss
    @State private var selectedMinutes = 25
    @State private var selectedSeconds = 0
    
    let minutes = Array(1...120)
    let seconds = Array(0...59).filter { $0 % 5 == 0 }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Timer Settings")
                .font(.title2.weight(.bold))
                .foregroundColor(.white)
            
            VStack(spacing: 16) {
                Text("Set Focus Duration")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    VStack {
                        Text("Minutes")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Picker("Minutes", selection: $selectedMinutes) {
                            ForEach(minutes, id: \.self) { minute in
                                Text("\(minute)").tag(minute)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 80, height: 100)
                    }
                    
                    VStack {
                        Text("Seconds")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Picker("Seconds", selection: $selectedSeconds) {
                            ForEach(seconds, id: \.self) { second in
                                Text(String(format: "%02d", second)).tag(second)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 80, height: 100)
                    }
                }
            }
            
            // Quick presets
            VStack(alignment: .leading, spacing: 8) {
                Text("Quick Presets")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    ForEach([15, 25, 45, 60], id: \.self) { preset in
                        Button("\(preset)m") {
                            selectedMinutes = preset
                            selectedSeconds = 0
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.orange.opacity(selectedMinutes == preset ? 1 : 0.3))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Button("Cancel") {
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Button("Set Timer") {
                    let totalSeconds = (selectedMinutes * 60) + selectedSeconds
                    timerManager.setDuration(totalSeconds)
                    dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(24)
        .frame(width: 300, height: 400)
        .background(Color.black)
        .onAppear {
            selectedMinutes = timerManager.duration / 60
            selectedSeconds = timerManager.duration % 60
        }
    }
}