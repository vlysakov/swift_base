import Foundation

var autos = [Car]()
autos.append(TunkCar(model: .ford, year: 2013, volumeBody: 5000))
autos.append(SportCar(model: .audi, year: 2016, volumeBody: 300))
autos.append(SportCar(model: .bmw, year: 2010, volumeBody: 400))

autos.forEach {
    print($0)
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
