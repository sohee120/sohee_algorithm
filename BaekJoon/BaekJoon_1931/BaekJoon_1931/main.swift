//
//  main.swift
//  BaekJoon_1931
//
//  Created by 윤소희 on 2024/02/14.
//

import Foundation

let n = Int(readLine()!)!
var meeting = [[Int]]()
for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    meeting.append(temp)
}

func solution(_ meeting: [[Int]]) -> Int {
    var sortedMeeting = meeting
    sortedMeeting.sort{$0[0] < $1[0]}
    sortedMeeting.sort{$0[1] < $1[1]}
    
    var cnt = 0
    var time = 0
    for meeting in sortedMeeting {
        let start = meeting[0]
        let end = meeting[1]
        
        if start >= time {
            cnt += 1
            time = end
        }
    }
    return cnt
}

print(solution(meeting))
