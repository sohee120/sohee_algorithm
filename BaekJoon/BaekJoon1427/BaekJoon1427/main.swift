//  BaekJoon1427

import Foundation

var input: Int = Int(readLine()!)!
var numArr: Array<Int> = []

repeat {
    
    numArr.append(input%10)
    input /= 10
    
} while input>0

var answerArr: Array<Int> = numArr.sorted(by:>)
print(answerArr.reduce(0, {$0 * 10 + $1}))
