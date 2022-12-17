import Foundation

func solution(_ n:Int64) -> Int64 {
    
    var num = sqrt(Double(n))
    if floor(sqrt(Double(n))) == sqrt(Double(n)) {
        return Int64(pow(num+1, 2))
    }else{
        return -1
    }
    return 0
}