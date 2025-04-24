//
//  JournalDisplay.swift
//  RedCarpetJournals
//
//  Created by Student on 4/23/25.
//

import SwiftUI

struct JournalDisplay: View {
    var title: String
    var date: String
    var emoji: String
    var color: Color
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 360, height: 100)
                    .foregroundStyle(.tabbrown)
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    Text(title)
                        .font(.system(size: 300))
                        .minimumScaleFactor(0.01)
                        .foregroundStyle(.white)
                        .padding()
        
                }
                .frame(height: 90)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
            }
            ZStack {
                Rectangle()
                    .foregroundStyle(color)
                HStack {
                    Text(date)
                        .foregroundStyle(.black)
                    Spacer()
                    Text(emoji)
                }
                .padding(.leading)
                .padding(.trailing)
            }
            .frame(width: 150, height: 40)
            .offset(x: -100, y: -50)
            
        }
    }
}

#Preview {
    JournalDisplay(title: "Coursera in LA", date: "11/7/11", emoji: "😍", color: .green)
}
