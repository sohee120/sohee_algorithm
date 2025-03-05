//
//  main.swift
//  BJ4485
//
//  Created by 윤소희 on 2/18/25.
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

func dijkstra(grid: [[Int]]) -> Int {
    let n = grid.count
    var dist = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    dist[0][0] = grid[0][0]
    var heap = Heap<(Int, Int, Int)>(sort: { $0.0 < $1.0 })
    heap.push((grid[0][0], 0, 0))

    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
//    while !heap.isEmpty {
//        guard let current = heap.pop() else { break }
//        let (cost, x, y) = current
//        if x == n - 1 && y == n - 1 {
//            return cost
//        }
//        if cost > dist[x][y] { continue }
//        for i in 0..<4 {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//            if nx >= 0 && nx < n && ny >= 0 && ny < n {
//                let nextCost = cost + grid[nx][ny]
//                if nextCost < dist[nx][ny] {
//                    dist[nx][ny] = nextCost
//                    heap.push((nextCost, nx, ny))
//                }
//            }
//        }
//    }
    
    while !heap.isEmpty {
        guard let current = heap.pop() else {break}
        let (cost, x, y) = current
        if x == n - 1 && y == n - 1 {
            return cost
        }
        if cost > dist[x][y] {continue}
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 && ny < 0 && nx >= n && ny >= n {continue}
            let nextCost = cost + grid[nx][ny]
            if nextCost < dist[nx][ny] {
                dist[nx][ny] = nextCost
            }
        }
    }
    
    return dist[n - 1][n - 1]
}


var testCase = 1
while let line = readLine(), let n = Int(line), n != 0 {
    var grid = [[Int]]()
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").compactMap { Int($0) }
        grid.append(row)
    }
    
    let result = dijkstra(grid: grid)
    print("Problem \(testCase): \(result)")
    testCase += 1
}
