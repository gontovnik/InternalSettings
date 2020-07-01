// Copyright © 2020 Danil Gontovnik. All rights reserved.

import UIKit

extension UIViewController {
    func getTopViewController() -> UIViewController {
        var topController = self
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        return topController
    }
}
