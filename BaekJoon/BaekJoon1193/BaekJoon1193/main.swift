//
//  main.swift
//  BaekJoon1193

import Foundation

let input = readLine()!

var N = Int(input)!
var n = 1


while true {
    
    let temp = N - n
    
    if temp <= 0 {
        if n % 2 == 0 {
            print("\(N)/\(n - N + 1)")
            break
        }else{
            print("\(n - N + 1)/\(N)")
            break
        }
        
    }else if temp > 0 {
        
        N = temp
        n += 1
    }
}



