//
//  main.swift
//  BaekJoon_6236
//
//  Created by 윤소희 on 4/2/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = input[0], N = input[1]
var money = [Int]()
var answer = 0

for _ in 0..<M {
    money.append(Int(readLine()!)!)
}

var start = money.max()!
var end = money.reduce(0,+)

while start <= end {
    var cnt = 0
    var leftMoney = 0
    let mid = (start + end)/2
    
    for m in money {
        if m > leftMoney {
            leftMoney = mid
            cnt += 1
        }
        leftMoney -= m
    }
    
    if cnt > N {
        start = mid + 1
    } else {
        end = mid - 1
        answer = mid
    }
}

print(answer)
