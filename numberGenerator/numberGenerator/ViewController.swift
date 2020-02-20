import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  guessingVC = segue.destination as? numberViewController, let sender = sender as? UIButton  {
            if sender == easyButton {
                guessingVC.difficulty = "easy"
            }
            if sender == mediumButton {
                guessingVC.difficulty = "medium"
            }
            if sender == hardButton {
                guessingVC.difficulty = "hard"
            }
            
            
        }
        
    }
    
}
