//
//  main.swift
//  week1_review
//
//  Created by 윤소희 on 2023/03/08.
//

import Foundation

//MARK: - 4375_1
//while let input = readLine() {
//
//    var mul = 1
//    var answer = 0
//
//    while true {
//        answer += 1
//        if mul % Int(input)! != 0 {
//            mul = mul * 10 + 1
//            mul %= Int(input)!
//        }else{
//            print(answer)
//            break
//        }
//    }
//}

//MARK: - 3986
//var input = Int(readLine()!)!
//var answer = 0
//
//while input > 0 {
//    let word = readLine()!
//    var stack = [String]()
//
//    stack.append("")
//
//    for i in word {
//        if String(i) == stack[stack.count - 1] {
//            stack.removeLast()
//        }else{
//            stack.append(String(i))
//        }
//    }
//    if stack.count == 1 {
//        answer += 1
//    }
//
//    input -= 1
//}
//print(answer)

//MARK: - 2559
//let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//let n = input[0]
//let k = input[1]
//let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
//var sumArr = Array(repeating: 0, count: n + 1)
//var ksumArr = [Int]()
//
//for i in 1...n {
//    sumArr[i] = temp[i-1] + sumArr[i-1]
//}
//
//for i in k...n {
//    ksumArr.append(sumArr[i] - sumArr[i-k])
//}
//
//print(ksumArr.max()!)

//MARK: - 9996

//let num = Int(readLine()!)!
//let fileFormat = readLine()!
//let arr = fileFormat.components(separatedBy: "*")
//let prefix = arr[0]
//let suffix = arr[1]
//
//
//for _ in 0..<num {
//
//    let fileName = readLine()!
//    let pre = fileName.prefix(prefix.count)
//    let suff = fileName.suffix(suffix.count)
//
//    if prefix.count + suffix.count > fileName.count {
//        print("NE")
//    }else{
//        if pre == prefix && suff == suffix {
//            print("DA")
//        }else{
//            print("NE")
//        }
//    }
//}

//MARK: - 1159
var cnt = [Character:Int]()
var answer = ""
var num = Int(readLine()!)!

for _ in 0..<num {
    let firstName = readLine()!.first!
    if cnt[firstName] == nil {
        cnt[firstName] = 1
    }else{
        cnt[firstName]! += 1
    }
}

for (key, value) in cnt.sorted(by: <) {
    if value >= 5 {
        answer += String(key)
    }
}

if answer.isEmpty {
    answer = "PREDAJA"
}

print(answer)
