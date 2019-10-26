import Foundation

public class V8: Engine {
    public var running: Bool
    let MAX_ACCELERATION = 8
    
    public init() {
        running = false
    }
    
    public func start() {
        running = true
    }
    
    public func stop() {
        running = false
    }
    
    public func accelerate(_ car: Car, rate: Int) {
        if running {
            car.speed += min(rate, MAX_ACCELERATION)
        } else {
            print("Engine isn't on!")
        }
    }
}
