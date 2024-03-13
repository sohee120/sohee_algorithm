import Foundation

func solution(_ babbling:[String]) -> Int {
    let pronun: [String:Int] = ["aya":0, "ye":0, "woo":0, "ma":0]
    var answer = 0
    
    for word in babbling {
        var present = ""
        var previous = ""
        for char in word {
            present += String(char)
            if pronun[present] != nil && present != previous {
                previous = present
                present = ""
            }
        }
        if present.isEmpty {
            answer += 1
        }
    }
    
    
    return answer
}