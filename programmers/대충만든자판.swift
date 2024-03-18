import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var keyDic: [String:Int] = [:]
    var keymap = keymap.map{$0.map{String($0)}}
    var result = [Int]()
    
    for key in keymap {
        for k in key {
            if keyDic[k] == nil {
                keyDic[k] = key.firstIndex(of: k)! + 1
            } else {
                keyDic[k] = min(keyDic[k]!, key.firstIndex(of: k)!+1)
            }
        }
    }
    
    for target in targets {
        var sum = 0
        for char in target {
            if keyDic[String(char)] == nil {
                sum = -1
                break
            }else{
                sum += keyDic[String(char)]!
            }
        }
        result.append(sum)
    }
    
    return result
}