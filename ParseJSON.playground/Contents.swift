import UIKit

let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")!
let fileContents = try! Data(contentsOf: fileUrl)

func main() {
    // Parse the JSON data into a Swift value
    let json = try? JSONSerialization.jsonObject(with: fileContents, options: [])
    
    // Cast the object as a dictionary with String keys
    let dictionary = json as! [String: Any]
    
    // Retrieve and cast each piece of data
    let name = dictionary["name"] as! String
    let occupations = dictionary["occupations"] as! [String]
    let birthYear = dictionary["birthYear"] as! Int
    
    // Print the data in a human readable format
    print("\(name) was born in \(2019 - birthYear) years ago. Their occupations are: \(occupations.joined(separator: ", "))")
}

main()
