//
//  main.swift
//  BaekJoon10988
//
//  Created by 윤소희 on 2023/03/02.
//

import Foundation

let input = readLine()!
let reversedInp = input.reversed()

var answer = input == String(reversedInp) ? 1 : 0
print(answer)
