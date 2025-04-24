//
//  EmojiView.swift
//  RedCarpetJournals
//
//  Created by Student on 4/23/25.
//

import SwiftUI

struct EmojiView: View {
    var emoji: String
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(color)
            Text(emoji)
                .font(.system(size: 25))
        }
    }
}

#Preview {
    EmojiView(emoji: "😍", color: .red)
}
