//
//  main.swift
//  BaekJoon 1978
//
//  Created by 윤소희 on 2022/02/13.
//

import Foundation

let n = Int(readLine()!)!
var isPrimeNumber = true
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0

for i in 0..<input.count {
    
        if input[i] == 1 {
            isPrimeNumber = false
        }else{
            for j in 2 ..< input[i] {
                if input[i] % j == 0 {
                    isPrimeNumber = false
                }
                
            }
        }
    if isPrimeNumber == true {
        count += 1
    }
    isPrimeNumber = true
}

print(count)
            
