import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var xo = 0, xx = 0
    var sArr = s.map{String($0)}
    var x = sArr[0]
    var str = ""
    
    var idx = 0
    while idx < sArr.count {
        str += sArr[idx]
        if sArr[idx] == x {
            xo += 1
        } else {
            xx += 1
        }
        idx += 1
        
        if idx >= sArr.count {
            if !str.isEmpty {
                answer += 1
            }
            break
        }
        if xo == xx {
            answer += 1
            xo = 0
            xx = 0
            x = sArr[idx]
            str = ""
        }
       
    }
    return answer
}