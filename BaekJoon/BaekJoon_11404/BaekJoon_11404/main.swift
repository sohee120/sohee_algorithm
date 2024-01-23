//
//  main.swift
//  BaekJoon_11404
//
//  Created by 윤소희 on 2024/01/23.
//

import Foundation

let INF = Int(1e9)
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1], c = input[2]
    
    graph[a][b] = min(graph[a][b], c)
}

for i in 1...n {
    graph[i][i] = 0
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
        }else{
            print(graph[i][j], terminator: " ")
        }
    }
    print()
}
