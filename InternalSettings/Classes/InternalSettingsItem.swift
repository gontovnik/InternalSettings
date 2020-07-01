// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation
import UIKit

public protocol InternalSettingsItem {
    var title: String { get }
}

public struct InternalSettingsActionItem: InternalSettingsItem {
    public let title: String
    public let block: () -> Void

    public init(title: String, block: @escaping () -> Void) {
        self.title = title
        self.block = block
    }
}

public struct InternalSettingsViewControllerItem: InternalSettingsItem {
    public let title: String
    public let block: () -> UIViewController

    public init(title: String, block: @escaping () -> UIViewController) {
        self.title = title
        self.block = block
    }
}
