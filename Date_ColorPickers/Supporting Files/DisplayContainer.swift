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

struct DisplayContainer<Content: View>: View {
    let header: String
    @ViewBuilder let content: Content
    init(_ header: String, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    var body: some View {
        VStack {
            Text(header).bold()
                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color(uiColor: .systemBackground))
                .background(Color(uiColor: .secondaryLabel), in: .rect)
            content
        }
    }
}
