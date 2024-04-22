import Foundation

var board = [[Int]](repeating: [Int](repeating: 0, count: 19), count: 19)

let dx = [[0,0],[-1,1],[-1,1],[1,-1]]
let dy = [[-1,1],[0,0],[1,-1],[1,-1]]

func search(_ x: Int, _ y: Int, _ dir1: Int, _ dir2: Int, _ count: Int) -> Int {
    if count > 5 { return 999 }  // 5개 이상 연속이면 추가 검사 중단

    let nx = x + dx[dir1][dir2]
    let ny = y + dy[dir1][dir2]
    if nx < 0 || ny < 0 || nx >= 19 || ny >= 19 { return count }
    if board[nx][ny] == board[x][y] {
        return search(nx, ny, dir1, dir2, count + 1)
    }
    return count
}

func startSetting(_ x: Int, _ y: Int) -> Int {
    var ans = 0

    for i in 0..<4 {
        var val = 1
        for j in 0..<2 {
            let nx = x + dx[i][j]
            let ny = y + dy[i][j]
            if nx >= 0 && ny >= 0 && nx < 19 && ny < 19 {
                if board[x][y] == board[nx][ny] { //그 방향에 같은 색 돌이 있을 때만 재귀함수 호출
                    val += search(nx, ny, i, j, 1)
                }
            }
        }
        if val == 5 { // 바둑알이 5개 일때
            ans = board[x][y] //해당 바둑알의 색깔 반환
            break
        }
    }
    return ans
}

for i in 0..<19 {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[i] = line
}

var ans = 0, ansX = 99, ansY = 99

for i in 0..<19 {
    for j in 0..<19 {
        if board[i][j] != 0 {
            let val = startSetting(i, j)
            if val != 0 {
                // 가장 왼쪽에 있는 바둑알로 갱신해주기 위함
                // 가장 위에 있는 바둑알은 어차피 위에서부터 탐색해서
                // 따로 처리안해줘도 됨
                if j < ansY {
                    ans = val
                    ansX = i
                    ansY = j
                }
            }
        }
    }
}

if ans != 0 {
    print(ans)
    print("\(ansX + 1) \(ansY + 1)")
} else {
    print("0")
}

