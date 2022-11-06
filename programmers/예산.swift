import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    var result = 0
    var answer = 0
    let sorted = d.sorted()
    for i in sorted{
        if result + i <= budget{
            answer += 1
            result += i
        }else{
            break
        }
    }
    return answer
}