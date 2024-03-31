//
//  main.swift
//  BaekJoon_2512
//
//  Created by 윤소희 on 3/31/24.
//

import Foundation

let n = Int(readLine()!)!
let budgets = readLine()!.split(separator: " ").map{Int(String($0))!}
let target = Int(readLine()!)!
let maxPrice = budgets.max()!

func bs(_ start:Int, _ end:Int, target: Int) -> Int {
    var start = start
    var end = end
    
    while start <= end {
        let mid = (start + end)/2
        var sum = 0
        for budget in budgets {
            if budget <= mid {
                sum += budget
            } else {
                sum += mid
            }
        }
        
        if sum <= target {
            start = mid + 1
        } else {
            end = mid - 1
        }
        
    }
    return end
}

let sum = budgets.reduce(0,+)
if sum <= target {
    print(maxPrice)
}else{
    print(bs(0, maxPrice, target: target))
}
