import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [Int:[Int]] = [:]
    var visited = Array(repeating: false, count: n+1)
    var result = 0
    
    for i in 1...n {
        graph.updateValue([], forKey:i)
    }
    
    for wire in wires {
        graph[wire[0]]?.append(wire[1])
        graph[wire[1]]?.append(wire[0])
    }
    
    func bfs(_ start:Int) -> Int {
        var queue: [Int] = [start]
        var idx = 0
        
        while idx < queue.count {
            let now = queue[idx]
            idx += 1
            
            visited[now] = true
            for node in graph[now]! {
                if !visited[node] {
                   queue.append(node)
                }
            }
        }
        return idx
    }
    
    visited[1] = true
    let cnt = bfs(2)
    result = abs(cnt - (n - cnt))
    
    for i in 1...n {
        visited = Array(repeating: false, count: n+1)
        visited[i] = true //전선을 끊은 효과
        let count = bfs(1)
        result = min(result, abs(count - (n - count)))
    }
    
    return result
}