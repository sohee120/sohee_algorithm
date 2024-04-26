//
//  main.swift
//  BaekJoon_1182
//
//  Created by 윤소희 on 4/26/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], S = input[1]
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0
var sum = 0
var visited = Array(repeating: false, count: N)

func dfs(_ depth:Int, _ start:Int) -> Int {
    if sum == S && depth>=1{
        count += 1
    }
    for i in start..<N {
        if !visited[i] {
            visited[i] = true
            sum += arr[i]
            dfs(depth + 1, i)
            visited[i] = false
            sum -= arr[i]
        }
    }
    return count
}

print(dfs(0, 0))
