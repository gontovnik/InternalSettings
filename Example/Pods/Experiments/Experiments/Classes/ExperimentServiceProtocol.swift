// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

public protocol ExperimentServiceProtocol {
    func registerExperiment<E: Experiment>(_ experiment: E.Type)
    func allocatedGroup<E: Experiment> (for experiment: E.Type) -> E.Group
}
