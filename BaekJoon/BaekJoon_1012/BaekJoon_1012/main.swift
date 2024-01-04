//
//  main.swift
//  BaekJoon_1012
//
//  Created by 윤소희 on 2024/01/04.
//

import Foundation

var T = Int(readLine()!)!

while T > 0 {
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var m = input[0]
    var n = input[1]
    var k = input[2]
    var cnt = 0
    var cntList = [Int]()
    
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    for _ in 0..<k {
        let location = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[location[1]][location[0]] = 1
    }
    
    func bfs(_ i: Int, _ j: Int) -> Int {
        var queue = [(Int, Int)]()
        queue.append((i,j))
        map[i][j] = 0
        cnt += 1
        
        while !queue.isEmpty {
            
            let dequeue = queue.removeFirst()
            let y = dequeue.0
            let x = dequeue.1
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                
                if nx < 0 || nx >= m || ny < 0 || ny >= n {
                    continue
                }
                
                if map[ny][nx] == 1 {
                    queue.append((ny,nx))
                    map[ny][nx] = 0
                    cnt += 1
                }
            }
        }
        return cnt
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1{
                cntList.append(bfs(i,j))
            }
        }
    }
    T -= 1
    print(cntList.count)
}
