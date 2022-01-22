//
//  main.swift
//  BaekJoon11021


import Foundation
let count = Int(readLine()!)!

for i in 1 ... count {
    
    let num = readLine()
    let numArr = num!.split(separator: " ")
    
    var a = Int(numArr[0])!
    var b = Int(numArr[1])!
    
    print("Case #\(i):", a+b)
    
}

