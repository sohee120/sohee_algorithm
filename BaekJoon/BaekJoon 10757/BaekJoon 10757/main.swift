//
//  main.swift
//  BaekJoon 10757
//
//  Created by 윤소희 on 2022/02/10.
//

import Foundation

let input = readLine()!.split(separator: " ")
var A = Array(input[0]).map{Int(String($0))!}
var B = Array(input[1]).map{Int(String($0))!}


if A.count > B.count {
    let diff = A.count - B.count
    for _ in 0 ..< diff {
        B.insert(0, at: B.startIndex)
    }
}else{
    let diff = B.count - A.count
    for _ in 0 ..< diff {
        A.insert(0, at: A.startIndex)
    }
}


for i in 0 ..< A.count {
    A[i] += B[i]
}

for i in (1 ..< A.count).reversed() {
    if A[i] >= 10 {
        A[i-1] += 1
    }
    A[i] = A[i] % 10
}

var stringA = A.map{String($0)}
var result = stringA.joined(separator: "")

print(result)

