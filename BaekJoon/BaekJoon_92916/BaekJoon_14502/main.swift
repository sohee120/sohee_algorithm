//
//  main.swift
//  BaekJoon_92916
//
//  Created by 윤소희 on 2024/01/09.
//

import Foundation

let size = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = size[0]
let m = size[1]
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
var empty = [(Int, Int)]()
var virus = [(Int, Int)]()
var max = 0
var idx = 0

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[i] = temp
}

for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] == 0 {
            empty.append((y,x))
        } else if  graph[y][x] == 2 {
            virus.append((y,x))
        }
    }
}

func bfs(_ lab: [[Int]]) {
    var bfsLab = lab
    var queue = [(Int, Int)]()
    var cnt = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for i in 0..<virus.count {
        queue.append(virus[i])
    }
    
    while !queue.isEmpty {
        var dequeue = queue.removeFirst()
        let y = dequeue.0
        let x = dequeue.1
        visited[y][x] = true
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || ny >= n || nx >= m || visited[ny][nx] || bfsLab[ny][nx] != 0 {
                continue
            }
            queue.append((ny,nx))
            bfsLab[ny][nx] = 2
        }
    }
    
    for i in 0..<n {
        cnt += bfsLab[i].filter{$0 == 0}.count
    }
    if max < cnt {
        max = cnt
    }
}

for i in 0..<empty.count {
    for j in 0..<i {
        for k in 0..<j {
            let y1 = empty[i].0
            let x1 = empty[i].1
            let y2 = empty[j].0
            let x2 = empty[j].1
            let y3 = empty[k].0
            let x3 = empty[k].1

            graph[y1][x1] = 1
            graph[y2][x2] = 1
            graph[y3][x3] = 1

            let copyLab = graph
            bfs(copyLab)

            graph[y1][x1] = 0
            graph[y2][x2] = 0
            graph[y3][x3] = 0

        }
    }
}

print(max)
