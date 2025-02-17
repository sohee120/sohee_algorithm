//
//  main.swift
//  BJ10282
//
//  Created by 윤소희 on 2/17/25.
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
        return (index-1)/2
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
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

struct Data: Comparable {
    static func < (lhs:Data, rhs:Data) -> Bool {
        return lhs.time < rhs.time
    }
    var node: Int
    var time:Int
}

var t = Int(readLine()!)!

while t > 0 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], d = input[1], c = input[2]

    let INF = Int(1e9)
    var graph = [[Data]](repeating: [], count: n+1)
    var totalTime = [Int](repeating: INF, count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    
    for _ in 0..<d {
        let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = temp[0], b = temp[1], s = temp[2]
        graph[b].append(Data(node: a, time: s))
    }
    
    func dijkstra(start: Int) {

        
        var heap = Heap<Data>(sort: {$0.time < $1.time})
        heap.push(Data(node: start, time: 0))
        totalTime[start] = 0


        while !heap.isEmpty {
            let now = heap.pop()!
            if visited[now.node] {continue}
            visited[now.node] = true
            
            for next in graph[now.node] {
                let time = now.time + next.time
                if time < totalTime[next.node] {
                    totalTime[next.node] = time
                    heap.push(Data(node: next.node, time: time))
                }
            }
            
        }
    }
    dijkstra(start: c)
    let result = totalTime.filter{$0 != INF}
    print("\(result.count) \(result.max()!)")

    t -= 1
}
