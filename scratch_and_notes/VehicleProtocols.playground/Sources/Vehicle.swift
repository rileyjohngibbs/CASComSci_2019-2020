import Foundation

protocol Vehicle: AnyObject {
    var speed: Int { get set }
    
    func addPassenger(passenger: Passenger)
    func accelerate(rate: Int)
    func brake(rate: Int)
}
