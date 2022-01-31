//
//  main.swift

import Foundation

let input = readLine() ?? ""
var num:[Int] = []

for char in input {

switch char {
    
    case "A","B","C":
        num.append(2)
    case "D","E","F":
        num.append(3)
    case "G","H","I":
        num.append(4)
    case "J","K","L":
        num.append(5)
    case "M","N","O":
        num.append(6)
    case "P","Q","R","S":
        num.append(7)
    case "T","U","V":
        num.append(8)
    case "W","X","Y","Z":
        num.append(9)
    default :
        break
    }
}


var sum = 0

for i in 0...(num.count - 1) {
    
    let time = 1 + (num[i])
    sum += time
    
    
}

print(sum)

