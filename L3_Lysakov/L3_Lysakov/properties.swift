//
//  properties.swift
//  L3_Lysakov
//
//  Created by Slava V. Lysakov on 23.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

@propertyWrapper
struct PropertyInterval<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>
    
    init(_ range: ClosedRange<Value>) {
        value = range.lowerBound
        self.range = range
    }

    var wrappedValue: Value {
        get {value}
        set {value = min(max(range.lowerBound, newValue), range.upperBound)}
    }
}

enum AutoModel :String {
    case audi
    case bmw
    case ford
}

enum DriveAction {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case loadBody
    case unloadBody
}

enum WindowState {
    case open
    case close
}
enum LaunchState {
    case running
    case stoped
}
