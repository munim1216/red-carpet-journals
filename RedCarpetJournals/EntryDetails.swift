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
        VStack(alignment: .leading, spacing: 20) {
            Text("\(entry.date)")
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(entry.text)
                .font(.body)
                .padding(.top, 10)

            Spacer()
        }
        .padding()
        .navigationTitle("Journal Entry")
    }
}
