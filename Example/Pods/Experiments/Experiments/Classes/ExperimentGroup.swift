// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

public protocol ExperimentGroup: CaseIterable, RawRepresentable {
    var rawValue: String { get }
    init?(rawValue: String)
}

extension ExperimentGroup {
    static func random() -> Self {
        let randomIndex = Int(arc4random_uniform(UInt32(allCases.count)))
        return Array(allCases)[randomIndex]
    }
}
