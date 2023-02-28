//
//  main.swift
//  Review
//
//  Created by 윤소희 on 2023/01/31.
//
import Foundation

let num = Int(String(readLine()!))!
var town = Array(repeating: Array(repeating: 0, count: num), count: num)
var cntList = [Int]()
var cnt = 0


for i in 0..<num {
    let temp: [Int]
    temp = readLine()!.map{Int(String($0))!}
    town[i] = temp
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func bfs(_ i:Int, _ j:Int) -> Int {
    var cnt = 0
    var queue = [(Int, Int)]()
    queue.append((i, j))
    cnt += 1
    town[i][j] = 0
    
    while !queue.isEmpty {
        let dequeue = queue.removeFirst()
        let y = dequeue.0
        let x = dequeue.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || ny >= num || nx >= num {
                continue
            }
            
            if town[ny][nx] == 1 {
                town[ny][nx] = 0
                queue.append((ny, nx))
                cnt += 1
            }
        }
    }
    return cnt
}

for i in 0..<num {
    for j in 0..<num {
        if town[i][j] == 1 {
            cntList.append(bfs(i, j))
        }
    }
}

print(cntList.count)
for i in 0..<cntList.count {
    print(cntList[i])
}
