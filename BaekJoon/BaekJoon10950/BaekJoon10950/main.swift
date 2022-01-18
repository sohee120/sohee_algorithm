//
//  main.swift
//  BaekJoon10950
//
//  Created by 윤소희 on 2022/01/17.
//

import Foundation

var num = readLine()!

var i = Int(num)!

for _ in 1 ... i {
    
    num = readLine()!
    let numArr = num.split(separator: " ")
    
    var a = Int(numArr[0])!
    var b = Int(numArr[1])!
    
    
    print(a+b)
}



        


