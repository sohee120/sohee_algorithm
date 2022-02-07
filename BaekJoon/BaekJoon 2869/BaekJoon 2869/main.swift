//
//  main.swift
//  BaekJoon 2869
//
//  Created by 윤소희 on 2022/02/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map{(Int(String($0)))!}

let A = input[0]
let B = input[1]
let V = input[2]

let answer = ceil(Double(V-B)/Double(A-B))
print(Int(answer))


