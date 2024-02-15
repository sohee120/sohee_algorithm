//
//  main.swift
//  BaekJoon_1238
//
//  Created by 윤소희 on 2024/02/15.
//

import Foundation

struct PriorityQueue<T> {
    var nodes = [T]()
    let sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
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
    
    func leftChildIndex(ofParent index:Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndex(ofParent index:Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(ofChild index:Int) -> Int {
        return (index - 1)/2
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else {return nil}
        nodes.swapAt(0, count - 1)
        defer {
            shiftDown(from: 0)
        }
        return nodes.removeLast()
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParent: parent)
            let right = rightChildIndex(ofParent: parent)
            var candidate = parent
            
            if left < count && sort(nodes[left], nodes[parent]) {
                candidate = left
            }
            
            if right < count && sort(nodes[right], nodes[parent]) {
                candidate = right
            }
            
            if parent == candidate {
                return
            }
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        shiftUp(from: nodes.count-1)
    }
    
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChild: child)
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChild: child)
        }
    }
}

let INF = Int.max
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], X = input[2]
var nodes = Array(repeating: [(Int, Int)](), count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = input[0], end = input[1], cost = input[2]
    nodes[start].append((cost, end))
}

func Dijkstra(start: Int) -> [Int] {
    var distances = Array(repeating: INF, count: N+1)
    distances[start] = 0
    var priorityQueue = PriorityQueue<(Int, Int)>(sort: {$0.0 < $1.0})
    priorityQueue.push((0, start))
    
    while !priorityQueue.isEmpty {
        guard let curData = priorityQueue.pop() else { break }
        let curCost = curData.0
        let curNode = curData.1
        
        if distances[curNode] < curCost {
            continue
        }
        
        for nextData in nodes[curNode] {
            let nextCost = nextData.0
            let nextNode = nextData.1
            
            let totalCost = curCost + nextCost
            
            if distances[nextNode] > totalCost {
                distances[nextNode] = totalCost
                priorityQueue.push((totalCost, nextNode))
            }
        }
    }
    return distances
}

var distancesX = Dijkstra(start: X)

for idx in 1...N {
    if idx == X {
        continue
    }
    let distances = Dijkstra(start: idx)
    distancesX[idx] += distances[X]
}

if let answer = distancesX[1...].max() {
    print(answer)
}
