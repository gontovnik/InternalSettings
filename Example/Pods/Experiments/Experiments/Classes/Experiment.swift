// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

public protocol Experiment {
    associatedtype Group: ExperimentGroup
    static var key: String { get }
}
