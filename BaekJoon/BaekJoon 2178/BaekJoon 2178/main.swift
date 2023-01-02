//
//  main.swift
//  BaekJoon 2178
//
//  Created by 윤소희 on 2023/01/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let M = input[1]

var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var check = Array(repeating: Array(repeating: false, count: M), count: N)
var distance = Array(repeating: Array(repeating: 0, count: M), count: N)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for i in 0..<N {
    var temp : [Int]
    temp = readLine()!.map{Int(String($0))!}
    
    map[i] = temp
}

func bfs() {
    distance[0][0] = 1
    check[0][0] = true
    
    var q = Array<(Int, Int)>()
    q.append((0,0))
    
    while !q.isEmpty {
        let poped = q[0]
        q.remove(at: 0)
        
        let x = poped.0
        let y = poped.1
        
        for i in 0..<4 {
            var nx = x + dx[i]
            var ny = y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M || check[nx][ny] || map[nx][ny] == 0 {
                continue
            }
            check[nx][ny] = true
            q.append((nx,ny))
            distance[nx][ny] = distance[x][y] + 1
        }

    }
    
}

bfs()
print(distance[N-1][M-1])
