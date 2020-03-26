//
//  main.swift
//  L3_Lysakov
//
//  Created by Slava V. Lysakov on 19.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

var a4 = Car(model: .audi, year: 2013, volumeBody: 200)
a4.printf ()

var x5 = Car(model: .bmw, year: 2016, volumeBody: 500)
x5.printf ()

var f150 = Truck(model: .ford, year: 2015, volumeBody: 4000)
f150.printf ()


print ("Работаем с F-150")
f150.runDriveAction(action: .openWindow)
f150.runDriveAction(action: .loadBody, 500)
f150.printf ()

print ("Работаем с Audi A4")
a4.runDriveAction(action: .startEngine)
a4.runDriveAction(action: .openWindow)
a4.runDriveAction(action: .loadBody, 1000)
a4.runDriveAction(action: .loadBody, 80)

a4.runDriveAction(action: .closeWindow)
a4.printf()

print ("Работаем с BMW X5")
x5.runDriveAction(action: .startEngine)
x5.runDriveAction(action: .loadBody, 200)
x5.runDriveAction(action: .unloadBody, 20)
x5.runDriveAction(action: .stopEngine)
x5.runDriveAction(action: .openWindow)
x5.printf()





