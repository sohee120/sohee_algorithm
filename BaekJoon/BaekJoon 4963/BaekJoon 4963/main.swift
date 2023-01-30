//
//  main.swift
//  BaekJoon 4963
//
//  Created by 윤소희 on 2023/01/30.
//

import Foundation

let dy = [0, 1, 0, -1, 1, 1, -1 ,-1]
let dx = [1, 0, -1, 0, 1, -1, 1, -1]


while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let w = input[0]
    let h = input[1]
    if w == 0 && h == 0 {
        break
    }
    
    var island = Array(repeating: Array(repeating: 0, count: w), count: h)
    
    for i in 0..<h {
        var temp : [Int]
        temp = readLine()!.split(separator: " ").map{Int(String($0))!}
        island[i] = temp
    }
    
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var answer = 0
    
    func dfs(_ y: Int, _ x: Int) {
        
        for i in 0..<8 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || ny >= h || nx >= w {
                continue
            }
            if !visited[ny][nx] && island[ny][nx] == 1 {
                visited[ny][nx] = true
                dfs(ny, nx)
            }
            
        }
    }
    for y in 0..<h {
        for x in 0..<w {
            if !visited[y][x] && island[y][x] == 1 {
                visited[y][x] = true
                dfs(y,x)
                answer += 1
            }
        }
    }
    print(answer)
}

