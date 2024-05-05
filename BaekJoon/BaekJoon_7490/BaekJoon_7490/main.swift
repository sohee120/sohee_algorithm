//
//  main.swift
//  BaekJoon_7490
//
//  Created by 윤소희 on 5/4/24.
//

import Foundation

var ans = [String]()

func solve(target: Int, sum: Int, sign: Int, prev: Int, idx: Int, expression: String) {
    if idx == target {
        let newSum = sum + (prev * sign)
        if newSum == 0 {
            ans.append(expression)
        }
        return
    } else {
        solve(target: target, sum: sum + (prev * sign), sign: 1, prev: idx + 1, idx: idx + 1, expression: expression + "+" + String(idx + 1))
        solve(target: target, sum: sum + (prev * sign), sign: -1, prev: idx + 1, idx: idx + 1, expression: expression + "-" + String(idx + 1))
        solve(target: target, sum: sum, sign: sign, prev: prev * 10 + (idx + 1), idx: idx + 1, expression: expression + " " + String(idx + 1))
    }
}

var testCaseCount: Int = Int(readLine()!)!

while testCaseCount > 0 {
    testCaseCount -= 1
    let num = Int(readLine()!)!

    solve(target: num, sum: 0, sign: 1, prev: 1, idx: 1, expression: "1")

    ans.sort()
    for expression in ans {
        print(expression)
    }
    print()
    ans.removeAll()
}


