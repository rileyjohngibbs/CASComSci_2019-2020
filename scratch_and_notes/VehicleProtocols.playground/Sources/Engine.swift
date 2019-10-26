import Foundation

public protocol Engine: AnyObject {
    var running: Bool { get }
    
    func start()
    func stop()
    func accelerate(_ car: Car, rate: Int)
}
