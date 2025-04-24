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
                Rectangle()
                    .foregroundStyle(.mattblack)
                    .ignoresSafeArea()
                
                NavigationLink (destination: Journaling(journalEntries: $journalEntries)){
                    Image(systemName: "plus.circle")
                        .font(.system(size: 75, weight: .thin))
                        .foregroundStyle(.white)
                }
                .offset(x: 125, y: 290)
                
                VStack {
                    Text("Name's Journal")
                        .font(fancyFont)
                        .foregroundStyle(.white)
                    
                    ForEach(journalEntries) { entry in NavigationLink(destination: EntryDetail(entry: entry)) {
                        
                        JournalDisplay(title: entry.title, date: "\(entry.date)", emoji: entry.emoji, color: entry.color)
                    }
                    }
                    Spacer()
                }
            }
        }
        
    }
}
