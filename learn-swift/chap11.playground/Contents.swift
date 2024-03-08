import UIKit
//default value
struct IceCream {
    let name: String = "vanila"
    lazy var ingeredient: [String] = ["Milk", "sugar", "Vanilla E"]
}
struct IceCream1 {
    let name: String = "vanila"
    lazy var ingeredient: [String] = {
        return ["Milk", "sugar", "Vanilla E"]
    }()
}
//challenge 2
struct car {
    let make: String
    let color: String
}
struct FuelTank {
     var level: Double
}
var lowerful: Bool

