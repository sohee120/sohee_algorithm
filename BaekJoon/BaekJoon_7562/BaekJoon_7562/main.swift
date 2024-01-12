//
//  main.swift
//  BaekJoon_7562
//
//  Created by 윤소희 on 2024/01/12.
//

import Foundation

var T = Int(readLine()!)!

let dy = [2, 1, -2, -1, -2, -1, 2, 1]
let dx = [1, 2, 1, 2, -1, -2, -1, -2]

while T>0 {
    let size = Int(readLine()!)!
    let startLocation = readLine()!.split(separator: " ").map{Int(String($0))!}
    let endLocation = readLine()!.split(separator: " ").map{Int(String($0))!}
    var chess = Array(repeating: Array(repeating: 0, count: size), count: size)
    var visited = Array(repeating: Array(repeating: false, count: size), count: size)
    var idx = 0
    
    func bfs(_ i:Int, _ j:Int) {
        var queue = [(Int, Int)]()
        queue.append((i,j))
        visited[i][j] = true
        
        while idx<queue.count {
            let dequeue = queue[idx]
            let y = dequeue.0
            let x = dequeue.1
            idx += 1
            
            for i in 0..<8 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny<0 || nx<0 || ny>=size || nx>=size || visited[ny][nx] {
                    continue
                }
                queue.append((ny,nx))
                visited[ny][nx] = true
                chess[ny][nx] = chess[y][x] + 1
            }
        }
    }
    bfs(startLocation[0], startLocation[1])
    print(chess[endLocation[0]][endLocation[1]])
    T -= 1
}


