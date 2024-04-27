//
//  main.swift
//  BaekJoon_2116
//
//  Created by 윤소희 on 4/28/24.
//

import Foundation

let n = Int(readLine()!)!

var dices = [[Int]]()
for _ in 0..<n {
    let dice = readLine()!.split(separator: " ").map{Int(String($0))!}
    dices.append(dice)
}

func findMax(_ dice:[Int], _ num:Int) -> (Int,Int) {
    var idx = 0
    for i in 0..<6 {
        if dice[i] == num {
            idx = i
            break
        }
    }
    
    let oppositeIdx: Int
    switch idx {
    case 0: oppositeIdx = 5
    case 1: oppositeIdx = 3
    case 2: oppositeIdx = 4
    case 3: oppositeIdx = 1
    case 4: oppositeIdx = 2
    case 5: oppositeIdx = 0
    default: oppositeIdx = -1
    }
    
    var others = [Int]()
    for i in 0..<6 {
        if i != idx && i != oppositeIdx {
            others.append(dice[i])
        }
    }
    let maxOther = others.max() ?? 0
    return (dice[oppositeIdx], maxOther)
}

var answer = 0
for i in 0..<6 {
    var nextVal = dices[0][i]
    var total = 0
    var (next, maxOther) = findMax(dices[0], nextVal)
    nextVal = next
    total += maxOther
    
    for j in 1..<n {
        let result = findMax(dices[j], nextVal)
        nextVal = result.0
        total += result.1
    }
    answer = max(answer, total)
}
print(answer)

