//
//  main.swift
//  BaekJoon_11725
//
//  Created by 윤소희 on 2024/01/12.
//

import Foundation

let nodeNum = Int(readLine()!)!
var graph: [Int:[Int]] = [:]
var visited = Array(repeating: false, count: nodeNum + 1)

for i in 0...nodeNum {
    graph.updateValue([], forKey: i)
}

for _ in 1..<nodeNum {
    let connect = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[connect[0]]!.append(connect[1])
    graph[connect[1]]!.append(connect[0])
}

var parents = Array(repeating: 0, count: nodeNum+1)

func dfs(_ start: Int, _ parent: Int) {
    visited[start] = true
    parents[start] = parent
    
    for node in graph[start]! {
        if !visited[node] {
            dfs(node, start)
        }
    }
}

dfs(1, 0)

for i in 2...nodeNum {
    print(parents[i])
}

