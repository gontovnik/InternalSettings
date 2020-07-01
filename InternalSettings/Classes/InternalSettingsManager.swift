// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation
import UIKit

public final class InternalSettingsManager {

    // MARK: - Vars

    public static let shared = InternalSettingsManager()

    private var sections = [InternalSettingsSection]()

    // MARK: -

    public func show(in window: UIWindow) {
        show(in: window.rootViewController?.getTopViewController())
    }

    public func show(in presentingViewController: UIViewController?) {
        let navigationController = UINavigationController()
        let viewModel = InternalSettingsViewModel(
            sections: sections,
            didSelectViewControllerItem: { [weak navigationController] item in
                let viewController = item.block()
                viewController.title = item.title
                navigationController?.pushViewController(viewController, animated: true)
            }
        )
        let viewController = InternalSettingsViewController(viewModel: viewModel)
        viewController.navigationItem.rightBarButtonItem = BarButtonItem(title: "Close", block: { [weak viewController] in
            viewController?.dismiss(animated: true, completion: nil)
        })
        navigationController.viewControllers = [viewController]
        presentingViewController?.present(navigationController, animated: true, completion: nil)
    }

    // MARK: -

    public func register(section: InternalSettingsSection) {
        sections.append(section)
    }
}
