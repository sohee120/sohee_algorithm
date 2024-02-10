//
//  main.swift
//  BaekJoon_11399
//
//  Created by 윤소희 on 2024/02/10.
//

import Foundation

let N = Int(readLine()!)!
var time = Array(repeating: 0, count: N)

time = readLine()!.split(separator: " ").map { Int(String($0))! }

time.sort()

var result = 0

for i in 0...N {
    for j in 0..<i {
        result += time[j]
    }
}

print(result)

