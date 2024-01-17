//
//  main.swift
//  BaekJoon_11403
//
//  Created by 윤소희 on 2024/01/16.
//

import Foundation

let n = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    matrix[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

var check = Array(repeating: Array(repeating: "0", count: n), count: n)
var visited = Array(repeating: false, count: n)

func dfs(_ start:Int, _ now: Int) {
    for i in 0..<n  {
        if matrix[now][i] == 1 && !visited[i] {
            check[start][i] = "1"
            visited[i] = true
            dfs(start, i)
        }
    }
}

for i in 0..<n {
    dfs(i, i)
    visited = Array(repeating: false, count: n)
}

for line in check {
    print(line.joined(separator: " "))
}
