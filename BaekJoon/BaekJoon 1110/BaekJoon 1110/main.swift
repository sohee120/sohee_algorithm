//
//  main.swift

import Foundation

var count = 1
var input = Int(readLine()!)!

    if input < 10 {
        input *= 10
    }

var Num = input

while true {

    let a = Int(Num) / 10
    let b = Int(Num) % 10


    let c = a + b
    
    let newNum = 10 * b + (c % 10)
    
    if input == newNum {
        break
    }
    
    Num = newNum
    
    count += 1

}

print(count)


