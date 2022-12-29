//
//  main.swift
//  BaekJoon2606
//
//  Created by 윤소희 on 2022/12/27.
//

import Foundation

let computerNum = Int(readLine()!)!
let networkConnect = readLine()!

//이차원 배열을 만들고 집어넣기
//sortedInp에 0번 배
var conArr : [Int:[Int]] = [:]
for num in 1...computerNum {
    conArr.updateValue([], forKey: num)
  }
  

for _ in 0..<Int(networkConnect)! {
    let input = readLine()!.split(separator: " ").map({Int($0)!})
    conArr[input[0]]!.append(input[1])
    // 양방향 간선이기 때문에 양쪽 어디를 먼저 순회해도 돌 수 있게 해주어야한다.
    conArr[input[1]]!.append(input[0])
}
// input을 찾아가면 이어진다.
// 중복으로 숫자가 증가하는 것을 방지하기 위해
var visited = [Int]()

func dfs(_ node:Int) {
    if visited.contains(node) {
        return
    }
    visited.append(node)

    for node in conArr[node]! {
        dfs(node)
    }
}

dfs(1)

print(visited.count - 1)
