//
//  main.swift
//  BaekJoon_1759
//
//  Created by 윤소희 on 4/28/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let L = input[0], C = input[1]
var aeiou = ["a","e","i","o","u"]
var arr = readLine()!.split(separator: " ").map{String($0)}.sorted(by: <)
var visited = Array(repeating: false, count: C)
var password = [String]()

func dfs(idx: Int) {
    if password.count == L {
        var containVowel = false
        var consonantCnt = 0
        
        for i in password {
            if aeiou.contains(i) {
                containVowel = true
            } else {
                consonantCnt += 2
            }
        }
        
        if consonantCnt >= 2 && containVowel {
            print(password.joined(separator: ""))
        }
        return
    }
    
    for k in idx..<C {
        if !visited[k] {
            visited[k] = true
            password.append(arr[k])
            dfs(idx: k)
            visited[k] = false
            password.removeLast()
        }
    }
}

dfs(idx: 0)



