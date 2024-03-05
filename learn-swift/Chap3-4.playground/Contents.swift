import UIKit
//challenge 1
let firstName = "Matt"
var lastName = ""
if firstName == "Matt" {
     lastName = "Galloway"
} else if firstName == "Ray" {
     lastName = "Wenderlich"
}
let fullName = firstName + " " + lastName //Cannot find 'lastName' in scope va loai bo let o truoc lastName
//challenge 2
let answer = true && true
let answer1 = false || false
let answer2 = (true && 1 != 2) || (4 > 3 && 100 < 1)
let answer3 = ((10 / 2) > 3) && ((10 % 2) == 0)
//challenge 3
let currentPosition = 9
let diceRoll = 2
var nextposition = currentPosition + diceRoll

if nextposition == 3 {
    nextposition = 15
}else if nextposition == 7{
    nextposition = 12
}
if nextposition == 11{
    nextposition = 2
}else if nextposition == 17{
    nextposition = 9
}
//challenge 4
func numberdayinMonth(month: String, year: Int)->Int{
    let lowercaseMonth = month.lowercased()
    switch lowercaseMonth {
    case "thang 1", "thang 3", "thang 5", "thang 7", "thang 8", "thang 10", "thang 12":
        return 31
    case "thang 4", "thang 6", "thang 9","tháng 11":
        return 30
    case "thang 2":
        if year%400 == 0 || year%4 == 0 && year%100 != 0 {return 29}
        else  {return 28}
    default:
        return 0
    }
}
let month = "thang 2"
let year = 2024
let numberofDays = numberdayinMonth(month: month, year: year)
//challenge 5
func nextnumber(number: Int)-> Int{
    var power = 1
    while power < number {
        power *= 2
    }
    return power
}
let num = 27
var next = nextnumber(number: num)

//challenge 6
func triangularNumber(depth: Int)->Int{
    return (depth * (depth+1))/2
    
}
let depth = 6
let tri = triangularNumber(depth: depth)
//challenge 7
func fibonacci(n: Int)->Int{
    if n == 1 || n == 2 {return 1}
    if n == 0 {return 0}
    assert(n > 2)
    var array = [0, 1]
    while array.count < n {
        array.append(array[array.count - 1] + array[array.count - 2])
    }
    return array[n-1]
}
let res = fibonacci(n: 11)
//challenge 8
func printTimesTable(factor: Int) {
    for i in 1...12 {
        let result = factor * i
        print("\(factor) x \(i) = \(result)")
    }
}
let factor = 5
printTimesTable(factor: factor)
//challenge 9
func diceCombinations() {
    print("Number of Combinations:")
    print("-----------------------")
    for total in 2...12 {
        var com = 0
        for roll1 in 1...6 {
            for roll2 in 1...6 {
                if roll1 + roll2 == total {
                    com += 1
                }
            }
        }
        print("\(total): \(com)")
    }
}

// Example usage:
diceCombinations()

