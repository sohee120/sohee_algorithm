import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var setReport = Set(report)
    var dic = [String:Int]()
    var userDic = [String:[String]]()
    var result = Array(repeating:0, count: id_list.count)
    
    for id in id_list {
        userDic.updateValue([], forKey:id)
    }

    for i in setReport {
        let id = i.split(separator: " ").map{String($0)} 
        userDic[id[0]]!.append(id[1])

        if let reported = dic[id[1]] {
            dic[id[1]]! += 1
        } else {
            dic[id[1]] = 1
        }
    }
    
    for (idx,id) in id_list.enumerated() {
        for i in userDic[id]! {
            if dic[i]! >= k {
                result[idx] += 1
            }
        }   
    }

    return result
}