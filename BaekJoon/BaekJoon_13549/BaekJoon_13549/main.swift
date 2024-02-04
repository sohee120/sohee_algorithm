//
//  main.swift
//  BaekJoon_13549
//
//  Created by 윤소희 on 2024/02/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
let MAX = 100000
var result = 0
var answer = [Int]()
var visit = Array(repeating: false, count: MAX+1)

func bfs() {
    var queue: [(Int, Int)] = [(n, 0)]
    var idx = 0
    visit[n] = true

    while idx < queue.count {
        let dequeue = queue[idx]
        idx += 1
        
        if dequeue.0 == k {
            print(dequeue.1)
            break
        }
        
        if dequeue.0 * 2 < MAX+1 && !visit[dequeue.0 * 2] {
            visit[dequeue.0 * 2] = true
            queue.append((dequeue.0 * 2 , dequeue.1 ))
        }
        
        if dequeue.0 - 1 >= 0 && !visit[dequeue.0 - 1] {
            visit[dequeue.0 - 1] = true
            queue.append((dequeue.0 - 1 , dequeue.1 + 1 ))
        }
        
        if dequeue.0 + 1 < MAX+1 && !visit[dequeue.0 + 1] {
            visit[dequeue.0 + 1] = true
            queue.append((dequeue.0 + 1 , dequeue.1 + 1 ))
        }
    }
}

bfs()
