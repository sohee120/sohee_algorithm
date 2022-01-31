//
//  main.swift
//  BaekJoon2908
//
//  Created by 윤소희 on 2022/01/31.
//

import Foundation

let input = readLine()!.split(separator: " ")
var result = 0
for i in 0 ... (input.count - 1) {
    var revArr: [Character] = []
    for j in input[i] {
        revArr.append(j)
    }
    revArr.reverse()
    if result == 0 {
        result = Int(String(revArr))!
    }else if result < Int(String(revArr))! {
        result = Int(String(revArr))!
    }
}
print(result)




