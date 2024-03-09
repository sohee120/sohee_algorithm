//
//  main.swift
//  BaekJoon_1449
//
//  Created by 윤소희 on 3/9/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], L = input[1]
let pipe = readLine()!.split(separator: " ").map{Int(String($0))!}
var leak = Array(repeating: false, count: 1001)
var count = 0

for p in pipe {
    leak[p] = true
}

var idx = 1
while idx <= 1000 {
    if leak[idx] {
        idx += L
        count += 1
    } else {
        idx += 1
    }
}

print(count)
