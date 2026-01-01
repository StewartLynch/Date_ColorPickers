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

struct OptionalDatesPicker: View {
    @State private var selectedDate: Date?
    private var dateBinding: Binding<Date> {
        Binding {
            selectedDate ?? Date.now
        } set: { setDate in
            selectedDate = setDate
        }

    }
    var body: some View {
        VStack{
            ViewOption.second.descrView
            DisplayContainer("Optional Dates") {
                LabeledContent("Select Date"){
                    if selectedDate != nil {
                        HStack {
                            DatePicker("Select Date",
                                       selection: dateBinding,
                                       displayedComponents: .date
                            )
                            .labelsHidden()
                            Button {
                                selectedDate = nil
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                        }
                    } else {
                        Button("Add Date") {
                            selectedDate = Date.now
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        OptionalDatesPicker()
            .navigationTitle(ViewOption.second.title)
            .toolbarTitleDisplayMode(.inlineLarge)
    }
}
