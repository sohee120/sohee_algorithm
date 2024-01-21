import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0], n = input[1]
var k = input[2]
var paper = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]
var cntList = [Int]()

while k>0 {
    let dot = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    for i in dot[0]..<dot[2] {
        for j in dot[1]..<dot[3] {
            paper[j][i] = 1
        }
    }
    k -= 1
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var cnt = 0
    var queue = [(Int, Int)]()
    queue.append((i,j))
    visited[i][j] = true
    cnt += 1
    
    while !queue.isEmpty {
        let dequeu = queue.removeFirst()
        let y = dequeu.0
        let x = dequeu.1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || nx < 0 || ny >= m || nx >= n || visited[ny][nx] || paper[ny][nx] == 1 {
                continue
            }
            queue.append((ny, nx))
            visited[ny][nx] = true
            cnt += 1
        }
    }
    return cnt
}

for y in 0..<m {
    for x in 0..<n {
        if !visited[y][x] && paper[y][x] == 0 {
            cntList.append(bfs(y, x))
        }
    }
}

print(cntList.count)
print(cntList.sorted().map{String($0)}.joined(separator: " "))

