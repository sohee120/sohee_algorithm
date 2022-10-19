import Foundation

let minusArr = readLine()!.split(separator:"-").map{String($0)}
let plus = minusArr[0].split(separator:"+").map{Int(String($0))!}

var answer = 0
for i in plus {
    answer += i
}
var minusTotal = 0
for i in 1..<minusArr.count {
    let minus = minusArr[i].split(separator:"+").map{Int(String($0))!}
    
    for j in minus {
        minusTotal += j
    }
}

print(answer - minusTotal)
