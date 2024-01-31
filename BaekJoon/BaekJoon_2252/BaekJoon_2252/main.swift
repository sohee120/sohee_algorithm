//
//  main.swift
//  BaekJoon_2252
//
//  Created by 윤소희 on 2024/01/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var nodes = Array(repeating: [Int](), count: n+1)
var indegree = Array(repeating: 0, count: n+1)

for _ in 0..<m {
    let num = readLine()!.split(separator: " ").map{Int(String($0))!}
    nodes[num[1]].append(num[0])
    indegree[num[0]] += 1
}

var queue = [Int]()

for i in 1...n {
    if indegree[i] == 0 {
        queue.append(i)
    }
}

var idx = 0
var result = [Int]()

while idx<queue.count {
    let now = queue[idx]
    result.append(now)
    
    for node in nodes[now] {
        indegree[node] -= 1
        if indegree[node] ==  0 {
            queue.append(node)
        }
    }
    idx += 1
}

result.reverse()

for height in result {
    print(height, terminator: " ")
}
