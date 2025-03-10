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
        guard !nodes.isEmpty else { return nil }
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
    static func < (lhs:Data, rhs:Data) -> Bool {
        return lhs.cost < rhs.cost
    }
    var x: Int
    var y: Int
    var cost: Int
}

let n = Int(readLine()!)!
var grid = [[Int]](repeating: [Int](), count: n)
for i in 0..<n {
    grid[i] = readLine()!.compactMap { Int(String($0)) }
}
var ans = 0
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var distance = Array(repeating: Array(repeating: Int.max, count: n), count: n)

func dijkstra() {
    var heap = Heap<Data>(sort: {$0.cost < $1.cost})
    distance[0][0] = 0
    
    heap.push(Data(x: 0, y: 0, cost: 0))
    
    while !heap.isEmpty {
        let now = heap.pop()!
        let x = now.x, y = now.y, cost = now.cost
        
        if cost > distance[x][y] { continue }
        
        if x == n - 1 && y == n - 1 {
            print(cost)
            return
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || nx >= n || ny < 0 || ny >= n {continue}
            let newCost = cost + (grid[nx][ny] == 0 ? 1 : 0)
            if newCost < distance[nx][ny] {
                distance[nx][ny] = newCost
                heap.push(Data(x: nx, y: ny, cost: newCost))
            }
        }
    }
    print(distance[n - 1][n - 1])
}

dijkstra()
