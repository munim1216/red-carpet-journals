//
//  Journals.swift
//  RedCarpetJournals
//
//  Created by Student on 4/9/25.
//

import SwiftUI

struct Journals: View {
    var fancyFont: Font = .custom("Baskerville", size: 45)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Name's Journal")
                    .font(fancyFont)
                
                HStack {
                        NavigationLink (destination: Journaling()){
                            Image(systemName: "plus.square.dashed")
                                .font(.system(size: 150, weight: .thin))
                                .foregroundStyle(.blue)
                                .offset(x: -20, y: 20)
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
