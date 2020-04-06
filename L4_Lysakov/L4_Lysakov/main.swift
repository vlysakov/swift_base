//
//  main.swift
//  L4_Lysakov
//
//  Created by Slava V. Lysakov on 25.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

var autos = [BaseCar]()
autos.append(TruckCar(model: .ford, year: 2013, volumeBody: 5000))
autos.append(Car(model: .audi, year: 2016, volumeBody: 300))
autos.append(Car(model: .bmw, year: 2010, volumeBody: 400))
autos.append(SportCar(model: .ford, year: 2018, volumeBody: 50))

autos.forEach {
    $0.printf()
    $0.runDriveAction(action: .startEngine)
    $0.runDriveAction(action: .startEngineTurbo)
    $0.runDriveAction(action: .openWindow)
    $0.runDriveAction(action: .openLuke)
    $0.runDriveAction(action: .loadBody, 500)
    $0.runDriveAction(action: .closeLuke)
    $0.runDriveAction(action: .closeWindow)
    $0.runDriveAction(action: .stopEngine)
    print()
}

