//
//  main.swift
//  BaekJoon 1012
//
//  Created by 윤소희 on 2023/01/13.
//

import Foundation

var testNum = Int(readLine()!)!


let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while testNum > 0 {

    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = input[0]
    let n = input[1]
    let k = input[2]
    
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    var cnt: Int = 0
    var cntList = [Int]()
    
    for _ in 0..<k {
        let coor = readLine()!.split(separator: " ").map{Int(String($0))!}
        let j = coor[0]
        let i = coor[1]
        map[i][j] = 1
    }
    
    func bfs(_ i: Int, _ j: Int) -> Int {
        var queue = Array<(Int,Int)>()
        queue.append((i,j))
        map[i][j] = 0
        cnt = 1
        
        while !queue.isEmpty {
            let poped = queue.removeFirst()
            let y = poped.0
            let x = poped.1
            
            for k in 0..<4 {
                let ny = y + dy[k]
                let nx = x + dx[k]
                
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
    
    print(cntList.count)
    
    testNum -= 1
}
        
