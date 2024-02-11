//
//  main.swift
//  BaekJoon_11047
//
//  Created by 윤소희 on 2024/02/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
var k = input[1]
var coins = [Int]()
var result = 0

for _ in 0..<n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

coins = coins.reversed()

for value in coins {
    if value <= k {
        result += (k / value)
        k = (k % value)
    }
    if k == 0{
        break
    }
}

print(result)


