import UIKit
//challenge 1
func characterCount(_ str: String) {
    var characterCounts = [Character: Int]()
    
    // Count each character
    for char in str {
        if let count = characterCounts[char] {
            characterCounts[char] = count + 1
        } else {
            characterCounts[char] = 1
        }
    }
    
    // Sort characters by count
    let sortedCounts = characterCounts.sorted { $0.value > $1.value }
    
    // Print character counts
    for (char, count) in sortedCounts.enumerated() {
        let cha = count.key
        let count = count.value
        print("\(cha): \(String(repeating: "#", count: count))")
    }
}

// Test
characterCount("abracadabra")

//challenge 2
func wordCount(in inputstr: String)->Int{
    let words = inputstr.components(separatedBy: .whitespaces)
    let fillterword = words.filter(){!$0.isEmpty}
    return fillterword.count
}
let sentence = "hello world."
print("Số từ trong câu là: \(wordCount(in: sentence))")
//challenge 3
func NameFommater(in inputstr: String)-> String{
    let words = inputstr.components(separatedBy: .whitespaces)
    let firstName = words[1].trimmingCharacters(in: .whitespaces)
    let lastName = words[0].trimmingCharacters(in: .whitespaces)
    return ("\(firstName) \(lastName)")
}
print(NameFommater(in: sentence))
//challenge 4
func customComponents(separatedBy delimiter: String, in str: String) -> [String] {
    var components = [String]()
    var currentIndex = str.startIndex
    
    while let delimiterRange = str[currentIndex...].range(of: delimiter) {
        let component = String(str[currentIndex..<delimiterRange.lowerBound])
        components.append(component)
        currentIndex = delimiterRange.upperBound
    }
    
    if currentIndex < str.endIndex {
        let remainingComponent = String(str[currentIndex..<str.endIndex])
        components.append(remainingComponent)
    }
    
    return components
}

// Test
print(customComponents(separatedBy: ",", in: "apple,banana,cherry")) // Output: ["apple", "banana", "cherry"]

//challenge 5
func reverseWords(_ str: String) -> String {
    var reversedString = ""
    var currentWord = ""
    
    // Iterate through the string
    for char in str {
        if char != " " {
            // Add characters to the current word
            currentWord.insert(char, at: currentWord.startIndex)
        } else {
            // Add reversed word to the result string
            reversedString += currentWord + " "
            currentWord = ""
        }
    }
    
    // Add the last word (if any) to the result string
    if !currentWord.isEmpty {
        reversedString += currentWord
    }
    
    return reversedString
}

// Test
print(reverseWords("My dog is called Rover")) // Output: "yM god si dellac revoR"

