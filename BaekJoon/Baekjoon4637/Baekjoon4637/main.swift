//  Baekjoon4637

import Foundation

var checkArr: Array<Int> = Array(repeating: 0, count: 10004)
var isSelfNum: Bool = false

func checkSelfNum(num: Int) -> Int {
    
    var n = num
    var result: Int = n
    
    repeat {
        result += n % 10
        n /= 10
    } while(n>0)
        
    return result
}

for i in 1...10000{
    
    let idx = checkSelfNum(num: i)
    
    if idx <= 10000{
    checkArr[idx] = -1
    }
    
}

for j in 1...10000 {
    
    if checkArr[j] != -1 {
        print(j)
    }
    
}
