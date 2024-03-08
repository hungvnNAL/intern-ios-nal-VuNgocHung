import UIKit
//challenge 1
struct Circle {
    var radius = 0.0
    var area: Double {
        get {
            return .pi * radius * radius
        }
        set {
            radius = sqrt(newValue / .pi)
        }
    }
    
    mutating func grow(byFactor factor: Double) {
        area *= factor * factor
    }
}
var circle = Circle(radius: 2.0)
print("Initial area:", circle.area)
circle.grow(byFactor: 3)
print("New area after growth:", circle.area)

//challenge 2
let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
struct SimpleDate{
    var month: String
    var day: Int
    mutating func advance() {
           guard let monthIndex = months.firstIndex(of: month) else {
               return
           }
           if month == "December" && day == 31 {
               month = "January"
               day = 1
           } else if day == daysInMonth(month: month) { // Check if it's the last day of the month
               // Move to the next month
               month = months[(monthIndex + 1) % 12]
               day = 1
           } else {
               // Just increment the day
               day += 1
           }
       }
       
       // Function to get the number of days in a month
       func daysInMonth(month: String) -> Int {
           switch month {
           case "January", "March", "May", "July", "August", "October", "December":
               return 31
           case "April", "June", "September", "November":
               return 30
           case "February":
               return 28
           default:
               return 0
           }
       }
   }

var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month // December; should be January!
date.day// 32; should be 1!

