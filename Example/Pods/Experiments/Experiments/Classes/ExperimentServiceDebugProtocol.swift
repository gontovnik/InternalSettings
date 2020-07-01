// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

protocol ExperimentServiceDebugProtocol {
    var registeredExperiments: [RegisteredExperimentDebug] { get }
    func allocatedGroupRawForExperiment(withKey key: String) -> String?
    func allocateGroup(experimentKey: String, groupRaw: String)
}
