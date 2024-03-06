import UIKit
//chellenge 1
let array1 = [Int]()
let array2 = ["string"]
let array3: [String] = []
let array4 = [1, 2, 3]
print(array4[0])
//print(array4[5])//index out of rang
array4[1...2]
//array4[0] = 4 let array 4 len kh
//array4.append(4)
var array5 = [1, 2, 3]
array5[0] = array5[1]
array5[0...1] = [4, 5]
//array5[0] = "Six" dang int khong the them string
//array5 += 6 //khong the thay doi dang Int
for item in array5 { print(item) }
//challenge 2
func removingOnce(_ item: Int, from array: [Int]) -> [Int]{
    var newarray = array4
    if let index = newarray.firstIndex(of: item){
        newarray.remove(at: index)
    }
    return newarray
}
removingOnce(1, from: [1])
//challenge 3
func removing(_ item: Int, from array: [Int]) -> [Int]{
    var newarray = array5
    newarray.removeAll() {$0 == item}
    return newarray
}
removing(5, from: [1])
//challenge 4
func reversed(_ array: [Int]) -> [Int]{
    var newarray = [Int]()
    for element in array {
        newarray.insert(element, at: 0)
    }
    return newarray
}
print(reversed(array4))
//challenge 5
func middle(_ array: [Int]) -> Int?{
    guard !array.isEmpty else {
            return nil
        }
    let middleArray = (array.count - 1) / 2
    return array[middleArray]
}
let array = [1,4,5,6,4,4]
middle(array)
//challenge 6
func minMax(of numbers: [Int]) -> (min: Int, max: Int)?{
    guard !numbers.isEmpty else {
            return nil
        }
    var minVal = numbers[0] // Initialize minVal with the first element of the array
        var maxVal = numbers[0] // Initialize maxVal with the first element of the array
        
        for number in numbers {
            if number < minVal {
                minVal = number // Update minVal if a smaller number is found
            }
            if number > maxVal {
                maxVal = number // Update maxVal if a larger number is found
            }
        }
        
        return (minVal, maxVal)
}
let numbers = [5, 3, 9, 1, 7, 4]
print(minMax(of: numbers))
