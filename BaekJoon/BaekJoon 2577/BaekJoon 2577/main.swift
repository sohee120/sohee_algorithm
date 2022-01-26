//
//  main.swift
//  BaekJoon 2577
//
//  Created by 윤소희 on 2022/01/25.
//

import Foundation

var input = 1
var resultArr = [Int](repeating: 0, count: 10)

for _ in 1 ... 3 {
    
    input *= Int(readLine()!)!
}

while input > 0 {
    
    let num = input % 10
    resultArr[num] += 1
    input /= 10
}

for result in resultArr {
    print(result)
}


