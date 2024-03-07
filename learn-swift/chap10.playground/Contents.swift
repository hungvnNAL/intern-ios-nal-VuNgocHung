import UIKit
//challenge 2
struct Tshirt {
    var size: Int
    var color: String
    var metarial: String
    var price: Int
}
var Price = [Tshirt(size: 1, color: "yellow", metarial: "cotton", price: 100),
             Tshirt(size: 2, color: "red", metarial: "lanh", price: 200)
]
func priceTshirt()-> Int{
    
    return Price.reduce(0) {$0 + $1.price}
}
print(priceTshirt())

//challenge 1
struct Fruit {
    let name: String
    let mount: Int
}
var fruits = [
    Fruit(name: "apple", mount: 400),
    Fruit(name: "orange", mount: 300),
    Fruit(name: "pear", mount:  400)
]
func howmanyfruit() -> Int {
    // Sử dụng reduce để tính tổng số quả
    let totalFruits = fruits.reduce(0) { result, fruit in
        return result + fruit.mount
    }
    return totalFruits
}
func addfruit(_ newfruits: [Fruit]) {
    fruits += newfruits
}
let newFruits = [
    Fruit(name: "grape", mount: 150),
    Fruit(name: "watermelon", mount: 500),
    Fruit(name: "pineapple", mount: 300)
]
addfruit(newFruits)
print(howmanyfruit())
//challenge 3 (khó)
