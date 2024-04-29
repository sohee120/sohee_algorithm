//
//  main.swift
//  BaekJoon_2589
//
//  Created by 윤소희 on 4/29/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var island = [[String]]()
var answer = 0

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for _ in 0..<n {
    island.append(readLine()!.map{String($0)})
}

func bfs(_ i:Int, _ j:Int) {
    var queue = [(Int,Int)]()
    queue.append((i,j))
    var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    visited[i][j] = 1
    
    while !queue.isEmpty {
        let dequeu = queue.removeFirst()
        let y = dequeu.0
        let x = dequeu.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m || visited[ny][nx] != 0 {
                continue
            }
            
            if island[ny][nx] == "L" {
                visited[ny][nx] = visited[y][x] + 1
                answer = max(answer, visited[y][x])
                queue.append((ny,nx))
                continue
            }
        }
    }
}

for y in 0..<n {
    for x in 0..<m {
        if island[y][x] == "L" {
            bfs(y, x)
        }
    }
}

print(answer)
