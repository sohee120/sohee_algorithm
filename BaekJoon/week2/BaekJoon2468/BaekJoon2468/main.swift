//
//  main.swift
//  BaekJoon2468
//
//  Created by 윤소희 on 2023/03/23.
//

import Foundation

let n = Int(readLine()!)!
var area = Array(repeating: Array(repeating: 0, count: n), count: n)
var cnt = 0
var cntList = [Int]()

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let height = readLine()!.split(separator: " ").map{Int(String($0))!}
    area[i] = height
}

func bfs(_ i: Int, _ j:Int) -> Int {
    var queue = [(Int, Int)]()
    queue.append((i,j))
    area[i][j] = n - 1
    cnt = 1
    
    while !queue.isEmpty {
        let dequeue = queue.removeFirst()
        let y = dequeue.0
        let x = dequeue.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= n || nx < 0 || nx >= n || area[ny][nx] <= n {
                continue
            }
            queue.append((ny, nx))
            area[ny][nx] = n - 1
            cnt += 1
        }
    }
    return cnt
}

for i in 0..<n {
    for j in 0..<n {
        if area[i][j] > n {
            cntList.append(bfs(i,j))
        }
    }
}


print(cntList.count)
print(cntList)
