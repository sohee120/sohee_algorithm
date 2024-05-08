//
//  main.swift
//  BaekJoon_2748
//
//  Created by 윤소희 on 5/8/24.
//

import Foundation

let n = Int(readLine()!)!
var fibonacci: [Int] = [0, 1]

if n >= 2 {
    for i in 2...n {
        fibonacci.append(fibonacci[i-2]+fibonacci[i-1])
    }
}

print(fibonacci[n])
