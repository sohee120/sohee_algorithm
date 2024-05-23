import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    
    var queue: [(index: Int, priority: Int)] = priorities.enumerated().map { ($0, $1) }
    var executionOrder = 0
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        if queue.contains(where: { $0.priority > current.priority }) {
            queue.append(current)
        } else {
            executionOrder += 1
            if current.index == location {
                return executionOrder
            }
        }
    }
    
    return -1 
}