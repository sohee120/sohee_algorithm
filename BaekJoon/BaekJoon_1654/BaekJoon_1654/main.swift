//
//  main.swift
//  BaekJoon_1654
//
//  Created by 윤소희 on 4/10/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let k = input[0], n = input[1]
var cables = [Int]()

for _ in 0..<k {
    let temp = Int(readLine()!)!
    cables.append(temp)
}

var left = 1
var right = cables.max()!
var answer = 0

while left <= right {
    let mid = (left + right)/2
    var cnt = 0
    
    for cable in cables {
        cnt += cable/mid
    }
    
    if cnt >= n {
        answer = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(answer)



