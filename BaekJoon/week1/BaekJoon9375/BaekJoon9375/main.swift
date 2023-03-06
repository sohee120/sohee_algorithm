//
//  main.swift
//  BaekJoon9375
//
//  Created by 윤소희 on 2023/03/06.
//

import Foundation

var t = Int(readLine()!)!

while t > 0 {
    var answer = 1
    let n = Int(readLine()!)!
    var clothes = [String:Int]()
    for _ in 0..<n {
        let cloth = readLine()!.components(separatedBy: " ")
        if clothes[cloth[1]] == nil {
            clothes[cloth[1]] = 1
        }else{
            clothes[cloth[1]]! += 1
        }
    }
    for (_, value) in clothes {
        answer *= (value + 1)
    }
    print(answer - 1)
    t -= 1
}


