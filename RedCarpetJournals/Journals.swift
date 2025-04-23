//
//  Journals.swift
//  RedCarpetJournals
//
//  Created by Student on 4/9/25.
//

import SwiftUI

struct Journals: View {
    var fancyFont: Font = .custom("Baskerville", size: 45)
    @State var journalEntries: [Entry] = []
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Name's Journal")
                    .font(fancyFont)
                
                ZStack {
                    NavigationLink (destination: Journaling(journalEntries: $journalEntries)){
                        Image(systemName: "plus.square.dashed")
                            .font(.system(size: 150, weight: .thin))
                            .foregroundStyle(.blue)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    VStack {
                        ForEach(journalEntries) { entry in NavigationLink(destination: EntryDetail(entry: entry)) {
                            Rectangle()
                                .fill(.cyan)
                                .frame(width: 300, height: 70)
                                .cornerRadius(10)
                                .overlay(Text("\(entry.date) \(entry.emoji)"))
                                .foregroundStyle(.white)
                        }
                            
                        }
                    }
                }
                Spacer()

            }
            .padding()
        
        }
    }
}

#Preview {
    Journals()
}
