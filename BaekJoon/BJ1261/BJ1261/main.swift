//
//  main.swift
//  BJ1261
//
//  Created by 윤소희 on 3/9/25.
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
    
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChild: child)
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChild: child)
        }
    }
    
    mutating func push(_ element: T) {
        nodes.append(element)
        shiftUp(from: count - 1)
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
    
    mutating func pop() -> T? {
        guard !nodes.isEmpty else { return nil }
        nodes.swapAt(0, count - 1)
        defer {
            shiftDown(from: 0)
        }
        return nodes.removeLast()
    }
}

struct Data: Comparable {
    static func < (lhs:Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
    
    let x: Int
    let y: Int
    let cost: Int
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0], n = input[1]
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
let INF = Int.max
var distance = Array(repeating: Array(repeating: INF, count: m), count: n)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for i in 0..<n {
    graph[i] = readLine()!.map{Int(String($0))!}
}

func dijkstra(start: (Int, Int)) {
    var heap = Heap<Data>(sort: {$0.cost < $1.cost})
    heap.push(Data(x: start.1, y: start.0, cost: 0))
    distance[start.0][start.1] = 0
    
    while !heap.isEmpty {
        let now = heap.pop()!
        let x = now.x, y = now.y, cost = now.cost
        
        if distance[y][x] < cost { continue }
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
            if distance[ny][nx] > cost + graph[ny][nx] {
                heap.push(Data(x: nx, y: ny, cost: cost + graph[ny][nx]))
                distance[ny][nx] = cost + graph[ny][nx]
            }
        }
    }
}

dijkstra(start: (0,0))
print(distance[n-1][m-1])
