//
//  main.swift
//  BaekJoon_10819
//
//  Created by 윤소희 on 5/3/24.
//

import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var maxValue = 0

func calcSum(_ arr: [Int]) -> Int {
    var sum = 0
    for idx in 0..<arr.count-1 {
        sum += abs(arr[idx] - arr[idx+1])
    }
    return sum
}

func permutation(_ arr: [Int], _ depth: Int) {
    var nums = arr
    guard depth < n else {
        let sum = calcSum(arr)
        maxValue = max(sum, maxValue)
        return
    }
    
    for i in depth..<n {
        nums.swapAt(depth, i)
        permutation(nums, depth+1)
        nums.swapAt(depth, i)
    }
}


permutation(numbers, 0)
print(maxValue)


