import UIKit
import Foundation

//challenge1
func repeatTask(times: Int, task: () -> Void){

    for i in 0..<times {
           task()
       }
   }

   // Usage example:
   repeatTask(times: 10) {
       print("Swift Apprentice is a great book!")
}
//challenge2
func mathSum(length: Int, series: (Int) -> Int) -> Int{
    var sum = 0
        for i in 1...length {
            sum += series(i)
        }
        return sum
}
//challenge 3
let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]
var averageRatings = [String: Double]()
for (appName, ratings) in appRatings {
    let sum = ratings.reduce(0, +)
    let average = Double(sum) / Double(ratings.count)
    averageRatings[appName] = average
}
print("Tb:")
for (appName, averageRating) in averageRatings {
    print("\(appName): \(averageRating)")
}
