//
//  main.swift
//  BaekJoon4344
//
//  Created by 윤소희 on 2022/01/28.
//

import Foundation

let caseNum = Int(readLine()!)!

for _ in 1 ... caseNum {
    
    var scoreArr = readLine()!.split(separator: " ").map{ Int($0)!}
    let n = scoreArr[0]
    scoreArr.remove(at: 0)
    var result = 0
    
    for i in 0 ... n-1 {
        
        if scoreArr[i] > scoreArr.reduce(0, { $0 + $1 }) / n {
            result += 1
        }
    }
    
    print(String(format: "%.3f", Float(result) / Float(n) * 100) + "%")
    
}
    
    
    
    
    




