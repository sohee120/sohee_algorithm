//
//  main.swift
//  BJ6497
//
//  Created by 윤소희 on 3/9/25.
//

import Foundation

struct Edge {
    let a: Int
    let b: Int
    let cost: Int
}

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = input[0], n = input[1]
    if m == 0 && n == 0 {
        break
    }
    var edges = [Edge]()
    var parent = Array(repeating: 0, count: m)
    for i in 0..<m {
        parent[i] = i
    }
    
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
        
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    func isSameParent(a: Int, b: Int) -> Bool {
        return find(index: a) == find(index: b)
    }
    
    for _ in 0..<n {
        let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges.append(Edge(a: temp[0], b: temp[1], cost: temp[2]))
    }
    
    edges.sort{$0.cost < $1.cost}

    let total = edges.map{$0.cost}.reduce(0, +)
    var sum = 0
    
    for edge in edges {
        let a = edge.a, b = edge.b, cost = edge.cost
        if !isSameParent(a: a, b: b) {
            union(a: a, b: b)
            sum += cost
        }
    }
    print(total - sum)
}

