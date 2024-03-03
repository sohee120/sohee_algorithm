//
//  main.swift
//  BaekJoon_14916
//
//  Created by 윤소희 on 2024/03/03.
//

import Foundation

var input = Int(readLine()!)!
var count = 0

while input > 1 {
    if input % 5 == 0 {
        count += input / 5
        break
    }
    input -= 2
    count += 1
}
print(input == 1 ? -1 : count)

