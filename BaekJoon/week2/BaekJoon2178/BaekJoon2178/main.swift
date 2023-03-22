//
//  main.swift
//  BaekJoon2178
//
//  Created by 윤소희 on 2023/03/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let m = input[1]
var maze = Array(repeating: Array(repeating: 0, count: m), count: n)
var check = Array(repeating: Array(repeating: false, count: m), count: n)
var distance = Array(repeating: Array(repeating: 0, count: m), count: n)

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let temp = readLine()!.map{Int(String($0))!}
    maze[i] = temp
}

func bfs() {
    
    distance[0][0] = 1
    check[0][0] = true
    
    var queue = [(Int, Int)]()
    queue.append((0,0))
    
    while !queue.isEmpty {
        let dequeue = queue.removeFirst()
        let y = dequeue.0
        let x = dequeue.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m || check[ny][nx] || maze[ny][nx] == 0 {
                continue
            }
            queue.append((ny, nx))
            check[ny][nx] = true
            distance[ny][nx] = distance[y][x] + 1
            
        }
    }
}

bfs()
print(distance[n-1][m-1])
