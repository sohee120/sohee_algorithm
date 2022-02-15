//
//  main.swift
//  BaekJoon 11653

import Foundation

var input = Int(String(readLine()!))!
if input == 1 {
    print("")
}
for i in stride(from: 2, through: input, by: 1) {
    while input % i == 0 {
        print("\(i)")
        input = input / i
    }
}
