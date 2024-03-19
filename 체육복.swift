import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var nreserve = reserve.filter{ !lost.contains($0)}
    var nlost = lost.filter{ !reserve.contains($0) }
    var cnt = n - nlost.count
    
    for i in nlost.sorted(by:<) {
        if nreserve.contains(i-1) {
            if let temp = nreserve.firstIndex(of:i-1) {
                nreserve.remove(at: temp)
                cnt += 1
                continue
            }
        }
        if nreserve.contains(i+1) {
            if let temp = nreserve.firstIndex(of:i+1) {
                nreserve.remove(at: temp)
                cnt += 1
            }
        }
    }

    return cnt
}