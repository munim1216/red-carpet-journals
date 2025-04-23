//
//  Journaling.swift
//  RedCarpetJournals
//
//  Created by Student on 4/21/25.
//

import SwiftUI

struct Journaling: View {
    @Environment(\.dismiss) private var dismiss
    @State private var entry: String = ""
    @State private var emoji: String = ""
    @State private var date = Date()
    @FocusState private var focusState: Bool
    @Binding var journalEntries: [Entry]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("How is your day? ✏️")
                .italic()
                .bold()
            DatePicker(
                "Today's Date",
                selection: $date,
                displayedComponents: [.date]
            )
            
            Divider()
            
            HStack {
                Text("Rate today with an emoji")
                Spacer()
                Button("😍") {
                    emoji = "😍"
                }
                Button("😀") {
                    emoji = "😀"
                }
                Button("😑") {
                    emoji = "😑"
                }
                Button("😕") {
                    emoji = "😕"
                }
                Button("😧") {
                    emoji = "😧"
                }
            }
            
            Divider()
            
            TextEditor(text: $entry)
                .focused($focusState)
                .overlay {
                    VStack {
                        HStack {
                            if !focusState && entry == "" {
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
        

        HStack {
            Spacer()
            Button("Save") {
    //            Saving code
                let newEntry = Entry(text: entry, date: date, emoji: emoji)
                journalEntries.append(newEntry)
                dismiss()
            }
            .disabled(entry == "")
            .buttonStyle(.borderedProminent)
            .padding()
        }


        

        
    }
}


