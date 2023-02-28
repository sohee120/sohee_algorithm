//
//  main.swift
//  BaekJoon10808
//
//  Created by 윤소희 on 2023/03/02.
//

import Foundation

var answerArr = Array(repeating: 0, count: 26)
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
let input = readLine()!
var answer = ""

for i in input {
    for j in 0..<alphabet.count {
        if String(i) == alphabet[j] {
            answerArr[j] += 1
        }
    }
}

for i in answerArr {
    answer += "\(String(i)) "
}

print(answer)
