import Foundation

@propertyWrapper
struct YearInterval {
    private let minValue = 1900
    private let maxValue = Calendar.current.component(.year, from: Date())
    var value: Int

    init() {
        self.value = maxValue

    }

    var wrappedValue: Int {
        get {
            value
        }
        set {
            value = min(max(minValue, newValue), maxValue)
        }
    }
}

enum AutoType: String {
    case unknown = "неопределен"
    case car = "легковой"
    case truck = "грузовой"
    case sport = "Спортивный"
}

enum AutoModel: String {
    case audi
    case bmw
    case ford
}

enum DriveAction {
    case startEngine
    case startEngineTurbo
    case stopEngineTurbo
    case stopEngine
    case openWindow
    case closeWindow
    case loadBody
    case unloadBody
    case openLuke
    case closeLuke
    case joinTrailer
}

enum WindowState {
    case open
    case close
}

enum LaunchState {
    case running
    case stoped
}
