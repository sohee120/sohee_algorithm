import Foundation

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var releaseDays = [Int]()
    var result = [Int]()
    

    for i in 0..<progresses.count {
        let remainingProgress = 100 - progresses[i]
        let days = (remainingProgress + speeds[i] - 1) / speeds[i]  
        releaseDays.append(days)
    }
    
    var currentReleaseDay = releaseDays[0]
    var count = 0
    
    for day in releaseDays {
        if day <= currentReleaseDay {
            count += 1
        } else {
            result.append(count)
            count = 1
            currentReleaseDay = day
        }
    }
    
    result.append(count)
    
    return result
}
