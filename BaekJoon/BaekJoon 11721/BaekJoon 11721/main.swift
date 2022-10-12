//  BaekJoon 11721

import Foundation

var input: String = readLine()!
var answerArr: Array<Character> = []
var answer: String = ""

for character in input {
    
    answerArr.append(character)
    
}

for i in 1 ... answerArr.count {
    
    answer += String(answerArr[i-1])
    if i%10 == 0 {answer += "\n"}
    
}

print(answer)
