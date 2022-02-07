//
//  main.swift
//  BaekJoon 10250
//
//  Created by 윤소희 on 2022/02/07.
//

import Foundation

let count = Int(readLine()!)!


for _ in 1 ... count {
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}

    let H = input[0]
    let W = input[1]
    let N = input[2]
    
        if N%H == 0 {
            if N/H < 10 {
                print("\(H)"+"0\(N/H)")
            }else{
                print("\(H)"+"\(N/H)" )
            }
        }else{
            if N/H + 1 < 10 {
                print("\(N%H)"+"0\(N/H+1)")
            }else{
                print("\(N%H)"+"\(N/H+1)")
            }
        }
    
}
