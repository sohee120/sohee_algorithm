//
//  main.swift
//  BaekJoon2979
//
//  Created by 윤소희 on 2023/03/02.
//

import Foundation

var cnt = Array(repeating: 0, count: 101)
var answer = 0

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

for _ in 0..<3 {
    let time = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in time[0]..<time[1] {
        cnt[j] += 1
    }
}

for i in cnt {
    if i == 1 {
        answer += input[0]
    }else if i == 2 {
        answer += 2*input[1]
    }else if i == 3 {
        answer += 3*input[2]
    }
}

print(answer)
