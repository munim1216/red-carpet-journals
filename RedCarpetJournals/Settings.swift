//
//  Settings.swift
//  RedCarpetJournals
//
//  Created by Student on 4/9/25.
//

import SwiftUI
struct Settings: View {
    @Binding var name: String
    @EnvironmentObject var sharedData: SharedData
    @State private var deleted = false
    @State private var entries = false
    @State private var showConfirmationAlert = false
    @State var lightMode = false
    @State var updatedName: String = ""
    
    var fancyFont: Font = .custom("Baskerville", size: 45)
        
    var body: some View {
        VStack {
            Text("Settings")
                .font(fancyFont)
            HStack {
                Text("My name is:")
                    .font(.custom("Baskerville", size: 25))
                TextField("Name: ", text: $name)
                    .font(.custom("Baskerville", size: 25))
            }
            .padding()
            HStack {
                Button("Light Mode") {
                    sharedData.lightMode = true
                }
                .buttonStyle(.bordered)
                Button("Dark Mode") {
                    sharedData.lightMode = false
                }
                .buttonStyle(.bordered)
            }
            Button("Delete All Journal Entries") {
                showConfirmationAlert = true
            }
            .alert("Confirm Deletion", isPresented: $showConfirmationAlert) {
                Button("Confirm", role: .destructive) {
                    sharedData.journalEntries.removeAll()
                    deleted = true
                }
            } message: {
                Text("Are you sure you want to delete ALL of your journal entries? 🫣")
            }
            .alert("All entries deleted.", isPresented: $deleted) {
                Button("OK", role: .none) {
                    entries = false
                }
            }
            .buttonStyle(.bordered)
            .disabled(!entries)
        }
        .onAppear {
            entries = !sharedData.journalEntries.isEmpty
        }
        .preferredColorScheme(sharedData.lightMode ? .light : .dark)
    }
}

#Preview {
    @Previewable @State var name = "Name"
    Settings(name: $name)
        .environmentObject(SharedData())
}
