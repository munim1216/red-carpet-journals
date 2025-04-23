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
        TabView {
            Tab("Journals", systemImage: "book") {
                Journals()
            }
            
            Tab("Settings", systemImage: "gear") {
                Settings()
            }
        }

    }
}

#Preview {
    ContentView()
}
