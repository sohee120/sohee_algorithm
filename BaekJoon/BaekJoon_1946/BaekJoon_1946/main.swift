//
//  main.swift
//  BaekJoon_1946
//
//  Created by 윤소희 on 2024/02/27.
//

import Foundation

let T = Int(readLine()!)!
var people = [[Int]]()
var result = [Int]()
for _ in 0..<T {
    let temp = Int(readLine()!)!
    var tempResult = 0
    for _ in 0..<temp{
        people.append(readLine()!.split(separator: " ").map({Int($0)!}))
    }
    people.sort { (a, b) -> Bool in
        return a[0] < b[0]
    }
    var tempMin = 0
    for idx in 0..<temp {
        if idx == 0 {
            tempResult += 1
            tempMin = people[idx][1]
        } else {
            if tempMin > people[idx][1]{
                tempResult += 1
                tempMin = people[idx][1]
            }
        }
    }
    result.append(tempResult)
    people = []
}
for answer in result {
    print(answer)
}



