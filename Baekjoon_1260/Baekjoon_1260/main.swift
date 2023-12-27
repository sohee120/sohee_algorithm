//
//  main.swift
//  Baekjoon_1260
//
//  Created by 윤소희 on 2023/12/27.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = line[0]
let M = line[1]
let V = line[2]

var graph: [[Int]] = Array(repeating: [], count: N+1)
var check = Array(repeating: false, count: N+1)
var result = ""

for _ in 0..<M {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = relation[0]
    let b = relation[1]
    graph[a].append(b)
    graph[b].append(a)
    graph[a].sort()
    graph[b].sort()
}

func dfs(_ now:Int) {
    check[now] = true
    result += "\(now) "
    for node in graph[now] {
        if !check[node] {
            dfs(node)
        }
    }
}

func bfs(_ now: Int) {
    var needVisited: [Int] = [now]
    var visited = Set<Int>()
    
    while !needVisited.isEmpty {
        let node = needVisited.removeFirst()
        if !visited.contains(node) {
            visited.insert(node)
            result += "\(node) "
            needVisited.append(contentsOf: graph[node])
        }
    }
}

dfs(V)
print(result)
result = ""
bfs(V)
print(result)



