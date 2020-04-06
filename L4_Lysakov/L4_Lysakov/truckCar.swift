//
//  truckCar.swift
//  L4_Lysakov
//
//  Created by Slava V. Lysakov on 26.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

class TruckCar: BaseCar {

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

    override func printf() {
        super.printf()
        print(joinTrailer ? "Прицеплен прицеп" : "Прицеп отцеплен")
    }

}
