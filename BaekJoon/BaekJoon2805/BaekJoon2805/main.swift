//
//  main.swift
//  BaekJoon2805
//
//  Created by 윤소희 on 3/28/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var heights = readLine()!.split(separator: " ").map{Int(String($0))!}

heights.sort()

var start = 0
var end = heights[heights.count-1]

while start <= end {
    var sum = 0
    let mid = (start + end)/2
    
    for h in heights {
        if h - mid > 0 {
            sum += (h - mid)
        }
    }
    if sum < M {
        end = mid - 1
    } else {
        start = mid + 1
    }
}
print(start-1)



