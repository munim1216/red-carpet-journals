//
//  ContentView.swift
//  RedCarpetJournals
//
//  Created by Student on 4/8/25.
//

import SwiftUI

// Trebuchet MS
// Baskerville
// Didot

struct ContentView: View {
    
    var fancyFont: Font = .custom("Baskerville", size: 45)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name's Journal")
                .font(fancyFont)
            
            HStack {
                Image(systemName: "plus.square.dashed")
                    .font(.system(size: 150, weight: .thin))
                    .foregroundStyle(.blue)
                    .offset(x: -20, y: 20)
                
                    
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(.blue)
//                    .frame(width: 100, height: 100)
//                    .overlay(Image(systemName: "plus.square.dashed"))
            }
            
        }
        .padding()
        Spacer()
        
        VStack {
            TabView {
                Tab("Journals", systemImage: "book") {
                    Journals()
                }
                
                Tab("Settings", systemImage: "gear") {
                    Settings()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
