//
// Created by Slava V. Lysakov on 30.03.2020.
// Copyright (c) 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

class Car: BaseCar {

    override var autoType: AutoType {
        return .car
    }
    override var maxWeight: Int {
        return 500
    }

    var hasLuke: Bool {
        return false
    }

    private var hasLukeOpen: Bool = false {
        didSet {
            if hasLuke {
                print("Люк \(hasLukeOpen ? "открыт" : "закрыт") ")
            }
        }
    }

    override func runDriveAction(action: DriveAction, _ weight: Int...) {
        switch action {
            case .openLuke:
                hasLukeOpen = hasLuke && true
            case .closeLuke:
                hasLukeOpen = false
            default:
                if !weight.isEmpty {
                    super.runDriveAction(action: action, weight[0])
                } else {
                    super.runDriveAction(action: action)
                }
        }
    }

    override func printf() {
        super.printf()
        if hasLuke {
            print("Имеется люк")
            print("Люк \(hasLukeOpen ? "открыт" : "закрыт") ")
        } else {
            print("Люк отсутствует")
        }
    }

}
