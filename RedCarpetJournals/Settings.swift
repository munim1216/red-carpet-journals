//
//  Settings.swift
//  RedCarpetJournals
//
//  Created by Student on 4/9/25.
//

import SwiftUI
struct Settings: View {
    @Binding var name: String
    @State var updatedName: String = ""
    
    var fancyFont: Font = .custom("Baskerville", size: 45)
        
    var body: some View {
        VStack {
            Text("Settings")
                .font(fancyFont)
            HStack {
                Text("My name is:")
                    .font(.custom("Baskerville", size: 25))
                TextField("Name: ", text: $name)
                    .font(.custom("Baskerville", size: 25))
                    .onSubmit {
                        
                    }
            }
            .padding()
        }
    }
}
