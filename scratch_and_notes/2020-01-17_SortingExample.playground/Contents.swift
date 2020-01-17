import UIKit

struct Student {
    let givenName: String
    let familyName: String
    let gradYear: Int
}

var myList: [Student] = [
    Student(givenName: "Miles", familyName: "Malin", gradYear: 2021),
    Student(givenName: "Riley", familyName: "Gibbs", gradYear: 2004),
    Student(givenName: "Keegan", familyName: "Gibbs", gradYear: 2003),
    Student(givenName: "Katelin", familyName: "Gibbs", gradYear: 2006),
    Student(givenName: "Erik", familyName: "Anderson", gradYear: 2004),
    Student(givenName: "Kaelen", familyName: "Cook", gradYear: 2020),
    Student(givenName: "Alberto", familyName: "Mancarella", gradYear: 2021)
]

func sortByFamilyName(a: Student, b: Student) -> Bool {
    if a.familyName == b.familyName {
        return a.givenName < b.givenName
    } else {
        return a.familyName < b.familyName
    }
}

let sortedList = myList.sorted(by: sortByFamilyName)
myList.sort(by: sortByFamilyName)

for item in sortedList {
    print("\(item.familyName), \(item.givenName)")
}
