//
//  main.swift
//  BaekJoon_1753
//
//  Created by 윤소희 on 6/17/24.
//

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let comparer: (T,T) -> Bool
    
    var isEmpty: Bool {
        return elements.count <= 1
    }
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    
    mutating private func swimUp(index:Int) {
        var index = index
        while index > 1 && comparer(elements[index], elements[index/2]) {
            elements.swapAt(index, index/2)
            index /= 2
        }
    }
    
    mutating func pop() -> T? {
            if elements.count < 2 { return nil }
            elements.swapAt(1, elements.count - 1)
            let deletedElement = elements.removeLast()
            diveDown(index: 1)
            return deletedElement
        }
        
        mutating private func diveDown(index: Int) {
            var swapIndex = index
            var isSwap = false
            let leftIndex = index * 2
            let rightIndex = index * 2 + 1

            if leftIndex < elements.endIndex && comparer(elements[leftIndex], elements[swapIndex]) {
                swapIndex = leftIndex
                isSwap = true
            }
            
            if rightIndex < elements.endIndex && comparer(elements[rightIndex], elements[swapIndex]) {
                swapIndex = rightIndex
                isSwap = true
            }

            if isSwap {
                elements.swapAt(swapIndex, index)
                diveDown(index: swapIndex)
            }
        }
    }

    struct Data: Comparable {
        static func < (lhs: Data, rhs: Data) -> Bool {
            return lhs.cost < rhs.cost
        }
        let node: Int
        let cost: Int
    }

    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let v = input[0], e = input[1]
    let k = Int(readLine()!)!
    let INF = 1_234_567_890
    var graph = [[Data]](repeating: [], count: v + 1)

    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let a = input[0], b = input[1], cost = input[2]
        graph[a].append(Data(node: b, cost: cost))
    }

    var distance = [Int](repeating: INF, count: v + 1)

    func dijkstra(start: Int) {
        // cost 최소 힙
        var heap = Heap<Data>(comparer: <)
        distance[start] = 0
        heap.insert(element: Data(node: start, cost: 0))
        
        while !heap.isEmpty {
            let now = heap.pop()!
            
            // 이미 갱신된 노드라면 넘어감
            if distance[now.node] < now.cost {
                continue
            }
            
            // 현재 노드와 연결된 노드 확인
            for next in graph[now.node] {
                
                // 현재노드를 거쳐서 다음 노드로 가능 비용
                let cost = now.cost + next.cost
                
                // 현재 노드를 거쳐서 다음 노드로 가는 비용이 더 적다면 비용 갱신 및 힙에 삽입
                if cost < distance[next.node] {
                    distance[next.node] = cost
                    heap.insert(element: Data(node: next.node, cost: cost))
                }
            }
        }
    }

    dijkstra(start: k)

    distance[1...].forEach { print($0 == INF ? "INF" : $0) }

