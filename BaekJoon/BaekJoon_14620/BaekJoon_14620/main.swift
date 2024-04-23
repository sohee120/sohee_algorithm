//
//  main.swift
//  BaekJoon_14620
//
//  Created by 윤소희 on 4/22/24.
//

import Foundation

let n = Int(readLine()!)!  // 화단 한 변의 길이 입력 받기
var garden = [[Int]]()  // 화단의 가격 정보를 담을 2차원 배열

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map {Int(String($0))!}
    garden.append(row)
}

var minCost = Int.max  // 최소 비용을 저장할 변수

// 해당 위치에 꽃을 심을 수 있는지 확인하는 함수
func check(_ i: Int, _ j: Int, _ visited: [[Bool]]) -> Bool {
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0), (0, 0)]
    for direction in directions {
        let x = i + direction.0
        let y = j + direction.1
        if !(x >= 0 && x < n && y >= 0 && y < n) || !visited[x][y] {
            return false
        }
    }
    return true
}

// 해당 위치에 꽃을 심었을 때의 비용 계산 함수
func calc(_ i: Int, _ j: Int) -> Int {
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0), (0, 0)]
    var cost = 0
    for direction in directions {
        let x = i + direction.0
        let y = j + direction.1
        cost += garden[x][y]
    }
    return cost
}

// 깊이 우선 탐색 (DFS) 함수
func dfs(_ x: Int, _ cnt: Int, _ visited: inout [[Bool]], _ costSum: Int) {
    if cnt == 3 {
        minCost = min(minCost, costSum)
        return
    }

    for i in x..<n-1 {
        for j in 1..<n-1 {
            if check(i, j, visited) {
                for direction in [(0, 1), (0, -1), (1, 0), (-1, 0), (0, 0)] {
                    visited[i + direction.0][j + direction.1] = false
                }
                dfs(i, cnt+1, &visited, costSum + calc(i, j))
                for direction in [(0, 1), (0, -1), (1, 0), (-1, 0), (0, 0)] {
                    visited[i + direction.0][j + direction.1] = true
                }
            }
        }
    }
}

// 화단의 방문 여부를 저장하는 배열 초기화
var visited = Array(repeating: Array(repeating: true, count: n), count: n)

// DFS 실행
dfs(1, 0, &visited, 0)

// 결과 출력
print(minCost)
