import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var computers = computers
    var check = Array(repeating: Array(repeating: 0, count:n), count:n)
    var visited = Array(repeating: false, count: n)
    var cnt = 0
    
    func dfs(_ start:Int, _ now:Int) {
        for i in 0..<n {
            if computers[now][i] == 1 && !visited[i] {
                computers[now][i] = 0
                visited[i] = true
                dfs(start, i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            dfs(i, i)
            cnt += 1
        }
    }
    
    return cnt
}