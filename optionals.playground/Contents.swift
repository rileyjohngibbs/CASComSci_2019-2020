// This is the homework for Swift Functions Intro:
func square(int: Int) -> Int {
  let jesus = int * int
  return jesus
}
print(square(int: 4))

func five() -> Int {
  return 5
}
print(five())

func fullName(first: String, last: String) -> String {
  return first + " " + last
}
print(fullName(first: "Kaelen", last: "Cook"))

func shout(string: String) -> String {
  return string + "!"
}
print(shout(string: "Get down on the ground"))

func numberName(num: Int) -> String {
  var listnumstoname = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
  if num > 9 {
    return "Nil"
  }
  if num < 0 {
    return "Nil"
  }
  else {
    return listnumstoname[num]
  }
}
print(numberName(num: 6))
print(numberName(num: 15))

// thats it


// This is a function that returns a String? (or Optional<String>). You'll use it below.

func getFirstVowel(in name: String) -> String? {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "y"]
    for char in name {
        if vowels.contains(char) {
            return String(char)
        }
    }
    return nil
}

// TODO: Change yourName to your name.

let yourName = "Riley"

let firstVowel = getFirstVowel(in: yourName)

// TODO: Assign the underlying value of firstVowel to unwrappedVowelOne, unwrappedVowelTwo, and unwrappedVowelThree. Use a different method of unwrapping firstVowel each time.
// v-- Insert code below here --v

var unwrappedVowelOne: String

var unwrappedVowelTwo: String

var unwrappedVowelThree: String

// ^-- Insert code above here --^

print("The first vowel in '\(yourName)' is '\(unwrappedVowelOne)'.")
print("The first vowel in '\(yourName)' is '\(unwrappedVowelTwo)'.")
print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)'.")
