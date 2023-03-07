//
//  main.swift
//  BaekJoon3986
//
//  Created by 윤소희 on 2023/03/07.
//

import Foundation

var input = Int(readLine()!)!
var answer = 0

while input > 0 {
    var stack = [String]()
    stack.append("")
    let word = readLine()!
    for i in word {
        if String(i) == stack[stack.count-1] {
            stack.removeLast()
        }else{
            stack.append(String(i))
        }
    }
    if stack.count == 1 {
        answer += 1
    }
    input -= 1
}
print(answer)
