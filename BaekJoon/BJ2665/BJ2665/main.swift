//
//  main.swift
//  BJ2665
//
//  Created by 윤소희 on 2/19/25.
//

import Foundation

struct Heap<T> {
    var nodes = [T]()
    var sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
}
