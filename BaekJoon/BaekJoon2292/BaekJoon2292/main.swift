//
//  main.swift
//  BaekJoon2292


import Foundation

let input = Int(readLine()!)!

var sum = 1
var count = 1

for i in 1 ... input {
    
    if input == 1 {
        print(count)
        break
    }
    
    if input <= sum {
        print(count)
        break
    }
    
    sum += 6*i
    count += 1

}
