import UIKit

var str = "Hello, playground"
//challenge 1
for index in stride(from: 10, through: 9, by: -0.1){
    print(index)
}
//challenge 2
func isPrime(number: Int)-> Bool{
    if number <= 1 {
        return false
        
    }
    var i = 2
    while i*i <= number{
        if number%i == 0{
            return false
            
        }
        i = i+1
        return true
    }
    return true
}
print(isPrime(number: 223))
//challenge 3
func fibonacci(_ number1: Int)-> Int{
    if number1 < 0{return 0}
    else if number1 == 1 || number1 == 2{return 1}
    else{
        return fibonacci(number1 - 1) + fibonacci(number1 - 2)
    }
}
