//
//  main.swift
//  BaekJoon 1012
//
//  Created by 윤소희 on 2023/01/13.
//

import Foundation

var testNum = Int(readLine()!)!

while testNum > 0 {
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = input[0] //10
    let n = input[1] //8
    let k = input[2]
    var field = Array(repeating: Array(repeating: 0, count: m), count: n)
    let dy = [1, 0, -1, 0]
    let dx = [0, 1, 0, -1]
    var cntList = [Int]()
    var cnt = 0
    
    for _ in 0..<k {
        let coordinate = readLine()!.split(separator: " ").map{Int(String($0))!}
        field[coordinate[1]][coordinate[0]] = 1
    }
    
    func bfs(_ i:Int, _ j:Int) -> Int {
        var queue = [(Int,Int)]()
        queue.append((i,j))
        cnt += 1
        
        while !queue.isEmpty {
            let dequeue = queue.removeFirst()
            let y = dequeue.0
            let x = dequeue.1
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || ny >= n || nx < 0 || nx >= m || field[ny][nx] == 0 {
                    continue
                }
                queue.append((ny,nx))
                cnt += 1
                field[ny][nx] = 0
            }
        }
        return cnt
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if field[i][j] == 1 {
                cntList.append(bfs(i, j))
            }
        }
    }
    
    print(cntList.count)
    testNum -= 1
    
}
