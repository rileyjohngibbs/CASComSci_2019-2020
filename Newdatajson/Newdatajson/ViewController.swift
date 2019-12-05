import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?
    
    // TODO: Come up with a better UI than just a single boring label.
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
        }
        
        let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
        
        let dictionary = json as! [String: Any]
        let advisor: String = dictionary["advisor"] as! String
        let classes: [String] = dictionary["classes"] as! [String]
        let grade: Int = dictionary["grade"] as! Int
    
        // This just puts the file contents (unparsed) into the label.
        if let string = jsonFileString {
            myLabel.text = "ADVISOR: \(advisor). GRADE: \(grade). CLASSES: \(classes.joined(separator: ", "))."
        }
        
        if jsonFileData != nil {
            // TODO: Parse the JSON data and display it in the app.
        }
    }
    
}





