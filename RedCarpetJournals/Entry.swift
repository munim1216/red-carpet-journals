//
//  Entry.swift
//  RedCarpetJournals
//
//  Created by Student on 4/22/25.
//

import SwiftUI

struct Entry: Identifiable {
    var id = UUID()
    var text: String
    var date: Date
    var title: String
    var emoji: String
    var color: Color
    
    init(id: UUID = UUID(), text: String, date: Date, emoji: String, title: String, color: Color) {
        self.id = id
        self.text = text
        self.date = date
        self.emoji = emoji
        self.title = title
        self.color = color
    }
}

