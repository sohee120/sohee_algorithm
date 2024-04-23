//
//  main.swift
//  BaekJoon_3933
//
//  Created by 윤소희 on 4/23/24.
//

import Foundation
let S = 1 << 15
//각 n에 대해 최대 4개의 제곱수 합으로 표현하는 경우의 수를 저장
var dp = Array(repeating: Array(repeating: 0, count: 5), count: S)

for i in 1...Int(sqrt(Double(S))) {
    let square = i * i
    dp[square][1] = 1 // 해당 수가 자기 자신만으로 제곱수인 경우 (기본 경우)
    
    // 현재 제곱수를 추가하여 N을 만드는 모든 경우를 계산
    for j in square..<S {
        if j - square >= 0 {
            dp[j][2] += dp[j - square][1] // 2개의 제곱수로 j를 만드는 경우
            dp[j][3] += dp[j - square][2] // 3개의 제곱수로 j를 만드는 경우
            dp[j][4] += dp[j - square][3] // 4개의 제곱수로 j를 만드는 경우
            
        }
    }
}

while true {
    let n = Int(readLine()!)!
    if n == 0 {break}
    
    let ans = dp[n][1...4].reduce(0,+)
    
    print(ans)
    print(dp[25][1...4])
}
