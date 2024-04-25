//
//  main.swift
//  BaekJoon_14225
//
//  Created by 윤소희 on 4/25/24.
//

import Foundation

let size = Int(readLine()!)!
var S = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: 21)
var result = Array(repeating: false, count: 2000001)
var sum = 0

func dfs(_ depth: Int, _ start:Int) {
    if depth >= 1 {
        result[sum] = true
    }
    
    for i in start..<size {
        if !visited[i] {
            visited[i] = true
            sum += S[i]
            dfs(depth+1, i)
            visited[i] = false
            sum -= S[i]
        }
    }
}

dfs(0,0)

for i in 1...2000000{
    if result[i] == false{
        print(i)
        break
    }
}


