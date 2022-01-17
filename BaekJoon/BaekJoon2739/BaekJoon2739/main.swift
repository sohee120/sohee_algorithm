//
//  main.swift
//  BaekJoon2739
//
//  Created by 윤소희 on 2022/01/17.
//

import Foundation

let num = readLine()
let numArr = num!.split(separator: " ")

var mulNum = Int(numArr[0])!

for i:Int in 1 ... 9 {
    print("\(mulNum) * \(i) =", mulNum*i)
}

