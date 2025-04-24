//
//  SharedData.swift
//  RedCarpetJournals
//
//  Created by Student on 4/23/25.
//

import Foundation
import SwiftUI

class SharedData: ObservableObject {
    @Published var journalEntries: [Entry] = []
    @Published var lightMode = false
    @Published var topMood = "😍"
    @Published var goodMood = "😁"
    @Published var okayMood = "😑"
    @Published var badMood = "🙁"
    @Published var worstMood = "😧"
    @Published var topColor = Color.green
    @Published var goodColor = Color.blue
    @Published var okayColor = Color.yellow
    @Published var badColor = Color.orange
    @Published var worstColor = Color.red
}


