//
//  main.swift
//  BaekJoon 3052
//
//  Created by 윤소희 on 2022/01/26.
//

import Foundation

var input: [Int] = []
var num: [Int] = []

for _ in 0 ... 9 {
    
    input.append(Int(readLine()!)!)
    
}

let rem = input.map{ $0 % 42 }

for i in rem {
    if num.contains(i) == false {
        num.append(i)
    }
}
    
print(num.count)


