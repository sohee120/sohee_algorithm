//
//  main.swift
//  BaekJoon_1405
//
//  Created by 윤소희 on 4/25/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let K = input[0], E = Double(input[1])/100, W = Double(input[2])/100, N = Double(input[3])/100, S = Double(input[4])/100

let dict = [0:E, 1:W, 2:N, 3:S]
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var sum: Double = 0.0

var visited = Array(repeating: Array(repeating: false, count: 31), count: 31)

func dfs(_ y:Int,_ x:Int, value: Double, count:Int) {
    if count == K {
        sum += value
        return
    }
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if !visited[ny][nx] {
            visited[ny][nx] = true
            dfs(ny, nx, value: dict[i]!*value, count: count+1)
            visited[ny][nx] = false
        }
    }
}

visited[15][15] = true
dfs(15, 15, value: 1.0, count: 0)
print(sum)
