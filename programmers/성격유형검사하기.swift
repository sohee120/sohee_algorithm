import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dic = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    var result = ""
    
    for i in 0..<survey.count {
        if let tempScore = getScore(survey[i].map{String($0)}, choices[i]) {
            dic[tempScore.0]! += tempScore.1
        }
    }
    
    dic["T"]! > dic["R"]! ? result.append("T") : result.append("R")
    dic["F"]! > dic["C"]! ? result.append("F") : result.append("C")
    dic["M"]! > dic["J"]! ? result.append("M") : result.append("J")
    dic["N"]! > dic["A"]! ? result.append("N") : result.append("A")
    
    return result
}

func getScore(_ input:[String], _ choice: Int) -> (String,Int)? {
    switch choice {
        case 1: return (input[0],3)
        case 2: return (input[0],2)
        case 3: return (input[0],1)
        case 5: return (input[1],1)
        case 6: return (input[1],2)
        case 7: return (input[1],3)
        default: return nil
    }
}