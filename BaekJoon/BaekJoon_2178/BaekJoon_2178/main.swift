//
//  main.swift
//  BaekJoon_2178
//
//  Created by 윤소희 on 2023/12/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let M = input[1]

var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var distance = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<N {
    var temp: [Int]
    temp = readLine()!.map{Int(String($0))!}
    map[i] = temp
}

func bfs() {
    distance[0][0] = 1
    visited[0][0] = true
    
    var queue = [(Int, Int)]()
    queue.append((0,0))
    
    while !queue.isEmpty {
        var dequeue = queue.removeFirst()
        var y = dequeue.0
        var x = dequeue.1
        
        for i in 0..<4 {
            var ny = y + dy[i]
            var nx = x + dx[i]
            
            if nx<0 || nx>=M || ny<0 || ny>=N || visited[ny][nx] || map[ny][nx] == 0 {
                continue
            }
            visited[ny][nx] = true
            queue.append((ny, nx))
            distance[ny][nx] = distance[y][x] + 1
        }
    }
}

bfs()
print(distance[N-1][M-1])
