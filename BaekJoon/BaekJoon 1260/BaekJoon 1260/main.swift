//
//  main.swift
//  BaekJoon 1260
//
//  Created by 윤소희 on 2022/12/29.
//

import Foundation

var visited = [Int]()
var dfsResult:String = ""
var bfsRresult:String = ""

let input = readLine()!.split(separator: " ").map{Int($0)!}
var connect : [Int:[Int]] = [:]
for num in 1...input[0] {
    connect.updateValue([], forKey: num)
}

for _ in 1...input[1] {
    let node = readLine()!.split(separator: " ").map{Int($0)!}
    connect[node[0]]!.append(node[1])
    connect[node[1]]!.append(node[0])
    connect[node[0]]!.sort()
    connect[node[1]]!.sort()
}

func dfs(_ nodeNum: Int) {
    if !visited.contains(nodeNum) {
        visited.append(nodeNum)
        dfsResult += "\(nodeNum) "
        
        for nodeNum in connect[nodeNum]! {
            dfs(nodeNum)
        }
    }
}
    
    
    func bfs(_ now: Int) {
        var needVisited: [Int] = [now]
        var visited = [Int]()
        
        while !needVisited.isEmpty {
            let node = needVisited.removeFirst()
            if !visited.contains(node) {
                visited.append(node)
                bfsRresult += "\(node) "
                needVisited.append(contentsOf: connect[node]!)
            }
        }
    }
    
    dfs(input[2])
    print(dfsResult)
    bfs(input[2])
    print(bfsRresult)
