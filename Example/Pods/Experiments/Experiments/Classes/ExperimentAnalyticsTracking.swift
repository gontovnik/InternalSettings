// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

public protocol ExperimentAnalyticsTracking {
    func setUserProperties(_ userProperties: [AnyHashable: Any])
}
