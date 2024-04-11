//
//  main.swift
//  BaekJoon_1300
//
//  Created by 윤소희 on 4/10/24.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var bArr = [Int]()

var start = 1
var end = n * n
while start <= end{
    let mid = (start + end) / 2
    var count = 0
    for i in 1...n{
        count += min(mid/i, n)
    }
    if count >= k{
        end = mid - 1
    }else{
        start = mid + 1
    }
    
}
print(start)


