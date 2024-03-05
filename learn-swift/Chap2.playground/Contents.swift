import UIKit
//Challenge 5: Find the error
//What is wrong with the following code?
//let name = "Matt"
//name += " Galloway"// báo lỗi vì đã để biến khai báo là let name muốn thay đổi name += Galloway thì đổi khai báo là var
//Challenge 8: What is the value of summary?
//What is the value of the constant named summary?
let number = 10
let multiplier = 5
let summary = "\(number) multiplied by \(multiplier) equal \(number * multiplier)"
//Challenge 9: Compute the value
//What is the sum of a and b, minus c?
let a = 4
let b: Int32 = 100
let c: UInt8 = 12
let result = a + Int(b) - Int(c)
//Challenge 10:
let Dpi: Double = Double.pi
let lpi: Float  = Float.pi
let dif = Dpi - Double(lpi)
