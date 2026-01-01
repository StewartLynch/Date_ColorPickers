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

import Foundation

extension Date {
    /// Returns a date that is `offset` days from this date.
    /// - Parameter offset: The number of days to add or subtract from `self`.
    /// - Returns: A new `Date` `offset` days days before or after `self`.
    func offset(_ offset: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: offset, to: self)!
    }
}
