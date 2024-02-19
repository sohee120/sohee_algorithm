//
//  main.swift
//  Review_1197.11404
//
//  Created by 윤소희 on 2024/02/20.
//

import Foundation

//백준 1197_크루스칼

typealias Edge = (a:Int, b:Int, cost:Int)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = input[0], e = input[1]
var parent = Array(0...v)
var edges = [Edge]()
var answer = 0

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1], cost = input[2]
    edges.append(Edge(a,b,cost))
}

edges.sort{$0.cost < $1.cost}

func find(_ idx:Int) -> Int {
    if parent[idx] == idx {
        return idx
    }else{
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

func isSameParent(_ a:Int, _ b: Int) -> Bool {
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


//백준 11404
let n = Int(readLine()!)!
let m = Int(readLine()!)!
let INF = Int(1e9)
var graph = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)

for i in 1...n {
    graph[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1], c = input[2]
    graph[a][b] = min(graph[a][b], c)
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

for i in 1...n {
    for j in 1...n {
        if graph[i][j] == INF {
            print(0, terminator: " ")
        } else {
            print(graph[i][j], terminator: " ")
        }
    }
    print()
}
