//
//  main.swift
//  BaekJoon1213
//
//  Created by 윤소희 on 2023/03/06.
//

import Foundation

var alphabet = [String:Int]()
var odd = [String]()
var answer = ""

let input = readLine()!

for i in input {
    if alphabet[String(i)] == nil {
        alphabet[String(i)] = 1
    }else{
        alphabet[String(i)]! += 1
    }
}

for (key, value) in alphabet {
    if value % 2 != 0 {
        odd.append(key)
    }
}

if odd.count >= 2 {
    print("I'm Sorry Hansoo")
    exit(0)
}else if odd.count == 1{
    answer = odd[0]
    alphabet[answer]! -= 1
}

for (key) in alphabet.keys.sorted(by: >) {
    while alphabet[key]! > 0 {
        answer = key + answer + key
        alphabet[key]! -= 2
    }
}

print(answer)
