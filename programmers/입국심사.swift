import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var left = 1
    var right = n * (times.max()!)
    var ans = 0
    
    while left <= right {
        let mid = (left + right)/2
        var cnt = 0
        
        for time in times {
            cnt += mid/time
        }
        
        if cnt >= n {
            ans = mid
            right = mid - 1
        }else{
            left = mid + 1
        }
    }

    return Int64(ans)
}