//
//  main.swift
//  BaekJoon_1744
//
//  Created by 윤소희 on 3/5/24.
//

import Foundation

let N = Int(readLine()!)!
var minus = [Int]()
var zero = [Int]()
var one = [Int]()
var plus = [Int]()
var result = 0

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input > 1 {
        plus.append(input)
    }else if input == 1 {
        one.append(input)
    } else if input == 0 {
        zero.append(input)
    } else {
        minus.append(input)
    }
}

minus = minus.sorted(by: <)
plus = plus.sorted(by: >)

var idx = 0
while idx < minus.count {
    if idx+1 < minus.count {
        result += minus[idx] * minus[idx+1]
    } else if idx+1 >= minus.count {
        if !zero.isEmpty {
            result += 0
        } else{
            result += minus[idx]
        }
    }
    idx += 2
}

idx = 0
while idx < plus.count {
    if idx+1 < plus.count {
        result += plus[idx] * plus[idx+1]
    } else if idx+1 >= plus.count {
        result += plus[idx]
    }

    idx += 2
}

if !one.isEmpty {
    result += one.count
}

print(result)
