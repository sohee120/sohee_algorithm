//
//  main.swift
//  BaekJoon_16234
//
//  Created by 윤소희 on 2024/02/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], L = input[1], R = input[2]
var land = Array(repeating: Array(repeating: 0, count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<N {
    let num = readLine()!.split(separator: " ").map{Int(String($0))!}
    land[i] = num
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var queue = [(Int, Int)]()
    queue.append((i, j))
    visited[i][j] = true
    var union = [(Int, Int)]()
    union.append((i, j))
    var count = 0
    count += land[i][j]
    
    while !queue.isEmpty {
        let dequeue = queue.removeFirst()
        let y = dequeue.0
        let x = dequeue.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if nx < 0 || nx >= N || ny < 0 || ny >= N || visited[ny][nx] {
                continue
            }
            
            if L <= abs(land[ny][nx] - land[y][x]), abs(land[ny][nx] - land[y][x]) <= R {
                union.append((ny, nx))
                visited[ny][nx] = true
                count += land[ny][nx]
                queue.append((ny, nx))
            }
        }
    }
    let unionPopulation = Int(floor(Double(count) / Double(union.count)))
    for country in union {
        land[country.0][country.1] = unionPopulation
    }
    return union.count
}

var day = 0
while true {
    visited = Array(repeating: Array(repeating: false, count: N), count: N) // visited 초기화
    var check = false
    
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] {
                if bfs(i, j) >= 2 {
                    check = true
                }
            }
        }
    }
    
    if !check {
        break
    }
    
    day += 1
}

print(day)

