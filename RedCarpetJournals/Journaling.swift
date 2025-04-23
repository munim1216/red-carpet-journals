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
        VStack(alignment: .leading, spacing: 10) {
    
            ZStack {
                TextEditor(text: $title)
                    .font(.system(size: 30))
                    .focused($titleFocused)
                    .overlay {
                        HStack {
                            if !titleFocused && title == "" {
                                Text("Title")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 30))
                                Spacer()
                            }
                        }
                    }
                    .frame(width: .infinity, height: 30)
                
                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
            }
            
    
            
            TextEditor(text: $entry)
                .focused($entryFocused)
                .overlay {
                    VStack {
                        HStack {
                            if !entryFocused && entry == "" {
                                Text("Start your journal here")
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
        }
        .padding()
        
        VStack {

            HStack {
                Text("Rate Today!")
                    .font(.system(size: 25))
                
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
}
