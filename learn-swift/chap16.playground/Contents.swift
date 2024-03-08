import UIKit

protocol Feedable {
    func feed()
}

protocol Cageable {
    func cage()
}

protocol Tankable {
    func putInTank()
}

protocol Walkable {
    func exercise()
}

protocol Cleanable {
    func clean()
}

// Create classes or structs for each animal and adopt the appropriate protocols

// Dog
class Dog: Feedable, Walkable {
    func feed() {
        print("Dog has been fed")
    }
    
    func exercise() {
        print("Dog has been walked")
    }
}

// Cat
class Cat: Feedable {
    func feed() {
        print("Cat has been fed")
    }
}

// Fish
class Fish: Feedable, Tankable, Cleanable {
    func feed() {
        print("Fish has been fed")
    }
    
    func putInTank() {
        print("Fish has been put in tank")
    }
    
    func clean() {
        print("Tank has been cleaned")
    }
}

// Bird
class Bird: Feedable, Cageable {
    func feed() {
        print("Bird has been fed")
    }
    
    func cage() {
        print("Bird has been caged")
    }
}

// Create homogeneous arrays for animals that need to be fed, caged, cleaned, walked, and tanked

var feedableAnimals: [Feedable] = [Dog(), Cat(), Fish(), Bird()]
var cageableAnimals: [Cageable] = [Bird()]
var tankableAnimals: [Tankable] = [Fish()]
var walkableAnimals: [Walkable] = [Dog()]
var cleanableAnimals: [Cleanable] = [Fish()]

// Write a loop to perform the proper tasks on each element of each array

for animal in feedableAnimals {
    animal.feed()
}

for animal in cageableAnimals {
    animal.cage()
}

for animal in tankableAnimals {
    animal.putInTank()
}

for animal in walkableAnimals {
    animal.exercise()
}

for animal in cleanableAnimals {
    animal.clean()
}
