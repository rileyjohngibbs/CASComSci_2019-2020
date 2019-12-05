import UIKit

func main() {
    let MAX_ID: Int = 15
    let swapiUrlStr = "https://swapi.co/api/people/"
    
    print("Fetching the first \(MAX_ID) characters synchronously. This is slow.")
    var syncPeople: [SwapiPerson] = []
    for i: Int in (1...MAX_ID) {
        let swapiUrlObj = URL(string: "\(swapiUrlStr)\(i)/")!
        let data = try? Data(contentsOf: swapiUrlObj)
        if let data = data {
            if let person = parseSwapiPerson(data) {
                syncPeople.append(person)
            }
        }
    }
    syncPeople.sort(by: {(a: SwapiPerson, b: SwapiPerson) in a.name < b.name})
    for person in syncPeople { print(person) }
    
    print("Fetching the first \(MAX_ID) character asynchronously. This should be pretty quick.")
    var tasks: [URLSessionDataTask] = []
    var asyncPeople: [SwapiPerson] = []
    for i: Int in (1...MAX_ID) {
        let swapiUrlObj = URL(string: "\(swapiUrlStr)\(i)/")!
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
            asyncPeople.append(person)
            if asyncPeople.count == MAX_ID {
                asyncPeople.sort(by: {(a: SwapiPerson, b: SwapiPerson) in a.name < b.name})
                for person in asyncPeople { print(person) }
            }
        }
        tasks.append(task)
    }
    for task in tasks {
        task.resume()
    }
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
