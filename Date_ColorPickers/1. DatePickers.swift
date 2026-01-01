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
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.


import SwiftUI

struct DatePickers: View {
    @State private var selectedDate = Date.now
    private var endDate = Date.now.offset(21)
    private var startDate = Date.now.offset(-21)
    var body: some View {
        VStack{
            ViewOption.first.descrView
            ScrollView {
                DisplayContainer("Standard Date Picker") {
                    DatePicker("Selected Date",
                               selection: $selectedDate
                    )
                }
                DisplayContainer("Date Only") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               displayedComponents: .date
                    )
                }
                DisplayContainer("Time Only") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               displayedComponents: .hourAndMinute
                    )
                }
                DisplayContainer("No end date") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: Date.now...,
                               displayedComponents: .date
                    )
                }
                DisplayContainer("No Start Date") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: ...endDate,
                               displayedComponents: .date
                    )
                }
                DisplayContainer("Start and end date") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: startDate...endDate,
                               displayedComponents: .date
                    )
                }
                DisplayContainer("Custom Label") {
                    DatePicker(selection: $selectedDate,
                               in: startDate...) {
                        Image(systemName: "calendar")
                            .font(.largeTitle)
                    }
                }
                DisplayContainer("Automatic Style") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: startDate...endDate,
                               displayedComponents: .date
                    )
                    .datePickerStyle(.automatic)
                }
                DisplayContainer("Compact Style") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: startDate...endDate,
                               displayedComponents: .date
                    )
                    .datePickerStyle(.compact)
                }
                DisplayContainer("Graphical Style") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: startDate...endDate,
                               displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                }
                DisplayContainer("Wheel Style") {
                    DatePicker("Selected Date",
                               selection: $selectedDate,
                               in: startDate...endDate
                    )
                    .datePickerStyle(.wheel)
                }
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        DatePickers()
            .navigationTitle(ViewOption.first.title)
            .toolbarTitleDisplayMode(.inlineLarge)
    }
}
