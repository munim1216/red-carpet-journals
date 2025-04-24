//
//  EntryDetails.swift
//  RedCarpetJournals
//
//  Created by Student on 4/22/25.
//

import SwiftUI


struct EntryDetail: View {
    var entry: Entry  // <- pass in the full journal entry

    var body: some View {
        ZStack {
            if entry.color == .orange {
                entry.color
                    .brightness(0.3)
                    .ignoresSafeArea()
            } else {
                entry.color
                    .brightness(0.5)
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("\(entry.date)")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("You were feeling \(entry.emoji)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text(entry.text)
                    .font(.body)
                    .padding(.top, 10)

                Spacer()
            }
            .padding()
            .navigationTitle(entry.title)
        }
    }
}
