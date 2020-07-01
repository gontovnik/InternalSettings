// Copyright © 2020 Danil Gontovnik. All rights reserved.

import Foundation

import Experiments

struct ButtonColorExperiment: Experiment {
    typealias Group = ButtonColorExperimentGroup

    static let key = "button_color_experiment"
}

enum ButtonColorExperimentGroup: String, ExperimentGroup {
    case red,
    blue,
    green
}
