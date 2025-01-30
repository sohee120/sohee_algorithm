import Foundation

let n = Int(readLine()!)!
var liquid = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Array(repeating: 0, count: 2)
var val: Int = Int.max
var start = 0, end = n - 1

liquid.sort{$0<$1}

while start < end {
    let sum = liquid[start] + liquid[end]
    
    if abs(sum) < val {
        val = abs(sum)
        ans[0] = liquid[start]
        ans[1] = liquid[end]
    }
    
    if sum == 0 {break}
    
    if sum < 0 {
        start += 1
    } else {
        end -= 1
    }
}

print("\(ans[0]) \(ans[1])")


