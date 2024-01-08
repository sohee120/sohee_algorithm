//
//  main.swift
//  BaekJoon_11724
//
//  Created by 윤소희 on 2024/01/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let m = input[1]
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited = Array(repeating: false, count: n+1)

var result = 0

for _ in 0..<m {
    let connect = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[connect[0]].append(connect[1])
    graph[connect[1]].append(connect[0])
}

func dfs(_ nodeNum: Int) {
    visited[nodeNum] = true
    
    for i in 0..<graph[nodeNum].count {
        let next = graph[nodeNum][i]
        if !visited[next] {
            dfs(next)
        }
    }
}

for i in 1...n {
    if !visited[i] {
        if graph[i].isEmpty {
            result += 1
            visited[i] = true
        } else {
            dfs(i)
            result += 1
        }
    }
}

print(result)
