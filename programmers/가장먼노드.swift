import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var connect: [Int:[Int]] = [:]
    var distance = Array(repeating: -1, count:n+1)
    
    for i in 0...n {
        connect.updateValue([], forKey:i)
    }
    
    for e in edge {
        connect[e[0]]!.append(e[1])
        connect[e[1]]!.append(e[0])
    }
    
    func bfs(_ start: Int) {
        distance[start] = 0
        
        var queue = [Int]()
        
        for i in connect[start]! {
            distance[i] = 1
            queue.append(i)
        }
        
        while !queue.isEmpty {
            let dequeue = queue.removeFirst()
            
            for i in connect[dequeue]! {
                if distance[i] == -1 {
                    distance[i] = distance[dequeue] + 1
                    queue.append(i)
                }
            }
        }
    }
    
    bfs(1)
    
    let maxDis = distance.max()!
    return distance.filter{$0 == maxDis}.count
}