//
//  main.swift
//  BaekJoon10809
//
//  Created by 윤소희 on 2022/01/30.
//

import Foundation

let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

let input = readLine()!.map{String($0)}

for item in alphabet {
    if input.contains(item) {
    let index = (input.firstIndex(of: item ))!
        print(index, terminator: " ")
    }else{
        print("-1", terminator: " ")
    }
}



