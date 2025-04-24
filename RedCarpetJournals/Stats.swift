//
//  Stats.swift
//  RedCarpetJournals
//
//  Created by Student on 4/23/25.
//

import Charts
import SwiftUI

struct Data: Identifiable {
    var id = UUID()
    let emoji: String
    let count: Int
}

struct Stats: View {
    @Binding var name: String
    @EnvironmentObject var sharedData: SharedData
    
    private var data: [Data] {
        var heartCount = 0
        var smileCount = 0
        var crossCount = 0
        var sadCount = 0
        var shockedCount = 0

        for entry in sharedData.journalEntries {
            switch entry.emoji {
                case "😍":
                    heartCount += 1
                case "😀":
                    smileCount += 1
                case "😑":
                    crossCount += 1
                case "😕":
                    sadCount += 1
                case "😧":
                    shockedCount += 1
                default:
                    break
            }
        }

        return [
            Data(emoji: "😍", count: heartCount),
            Data(emoji: "😀", count: smileCount),
            Data(emoji: "😑", count: crossCount),
            Data(emoji: "😕", count: sadCount),
            Data(emoji: "😧", count: shockedCount)
        ]
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.mattblack)
                .ignoresSafeArea()
            
            VStack {
                Chart(data) {
                    BarMark(
                        x: .value("Emoji", $0.emoji),
                        y: .value("Count", $0.count)
                    )
                }
            }
            .chartForegroundStyleScale([
                "😍": Color.green,
                "😀": Color.blue,
                "😑": Color.yellow,
                "😕": Color.orange,
                "😧": Color.red
            ])
            .chartLegend { }
            .chartXAxis {
                AxisMarks(stroke: StrokeStyle(lineWidth: 0))
            }
            .chartYAxis(.hidden)
            .padding()
            .preferredColorScheme(sharedData.lightMode ? .light : .dark)
        }
    }
}

#Preview {
    @Previewable @State var name = "Name"
    Stats(name: $name).environmentObject(SharedData())
}
