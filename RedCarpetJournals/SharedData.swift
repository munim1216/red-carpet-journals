//
//  SharedData.swift
//  RedCarpetJournals
//
//  Created by Student on 4/23/25.
//

import Foundation

class SharedData: ObservableObject {
    @Published var journalEntries: [Entry] = []
}
