// Copyright © 2020 Danil Gontovnik. All rights reserved.

import UIKit

import Experiments
import InternalSettings

private final class AnalyticsTracker: ExperimentAnalyticsTracking {
    func setUserProperties(_ userProperties: [AnyHashable : Any]) {
        print("[AnalyticsTracker] setUserProperties: ", userProperties)
    }
}

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Vars

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let experimentService = ExperimentService(userDefaults: .standard, analyticsTracker: AnalyticsTracker())
        experimentService.registerExperiment(ButtonColorExperiment.self)

        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = ViewController(experimentService: experimentService)
        window?.makeKeyAndVisible()

        InternalSettingsManager.shared.register(
            section: InternalSettingsSection(
                items: [
                    InternalSettingsViewControllerItem(
                        title: "Experiments",
                        block: { () -> UIViewController in
                            let viewModel = ExperimentsDebugViewModel(experimentService: experimentService)
                            return ExperimentsDebugViewController(viewModel: viewModel)
                        }
                    )
                ]
            )
        )

        return true
    }
}

