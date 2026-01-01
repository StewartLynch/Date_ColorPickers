//
//----------------------------------------------
// Original project: Date_ColorPickers
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions (Stewart Lynch). All rights reserved.



import SwiftUI

struct MultiDatePickers: View {
    @State private var dates: Set<DateComponents> = []
    @Environment(\.calendar) private var calendar
    @Environment(\.timeZone) private var timeZone
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100))]
    private var selectedDates: [Date] {
        dates.compactMap { compontents in
            var comps = compontents
            comps.timeZone = timeZone
            return calendar.date(from: comps)
        }
        .sorted()
    }
       var body: some View {
        VStack{
            ViewOption.third.descrView
            ScrollView {
                DisplayContainer("Multi-Date Pickers") {
                    MultiDatePicker("Multiple Dates",
                                    selection: $dates,
                                    in: Date.now.offset(1)...
                    )
                }
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns) {
                        ForEach(selectedDates, id: \.self) { date in
                            Text(date.formatted(date: .abbreviated, time: .omitted))
                        }
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        MultiDatePickers()
            .navigationTitle(ViewOption.third.title)
    }
}


