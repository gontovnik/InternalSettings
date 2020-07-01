// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

struct RegisteredExperimentDebug {
    let key: String
    let groups: [String]

    init<E: Experiment>(experiment: E.Type) {
        self.key = experiment.key
        self.groups = experiment.Group.allCases.map { $0.rawValue }
    }
}
