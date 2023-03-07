//
//  main.swift
//  BaekJoon4375-1
//
//  Created by 윤소희 on 2023/03/07.
//

import Foundation

while let input = readLine() {
    
    var mul = 1
    var answer = 0
    
    while true {
        answer += 1
        if mul % Int(input)! != 0 {
            mul = mul * 10 + 1
            mul %= Int(input)!
        }else{
            print(answer)
            break
        }
    }
}
