//
//  main.swift
//  BaekJoon_2437
//
//  Created by 윤소희 on 3/8/24.
//

import Foundation

let n = Int(readLine()!)!
var weights = readLine()!.split(separator: " ").map { Int($0)!}

weights.sort()

var totalSum = 0

for weight in weights {
    if weight > totalSum+1 {
        break
    }
    totalSum += weight
}

print(totalSum+1)
