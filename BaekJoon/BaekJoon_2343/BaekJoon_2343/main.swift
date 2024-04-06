//
//  main.swift
//  BaekJoon_2343
//
//  Created by 윤소희 on 4/3/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0], n = input[1]
var times: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}

var start = times.max()!
var end = times.reduce(0,+)
var answer = 0

while start <= end {
    var cnt = 1
    let mid = (start + end)/2
    var current = mid
    
    for t in times {
        if current < t {
            cnt += 1
            current = mid
        }
        current -= t
    }
    if cnt <= n {
        end = mid - 1
        answer = mid
    }else{
        start = mid + 1
    }
}

print(answer)
