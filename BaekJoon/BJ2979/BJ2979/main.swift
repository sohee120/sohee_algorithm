//
//  main.swift
//  BJ2979
//
//  Created by 윤소희 on 12/28/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = Array(repeating: 0, count: 101)
var ans = 0

for _ in 0..<3 {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in temp[0]..<temp[1] {
        cnt[i] += 1
    }
}

cnt = cnt.filter{$0 != 0}


for num in cnt {
    switch num {
    case 1: ans += 1 * input[0]
    case 2: ans += 2 * input[1]
    default: ans += 3 * input[2]
    }
}

print(ans)
