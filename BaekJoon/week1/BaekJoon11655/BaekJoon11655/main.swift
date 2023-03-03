//
//  main.swift
//  BaekJoon11655
//
//  Created by 윤소희 on 2023/03/03.
//

import Foundation

let input = readLine()!
var answer = ""

for i in input {
    var asciiVal = i.asciiValue!
    if asciiVal >= 65 && asciiVal <= 77 {
        asciiVal += 13
    }else if asciiVal >= 78 && asciiVal <= 90 {
        asciiVal -= 13
    }else if asciiVal >= 97 && asciiVal <= 109 {
        asciiVal += 13
    }else if asciiVal >= 110 && asciiVal <= 123 {
        asciiVal -= 13
    }
    answer += "\(UnicodeScalar(asciiVal))"
}

print(answer)

