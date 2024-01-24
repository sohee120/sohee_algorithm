//
//  main.swift
//  BaekJoon_2644
//
//  Created by 윤소희 on 2024/01/24.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = input[0], b = input[1]
let m = Int(readLine()!)!
var family: [Int:[Int]] = [:]
var visited = Array(repeating: false, count: n+1)
var result = 0


for i in 0...n {
    family.updateValue([], forKey: i)

}

for _ in 0..<m {
    let connect = readLine()!.split(separator: " ").map{Int(String($0))!}
    family[connect[1]]!.append(connect[0])
    family[connect[0]]!.append(connect[1])
}

func dfs(_ start: Int, _ count: Int) {
    visited[start] = true
    if start == b {
        result = count
        return
    }
    
    for node in family[start]! {
        if !visited[node] {
            dfs(node, count + 1)
        }
    }
}

dfs(a, 0)
result = result == 0 ? -1 : result
print(result)


