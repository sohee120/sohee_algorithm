//
//  main.swift
//  BaekJoon 1081
//
//  Created by 윤소희 on 2022/01/25.
//

import Foundation

let n = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map{(Int($0))!}

var min = num[0]
var max = num[n-1]

for i:Int in 0 ... n-1 {
    
    if min > num[i] {
        
        min = num[i]
    }
}
    
    for j:Int in 0 ... n-1 {
        
        if max < num[j] {

            max = num[j]
    }
}
    print ( min, max )



