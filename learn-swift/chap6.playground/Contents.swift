import UIKit
//challenge 1
var name: String? = "Ray"
var age: Int? = nil
let distance: Float = 26.7
var middleName: String? = nil
//challenge2
func divideWhole(_ value: Int, by divisor: Int)-> Int?{
    guard value % divisor == 0
    else {return nil}
    return value / divisor
}
if let answer = divideWhole(10, by: 2){
    print(answer)
} else {print("not")}
//challenge 3
func dive(_ number: Int, by divisor: Int)-> Int{
    return (number%divisor == 0) ? number/divisor: 0
}
let res = dive(10, by: 2)

//challenge 4
let num: Int??? = 10
print(num!!!)
func usequard (_ numb: Int???){
    guard let unwrap1 = numb, let unwrap2 = unwrap1, let unwrap3 = unwrap2 else {return}
    print(unwrap3)
}
let numb : Int??? = 100
usequard(numb)
