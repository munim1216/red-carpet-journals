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
                
                HStack {
                    NavigationLink (destination: Journaling(journalEntries: $journalEntries)){
                            Image(systemName: "plus.square.dashed")
                                .font(.system(size: 150, weight: .thin))
                                .foregroundStyle(.blue)
                                .offset(x: -20, y: 20)
                        }
                    
                    
                }
                VStack {
                    ForEach(journalEntries) { entry in NavigationLink(destination: EntryDetail(entry: entry)) {
                        Rectangle()
                            .fill(.cyan)
                            .frame(width: 300, height: 70)
                            .cornerRadius(10)
                            .overlay(Text("\(entry.date)"))
                            .foregroundStyle(.white)
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
