//
//  main.swift
//  BaekJoon_1038
//
//  Created by 윤소희 on 4/22/24.
//

import Foundation

let N = Int(readLine()!)!
var queue = [Int]()

for i in 1...9 {
    queue.append(i)
}

func solution(_ n: Int) -> Int {
    if n <= 9 {return n}
    var cnt = 9
    var idx = 0
    
    while idx < queue.count {
        let num = queue[idx]
        idx += 1
        
        let last = num % 10 //마지막 자릿수
        for d in 0..<last {
            let newNum = num * 10 + d
            queue.append(newNum)
            cnt += 1
            if cnt == n {
                return newNum
            }
        }
    }
    return -1
}

print(solution(N))
