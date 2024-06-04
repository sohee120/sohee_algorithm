//
//  main.swift
//  BaekJoon_1922
//
//  Created by 윤소희 on 6/5/24.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
typealias Edge = (a:Int, b:Int, cost:Int)
var edges = [Edge]()
var parent = Array(0...n)
var answer = 0

for _ in 0..<m{
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges.append(Edge(temp[0], temp[1], temp[2]))
}

edges.sort{$0.cost < $1.cost}

func find(_ idx:Int) -> Int {
    if parent[idx] == idx {
        return idx
    } else {
        parent[idx] = find(parent[idx])
        return parent[idx]
    }
}

func union(_ a:Int, _ b:Int) {
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

func isSameParent (_ a:Int, _ b:Int) -> Bool {
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
