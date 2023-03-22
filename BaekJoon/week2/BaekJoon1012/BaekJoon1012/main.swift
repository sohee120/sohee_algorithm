//
//  main.swift
//  BaekJoon1012
//
//  Created by 윤소희 on 2023/03/21.
//

import Foundation

var t = Int(readLine()!)!
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

while t > 0 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = input[0]
    let n = input[1]
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    var cnt: Int = 0
    var cntList = [Int]()
    
    for _ in 0..<input[2] {
        let location = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[location[1]][location[0]] = 1
    }
    
    func bfs(_ i: Int, _ j: Int) -> Int {
        var queue = [(Int, Int)]()
        queue.append((i, j))
        map[i][j] = 0
        cnt = 1
        
        while !queue.isEmpty {
            
            let dequeue = queue.removeFirst()
            let y = dequeue.0
            let x = dequeue.1
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || ny >= n || nx < 0 || nx >= m {
                    continue
                }
                
                if map[ny][nx] == 1 {
                    queue.append((ny, nx))
                    map[ny][nx] = 0
                    cnt += 1
                }
            }
        }
        return cnt
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                cntList.append(bfs(i,j))
            }
        }
    }

    print(cntList.count)
    t -= 1
}
