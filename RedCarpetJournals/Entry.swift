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
    
    init(id: UUID = UUID(), text: String, date: Date) {
        self.id = id
        self.text = text
        self.date = date
    }
}

