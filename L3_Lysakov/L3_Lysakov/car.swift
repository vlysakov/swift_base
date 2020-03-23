//
//  Car.swift
//  L3_Lysakov
//
//  Created by Slava V. Lysakov on 23.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

struct Car {
    let model :AutoModel
    @PropertyInterval(1900...2020)
    private var years :Int
    
    @PropertyInterval(0...3500)
    private var volumeBody :Int {
        willSet {
            if newValue > 3500 {
                print ("В легковой автомобиль нельзя загрузить более 3500 кг. Установлено максимальное значение 2500 кг.")
            } else if newValue < 0 {
                print ("Объем багажника не может быть меньше 0. Установлено значение 0")
            }
        }
    }
    
    private var useVolumeBody :Int = 0 {
        willSet {
            print ("Загружено \(newValue)")
        }
        didSet {
            print ("остаток \(volumeBody-useVolumeBody) ")
        }
    }
    
    private var windowOpen = WindowState.close {
        willSet {
            print (newValue == .open && windowOpen == .close ? "Двери открываются" : "Двери закрываются")
        }
        didSet {
            print (oldValue == .open && windowOpen == .close ? "Двери закрыты" : "Двери открыты")
        }
    }
    
    private var deviceLaunched = LaunchState.stoped {
        willSet {
            print (newValue == .running && deviceLaunched == .stoped ? "Двигатель запускается" : "Двигатель останавливается")
        }
        didSet {
            print (oldValue == .running && deviceLaunched == .stoped ? "Двигатель заглушен" : "Двигатель запущен")
        }
    }
    
    init (model: AutoModel, year: Int, volumeBody: Int) {
        self.model = model
        self.volumeBody = volumeBody
        self.years = year
    }
     
    mutating func runDriveAction (action: DriveAction, _ weight: Int...) {
        switch action {
        case .startEngine:
            deviceLaunched = .running
        case .stopEngine:
            deviceLaunched = .stoped
        case .openWindow:
            windowOpen = .open
        case .closeWindow:
            windowOpen = .close
        case .loadBody:
            if !weight.isEmpty {
                loadingBody(.loadBody, weight[0])
            }
        case .unloadBody:
            if !weight.isEmpty {
                loadingBody(.unloadBody, weight[0])
            }
        }
    }
    
    private mutating func loadingBody (_ action: DriveAction, _ weight: Int) {
        switch action {
        case .loadBody:
            if weight+useVolumeBody > volumeBody {
                print ("Суммарная масса \(weight+useVolumeBody) больше вместимости багажника \(volumeBody) кг.")
            } else {
                useVolumeBody += weight
            }
        case .unloadBody:
            if weight+useVolumeBody < 0 {
                print ("Невозможно выгрузить из багажника больше чем в нем находится \(weight+useVolumeBody). Операция отменена")
            } else {
                useVolumeBody -= weight
            }
        default:
            print ("Некорректная операция")
        }
    }
    
    func printf () {
        print ("Легковой - модель \(model) год выпуска \(years) объем багажника \(volumeBody)")
        print (windowOpen == .open ? "Окна открыты" : "Окна закрыты")
        print (deviceLaunched == .running ? "Двигатель запущен" : "Двигатель заглушен")
        print ("Свободный объем багажника \(volumeBody - useVolumeBody)")
        print()
    }
}
