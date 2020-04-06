//
// Created by Slava V. Lysakov on 06.04.2020.
// Copyright (c) 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

protocol Car {
    var autoType: AutoType { get }
    var maxWeight: Int { get }
    var year: Int { get set }
    var volumeBody: Int { get set }
    var model: AutoModel { get }
    var windowOpen: WindowState { get set }
    var deviceLaunched: LaunchState { get set }
    var useVolumeBody: Int { get set }

    func loadingBody(_ action: DriveAction, _ weight: Int)
    func runDriveAction(action: DriveAction, _ weight: Int...)
}

//extension Car {
//    mutating func runDriveAction(action: DriveAction, _ weight: Int...) {
//        switch action {
//            case .startEngine:
//                deviceLaunched = .running
//            case .stopEngine:
//                deviceLaunched = .stoped
//            case .openWindow:
//                windowOpen = .open
//            case .closeWindow:
//                windowOpen = .close
//            case .loadBody:
//                if !weight.isEmpty {
//                    loadingBody(.loadBody, weight[0])
//                }
//            case .unloadBody:
//                if !weight.isEmpty {
//                    loadingBody(.unloadBody, weight[0])
//                }
//            default:
//                print("Операция не поддерживается")
//        }
//    }
//}


