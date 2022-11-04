import Foundation

var addArr = [Int]()

func solution(_ numbers:[Int]) -> [Int] {
    
var input = numbers
    
while input.count > 1 {  
    
    for i in 1...input.count-1 {
        addArr.append(input[0] + input[i])      
        } 
    
    input.remove(at: 0)
    }
    
    let answer: Set = Set(addArr)
    var sortAnswer = Array(answer).sorted()
    
    return sortAnswer

}