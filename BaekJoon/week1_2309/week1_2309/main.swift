//
//  main.swift
//  week1_2309
//
//  Created by 윤소희 on 12/13/24.
//

import Foundation

var heights = [Int]()
var ans = [Int]()

for _ in 0..<9 {
    let temp = Int(readLine()!)!
    heights.append(temp)
}

var combinations = combination(heights, 7)

for com in combinations {
    let sum = com.reduce(0, +)
    if sum == 100 {
        ans = com.sorted{$0 < $1}
        break
    }
}

for i in ans {
    print(i)
}


func combination<T>(_ elements: [T], _ k:Int) -> [[T]] {
    var result = [[T]]()
    
    func combi( _ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in index..<elements.count {
            combi(i+1, now + [elements[i]])
        }
    }
    combi(0, [])
    return result
}


