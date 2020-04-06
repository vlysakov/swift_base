import Foundation

class SportCar: BaseCar {
    override var autoType: AutoType {
        return .sport
    }
    override var maxWeight: Int {
        return 10
    }

    var hasLuke: Bool {
        return true
    }

    private var hasLukeOpen: Bool = false {
        didSet {
            if hasLuke {
                print("Люк \(hasLukeOpen ? "открыт" : "закрыт") ")
            }
        }
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
            case .openLuke:
                hasLukeOpen = hasLuke && true
            case .closeLuke:
                hasLukeOpen = false
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

    override var dsc: String {
        hasLuke ? ("\(super.dsc)Имеется люк\nЛюк \(hasLukeOpen ? "открыт" : "закрыт") ") : ("\(super.dsc)Люк отсутствует\n")
    }

}


