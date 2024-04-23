//
//  main.swift
//  BaekJoon_1527
//
//  Created by 윤소희 on 4/23/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = input[0], B = input[1]
var answer = 0

func solution(_ n:Int, _ A:Int, _ B:Int) {
    if n > 1000000000 {return}
    if A <= n  && B >= n {
        answer += 1
    }
    solution(10*n + 4, A, B)
    solution(10*n + 7, A, B)
}

solution(0, A, B)
print(answer)
