//
//  main.swift
//  BaekJoon 2439
//
//  Created by 윤소희 on 2022/01/22.
//

import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let space = [Character].init(repeating: " ", count: n-i)
    let char = [Character].init(repeating: "*", count: i)
    
    print(String(space+char))
}
