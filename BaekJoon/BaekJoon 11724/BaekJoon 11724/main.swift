//
//  main.swift
//  BaekJoon 11724
//
//  Created by 윤소희 on 2023/01/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var connect: [[Int]] = Array(repeating: [], count: input[0] + 1)
var visited = Array(repeating: false, count: input[0] + 1)
var result = 0
var depth = 0

for _ in 0..<input[1] {
    let node = readLine()!.split(separator: " ").map{Int(String($0))!}
    connect[node[0]].append(node[1])
    connect[node[1]].append(node[0])
}

func dfs(_ nodeNum: Int, _ depth: Int) {
    visited[nodeNum] = true
    
    for i in 0..<connect[nodeNum].count {
        let next = connect[nodeNum][i]
        if !visited[next] {
            dfs(next, depth + 1)
        }
    }
}

for i in 1..<input[0]+1 {
    if !visited[i] {
        if connect[i].isEmpty {
            result += 1
            visited[i] = true
        }else{
            dfs(i, 0)
            result+=1
        }
    }
}

print(result)
