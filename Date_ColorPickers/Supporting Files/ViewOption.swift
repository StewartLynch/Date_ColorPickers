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

enum ViewOption: CaseIterable, Identifiable, View {
    case first, second, third, fourth
    var id: Self { self }
    
    var title: String {
        switch self {
        case .first:
            "Date Pickers"
        case .second:
            "Optional Date Pickers"
        case .third:
            "Multi Date Pickers"
        case .fourth:
            "Color Pickers"
        }
    }
    
    var picker: String {
        switch self {
        case .first:
            "Date Pickers"
        case .second:
            "Optional Date Pickers"
        case .third:
            "Multi Date Pickers"
        case .fourth:
            "Color Pickers"
        }
    }
    
    var body: some View {
        switch self {
        case .first:
            DatePickers()
        case .second:
            OptionalDatesPicker()
        case .third:
            MultiDatePickers()
        case .fourth:
            ColorPickers()
        }
    }
    
    var desc: String {
        switch self {
        case .first:
            """
            Exploring DatePicker arguments and picker styles
            """
        case .second:
            """
            Dealing with a DatePicker bound to an optional observable value.
            """
        case .third:
            """
            Select multiple dates on a calendar and add to a set of DateComponents
            """
        case .fourth:
            """
            Native SwiftUI ColorPicker vs UIKit ColorPicker
            """
        }
        
    }
    var descrView: some View {
        Text(.init(desc))
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.5), in: .rect(cornerRadius: 10))
    }
}
