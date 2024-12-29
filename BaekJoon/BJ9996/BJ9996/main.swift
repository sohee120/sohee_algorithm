//
//  main.swift
//  BJ9996
//
//  Created by 윤소희 on 12/28/24.
//

import Foundation

let num = Int(readLine()!)!
let pattern = readLine()!
let pre = pattern.components(separatedBy: "*")[0]
let suf = pattern.components(separatedBy: "*")[1]

for _ in 0..<num {
    let input = readLine()!
    if pre.count + suf.count > input.count {
        print("NE")
        continue
    }
    if input.prefix(pre.count) == pre && input.suffix(suf.count) == suf {
        print("DA")
    } else {
        print("NE")
    }
}
