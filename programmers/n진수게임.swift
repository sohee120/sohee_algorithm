import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {

    var result = ""
    var numArr = [String]()

    for i in 0..<m*t {    
        for j in String(i, radix: n).uppercased() {
           if numArr.count == m*(t-1) + p {
               break
           }
            numArr.append(String(j))
        }
    }

    for i in stride(from: p-1, through: numArr.count, by:m) {
        if result.count == t {
            break
        }
        result += numArr[i]
        
    }
    
    return result
}