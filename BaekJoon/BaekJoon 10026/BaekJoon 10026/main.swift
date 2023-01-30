//
//  main.swift
//  BaekJoon 10026
//
//  Created by 윤소희 on 2023/01/29.
//

import Foundation

let n = Int(String(readLine()!))!
var rgb: [[String]] = Array(repeating: Array(repeating: "", count: n), count: n)
let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
var normalVis = Array(repeating: Array(repeating: false, count: n), count: n)
var normalCnt = 0
var abnormalVis = Array(repeating: Array(repeating: false, count: n), count: n)
var abnormalCnt = 0
var stack = [(Int,Int)]()

for i in 0..<n {
    let input = readLine()!.map{String($0)}
    rgb[i] = input
}

for i in 0..<n {
    for j in 0..<n {
        if normalVis[i][j] == false {
            stack.append((i,j))
            normalCnt += 1
        }
        while !stack.isEmpty {
            var now = stack.popLast()!
            let y = now.0
            let x = now.1
            var nowCol = rgb[y][x]
            normalVis[y][x] = true
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || nx < 0 || ny >= n || nx >= n || normalVis[ny][nx] {
                    continue
                }
                if nowCol == rgb[ny][nx] {
                    normalVis[ny][nx] = true
                    stack.append((ny,nx))
                }
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if abnormalVis[i][j] == false {
            stack.append((i,j))
            abnormalCnt += 1
        }
        while !stack.isEmpty {
            var now = stack.popLast()!
            let y = now.0
            let x = now.1
            let nowCol = rgb[y][x]
            abnormalVis[y][x] = true
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny < 0 || nx < 0 || ny >= n || nx >= n || abnormalVis[ny][nx] {
                    continue
                }
                if nowCol == "G" || nowCol == "R" {
                    if rgb[ny][nx] == "G" || rgb[ny][nx] == "R" {
                        abnormalVis[ny][nx] = true
                        stack.append((ny,nx))
                    }
                } else if nowCol == "B" {
                    if rgb[ny][nx] == "B" {
                        abnormalVis[ny][nx] = true
                        stack.append((ny,nx))
                    }
                }
            }
        }
    }
}


print("\(normalCnt) \(abnormalCnt)")
