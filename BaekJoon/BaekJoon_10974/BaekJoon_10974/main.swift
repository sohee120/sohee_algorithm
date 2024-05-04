//
//  main.swift
//  BaekJoon_10974
//
//  Created by 윤소희 on 5/4/24.
//

import Foundation

var N = Int(readLine()!)!

func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var visited = Array(repeating: false, count: array.count)
    
    func cycle(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }
    
    cycle([])
    
    return result
}

let result = permutation(Array(1...N), N)

for ele in result {
    for num in ele {
        print(num, terminator: " ")
    }
    print()
}
