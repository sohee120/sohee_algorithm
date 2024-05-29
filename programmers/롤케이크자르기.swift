import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    var s1: Set<Int> = []
    var s2: Set<Int> = Set(topping)
    
    let maxValue = topping.max()!
    var toppingArr = Array(repeating: 0, count: maxValue+1)
    for t in topping {
        toppingArr[t] += 1
    }
    
    for t in topping {
        s1.insert(t)
        toppingArr[t] -= 1
        if toppingArr[t] <= 0 {
            s2.remove(t)
        }
        if s1.count == s2.count { answer += 1}
    }
    
    return answer
}

