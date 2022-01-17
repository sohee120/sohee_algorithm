//
//  main.swift
//  BaekJoon2884
//
//  Created by 윤소희 on 2022/01/17.

import Foundation

let time = readLine()
let timeArr = time!.split(separator: " ")

var hour = Int(timeArr[0])!
var min = Int(timeArr[1])!

min -= 45

if min < 0 {
    min += 60
    hour -= 1
}

if hour < 0 {
  hour += 24
}
 
print("\(hour) \(min)")

