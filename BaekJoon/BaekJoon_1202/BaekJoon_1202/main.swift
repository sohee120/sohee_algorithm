//
//  main.swift
//  BaekJoon_1202
//
//  Created by 윤소희 on 2024/02/29.
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

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var jewels = [(m: Int, v: Int)]()
var bags = [Int]()

for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    jewels.append((temp[0], temp[1]))
}

for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

jewels.sort(by: { $0.m < $1.m })
bags.sort(by: <)

var heap = PriorityQueue<(Int,Int)>(sort: {$0.1 > $1.1})

var getValue = 0
var jewelIdx = 0
for bag in bags {
    while jewelIdx < jewels.count, jewels[jewelIdx].m <= bag {
        heap.push(jewels[jewelIdx])
        jewelIdx += 1
    }
    
    let jewels = heap.pop()
    getValue += jewels?.1 ?? 0
}

print(getValue)
