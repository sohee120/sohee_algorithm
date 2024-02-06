//
//  main.swift
//  BaekJoon_1520
//
//  Created by 윤소희 on 2024/02/06.
//

//DFS+DP
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0], n = input[1]
var map = Array(repeating: Array(repeating: 0, count: n), count: m)
var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

for i in 0..<m {
    let h = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = h
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

func dfs(_ y:Int, _ x:Int) -> Int {
    if y == m-1 && x == n-1 {
        return 1
    }
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || nx < 0 || ny >= m || nx >= n || map[y][x] <= map[ny][nx]{
            continue
        }
        if dp[ny][nx] > 0 {
            dp[y][x] += dp[ny][nx]
        } else if dp[ny][nx] == 0 {
            dp[y][x] += dfs(ny, nx)
        }
    }
    
    if dp[y][x] == 0 {
        dp[y][x] = -1
        return 0
    } else {
        return dp[y][x]
    }
}

let result = dfs(0,0)
print(result == -1 ? 0 : result)
