//
//  RedCarpetJournalsApp.swift
//  RedCarpetJournals
//
//  Created by Student on 4/8/25.
//

import SwiftUI

@main
struct RedCarpetJournalsApp: App {
    @StateObject private var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(name: "Name")
                .environmentObject(sharedData)
                .preferredColorScheme(sharedData.lightMode ? .light : .dark)
        }
    }
}
