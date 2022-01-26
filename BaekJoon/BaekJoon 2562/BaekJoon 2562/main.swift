//
//  main.swift
//  BaekJoon 2562
//
//  Created by 윤소희 on 2022/01/25.
//

import Foundation

var numArr: [Int] = []

for _ in 1...9 {
   
    numArr.append(Int(readLine()!)!)
}

let max = numArr.max()!
let index = numArr.firstIndex(of: max)!+1

print(max)
print(index)

