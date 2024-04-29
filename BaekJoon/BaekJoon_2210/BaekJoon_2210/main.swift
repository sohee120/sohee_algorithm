//
//  main.swift
//  BaekJoon_2210
//
//  Created by 윤소희 on 4/29/24.
//

import Foundation

var digits = [[Int]]()

let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]

for _ in 0..<5 {
    digits.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
var answerList = [String]()

func dfs(_ y:Int, _ x:Int, _ num:String) {
    var num = num
    num += String(digits[y][x])
    
    if num.count == 6 {
        answerList.append(num)
        return
    }
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || nx < 0 || ny >= 5 || nx >= 5 {
            continue
        }
        dfs(ny, nx, num)
    }
}

for i in 0..<5 {
    for j in 0..<5 {
        dfs(i, j, "")
    }
}

print(Set(answerList).count)
