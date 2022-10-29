import Foundation


func solution(_ num:Int, _ total:Int) -> [Int] {
    
    var answerArr = [Int]()
    
    let n = total/num
    var m = num/2

    if num%2 == 0{
        for i in 0..<num {
            answerArr.append(n-m+1)
            m -= 1
        }
    }else{
        for i in 1...num {
            answerArr.append(n-m)
            m -= 1
        }
    }
    
    return answerArr
}