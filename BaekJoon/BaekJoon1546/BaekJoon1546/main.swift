//
//  main.swift
//  BaekJoon1546


import Foundation

let n = Double(readLine()!)!
let scoreArr = readLine()!.split(separator: " ").map{ Double($0)! }

let max = Double(scoreArr.max()!)

let newscoreArr = scoreArr.map{ $0 / max * 100 }.reduce(0, {$0 + $1})

print(newscoreArr/n)


