//
//  main.swift
//  BaekJoon_1747
//
//  Created by 윤소희 on 4/22/24.
//

import Foundation

var N = Int(readLine()!)!

func isPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    if n <= 3 { return true }
    if n % 2 == 0 || n % 3 == 0 { return false }
    var i = 5
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

func isPalindrome(_ n:Int) -> Bool {
    let stringN = String(n).map{$0}
    return stringN == stringN.reversed()
}

while true {
    if isPrime(N) && isPalindrome(N) {
        break
    }
    N += 1
}

print(N)
