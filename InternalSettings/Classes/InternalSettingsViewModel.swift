// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

protocol InternalSettingsViewModelProtocol {
    var numberOfSections: Int { get }
    func numberOfItems(inSection section: Int) -> Int
    func titleForItem(atIndexPath indexPath: IndexPath) -> String
    func showsDisclosureIndicator(atIndexPath indexPath: IndexPath) -> Bool
    func didSelectItem(atIndexPath indexPath: IndexPath)
}

final class InternalSettingsViewModel: InternalSettingsViewModelProtocol {

    // MARK: - Vars

    private let sections: [InternalSettingsSection]
    private let didSelectViewControllerItem: (InternalSettingsViewControllerItem) -> Void

    var numberOfSections: Int {
        return sections.count
    }

    // MARK: - Init

    init(
        sections: [InternalSettingsSection],
        didSelectViewControllerItem: @escaping (InternalSettingsViewControllerItem) -> Void
    ) {
        self.sections = sections
        self.didSelectViewControllerItem = didSelectViewControllerItem
    }

    // MARK: -

    func numberOfItems(inSection section: Int) -> Int {
        return sections[section].items.count
    }

    func titleForItem(atIndexPath indexPath: IndexPath) -> String {
        return sections[indexPath.section].items[indexPath.row].title
    }

    func showsDisclosureIndicator(atIndexPath indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].items[indexPath.row] is InternalSettingsViewControllerItem
    }

    func didSelectItem(atIndexPath indexPath: IndexPath) {
        let item = sections[indexPath.section].items[indexPath.row]
        if let actionItem = item as? InternalSettingsActionItem {
            actionItem.block()
        } else if let viewControllerItem = item as? InternalSettingsViewControllerItem {
            didSelectViewControllerItem(viewControllerItem)
        }
    }
}
