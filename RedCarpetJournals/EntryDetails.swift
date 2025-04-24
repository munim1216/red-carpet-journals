//
//  EntryDetails.swift
//  RedCarpetJournals
//
//  Created by Student on 4/22/25.
//

import SwiftUI

struct EntryDetail: View {
    @Binding var entries: [Entry]
    @Environment(\.dismiss) private var dismiss
    @State private var showConfirmationAlert = false
    @State var index: Int

    var entry: Entry  // <- pass in the full journal entry

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(entry.date)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(entry.text)
                    .font(.body)
                    .padding(.top, 10)
                
                Spacer()
                
            }
            VStack {
                Button("Delete Entry") {
                    showConfirmationAlert = true
                }
                .alert("Confirm Deletion", isPresented: $showConfirmationAlert) {
                    Button("Confirm", role: .none) {
                        entries.remove(at: index)
                        dismiss()
                    }
                    Button("Cancel", role: .cancel) {
                        
                    }
                } message: {
                    Text("Are you sure you want to delete this entry? 🫣")
                }
            }
        }
        .padding()
        .navigationTitle("Journal Entry")
    }
}
