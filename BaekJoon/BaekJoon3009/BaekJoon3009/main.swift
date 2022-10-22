//  BaekJoon3009

import Foundation

let arr1 = readLine()!.split(separator: " ").map{Int($0)!}
let arr2 = readLine()!.split(separator: " ").map{Int($0)!}
let arr3 = readLine()!.split(separator: " ").map{Int($0)!}
var arr4:[Int] = []
var temp = 0

for i in 0..<arr1.count {
    if arr1[i] == arr2[i] {
        arr4.append(arr3[i])
    }else if arr2[i] == arr3[i]  {
        arr4.append(arr1[i])
    }else if arr1[i] == arr3[i] {
        arr4.append(arr2[i])
    }
}

print("\(arr4[0]) \(arr4[1])")

