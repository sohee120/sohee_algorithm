import Foundation

var cntArr = Array(repeating:0, count:1004)
var result: Int = 0

func solution(_ left:Int, _ right:Int) -> Int {

    for i in left...right {
        for j in 1...i {
            if i%j == 0 {
                cntArr[i] += 1
            }
        }
    }

    for i in 0..<cntArr.count {
        if cntArr[i] != 0 {
            if cntArr[i] % 2 == 0 {
                result += i
            }else{
                result -= i
            }
        }
    }

    return result
}
