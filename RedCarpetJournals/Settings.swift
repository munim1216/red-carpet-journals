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
                    sharedData.journalEntries.removeAll()
                }
                .buttonStyle(.bordered)
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
