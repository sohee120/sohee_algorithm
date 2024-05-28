import Foundation

func solution(_ dirs: String) -> Int {
    var visitedPaths = Set<[Int]>()
    var x = 0, y = 0

    for dir in dirs {
        var newX = x
        var newY = y

        switch dir {
        case "U":
            newY += 1
        case "D":
            newY -= 1
        case "R":
            newX += 1
        case "L":
            newX -= 1
        default:
            continue
        }

        if newX < -5 || newX > 5 || newY < -5 || newY > 5 {
            continue
        }

        let path = [x, y, newX, newY]
        let reversePath = [newX, newY, x, y]
        
        // 경로를 기록할 때 양방향을 모두 고려
        if !visitedPaths.contains(path) && !visitedPaths.contains(reversePath) {
            visitedPaths.insert(path)
        }

        // 위치 업데이트
        x = newX
        y = newY
    }

    return visitedPaths.count
}

