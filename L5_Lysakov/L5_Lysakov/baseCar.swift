import Foundation

class BaseCar: Car {

    var autoType: AutoType {
        return .unknown
    }
    var maxWeight: Int {
        return 100
    }
    let model: AutoModel // Модель автомобиля

    @YearInterval var year: Int

    var volumeBody: Int = 0 {
        willSet {
            if newValue > maxWeight {
                print("В \(autoType.rawValue) автомобиль нельзя загрузить более \(maxWeight) кг. Установлено максимальное значение \(maxWeight) кг.")
            } else if newValue < 0 {
                print("Объем багажника не может быть меньше 0. Установлено значение 0")
            }
        }
        didSet {
            volumeBody = volumeBody > maxWeight ? maxWeight : volumeBody
        }
    }

    var useVolumeBody: Int = 0 {
        willSet {
            print("Загружено \(newValue)")
        }
        didSet {
            print("остаток \(volumeBody - useVolumeBody) ")
        }
    }

    init(model: AutoModel, year: Int, volumeBody: Int) {
        self.model = model
        self.year = year
        self.volumeBody = volumeBody > maxWeight ? maxWeight : volumeBody
    }

    var windowOpen = WindowState.close {
        willSet {
            print(newValue == .open && windowOpen == .close ? "Двери открываются" : "Двери закрываются")
        }
        didSet {
            print(oldValue == .open && windowOpen == .close ? "Двери закрыты" : "Двери открыты")
        }
    }

    var deviceLaunched = LaunchState.stoped {
        willSet {
            print(newValue == .running && deviceLaunched == .stoped ? "Двигатель запускается" : "Двигатель останавливается")
        }
        didSet {
            print(oldValue == .running && deviceLaunched == .stoped ? "Двигатель заглушен" : "Двигатель запущен")
        }
    }

    func loadingBody(_ action: DriveAction, _ weight: Int) {
        switch action {
            case .loadBody:
                if weight + useVolumeBody > volumeBody {
                    print("Суммарная масса \(weight + useVolumeBody) больше вместимости багажника \(volumeBody) кг.")
                } else {
                    useVolumeBody += weight
                }
            case .unloadBody:
                if weight + useVolumeBody < 0 {
                    print("Невозможно выгрузить из багажника больше чем в нем находится \(weight + useVolumeBody). Операция отменена")
                } else {
                    useVolumeBody -= weight
                }
            default:
                print("Некорректная операция")
        }
    }

    func runDriveAction(action: DriveAction, _ weight: Int...) {
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
            default:
                print("Операция не поддерживается")
        }
    }

    var dsc: String {
        "\(autoType.rawValue) - модель \(model) год выпуска \(year) объем багажника \(volumeBody)\n" +
                (windowOpen == .open ? "Окна открыты\n" : "Окна закрыты\n") +
                (deviceLaunched == .running ? "Двигатель запущен\n" : "Двигатель заглушен\n") +
                "Свободный объем багажника \(volumeBody - useVolumeBody)\n"
    }

}

extension BaseCar: CustomStringConvertible {
    public var description: String {
        dsc
    }
}
