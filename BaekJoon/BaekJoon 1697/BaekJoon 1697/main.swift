//
//  main.swift
//  BaekJoon 1697
//
//  Created by 윤소희 on 2023/01/25.
//

import Foundation

let MAX = 100000

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let k = input[1]
var result = 0

if n == k {
    print(result)
} else {
    var queue: [(Int, Int)] = [(n, 0)]
    var visited: [Bool] = Array(repeating: false, count: MAX+1)
    var idx = 0
    visited[n] = true
    
    while idx < queue.count {
        let node = queue[idx]
        idx += 1
        
        for i in 0..<3 {
            
            var next: Int
            
            switch i {
            case 0: next = node.0 - 1
            case 1: next = node.0 + 1
            default: next = node.0 * 2
            }
            
            if next == k {
                result = node.1 + 1
                idx = queue.count
                break
            }else{
                if next < 0 || next > MAX || visited[next] {
                    continue
                }
                visited[next] = true
                queue.append((next, node.1+1))
            }
        }
    }
    print(result)
}
