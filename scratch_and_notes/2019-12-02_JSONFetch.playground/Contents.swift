import UIKit

func main() {
    let swapiUrlStr = "https://swapi.co/api/people/3/"
    let swapiUrlObj = URL(string: swapiUrlStr)!
    
    let task = URLSession.shared.dataTask(with: swapiUrlObj) {
        (data, response, error) in
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode),
            let data = data else {
            print("URL fetch failed")
            return
        }
        guard let person = parseSwapiPerson(data) else {
            print("JSON parsing to SWAPI person data failed")
            return
        }
        print(person)
    }
    
    task.resume()
}

struct SwapiPerson {
    var name: String
    var birthYear: String
    var height: Int
}

func parseSwapiPerson(_ data: Data) -> SwapiPerson? {
    let json = try? JSONSerialization.jsonObject(with: data, options: [])
    guard let dictionary = json as? [String: Any] else {
        return nil
    }
    guard let name = dictionary["name"] as? String,
        let birthYear = dictionary["birth_year"] as? String,
        let heightString = dictionary["height"] as? String else {
        return nil
    }
    guard let height = Int(heightString) else {
        return nil
    }
    let person = SwapiPerson(name: name, birthYear: birthYear, height: height)
    return person
}

main()
