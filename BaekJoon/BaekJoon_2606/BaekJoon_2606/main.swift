//
//  main.swift
//  BaekJoon_2606
//
//  Created by 윤소희 on 2023/12/29.
//

import Foundation

let comNum = Int(readLine()!)!
let netConnect = Int(readLine()!)!

var graph: [Int:[Int]] = [:]
for num in 1...comNum {
    graph.updateValue([], forKey: num)
}

for _ in 0 ..< netConnect {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]]!.append(input[1])
    graph[input[1]]!.append(input[0])
}

var visited = [Int]()

func dfs(_ node: Int) {
    if visited.contains(node) {
        return
    }
    visited.append(node)
    
    for node in graph[node]! {
        dfs(node)
    }
}

dfs(1)
print(visited.count - 1)
