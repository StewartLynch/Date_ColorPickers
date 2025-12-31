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
    
    var body: some View {
        VStack{
            ViewOption.first.descrView
            ScrollView {
                DisplayContainer("Standard Date Picker") {
                    
                }
                DisplayContainer("Date Only") {
                    
                }
                DisplayContainer("Time Only") {
                    
                }
                DisplayContainer("No end date") {
                    
                }
                DisplayContainer("No Start Date") {
                    
                }
                DisplayContainer("Start and end date") {
                    
                }
                DisplayContainer("Custom Label") {
                    
                }
                DisplayContainer("Automatic Style") {
                    
                }
                DisplayContainer("Compact Style") {
                    
                }
                DisplayContainer("Graphical Style") {
                    
                }
                DisplayContainer("Wheel Style") {
                    
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
