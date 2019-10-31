import UIKit


protocol Athlete {
    func practice()
    func playGame() -> Bool
}

class Student: Athlete {
    var Name: String = ""
    var Grade: Int = 0
    var StudentID: Int = 0
    
    func practice() {
        print("Practicing!")
    }
    func playGame() -> Bool {
        return false
    }
}

class OlympicScater: Athlete {
    func practice() {
        print("Flexing on lesser beings")
    }
    
    func playGame() -> Bool {
        return true
    }
    
    
}

let Man = Student()
let re = Man.playGame()
if re == true {
    print("Good Job! You won!")
}
else {
    print("Better luck next time.")
}
