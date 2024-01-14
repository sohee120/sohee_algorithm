//
//  main.swift
//  BaekJoon_4963
//
//  Created by 윤소희 on 2024/01/11.
//

import Foundation

let dy = [1, 0, -1, 0, 1, 1, -1, -1]
let dx = [0, 1, 0, -1, 1, -1, 1, -1]

while true {
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let w = input[0]
    let h = input[1]
    
    if w == 0 && h == 0 {
        break
    }
    
    var map = Array(repeating: Array(repeating: 0, count: w), count: h)
    var cnt = 0
    
    for i in 0..<h {
        var temp: [Int]
        temp = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[i] = temp
    }
    
    func bfs(_ i:Int, _ j: Int) {
        var queue = [(Int, Int)]()
        queue.append((i, j))
        map[i][j] = 0
        while !queue.isEmpty {
            let dequeue = queue.removeFirst()
            let y = dequeue.0
            let x = dequeue.1
            
            for i in 0..<8 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || nx < 0 || ny >= h || nx >= w {
                    continue
                }
                if map[ny][nx] == 1 {
                    queue.append((ny,nx))
                    map[ny][nx] = 0
                }
            }
        }
    }
    
    for y in 0..<h {
        for x in 0..<w {
            if map[y][x] == 1 {
                bfs(y,x)
                cnt += 1
            }
        }
    }
    print(cnt)
}
