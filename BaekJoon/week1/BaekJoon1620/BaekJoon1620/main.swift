//
//  main.swift
//  BaekJoon1620
//
//  Created by 윤소희 on 2023/03/05.
//

import Foundation

var poketmon1 = [Int:String]()
var poketmon2 = [String:Int]()
let inputNum = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 1...inputNum[0] {
    let name = readLine()!
    poketmon1.updateValue(name, forKey: i)
    poketmon2.updateValue(i, forKey: name)
}

for _ in 1...inputNum[1] {
    let input = readLine()!
    if Int(input) != nil {
        print(poketmon1[Int(input)!]!)
    }else{
        print(poketmon2[input]!)
    }
}

