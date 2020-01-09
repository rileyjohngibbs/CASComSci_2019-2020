import UIKit

let riley: [String: Any] = [
    "name": "Riley",
    "age": 33,
    "occupations": [
        "teacher",
        "software developer"
    ]
]

let jsonData: Data? = try? JSONSerialization.data(withJSONObject: riley, options: [])

let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

if let jsonData = jsonData, let url = url {
    do {
        try jsonData.write(to: url.appendingPathComponent("riley.json"))
    } catch {
        print("That didn't work.")
    }
} else {
    print("Foo.")
}
