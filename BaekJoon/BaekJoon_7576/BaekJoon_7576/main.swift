//
//  main.swift
//  BaekJoon_7576
//
//  Created by 윤소희 on 2024/01/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0]
let n = input[1]
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var depth = Array(repeating: Array(repeating: 0, count: m), count: n)
var idx = 0
var day = 0

for i in 0..<n {
    var temp: [Int]
    temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = temp
}

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

func bfs() {
    var queue = [(Int, Int)]()
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                queue.append((i,j))
            }
        }
    }
    
    while idx < queue.count {
        let dequeue = queue[idx]
        let y = dequeue.0
        let x = dequeue.1
        
        idx += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if nx < 0 || nx >= m || ny < 0 || ny >= n || map[ny][nx] == -1 || map[ny][nx] == 1 {
                continue
            }
            
            queue.append((ny, nx))
            map[ny][nx] = 1
            depth[ny][nx] = depth[ny][nx] == 0 ? depth[y][x] + 1 : min(depth[ny][nx], depth[y][x] + 1)
            day = max(day, depth[ny][nx])
        }
    }
}

bfs()

for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 0 {
            day = -1
            break
        }
    }
}

print(day)
