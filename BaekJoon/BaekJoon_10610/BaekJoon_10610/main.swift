//
//  main.swift
//  BaekJoon_10610
//
//  Created by 윤소희 on 2024/02/26.
//

import Foundation

private func solution(_ number: String) -> String {
    let arr = number.map{ Int(String($0))! }.sorted(by: >)

    if !arr.contains(0) || arr.reduce(0, +) % 3 != 0 {
        return "-1"
    }
    return arr.map{ String($0) }.joined()
}

let number = readLine()!
print(solution(number))

