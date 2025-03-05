//
//  main.swift
//  BJ1753
//
//  Created by 윤소희 on 2/24/25.
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
    
    func leftChildNode(ofParent index : Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildNode(ofParent index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(ofChild index: Int) -> Int {
        return (index-1)/2
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
            var candidate = parent
            var left = leftChildNode(ofParent: parent)
            var right = rightChildNode(ofParent: parent)
            
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
    static func < (lhs:Data, rhs:Data) -> Bool {
        return lhs.weight < rhs.weight
    }
    var node: Int
    var weight:Int
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = input[0], e = input[1]
let k = Int(readLine()!)!
let INF = Int.max
var graph = [[Data]](repeating: [], count: v+1)
var distance = [Int](repeating: INF, count: v+1)
for _ in 0..<e {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[temp[0]].append(Data(node: temp[1], weight: temp[2]))
}

func dijkstra(start: Int) {
    var heap = Heap<Data>(sort: {$0.weight < $1.weight})
    distance[start] = 0
    heap.push(Data(node: start, weight: 0))
    
    while !heap.isEmpty {
        let now = heap.pop()!
        
        if distance[now.node] < now.weight {continue}
        
        for next in graph[now.node] {
            let newWeight = now.weight + next.weight
            if newWeight < distance[next.node] {
                distance[next.node] = newWeight
                heap.push(Data(node: next.node, weight: newWeight))
            }
        }
    }
}

dijkstra(start: k)

for i in 1...v {
    print(distance[i] == INF ? "INF" : distance[i])
}
