//
//  main.swift
//  BaekJoon1157
//
//  Created by 윤소희 on 2022/01/30.
//

import Foundation

var input = readLine()!.uppercased()
var array = [String:Int]()

input.forEach {
    if array[String($0)] == nil {
        array[String($0)] = 1
    }else{
        array[String($0)]! += 1
        }
}

var result = [String]()

for key in array.keys {
    if array[key] == array.values.max(){
            result.append(key)
        }
}
print(result.count == 1 ? result[0] : "?")
