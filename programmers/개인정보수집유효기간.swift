import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termsDic = [String:Int]()
    var result = [Int]()
    var today = today.replacingOccurrences(of:".", with:"")
    
    for i in terms {
        let temp = i.split(separator: " ").map{String($0)}
        termsDic.updateValue(Int(temp[1])!, forKey:temp[0])
    }
    
    for (idx, pr) in privacies.enumerated() {
        var temp = pr.split(separator: ".").map{String($0)}
        let type = temp[2].split(separator: " ").map{String($0)}[1]
        temp[2] = temp[2].split(separator: " ").map{String($0)}[0]
        var date = temp.map{Int($0)!}
        
        date[1] += termsDic[type]!
        
        while date[1] > 12 {
            date[0] += 1
            date[1] -= 12
        }
        
        for i in 0..<date.count {
            temp[i] = String(date[i])
            if temp[i].count < 2 {
                temp[i] = "0"+temp[i]
            }
        }
        
        if today >= temp.joined() {
            result.append(idx+1)
        }
    }
    
    return result
}