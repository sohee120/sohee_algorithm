//
//  main.swift
//  BJ1647
//
//  Created by 윤소희 on 3/8/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var parent = Array(repeating: 0, count: n+1)
var ans = 0
for i in 0...n {
    parent[i] = i
}

struct Edge {
    let a: Int
    let b: Int
    let cost: Int
}

var edges = [Edge]()
var village = [Edge]()

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges.append(Edge(a: temp[0], b: temp[1], cost: temp[2]))
}

edges.sort{$0.cost < $1.cost}

func find(index: Int) -> Int {
    if parent[index] == index {
        return index
    } else {
        parent[index] = find(index: parent[index])
        return parent[index]
    }
}

func union(a: Int, b: Int) {
    let a = find(index: a), b = find(index: b)
    if a == b {
        return
    }
    
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

func isSameParent(a: Int, b:Int) -> Bool {
    return find(index: a) == find(index: b)
}

for edge in edges {
    let a = edge.a, b = edge.b, cost = edge.cost
    if !isSameParent(a: a, b: b) {
        union(a: a, b: b)
        ans += cost
        village.append(Edge(a: a, b: b, cost: cost))
    }
}
village.sort{$0.cost > $1.cost}
ans -= village[0].cost
print(ans)
