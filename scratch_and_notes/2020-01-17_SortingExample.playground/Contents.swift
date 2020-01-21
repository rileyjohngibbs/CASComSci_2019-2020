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

// Using a named function
func sortByFamilyName(a: Student, b: Student) -> Bool {
    if a.familyName != b.familyName {
        return a.familyName < b.familyName
    } else {
        return a.givenName < b.givenName
    }
}
let sortedList = myList.sorted(by: sortByFamilyName)
for item in sortedList {
    print("\(item.familyName), \(item.givenName)")
}

// Using a closure
let sortedByGradYear = myList.sorted(by: {
    (a, b) in
    return a.gradYear < b.gradYear
})
for item in sortedList {
    print("\(item.familyName), \(item.givenName)")
}

// Sorting the function "in-place"
// Using .sort instead of .sorted will mutate myList and not create a new one
myList.sort(by: sortByFamilyName)
for item in myList {
        print("\(item.familyName), \(item.givenName)")
}
