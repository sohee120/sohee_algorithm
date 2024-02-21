//
//  main.swift
//  BaekJoon_13305
//
//  Created by 윤소희 on 2024/02/21.
//

import Foundation

func gasstation() {
    let n = Int(readLine()!)!
    let distance = readLine()!.split(separator: " ").map {Int(String($0))!}
    let price = readLine()!.split(separator: " ").map {Int(String($0))!}
    var min = price[0]
    var result = 0
    for i in 0..<n-1 {
        if price[i] < min {
            min = price[i]
        }
        result += min * distance[i]
    }
    print(result)
}

gasstation()

