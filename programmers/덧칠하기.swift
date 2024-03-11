import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var need = Array(repeating:false, count:100001)
    var count = 0
    
    for i in section {
        need[i] = true
    }
    
    var idx = 1
    while idx < 100001 {
        if need[idx] {
            idx += m
            count += 1
        } else {
            idx += 1
        }
    }
    return count
}