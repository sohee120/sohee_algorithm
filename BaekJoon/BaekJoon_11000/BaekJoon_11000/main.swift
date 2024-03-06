//
//  main.swift
//  BaekJoon_11000
//
//  Created by 윤소희 on 3/6/24.
//

import Foundation

let n = Int(readLine()!)!
var lecture: [(Int, Bool)] = []
var current = 0
var answer = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    lecture.append((input[0], true))
    lecture.append((input[1], false))
}
lecture.sort {
    if $0.0 != $1.0 {
        return $0.0 < $1.0
    } else {
        return !$0.1
    }
}

for o in lecture {
    if o.1 {
        current += 1
        answer = max(current, answer)
    } else {
        current -= 1
    }
}

print(answer)
 
