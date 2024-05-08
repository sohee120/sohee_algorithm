//
//  main.swift
//  BaekJoon_9095
//
//  Created by 윤소희 on 5/8/24.
//

import Foundation

let t = Int(readLine()!)!

var dp = [0, 1, 2, 4]

for i in 4...11 {
    dp.append(dp[i-3]+dp[i-2]+dp[i-1])
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}


