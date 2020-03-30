//
// Created by Slava V. Lysakov on 30.03.2020.
// Copyright (c) 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

class SportCar: Car {

    override var autoType: AutoType {
        return .sport
    }
    override var maxWeight: Int {
        return 10
    }
    override var hasLuke: Bool {
        return true
    }

    var isTurbo: Bool = false {
        didSet {
            if (isTurbo) {
                print("Turbo-режим включен")
            } else {
                print("Turbo-режим выключен")
            }
        }
    }

    override func runDriveAction(action: DriveAction, _ weight: Int...) {
        switch action {
            case .startEngineTurbo:
                isTurbo = true
            case .stopEngineTurbo:
                isTurbo = false
            case .stopEngine:
                isTurbo = false
                deviceLaunched = .stoped
            default:
                if !weight.isEmpty {
                    super.runDriveAction(action: action, weight[0])
                } else {
                    super.runDriveAction(action: action)
                }
        }
    }


}
