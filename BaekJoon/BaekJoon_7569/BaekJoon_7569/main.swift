//
//  main.swift
//  BaekJoon_7569
//
//  Created by 윤소희 on 2024/01/10.
//

import Foundation

typealias Tomato = (y: Int, x: Int, z: Int)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0]
let n = input[1]
let h = input[2]
var box = [[[Int]]]()
let dy = [1, 0, -1, 0, 0, 0]
let dx = [0, 1, 0, -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]
var result = 0
var answer = 0

for _ in 0..<h {
    var temp = [[Int]]()
    for _ in 0..<n {
        let tomato = readLine()!.split(separator: " ").map{Int(String($0))!}
        temp.append(tomato)
    }
    box.append(temp)
}
var queue = [Tomato]()

func bfs() {
    var idx = 0
    
    while idx < queue.count {
        let dequeue = queue[idx]
        let z = dequeue.z
        let y = dequeue.y
        let x = dequeue.x
        idx += 1
        
        for i in 0..<6 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            let nz = z + dz[i]
            
            if nz<0 || ny<0 || nx<0 || nz>=m || ny>=h || nx>=n {
                continue
            }
            if box[ny][nx][nz] == 0 {
                queue.append((ny, nx, nz))
                box[ny][nx][nz] = box[y][x][z] + 1
            }
        }
    }
}

for y in 0..<h {
    for x in 0..<n {
        for z in 0..<m {
            if box[y][x][z] == 1 {
                queue.append((y,x,z))
            }
        }
    }
}

bfs()

for y in 0..<h {
    for x in 0..<n {
        for z in 0..<m {
            if box[y][x][z] == 0 {
                answer = -1
            }
            result = max(result, box[y][x][z])
        }
    }
}

answer = answer == -1 ? -1 : result-1

print(answer)
