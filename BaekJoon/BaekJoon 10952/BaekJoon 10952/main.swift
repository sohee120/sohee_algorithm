//
//  main.swift
//  BaekJoon 10952
//
//  Created by 윤소희 on 2022/01/24.
//

import Foundation

while true{
    
    let num = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    if num == [0, 0]{
        break
    }
    print(num[0]+num[1])

}

