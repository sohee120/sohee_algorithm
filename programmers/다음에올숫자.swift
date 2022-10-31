import Foundation

func solution(_ common:[Int]) -> Int {
    
    var d = common[1] - common[0]
    
    if common[1] + d == common[2] {
        return common[common.count-1] + d
    } else {
        let r = common[1] / common[0]
        return common[common.count-1] * r
    }

}