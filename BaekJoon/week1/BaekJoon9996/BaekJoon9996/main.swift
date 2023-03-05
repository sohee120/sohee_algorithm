//
//  main.swift
//  BaekJoon9996
//
//  Created by 윤소희 on 2023/03/03.
//

import Foundation

let num = Int(readLine()!)!
let fileFormat = readLine()!
let arr = fileFormat.components(separatedBy: "*")
let prefix = arr[0]
let suffix = arr[1]

for _ in 0..<num {
    let fileName = readLine()!
    let pre = fileName.prefix(prefix.count)
    let suff = fileName.suffix(suffix.count)
    
    if prefix.count + suffix.count > fileName.count {
        print("NE")
    }else{
        if pre == prefix && suff == suffix {
            print("DA")
        }else{
            print("NE")
        }
    }
}
