//
//  main.swift
//  BaekJoon 10871
//
//  Created by 윤소희 on 2022/01/23.
//

import Foundation

let num = readLine()
let numArr = num!.split(separator: " ")

let sequence = readLine()
let seqArr = sequence!.split(separator: " ")

var n = Int(numArr[0])!
var x = Int(numArr[1])!


for i in 0 ... n-1 {
    
    let a = Int( seqArr[i])
    
    if x > a! {
        print ( a!, terminator: " ")
    }
    
}
