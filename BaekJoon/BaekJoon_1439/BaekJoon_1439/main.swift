//
//  main.swift
//  BaekJoon_1439
//
//  Created by 윤소희 on 2024/03/01.
//

import Foundation

var input = readLine()!
var zero = input.split(separator: "0").count
var one = input.split(separator: "1").count
print(min(zero, one))
