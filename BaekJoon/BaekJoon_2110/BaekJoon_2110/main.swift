//
//  main.swift
//  BaekJoon_2110
//
//  Created by 윤소희 on 4/9/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], c = input[1]
var homes = [Int]()

for _ in 0..<n {
    let temp = Int(readLine()!)!
    homes.append(temp)
}

homes.sort()

var left = 1
var right = homes.max()! - homes.min()!
var answer = 0

while left <= right {
    var start = homes[0]
    var cnt = 1
    let mid = (left + right)/2
    
    for i in homes.indices {
        let d = homes[i] - start
        if d >= mid {
            cnt += 1
            start = homes[i]
        }
    }
    
    if cnt >= c {
        answer = mid
        left = mid + 1
    }else{
        right = mid - 1
    }
}

print(answer)

