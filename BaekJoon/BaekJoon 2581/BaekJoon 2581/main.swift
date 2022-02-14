//
//  main.swift
//  BaekJoon 2581

import Foundation

let M = Int(readLine()!)!
let N = Int(readLine()!)!
var numArr: [Int] = []
var isPrimeNum = true
var num = M

for _ in M ... N {
    
    if num == 1 {
        isPrimeNum = false
    }else{
        for j in 2 ..< num {
            if num % j == 0 {
                isPrimeNum = false
            }
        }
    }
    if isPrimeNum == true {
        numArr.append(num)
    }
    
    num += 1
    isPrimeNum = true
}

if numArr.reduce(0) {$0 + $1} == 0 {
    print (-1)
}else{
    print(numArr.reduce (0) {$0 + $1})
    print(numArr.min()!)
}
    
    


