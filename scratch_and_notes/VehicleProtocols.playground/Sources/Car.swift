import Foundation

public class Car: Vehicle {
    public var speed: Int
    var passengers: [Passenger]
    weak var engineDelegate: Engine?
    
    public init(withEngine engine: Engine) {
        engineDelegate = engine
        speed = 0
        passengers = []
    }
    
    public func accelerate(rate: Int) {
        guard engineDelegate != nil else {
            print("No engine!")
            return
        }
        engineDelegate?.accelerate(self, rate: rate)
    }
    
    public func start() {
        engineDelegate?.start()
    }
    
    public func stop() {
        engineDelegate?.stop()
    }

    public func brake(rate: Int) {
        speed -= rate
    }
    
    public func addPassenger(passenger newPassenger: Passenger) {
        passengers.append(newPassenger)
    }
    
    public func readSpeedometer() -> Int {
        return speed
    }
    
    public func viewOccupants() {
        var names: [String] = []
        for passenger in passengers {
            names.append(passenger.name)
        }
    }
}
