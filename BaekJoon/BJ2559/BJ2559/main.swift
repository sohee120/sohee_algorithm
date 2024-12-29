//
//  main.swift
//  BJ2559
//
//  Created by 윤소희 on 12/29/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
var sumArr = Array(repeating: 0, count: n+1)
var kSumArr = [Int]()

for i in 1...n {
    sumArr[i] = temp[i-1] + sumArr[i-1]
}

for i in k...n {
    kSumArr.append(sumArr[i] - sumArr[i-k])
}

print(kSumArr.max()!)
