//
//  main.swift
//  BaekJoon_10026
//
//  Created by 윤소희 on 2024/01/09.
//

import Foundation

let n = Int(readLine()!)!
var rgb: [[String]] = Array(repeating: Array(repeating:"", count:n), count: n)
var normalVisited = Array(repeating: Array(repeating: false, count: n), count: n)
var abnormalVisited = Array(repeating: Array(repeating: false, count: n), count: n)
var normalCnt = 0
var abnormalCnt = 0
var queue = [(Int,Int)]()

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for i in 0..<n {
    let temp = readLine()!.map{String($0)}
    rgb[i] = temp
}

for y in 0..<n {
    for x in 0..<n {
        if !normalVisited[y][x] {
            queue.append((y,x))
            normalCnt += 1
        }
        while !queue.isEmpty {
            let dequeu = queue.removeFirst()
            let y = dequeu.0
            let x = dequeu.1
            let nowColor = rgb[y][x]
            normalVisited[y][x] = true
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || nx < 0 || ny >= n || nx >= n || normalVisited[ny][nx] {
                    continue
                }
                
                if nowColor == rgb[ny][nx]{
                    normalVisited[ny][nx] = true
                    queue.append((ny,nx))
                }
            }
        }
    }
}

for y in 0..<n {
    for x in 0..<n {
        if !abnormalVisited[y][x] {
            queue.append((y,x))
            abnormalCnt += 1
        }
        while !queue.isEmpty {
            let dequeu = queue.removeFirst()
            let y = dequeu.0
            let x = dequeu.1
            let nowColor = rgb[y][x]
            abnormalVisited[y][x] = true
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || nx < 0 || ny >= n || nx >= n || abnormalVisited[ny][nx] {
                    continue
                }
                
                if nowColor == "G" || nowColor == "R" {
                    if rgb[ny][nx] == "G" || rgb[ny][nx] == "R" {
                        abnormalVisited[ny][nx] = true
                        queue.append((ny,nx))
                    }
                } else if nowColor == "B" {
                    if rgb[ny][nx] == "B" {
                        abnormalVisited[ny][nx] = true
                        queue.append((ny,nx))
                    }
                }
            }
        }
    }
}


print("\(normalCnt) \(abnormalCnt)")
