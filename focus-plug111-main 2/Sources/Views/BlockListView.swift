import SwiftUI

struct BlockListView: View {
    @EnvironmentObject var blockerService: WebsiteBlockerService
    @Environment(\.dismiss) var dismiss
    @State private var newWebsite = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Website Block List")
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Done") {
                    dismiss()
                }
                .foregroundColor(.orange)
            }
            
            // Add new website
            VStack(alignment: .leading, spacing: 8) {
                Text("Add Website to Block")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack {
                    TextField("Enter domain (e.g., twitter.com)", text: $newWebsite)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add") {
                        if !newWebsite.isEmpty {
                            blockerService.addWebsiteToBlockList(newWebsite)
                            newWebsite = ""
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            
            // Website list
            VStack(alignment: .leading, spacing: 12) {
                Text("Blocked Websites")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(blockerService.blockedWebsites, id: \.self) { website in
                            HStack {
                                Image(systemName: "shield.slash")
                                    .foregroundColor(.red)
                                
                                Text(website)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Button(action: {
                                    blockerService.removeWebsiteFromBlockList(website)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
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
                .frame(maxHeight: 300)
            }
            
            Spacer()
        }
        .padding(24)
        .frame(width: 400, height: 500)
        .background(Color.black)
    }
}