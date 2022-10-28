//
//  main.swift
//  BaekJoon10824
//
//  Created by 윤소희 on 2022/10/28.
//

import Foundation

let line = readLine()!.split(separator: " ").map{ String($0) }
var answer1 = ""
var answer2 = ""

for i in 0..<line.count {
    if i == 0 || i == 1 {
        answer1 += line[i]
    }else {
        answer2 += line[i]
    }
}

print(Int(answer1)! + Int(answer2)!)

