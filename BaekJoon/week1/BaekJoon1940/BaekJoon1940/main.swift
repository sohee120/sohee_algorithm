//
//  main.swift
//  BaekJoon1940
//
//  Created by 윤소희 on 2023/03/06.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer = 0

for i in 0...n-2 {
    for j in i+1...n-1 {
        if input[i] + input[j] == m {
            answer += 1
        }
    }
}

print(answer)
