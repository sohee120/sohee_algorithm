//
//  main.swift
//  BaekJoon11720
//
//  Created by 윤소희 on 2022/01/29.
//

import Foundation

let n = readLine()!
var input: [Int] = []

readLine()!.forEach{ input.append(Int(String($0))!)}

print(input.reduce((0), {$0 + $1}))

