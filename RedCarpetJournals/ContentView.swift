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
    @EnvironmentObject var entries: SharedData
    @State var name: String
    var fancyFont: Font = .custom("Baskerville", size: 45)
    
    var body: some View {
        TabView {
            Tab("Journals", systemImage: "book") {
                Journals(name: $name)
            }
            Tab("Settings", systemImage: "gear") {
                Settings(name: $name)
            }
            
            Tab("Stats", systemImage: "chart.bar") {
                Stats(name: $name)
            }
        }
        .tint(.white)
        .onAppear() {
            UITabBar.appearance().unselectedItemTintColor = .standoutblack
        }
    }
}

#Preview {
    ContentView(name: "Name")
        .environmentObject(SharedData())
}
