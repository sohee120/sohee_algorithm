import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var board = board
    var stack = [Int]()
    var answer = 0
    
    for i in moves {
        for j in 0..<board.count {
            if board[j][i-1] != 0 {
                stack.append(board[j][i-1])
                if stack.count >= 2 {
                    if stack[stack.count-1] == stack[stack.count-2] {
                        answer += 2
                        stack.removeLast(2)
                    }
                }
                board[j][i-1] = 0
                break
            }
        }
    }

    return answer
}