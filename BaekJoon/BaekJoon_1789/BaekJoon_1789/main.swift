//
//  main.swift
//  BaekJoon_1789
//
//  Created by 윤소희 on 2024/02/18.
//

import Foundation

let S = Int(readLine()!)!
var sum = 0
var cnt = 0
var n = 1

while true {
    sum += n
    cnt += 1
    n += 1
    if sum == S {
        print(cnt)
        break
    }else if sum > S {
        print(cnt-1)
        break
    }
}

