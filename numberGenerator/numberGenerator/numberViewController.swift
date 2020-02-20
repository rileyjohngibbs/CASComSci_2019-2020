import UIKit

class numberViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    var difficulty = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAction()
    }
    func checkDifficulty() -> Int{
        if difficulty == "easy" {
            let random = Int.random(in: 5...15)
            return random
        }
        else if difficulty == "medium"{
            let random = Int.random(in: 50...80)
            return random
        }
        else{
            let random = Int.random(in: 100...300)
            return random
        }
    }
    
    
    
    @objc func buttonAction() {
        let trueDifficulty = checkDifficulty()
        let number = Int.random(in: 1...trueDifficulty)
        let buttons = (1...trueDifficulty).map({ (x) -> UIButton in
            let newButton = UIButton()
            newButton.setTitle("Button \(x)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 25)
            newButton.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.6, alpha: 1)
            if x > number {
                newButton.addTarget(self, action: #selector(tooHigh), for: .touchUpInside)
            }
            else if x < number {
                newButton.addTarget(self, action: #selector(tooLow), for: .touchUpInside)
            }
            else{
                newButton.addTarget(self, action: #selector(justRight), for: .touchUpInside)
            }
            return newButton
        })
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: trueDifficulty*45)
        scrollView.contentSize = CGSize(width: 400, height: trueDifficulty*45)
        stackView.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.6, alpha: 1)
        scrollView.backgroundColor = UIColor(displayP3Red: 0.8, green: 0.3, blue: 0.6, alpha: 1)
        for button in buttons{
            stackView.addArrangedSubview(button)
            let constraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 0)
            
            if button != buttons[0] {
                stackView.addConstraint(constraint)
                
            }
            
        }
    }
    @objc func tooLow(){
        let alert = UIAlertController(title: "not gonna work, try again", message: "too low", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GO", style: .default))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func tooHigh(){
        let alert = UIAlertController(title: "not gonna work, try again", message: "too high", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GO", style: .default))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func justRight(){
        let alert = UIAlertController(title: "woohoo!!! you did it!!!", message: "Try a harder level", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GO", style: .default))
        self.present(alert, animated: true, completion: {})
    }
}
