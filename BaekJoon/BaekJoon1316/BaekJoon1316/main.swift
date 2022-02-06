//
//  main.swift
//  BaekJoon1316
//
//  Created by 윤소희 on 2022/02/05.
//

import Foundation

let n = Int(readLine()!)!
var answer = 0

for _ in 1 ... n {
    
    let input = readLine()!
    var array = [Character]()
    
    for alphabet in input {
        
        if array.contains(alphabet) == false {
            array.append(alphabet)
        }else if array.last! != alphabet {
            array.removeAll()
            break
        }
    }
    
    if array.count != 0 {answer += 1}
}

print(answer)
