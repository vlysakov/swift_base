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



