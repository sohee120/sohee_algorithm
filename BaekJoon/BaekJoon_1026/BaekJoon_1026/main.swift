//
//  main.swift
//  BaekJoon_1026
//
//  Created by 윤소희 on 2024/02/12.
//
import Foundation

var n = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var B = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)

var minValue = 0
for i in 0..<n{
    minValue += A[i]*B[i]
}

print(minValue)

