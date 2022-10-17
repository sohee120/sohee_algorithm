//  BaekJoon11656

import Foundation

let input = Array(readLine()!)
var answerArr = [String]()


for i in 0..<input.count {
    var suff = ""
    for j in i..<input.count {
        suff += String(input[j])
    }
    answerArr.append(suff)
}
answerArr = answerArr.sorted(by: < )

for a in answerArr {
    print(a)
}

