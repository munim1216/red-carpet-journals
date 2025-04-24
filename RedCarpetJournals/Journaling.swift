//
//  Journaling.swift
//  RedCarpetJournals
//
//  Created by Student on 4/21/25.
//

import SwiftUI

struct Journaling: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var sharedData: SharedData
    @State private var entry: String = ""
    @State private var title: String = ""
    @State private var emoji: String = ""
    @State private var date = Date()
    @FocusState private var entryFocused: Bool
    @FocusState private var titleFocused: Bool
    @Binding var journalEntries: [Entry]
    @State private var color: Color = .black
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundStyle(.mattblack)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    TextField("", text: $title, prompt: Text("Title").foregroundStyle(.textPreview))
                        .font(.system(size: 30))
                        .foregroundStyle(.textColors)
                    
                    DatePicker(
                        "",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .labelsHidden()
                    .foregroundStyle(.textColors)
                   
                }
                
                
                TextField("", text: $entry,  prompt: Text("Start your journal entry here!").foregroundStyle(.textPreview))
                    .foregroundStyle(.textColors)
            
                Spacer()
                
                VStack {
                    
                    HStack {
                        Text("Rate Today!")
                            .font(.system(size: 25))
                            .foregroundStyle(.textColors)
                        
                        Spacer()
                        Button("Save") {
                            //            Saving code
                            let newEntry = Entry(text: entry, date: date, emoji: emoji, title: title, color: color)
                            journalEntries.append(newEntry)
                            dismiss()
                            sharedData.journalEntries = journalEntries
                        }
                        .disabled(entry == "" || emoji == "" || title == "")
                        .buttonStyle(.borderedProminent)
                        .foregroundStyle(entry == "" || emoji == "" || title == ""  ? .deny : .confirm)
                    }
                                        
                    HStack {
                        Button() {
                            emoji = sharedData.topMood
                            color = sharedData.topColor
                        } label: {
                            EmojiView(emoji: sharedData.topMood, color: sharedData.topColor)
                        }
                        
                        Button() {
                            emoji = sharedData.goodMood
                            color = sharedData.goodColor
                        } label: {
                            EmojiView(emoji: sharedData.goodMood, color: sharedData.goodColor)
                        }
                        
                        Button() {
                            emoji = sharedData.okayMood
                            color = sharedData.okayColor
                        } label: {
                            EmojiView(emoji: sharedData.okayMood, color: sharedData.okayColor)
                        }
                        
                        Button() {
                            emoji = sharedData.badMood
                            color = sharedData.badColor
                        } label: {
                            EmojiView(emoji: sharedData.badMood, color: sharedData.badColor)
                        }
                        
                        Button() {
                            emoji = sharedData.worstMood
                            color = sharedData.worstColor
                        } label: {
                            EmojiView(emoji: sharedData.worstMood, color: sharedData.worstColor)
                        }
                        
                    }
                    .frame(height: 40)
                    .padding(.bottom)
                    
                    
                }
                .padding()
                
            }
            .padding()
        }
    }
}
