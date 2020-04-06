import Foundation

class TunkCar: BaseCar {
    override var autoType: AutoType {
        return .truck
    }
    override var maxWeight: Int {
        return 10000
    }

    var joinTrailer: Bool = false

    override func runDriveAction(action: DriveAction, _ weight: Int...) {
        switch action {
            case .joinTrailer:
                joinTrailer = !joinTrailer
                print(joinTrailer ? "Прицеплен прицеп" : "Прицеп отцеплен")
            default:
                if !weight.isEmpty {
                    super.runDriveAction(action: action, weight[0])
                } else {
                    super.runDriveAction(action: action)
                }
        }
    }

    override var dsc: String {
        joinTrailer ? ("\(super.dsc)Прицеплен прицеп\n") : ("\(super.dsc)Прицеп отцеплен\n")
    }

}
