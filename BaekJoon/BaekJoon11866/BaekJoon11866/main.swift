//  BaekJoon11866

import Foundation

// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
// 고의적 충돌
var input = readLine()!.split(separator: " ").map{Int(String($0))}
var personArr = [Int]()
var answerArr = [Int]()
var pointer : Int = 0
var count : Int = 1
var answerStr = ""

for i in 1...input[0]! {
    personArr.append(i)
}

while true {
        if count == input[1]! {
            answerArr.append(personArr[pointer])
            personArr.remove(at: pointer)
            count = 0
            pointer -= 1
        }

    count += 1
    pointer += 1
    
    if pointer > (personArr.count-1) {
        pointer = 0
    }
    
    if personArr.isEmpty {
        break
    }

}//while 끝

for i in answerArr {
    answerStr += "\(i), "
}

answerStr.removeLast()
answerStr.removeLast()

print("<\(answerStr)>")
