//
//  main.swift
//  BaekJoon2941
//
//  Created by 윤소희 on 2022/02/01.
//

import Foundation

var input = readLine()!
let croAlphabet = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

for i in 0...(croAlphabet.count-1) {
    input = input.replacingOccurrences(of: croAlphabet[i], with: "a")
}

print(input.count)

