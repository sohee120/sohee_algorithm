
import Foundation

//let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//let v = input[0], m = input[1]
//let INF = Int(1e9)
//var distance = Array(repeating: Array(repeating: INF, count: v+1), count: v+1)
//var ans = [Int]()
//for _ in 0..<m {
//    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
//    distance[temp[0]][temp[1]] = min(temp[2], distance[temp[0]][temp[1]])
//    distance[temp[1]][temp[0]] = min(temp[2], distance[temp[0]][temp[1]])
//}
//
//let location = readLine()!.split(separator: " ").map{Int(String($0))!}
//let J = location[0], S = location[1]
//
////플로이드-워셜
//for k in 1...v {
//    for i in 1...v {
//        for j in 1...v {
//            if i == j {continue}
//            distance[i][j] = min(distance[i][j], distance[i][k]+distance[k][j])
//        }
//    }
//}
//
//var sum = Array(repeating: 0, count: v+1)
//for i in 1...v {
//    sum[i] = distance[J][i] + distance[S][i]
//}
//
//let minDistance = sum.filter{$0 != 0}.min()

//for num in 1...v {
//    if num == S || num == J {continue}
//    if sum[num] != minDistance {continue}
//    if distance[num][S] < distance[num][J] {continue}
//    ans.append(num)
//}
//
//ans.sort{distance[J][$0] < distance[J][$1] || $0 < $1}
//
//print(ans.isEmpty ? -1 : ans[0])


struct PriotyQueue<T> {
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
    
    func leftChildNode(ofParent index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildNode(ofParent index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(ofChild index: Int) -> Int {
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
            let left = leftChildNode(ofParent: parent)
            let right = rightChildNode(ofParent: parent)
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
        shiftUp(from: nodes.count - 1)
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

func dijkstra(start:Int, v:Int, adjenctList:[[(Int,Int)]]) -> [Int] {
    let INF = Int(1e9)
    var distance = [Int](repeating: INF, count: v+1)
    var queue = PriotyQueue<(Int,Int)>(sort: {$0.1 < $1.1})
    distance[start] = 0
    queue.push((start, 0))
    
    while !queue.isEmpty {
        guard let (u,currentDistance) = queue.pop() else { break }
        if currentDistance > distance[u] { continue }
        
        for (v, weight) in adjenctList[u] {
            let newDistance = currentDistance + weight
            if newDistance < distance[v] {
                distance[v] = newDistance
                queue.push((v, newDistance))
            }
        }
    }
    return distance
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = input[0], m = input[1]
var adjenctList = [[(Int,Int)]](repeating: [], count: v+1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = edge[0], b = edge[1], c = edge[2]
    adjenctList[a].append((b, c))
    adjenctList[b].append((a, c))
}

let location = readLine()!.split(separator: " ").map{Int(String($0))!}
let J = location[0], S = location[1]

let distJ = dijkstra(start: J, v: v, adjenctList: adjenctList)
let distS = dijkstra(start: S, v: v, adjenctList: adjenctList)

var sum = [Int](repeating: 0, count: v+1)
var candidate = [Int]()

for i in 1...v {
    sum[i] = distJ[i] + distS[i] // 각 후보 장소까지의 최단 시간 합
}
let minCost = sum.filter{$0 != 0}.min()!

for i in 1...v {
    if i == J || i == S { continue }
    if sum[i] != minCost { continue }
    if distJ[i] > distS[i] { continue }
    candidate.append(i)
}

candidate.sort{sum[$0] < sum[$1] || $0 < $1}


print(candidate.isEmpty ? -1 : candidate[0])



