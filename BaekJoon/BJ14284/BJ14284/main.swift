//
//  main.swift
//  BJ14284
//
//  Created by 윤소희 on 3/6/25.
//

import Foundation

struct Heap<T> {
    var nodes = [T]()
    var sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count: Int {
        return nodes.count
    }
    
    func peek() -> T {
        return nodes.first!
    }
    
    func leftChildNode(ofParent index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildNode(ofParent index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(ofChild index: Int) -> Int {
        return (index - 1)/2
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        shiftUp(from: count - 1)
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
    
    mutating func pop() -> T? {
        guard !nodes.isEmpty else {return nil}
        nodes.swapAt(0, count - 1)
        defer {
            shiftDown(from: 0)
        }
        return nodes.removeLast()
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildNode(ofParent: parent)
            let right = rightChildNode(ofParent: parent)
            var candidate = parent
            
            if left < count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            
            if right < count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            
            if parent == candidate {
                return
            }
            
            nodes.swapAt(candidate, parent)
            parent = candidate
        }
    }
}

struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
    var node: Int
    var cost: Int
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
let INF = Int.max
var graph = [[Data]](repeating: [], count: n+1)
var distance = [Int](repeating: INF, count: n+1)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[temp[0]].append(Data(node: temp[1], cost: temp[2]))
    graph[temp[1]].append(Data(node: temp[0], cost: temp[2]))
}

let st = readLine()!.split(separator: " ").map{Int(String($0))!}
let s = st[0], t = st[1]

func dijkstra(start: Int) {
    var heap = Heap<Data>(sort: {$0.cost < $1.cost})
    distance[start] = 0
    heap.push(Data(node: start, cost: 0))
    
    while !heap.isEmpty {
        let now = heap.pop()!
        
        if now.cost > distance[now.node] { continue }
        
        for next in graph[now.node] {
            let newCost = now.cost + next.cost
            if newCost < distance[next.node] {
                distance[next.node] = newCost
                heap.push(Data(node: next.node, cost: newCost))
            }
        }
    }
}

dijkstra(start: s)
print(distance[t])
