//
//  main.swift
//  BaekJoon_2468
//
//  Created by 윤소희 on 2024/01/10.
//

import Foundation

let n = Int(readLine()!)!
var area = Array(repeating: Array(repeating: 0, count: n), count: n)
var cnt = 0
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var heights = Set<Int>()
var idx = 0
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let height = readLine()!.split(separator: " ").map{Int(String($0))!}
    area[i] = height
    for j in height {
        heights.insert(j)
    }
}

func bfs(_ i:Int, _ j:Int) {
    var queue = [(Int, Int)]()
    queue.append((i,j))
    visited[i][j] = true
    
    while idx < queue.count {
        let dequeue = queue[idx]
        let y = dequeue.0
        let x = dequeue.1
        idx += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || nx >= n || ny >= n || visited[ny][nx] {
                continue
            }
            
            queue.append((ny,nx))
            visited[ny][nx] = true
        }
    }
}

func bfsAll() -> Int {
    var cnt = 0
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                bfs(i,j)
                cnt += 1
            }
        }
    }
    return cnt
}

let maxHeight = heights.max()
var safeAreaNum = 0

for k in 1...maxHeight! {
    for i in 0..<n {
        for j in 0..<n {
            if area[i][j] <= k {
                visited[i][j] = true
            }
        }
    }
    safeAreaNum = max(bfsAll(), safeAreaNum)
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(safeAreaNum)
