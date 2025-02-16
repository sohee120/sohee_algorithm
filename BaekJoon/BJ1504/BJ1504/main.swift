//
//  main.swift
//  BJ1504
//
//  Created by 윤소희 on 2/11/25.
//

import Foundation

struct Heap<T> {
    var nodes = [T]()
    let sort : (T,T) -> Bool
    
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
        return index * 2 + 1
    }
    
    func rightChildNode(ofParent index: Int) -> Int {
        return index * 2 + 2
    }
    
    func parentIndex(ofChild index: Int) -> Int {
        return (index - 1)/2
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        shiftUp(from: count-1)
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
        nodes.swapAt(0, count-1)
        defer {
            shiftDown(from: 0)
        }
        return nodes.removeLast()
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            var candidate = parent
            let leftChild = leftChildNode(ofParent: parent)
            let rightChild = rightChildNode(ofParent: parent)
            if leftChild < count && sort(nodes[leftChild], nodes[parent]) {
                candidate = leftChild
            }
            if rightChild < count && sort(nodes[rightChild], nodes[parent]) {
                candidate = rightChild
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
    static func < (lhs: Data, rhs:Data) -> Bool {
        return lhs.cost < rhs.cost
    }
    var node: Int
    var cost: Int
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], e = input[1]
let INF = 1_234_567_890

var graph = [[Data]](repeating: [], count: n+1)
var distance = [Int](repeating: INF, count: n+1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1], cost = input[2]
    graph[a].append(Data(node: b, cost: cost))
    graph[b].append(Data(node: a, cost: cost))
}

let v = readLine()!.split(separator: " ").map { Int($0)! }
let v1 = v[0], v2 = v[1]

func dijkstra(start: Int) {
    var heap = Heap<Data>(sort: {$0.cost < $1.cost})
    heap.push(Data(node: start, cost: 0))
    distance = [Int](repeating: INF, count: n + 1)
    distance[start] = 0
    
    while !heap.isEmpty {
        let now = heap.pop()!
        
        if distance[now.node] < now.cost {continue}
        
        for next in graph[now.node] {
            let cost = now.cost + next.cost
            if cost < distance[next.node] {
                distance[next.node] = cost
                heap.push(Data(node: next.node, cost: cost))
            }
        }
    }
}
// 경로 1. start -> v1 -> v2 -> n
// 경로 2. start -> v2 -> v1 -> n

var answer = [0,0]
dijkstra(start: 1)
answer[0] += distance[v1]//3
answer[1] += distance[v2]//5
dijkstra(start: v1)
answer[0] += distance[v2]//3
answer[1] += distance[n]//4
dijkstra(start: v2)
answer[0] += distance[n]//1
answer[1] += distance[v1]//3

let minDistance = answer.min()!

print(minDistance >= INF ? -1:minDistance)
