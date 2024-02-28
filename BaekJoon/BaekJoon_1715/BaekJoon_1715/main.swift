//
//  main.swift
//  BaekJoon_1715
//
//  Created by 윤소희 on 2024/02/28.
//

import Foundation

struct PriorityQueue<T> {
    var nodes = [T]()
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    var count: Int {
        return nodes.count
    }
    func peek() -> T? {
        return nodes.first
    }
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return 2 * index + 1
    }
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return 2 * index + 2
    }
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        nodes.swapAt(0, count-1)
        defer {
            shiftDown(from: 0)
        }
        return nodes.removeLast()
    }
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            
            if left < count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            if right < count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
    mutating func push(_ element: T) {
        nodes.append(element)
        shiftUp(from: nodes.count - 1)
    }
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
}

let n = Int(readLine()!)!
var card = [Int]()
var result = 0
for _ in 0..<n {
    card.append(Int(readLine()!)!)
}

var heap = PriorityQueue<Int>(sort: {$0 < $1})

for i in 0..<card.count {
    heap.push(card[i])
}

while heap.count > 1 {
    let n1 = heap.pop()!
    let n2 = heap.pop()!
    
    result += n1 + n2
    heap.push(n1+n2)
}

print(result)
