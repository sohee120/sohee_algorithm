//
//  main.swift
//  BaekJoon_1647
//
//  Created by 윤소희 on 2024/02/22.
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

typealias Edge = (a:Int, b:Int, cost:Int)

let INF = Int.max
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = input[0], e = input[1]
var adjList = Array(repeating: [Edge](), count: v+1)
var answer = 0

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1], cost = input[2]
    adjList[a].append(Edge(a, b, cost))
    adjList[b].append(Edge(a, b, cost))
}

func prim(start: Int) -> [Edge] {
    var result = [Edge]()
    var visited = Array(repeating: false, count: v+1)
    var priorityQueue = PriorityQueue<Edge>(sort: { $0.cost < $1.cost })

    visited[start] = true
    
    for edge in adjList[start] {
        priorityQueue.push(edge)
    }

    while let edge = priorityQueue.pop(), result.count < v {
        if visited[edge.b] {
            continue
        }
        visited[edge.b] = true
        result.append(edge)

        for nextEdge in adjList[edge.b] where !visited[nextEdge.b] {
            priorityQueue.push(nextEdge)
        }
    }

    return result
}

for resultEdge in prim(start: 1) {
    answer += resultEdge.cost
}

print(prim(start: 1))
print(answer)



