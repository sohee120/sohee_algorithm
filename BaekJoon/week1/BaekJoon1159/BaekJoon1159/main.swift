//
//  main.swift
//  BaekJoon1159
//
//  Created by 윤소희 on 2023/03/02.
//

import Foundation

let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var cnt = Array(repeating: 0, count: 26)
var answer = ""

let num = Int(readLine()!)!
for _ in 0..<num {
    let name = readLine()!.first!
    
    for i in 0..<alphabet.count {
        if String(name) == alphabet[i] {
            cnt[i] += 1
        }
    }
}

for i in 0..<cnt.count {
    if cnt[i] >= 5 {
        answer += alphabet[i]
    }
}

if answer.isEmpty {
    answer = "PREDAJA"
}

print(answer)
