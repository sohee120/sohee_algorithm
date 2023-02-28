//
//  main.swift
//  BaekJoon2309
//
//  Created by 윤소희 on 2023/02/28.
//

import Foundation

// 조합 구현
func combination(array: [Int], length: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combi(nowIndex index: Int, now: [Int]) {
        if now.count == length {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            combi(nowIndex: i+1, now: now + [array[i]])
        }
    }
    combi(nowIndex:0, now:[])
    return result
}
// 입력 받기
var input = [Int]()

(0..<9).forEach { _ in
    let height = Int(readLine()!)!
    input.append(height)
}

let combinations = combination(array: input, length: 7)

// 조합을 순회하면서 합이 100인 조합 찾기
for combination in combinations {
    if combination.reduce(0, +) == 100 {
        combination.sorted().forEach { height in
            print(height)
        }
        break
    }
}



