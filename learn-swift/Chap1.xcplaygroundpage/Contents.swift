import UIKit
//challenge 1
let myage: Int = 25
var dog: Int = 1
dog += 1
print(dog)
//challenge 2
var age: Int = 16
print(age)
age = 30
print(age)
//challenge 3
let x: Int = 46
let y: Int = 10
let answer1: Int = (x*100) + y
let answer2: Int = (x*100) + (y*100)
let answer3: Int = (x*100) + (y/10)
print (answer1, answer2, answer3)
//challenge 4
let range: Int = (8 - (4 * 2) + (6/3)*4)
//challenge 5
let rating1, rating2, rating3 :Double;
rating1 = 2.5
rating2 = 4.3
rating3 = 3.0
(rating1 + rating2 + rating3)/3
//challenge 6+7
let voltage: Double = 120
let current: Double = 2.5
let power = voltage * current
let ressitant = power / (current*current)
//challenge 8
let rdNumber = Int(arc4random())
let diceroll = (rdNumber % 6) + 1
let diceroll2 = Int.random(in: 1...6)
//challenge 9
let a, b, c : Double;
a = 1
b = -3
c = 2
let beta = b * b - 4 * a * c
if beta > 0 {
    let root1 = (-b + sqrt(beta)) / (2 * a)
    let root2 = (-b - sqrt(beta)) / (2 * a)
    print("Root 1 is \(root1)")
    print("Root 2 is \(root2)")
} else if beta == 0 {
    let root = -b / (2 * a)
    print("There is one root: (root)")
} else {
    print("There are no real roots.")
}
