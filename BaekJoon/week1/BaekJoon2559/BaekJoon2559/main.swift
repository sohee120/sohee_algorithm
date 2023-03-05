//
//  main.swift
//  BaekJoon2559
//
//  Created by 윤소희 on 2023/03/05.
//

import Foundation

var sumArr = Array(repeating: 0, count: 100004)
var ksumArr = [Int]()

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let k = input[1]
let temp = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 1...n {
    sumArr[i] = temp[i-1] + sumArr[i-1]
}

for i in k...n {
    ksumArr.append(sumArr[i] - sumArr[i - k])
}

print(ksumArr.max()!)
