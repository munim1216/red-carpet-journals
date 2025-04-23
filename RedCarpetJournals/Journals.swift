//
//  Journals.swift
//  RedCarpetJournals
//
//  Created by Student on 4/9/25.
//

import SwiftUI

struct Journals: View {
    @Binding var name: String
    @EnvironmentObject var sharedData: SharedData
    var fancyFont: Font = .custom("Baskerville", size: 45)
    @State var journalEntries: [Entry] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink (destination: Journaling(journalEntries: $journalEntries)){
                    Image(systemName: "plus.circle")
                        .font(.system(size: 75, weight: .thin))
                        .foregroundStyle(.blue)
                }
                .offset(x: 125, y: 290)
                
                VStack {
                    Text("Name's Journal")
                        .font(fancyFont)
                    
                    ForEach(journalEntries) { entry in NavigationLink(destination: EntryDetail(entry: entry)) {
                        
                        Rectangle()
                            .fill(.cyan)
                            .frame(width: 300, height: 70)
                            .cornerRadius(10)
                            .overlay(Text("\(entry.date) \(entry.emoji)"))
                            .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
