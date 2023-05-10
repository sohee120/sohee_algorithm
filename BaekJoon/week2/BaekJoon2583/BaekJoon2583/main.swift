//
//  main.swift
//  BaekJoon2583
//
//  Created by 윤소희 on 2023/03/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0]
let n = input[1]
var k = input[2]
var paper = Array(repeating: Array(repeating: 0, count: n), count: m)
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]
var cnt = 0
var cntList = [Int]()

while k>0 {
    
    let dot = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    for i in dot[0]..<dot[2] {
        for j in dot[1]..<dot[3] {
            paper[j][i] = 1
        }
    }
    k -= 1
}

func bfs(_ i:Int,_ j: Int) -> Int {

    var queue = [(Int,Int)]()
    queue.append((i,j))
    paper[i][j] = 1
    cnt = 1
    
    while !queue.isEmpty {
        let dequeue = queue.removeFirst()
        let y = dequeue.0
        let x = dequeue.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= m || nx < 0 || nx >= n {
                continue
            }
            if paper[ny][nx] == 0 {
                paper[ny][nx] = 1
                queue.append((ny, nx))
                cnt += 1
            }
        }
    }
    return cnt
}

for i in 0..<m {
    for j in 0..<n {
        if paper[i][j] == 0 {
            cntList.append(bfs(i,j))
        }
    }
}

print(cntList.count)
print(cntList.sorted().map{String($0)}.joined(separator: " "))
