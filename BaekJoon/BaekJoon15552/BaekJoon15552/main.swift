//
//  main.swift
//  BaekJoon15552
//
//  Created by 윤소희 on 2022/01/19.
//

import Foundation

let time = readLine()!
let timeArr = time.split(separator: " ")

var num = Int(timeArr[0])!

var a = Int(timeArr[1])!
var b = Int(timeArr[2])!

let sum = timeArr.reduce(0, { (first: Int, second: Int) -> Int in
    return first + second
})





