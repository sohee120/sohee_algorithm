//
//  main.swift
//  BaekJoon2675
//
//  Created by 윤소희 on 2022/01/30.
//

import Foundation

let n = Int(readLine()!)!

for _ in 1 ... n {
    
    let inputArr = readLine()!.split(separator: " ").map{ $0 }
    
    let num = Int(inputArr[0])!
    let word: String = String(inputArr[1])
    
    
    for item in word {
        let output = String(repeating:item, count:num)
        print(output, terminator: "")
    }
  print(" ")
}
