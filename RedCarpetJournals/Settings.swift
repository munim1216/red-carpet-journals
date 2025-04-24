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
    @State var color: Color = .red
    @State var emoji1: Bool = false
    
    var fancyFont: Font = .custom("Baskerville", size: 45)
        
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.mattblack)
                .ignoresSafeArea()
            
            VStack {
                Text("Settings")
                    .font(fancyFont)
                
                HStack {
                    Text("My name is:")
                    TextField("Name: ", text: $name)
                }
                HStack {
                    Toggle(isOn: $sharedData.lightMode) {
                        Text("Light Mode")
                    }
                }
                
                Spacer()
                
                Text("Emoji and Color Changer")
                
                EmojiChanger(colorToEdit: $sharedData.topColor, emoji: $sharedData.topMood)
                EmojiChanger(colorToEdit: $sharedData.goodColor, emoji: $sharedData.goodMood)
                EmojiChanger(colorToEdit: $sharedData.okayColor, emoji: $sharedData.okayMood)
                EmojiChanger(colorToEdit: $sharedData.badColor, emoji: $sharedData.badMood)
                EmojiChanger(colorToEdit: $sharedData.worstColor, emoji: $sharedData.worstMood)
                
                Button("Delete All Journal Entries") {
                    showConfirmationAlert = true
                }
                .alert("Confirm Deletion", isPresented: $showConfirmationAlert) {
                    Button("Confirm", role: .destructive) {
                        sharedData.journalEntries.removeAll()
                        deleted = true
                    }
                } message:  {
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
            .padding()
        }
        .preferredColorScheme(sharedData.lightMode ? .light : .dark)
    }
}

#Preview {
    @Previewable @State var name = "Name"
    Settings(name: $name)
        .environmentObject(SharedData())
}
