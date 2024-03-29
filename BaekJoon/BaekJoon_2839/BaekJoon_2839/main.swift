//
//  main.swift
//  BaekJoon_2839
//
//  Created by 윤소희 on 2024/02/09.
//

import Foundation

var input = Int(readLine()!)!
var answer = 0

if input % 5 == 0 {
    answer = input/5
} else {
    
    while input >= 0 {
        input -= 3
        answer += 1
        
        if input % 5 == 0 {
            answer = input / 5 + answer
            break
        } else if input < 0 {
            answer = -1
        }
    }
}

print(answer)
