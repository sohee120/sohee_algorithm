//
//  main.swift
//  BaekJoon_1389
//
//  Created by 윤소희 on 2024/02/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var connect = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var visited = Array(repeating: Array(repeating: false, count: n+1), count: n+1)

for _ in 0..<m {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
    connect[relation[0]][relation[1]] = 1
    connect[relation[1]][relation[0]] = 1
}

func bfs(_ y:Int, _ destination:Int) -> Int {
    var queue = [(y, 0)]
    
    while !queue.isEmpty {
        let dequeue = queue.removeFirst()
        let y = dequeue.0
        let cnt = dequeue.1
        
        if y == destination {
            return cnt
        }
        
        for i in 1...n {
            if connect[y][i] == 1 && !visited[y][i] {
                visited[y][i] = true
                queue.append((i,cnt+1))
            }
        }
    }
    return -1
}

var answerIndex = 1
var minValue: Int = Int.max

for start in 1...n {
    var sum = 0
    for destination in 1...n {
        if start != destination {
            sum += bfs(start, destination)
            visited = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
        }
    }
    if sum < minValue {
        minValue = sum
        answerIndex = start
    }
}
print(answerIndex)


