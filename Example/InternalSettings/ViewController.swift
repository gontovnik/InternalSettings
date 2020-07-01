// Copyright © 2020 Danil Gontovnik. All rights reserved.

import UIKit

import Experiments
import InternalSettings

extension ButtonColorExperimentGroup {
    func toColor() -> UIColor {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
}

final class ViewController: UIViewController {

    // MARK: - Vars

    private let experimentService: ExperimentServiceProtocol

    private let button = UIButton(type: .system)

    // MARK: - Init

    init(experimentService: ExperimentServiceProtocol) {
        self.experimentService = experimentService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        button.addTarget(self, action: #selector(ViewController.showInternalSettings), for: .touchUpInside)
        button.setTitle("Open Internal Settings", for: .normal)
        button.tintColor = experimentService.allocatedGroup(for: ButtonColorExperiment.self).toColor()
        button.frame = view.bounds
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(button)
    }

    // MARK: -
    
    @objc
    private func showInternalSettings() {
        InternalSettingsManager.shared.show(in: self)
    }
}

