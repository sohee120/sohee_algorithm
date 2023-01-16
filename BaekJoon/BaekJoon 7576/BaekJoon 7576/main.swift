//
//  main.swift
//  BaekJoon 7576
//
//  Created by 윤소희 on 2023/01/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var m = input[0]
var n = input[1]
var arr = [[Int]]()
var vis = Array(repeating: Array(repeating: 0, count: m), count: n)
var queue = Array<(Int, Int)>()
var isZero: Bool = false
var day = 0
var idx = 0

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

for i in 0..<n {
    var temp : [Int]
    
    temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(temp)
    
    for j in 0..<m {
        if arr[i][j] == 1 {
            queue.append((i,j))
        } else if arr[i][j] == 0 {
            isZero = true
        }
    }
}

if !isZero {
    queue.removeAll()
}


func bfs () {
    while idx < queue.count {

        //removeFirst()는 시간복잡도가 O(n)으로 시간초과. 직접 idx를 만들어서 dequeue해야함
        let val = queue[idx]
        idx += 1
        
        let y = val.0
        let x = val.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            if nx < 0 || nx >= m || ny < 0 || ny >= n || arr[ny][nx] == -1 || arr[ny][nx] == 1 {
                continue
            }
            arr[ny][nx] = 1
            vis[ny][nx] = vis[ny][nx] == 0 ? vis[y][x] + 1 : min(vis[ny][nx], vis[y][x] + 1)
            day = max(day, vis[ny][nx])
            queue.append((ny, nx))
        }
    }
}

bfs()

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 0 {
            day = -1
        }
    }
}

print(day)


