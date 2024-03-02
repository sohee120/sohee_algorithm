//
//  main.swift
//  BaekJoon_1049
//
//  Created by 윤소희 on 2024/03/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var package = 1000
var single = 1000
for _ in 0..<m {
    let price = readLine()!.split(separator: " ").map { Int(String($0))! }
    package = min(package, price[0])
    single = min(single, price[1])
}
let po = package * (n / 6) + package
let so = single * n
let ps = package * (n / 6) + single * (n % 6)
print(min(po, so, ps))

