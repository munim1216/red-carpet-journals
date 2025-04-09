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
        Text("Name's Journal")
            .font(fancyFont)
    }
}

#Preview {
    Journals()
}
