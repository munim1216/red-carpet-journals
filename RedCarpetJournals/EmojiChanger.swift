//
//  EmojiChanger.swift
//  RedCarpetJournals
//
//  Created by Student on 4/24/25.
//

import SwiftUI

struct EmojiChanger: View {
    @Binding var colorToEdit: Color
    @Binding var emoji: String
    @State var alert = false
    
    var body: some View {
        ColorPicker(selection: $colorToEdit, supportsOpacity: false) {
            Button {
                alert.toggle()
            } label: {
                EmojiView(emoji: emoji, color: colorToEdit)
                    .frame(width: 45)
            }
            .alert("Change Symbol", isPresented: $alert) {
                TextField("New Symbol", text: $emoji)
                Button("Save") {}
                Button("Cancel", role: .cancel) { }
            }
        }
        .frame(height: 45)
    }
}

