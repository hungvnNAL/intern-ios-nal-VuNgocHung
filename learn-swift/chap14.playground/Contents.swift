import UIKit
//challenge
class A {
    init() {
        print("I'm A!")
        print("Calling A's initializer")
    }
    deinit {
            print("Deinitializing A")
        }
}

class B: A {
    override init() {
        print("I'm B!")
        print("Calling B's initializer")
        super.init()
    }
    deinit {
        print("Deinitializing B")
    }
}

class C: B {
    override init() {
        print("I'm C!")
        print("Calling C's initializer")
        super.init()
    }
    deinit {
        print("Deinitializing C")
    }
}

let c = A()
let cA = c as! A
do{
    let c = C()
}
// Define the base class StudentAthlete
class StudentAthlete {
    var name: String
    var age: Int
    var school: String
    
    init(name: String, age: Int, school: String) {
        self.name = name
        self.age = age
        self.school = school
    }
    
    func study() {
        print("\(name) is studying.")
    }
    
    func train() {
        print("\(name) is training as an athlete.")
    }
}

// Define the subclass StudentBaseballPlayer
class StudentBaseballPlayer: StudentAthlete {
    var position: String
    var number: Int
    var battingAverage: Double
    
    init(name: String, age: Int, school: String, position: String, number: Int, battingAverage: Double) {
        self.position = position
        self.number = number
        self.battingAverage = battingAverage
        super.init(name: name, age: age, school: school)
    }
    
    override func train() {
        super.train()
        print("\(name) is training as a baseball player.")
    }
}

// Usage
let baseballPlayer = StudentBaseballPlayer(name: "John", age: 18, school: " High", position: "Pitcher", number: 10, battingAverage: 0.320)
print("Baseball player name: \(baseballPlayer.name)")
print("Baseball player position: \(baseballPlayer.position)")
print("Baseball player number: \(baseballPlayer.number)")
print("Baseball player batting average: \(baseballPlayer.battingAverage)")
baseballPlayer.study()
baseballPlayer.train()
