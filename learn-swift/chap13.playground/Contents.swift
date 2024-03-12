import UIKit

//challenge 1
struct MovieList {
    var name: String
    var movies: [String]
    
    init(name: String, movies: [String]) {
        self.name = name
        self.movies = movies
    }
    func printMovies() {
        print("Movies in \(name):")
        for movie in movies {
            print(movie)
        }
    }
}
struct Movie {
    var title: String
}
class User {
    var lists: [String: MovieList] = [:]
    
    func addList(_ list: MovieList) {
        lists[list.name] = list
    }
    
    func list(forName name: String) -> MovieList? {
        return lists[name]
    }
}

// Create users
let jane = User()
let john = User()

// Create and share lists
var janeList = MovieList(name: "Jane's List", movies: ["Movie A", "Movie B"])
var johnList = MovieList(name: "John's List", movies: ["Movie X", "Movie Y"])

jane.addList(janeList)
john.addList(johnList)

// Modify the same list
janeList.movies.append("Movie C")
johnList.movies.append("Movie Z")

janeList.printMovies()

johnList.printMovies()
//challeng 2
struct Tshirt {
    let id: Int
    let size: String
    let color: String
    let price: Double
    
}
struct UserforTshirt {
    let name: String
    let email: String
    var shoppingCart: ShoppingCart
}
struct Address {
    let name: String
    let street: String
    let city: String
    let zipCode: String
}
class ShoppingCart {
    var order: [Tshirt] = []
    
    func addTshirt(_ Tshirt: Tshirt){
        order.append(Tshirt)
    }
    func remove(with id: Int) {
        order = order.filter(){$0.id != id}
    }
    func totalPrice()-> Double{
        var totalCost = 0.0
        for Tshirt in order {
            totalCost += Tshirt.price
        }
        return totalCost
    }
}
// Create a T-shirt
let tshirt = Tshirt(id: 1, size: "M", color: "Red", price: 19.99)

// Create a shopping cart
let shoppingCart = ShoppingCart()
shoppingCart.addTshirt(tshirt)

// Create a user
let user = UserforTshirt(name: "Alice", email: "alice@example.com", shoppingCart: shoppingCart)

// Add more items to the shopping cart
let anotherTshirt = Tshirt(id: 2, size: "L", color: "Blue", price: 24.99)
user.shoppingCart.addTshirt(anotherTshirt)

// Calculate total cost
let totalCost = user.shoppingCart.totalPrice()
print("Total cost: $\(totalCost)")
