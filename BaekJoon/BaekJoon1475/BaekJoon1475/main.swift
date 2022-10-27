//
//  main.swift
//  BaekJoon1475


import Foundation

let str = readLine()!
var N = Int(str)!
var counter = Array(repeating: 0, count: 10)

for _ in 0..<str.count {
    let num = N % 10
    N /= 10
    
    if num == 6 || num == 9 {
        if counter[6] > counter[9] {
            counter[9] += 1
        } else {
            counter[6] += 1
        }
    } else {
        counter[num] += 1
    }
}

print(counter.max()!)

