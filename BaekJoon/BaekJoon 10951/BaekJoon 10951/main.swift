//
//  main.swift
//  BaekJoon 10951
//
//  Created by 윤소희 on 2022/01/24.
//

import Foundation


while let input = readLine() {
    
    print(input.split(separator: " ").map{Int(String($0))!}.reduce(0){ $0+$1 })
}

