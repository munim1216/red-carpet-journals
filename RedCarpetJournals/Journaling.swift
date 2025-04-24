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
                        .foregroundStyle(.white)
                    
                    DatePicker(
                        "",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .labelsHidden()
                    .colorInvert()
                   
                }
                
                
                TextField("", text: $entry,  prompt: Text("Start your journal entry here!").foregroundStyle(.textPreview))
                    .foregroundStyle(.white)
            
                Spacer()
                
                VStack {
                    
                    HStack {
                        Text("Rate Today!")
                            .font(.system(size: 25))
                            .foregroundStyle(.white)
                        
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
                        if (entry == "" || emoji == "" || title == "") {
                            .foregroundStyle(.red)
                        } else {
                            .foregroundStyle(.green)
                        }
                    }
                    
                    
                    HStack {
                        
                        Button() {
                            emoji = "😍"
                            color = .green
                        } label: {
                            EmojiView(emoji: "😍", color: .green)
                        }
                        
                        Button() {
                            emoji = "😀"
                            color = .blue
                        } label: {
                            EmojiView(emoji: "😀", color: .blue)
                        }
                        
                        Button() {
                            emoji = "😑"
                            color = .yellow
                        } label: {
                            EmojiView(emoji: "😑", color: .yellow)
                        }
                        
                        Button() {
                            emoji = "😕"
                            color = .orange
                        } label: {
                            EmojiView(emoji: "😕", color: .orange)
                        }
                        
                        Button() {
                            emoji = "😧"
                            color = .red
                        } label: {
                            EmojiView(emoji: "😧", color: .red)
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
