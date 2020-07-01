// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

public protocol ExperimentsDebugViewModelProtocol {
    var numberOfSections: Int { get }
    func numberOfItems(inSection section: Int) -> Int
    func title(forSection section: Int) -> String
    func titleForItem(atIndexPath indexPath: IndexPath) -> String
    func showsCheckmarkForItem(atIndexPath indexPath: IndexPath) -> Bool
    func didSelectItem(atIndexPath indexPath: IndexPath)
}

public final class ExperimentsDebugViewModel: ExperimentsDebugViewModelProtocol {

    // MARK: - Vars

    private let experimentService: ExperimentServiceProtocol & ExperimentServiceDebugProtocol

    public var numberOfSections: Int {
        return experimentService.registeredExperiments.count
    }

    // MARK: - Init

    public init(experimentService: ExperimentServiceProtocol) {
        guard let experimentService = experimentService as? ExperimentServiceProtocol & ExperimentServiceDebugProtocol else {
            fatalError("experimentService has to confirm to both – ExperimentServiceProtocol & ExperimentServiceDebugProtocol")
        }
        self.experimentService = experimentService
    }

    // MARK: -

    public func numberOfItems(inSection section: Int) -> Int {
        return experimentService.registeredExperiments[section].groups.count
    }

    public func title(forSection section: Int) -> String {
        return experimentService.registeredExperiments[section].key
    }

    public func titleForItem(atIndexPath indexPath: IndexPath) -> String {
        return experimentService.registeredExperiments[indexPath.section].groups[indexPath.row]
    }

    public func showsCheckmarkForItem(atIndexPath indexPath: IndexPath) -> Bool {
        let experiment = experimentService.registeredExperiments[indexPath.section]
        let group = experiment.groups[indexPath.row]
        return experimentService.allocatedGroupRawForExperiment(withKey: experiment.key) == group
    }

    public func didSelectItem(atIndexPath indexPath: IndexPath) {
        let experiment = experimentService.registeredExperiments[indexPath.section]
        let group = experiment.groups[indexPath.row]
        experimentService.allocateGroup(experimentKey: experiment.key, groupRaw: group)
    }
}
