import UIKit

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}
func sumOfCoins(coins: [Coin]) -> Int {
    var totalCents = 0
    for coin in coins {
        totalCents += coin.rawValue
        
    }
    return totalCents
}
let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

let totalCents = sumOfCoins(coins: coinPurse)
print("Total cents in coin purse: \(totalCents)")
//challenge 2
enum Month: Int {
    case january = 1, february, march, april, may, june, july,
         august, september, october, november, december
}

extension Month {
    var monthsUntilSummer: Int {
        let currentMonth = self.rawValue
        let summerStartMonth = Month.june.rawValue
        let nextYearMonthOffset = 12
        if currentMonth < summerStartMonth {
            return summerStartMonth - currentMonth
        } else {
            return nextYearMonthOffset - currentMonth + summerStartMonth
        }
    }
}

let currentMonth = Month.march
let monthsUntilSummer = currentMonth.monthsUntilSummer
print("Months until summer: \(monthsUntilSummer)")
//challenge 3
enum Direction {
    case north
    case south
    case east
    case west
}

let movements: [Direction] = [.north, .north, .west, .south,
                              .west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y: 0)

for movement in movements {
    switch movement {
    case .north:
        location.y += 1
    case .south:
        location.y -= 1
    case .east:
        location.x += 1
    case .west:
        location.x -= 1
    }
}

print("Final location: (\(location.x), \(location.y))")

