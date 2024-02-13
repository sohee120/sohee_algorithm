//
//  main.swift
//  BaekJoon_1707
//
//  Created by 윤소희 on 2024/02/13.
//

import Foundation

let K = Int(String(readLine()!))!
var flag = 0
var graph: [[Int]] = [[]]
var visited: [Int] = []

for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let v = VE[0], e = VE[1]
    graph = Array(repeating: [Int](), count: v+1)
    visited = Array(repeating: 0, count: v+1)
    flag = 1
    for _ in 0..<e {
        let uv = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph[uv[0]].append(uv[1])
        graph[uv[1]].append(uv[0])
    }
    
    for k in 1...v {
        if visited[k] == 0 {
            let tem = bfs(k)
            if tem == false {
                flag = -1
                break
            }
        }
    }
    
    if flag == 1 {
        print("YES")
    } else if flag == -1 {
        print("NO")
    }
}

func bfs(_ node: Int) -> Bool {
    visited[node] = 1
    var queue: [Int] = []
    queue.append(node)

    while !queue.isEmpty {
        let now = queue.removeFirst()

        for i in graph[now] {
            if visited[i] == 0 {
                visited[i] = -visited[now]
                queue.append(i)
            } else {
                if visited[i] == visited[now] {
                    return false
                }
            }
        }
    }
    return true
}

