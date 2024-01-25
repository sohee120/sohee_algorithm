//
//  main.swift
//  BaekJoon_1916
//
//  Created by 윤소희 on 2024/01/25.
//

import Foundation

let INF = Int(1e9)
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var dist = Array(repeating: INF, count: n+1)
var graph = Array(repeating: [(v:Int, cost:Int)](), count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = input[0], v = input[1], cost = input[2]
    graph[u].append((v, cost))
}

for i in 1...n {
    graph[i].sort(by: {$0.cost < $1.cost})
}

let se = readLine()!.split(separator: " ").map{Int(String($0))!}
let start = se[0], end = se[1]
dist[start] = 0

var queue = [(start)]
var idx = 0

while idx < queue.count {
    let now = queue[idx]
    let cost = dist[now]
    
    for i in graph[now] {
        let next = i.v
        let ncost = i.cost
        
        if dist[next] > cost + ncost {
            dist[next] = cost+ncost
            queue.append(next)
        }
    }
    idx+=1
}

print(dist[end])


