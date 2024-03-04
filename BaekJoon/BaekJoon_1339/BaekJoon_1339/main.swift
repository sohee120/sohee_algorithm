//
//  main.swift
//  BaekJoon_1339
//
//  Created by 윤소희 on 3/4/24.
//

import Foundation
let n = Int(String(readLine()!))!
var arr: [[Character]] = Array(repeating: [], count: n)
var dict = [Character:Int]()
var sum = 0
for i in 0..<n {
    let word = readLine()!
    for j in word {
        arr[i].append(j)
    }
}

for i in 0..<n {
    for j in 0..<arr[i].count{
        dict[arr[i][j]] = 0
    }
}

for i in 0..<n{
    for j in 0..<arr[i].count{
        dict[arr[i][j]]! += Int(pow(10, Double(arr[i].count - j - 1)))
    }
}

var j = 9
for i in dict.sorted(by: {$0.value > $1.value}){
    sum += i.value * j
    j -= 1
}
print(sum)


