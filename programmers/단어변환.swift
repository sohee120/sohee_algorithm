import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) {
        return 0
    }
    
    var visited = Array(repeating:false, count:words.count)
    var queue = [(String, Int)]()
    
    queue.append((begin, 0))
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        if now.0 == target {
            return now.1
        }
        
        for (idx, word) in words.enumerated() {
            if !visited[idx] && check(now.0, word) {
                queue.append((word, now.1+1))
                visited[idx] = true
            }
        }
    }
    
    return 0
}

    
 func check(_ target:String, _ word:String) -> Bool {
    
    let target = target.map{$0}
    let word = word.map{$0}
    
    var cnt = 0
    for i in 0..<target.count {
        if target[i] != word[i]  {
           cnt += 1
        }
    }
    return cnt == 1
}