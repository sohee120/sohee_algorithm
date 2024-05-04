//
//  main.swift
//  BaekJoon_1198
//
//  Created by 윤소희 on 5/2/24.
//

import Foundation

let N = Int(readLine()!)!
var dots = [[Int]]()
var answer = 0.0

for _ in 0..<N {
     dots.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func combination<T: Comparable>(_ array: [[T]], _ n: Int) -> [[[T]]] {
    var result = [[[T]]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [[T]]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0, [])
    
    return result
}

func calcArea(_ x1: Int, _ y1:Int, _ x2: Int, _ y2:Int, _ x3: Int, _ y3:Int) -> Double {
    return Double(abs(x1*y2 + x2*y3 + x3*y1 - x2*y1 - x3*y2 - x1*y3))/2.0
}

for vertexs in combination(dots, 3) {
    let area = calcArea(vertexs[0][0], vertexs[0][1], vertexs[1][0], vertexs[1][1], vertexs[2][0], vertexs[2][1])
    answer = answer > area ? answer : area
}

print(answer)
