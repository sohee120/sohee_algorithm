//
//  main.swift
//  BaekJoon_1987
//
//  Created by 윤소희 on 2024/01/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let r = input[0]
let c = input[1]
var board = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: c), count: r)
var answer = 0

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for _ in 0..<r {
    board.append(readLine()!.map{Int($0.asciiValue!) - 65})
}

func dfs(_ y: Int, _ x: Int, _ count: Int, _ alphabet: Int) {
    answer = max(answer, count)
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || nx < 0 || ny >= r || nx >= c {
            continue
        }
        let n = 1 << board[ny][nx]
        if alphabet & n == 0 {
            dfs(ny, nx, count+1, alphabet|n)
        }
    }
}

dfs(0, 0, 1, 1<<board[0][0])
print(answer)


