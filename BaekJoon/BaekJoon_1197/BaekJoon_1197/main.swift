//
//  main.swift
//  BaekJoon_1197
//
//  Created by 윤소희 on 2024/01/17.
//

import Foundation

typealias Edge = (a:Int, b:Int, cost:Int)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = input[0], e = input[1]
var parent = Array(0...v)
var edges: [Edge] = []
var answer = 0

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1], cost = input[2]
    edges.append(Edge(a, b, cost))
}

edges.sort{ $0.cost < $1.cost }

func find(_ idx:Int) -> Int {
    if parent[idx] == idx {
        return idx
    } else {
        parent[idx] = find(parent[idx])
        return parent[idx]
    }
}

func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a == b {
        return
    }
    
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

func isSameParent(_ a: Int, _ b: Int) -> Bool {
    return find(a) == find(b)
}

for edge in edges {
    let a = edge.a, b = edge.b, cost = edge.cost
    if !isSameParent(a, b) {
        union(a, b)
        answer += cost
    }
}

print(answer)
