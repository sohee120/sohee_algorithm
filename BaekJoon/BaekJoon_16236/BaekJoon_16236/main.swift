//
//  main.swift
//  BaekJoon_16236
//
//  Created by 윤소희 on 2024/01/26.
//

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()

var shark = (-1,-1,-1)
var eatCnt = 0

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(input)
    
    if let j = input.firstIndex(of: 9) {
        shark = (i,j,2)
        graph[i][j] = 0
    }
}

var time = 0

func bfs() -> Bool {
    var visit = Array(repeating: Array(repeating: false, count: n), count: n)
    var queue = [(shark.0, shark.1, 0)]
    var idx = 0
    
    visit[shark.0][shark.1] = true
    
    var dist = Int.max
    var fishList = [(Int,Int)]()
    
    while queue.count > idx {
        let (y,x,cnt) = queue[idx]
        idx += 1
        
        if cnt > dist {continue}
        
        if graph[y][x] > 0 && graph[y][x] < shark.2 {
            dist = cnt
            fishList.append((y,x))
        }
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n || visit[ny][nx] || graph[ny][nx] > shark.2 {
                continue
            }
            visit[ny][nx] = true
            queue.append((ny,nx,cnt+1))
        }
    }
    
    if fishList.isEmpty {
        return false
    }
    
    fishList.sort{
        if $0.0 == $1.0 {
            return $0.1 < $1.1
        }
        return $0.0 < $1.0
    }
    
    let target = fishList.first!
    eatCnt += 1
    
    if eatCnt == shark.2 {
        shark.2 += 1
        eatCnt = 0
    }
    
    graph[target.0][target.1] = 0
    shark = (target.0, target.1, shark.2)
    
    time += dist
    return true
}

while true {
    if !bfs() {
        print(time)
        break
    }
}
