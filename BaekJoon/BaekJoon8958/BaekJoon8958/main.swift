//
//  main.swift
//  BaekJoon8958
//
//  Created by 윤소희 on 2022/01/28.
//

import Foundation

let num = Int(readLine()!)!

for _ in 1 ... num {
    
    let resultArr = readLine()!.split(separator: "X").map{ $0 }
    
    print(resultArr.reduce(0) {$0 + ($1.count)*($1.count + 1)/2})
}

