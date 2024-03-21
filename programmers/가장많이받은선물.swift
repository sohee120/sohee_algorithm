import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    var giftBox = Array(repeating: Array(repeating:0, count:friends.count), count:friends.count)
    var dic = [String:Int]()
    var give = Array(repeating:0, count:friends.count)
    var receive = Array(repeating:0, count:friends.count)
    var amount = Array(repeating:0, count:friends.count)
    var result = Array(repeating:0, count:friends.count)
    
    for (idx,name) in friends.enumerated() {
        dic.updateValue(idx, forKey: name)
    }
    
    for gift in gifts {
        let name = gift.components(separatedBy:" ")
        giftBox[dic[name[0]]!][dic[name[1]]!] += 1
    }
    
    for i in giftBox.indices {
        for j in giftBox.indices {
            give[i] += giftBox[i][j]
            receive[i] += giftBox[j][i]
            amount[i] = give[i] - receive[i]
        }
    }
    
    for i in giftBox.indices {
        for j in i+1..<giftBox.count {    
            if i == j {continue}
            if giftBox[i][j] > giftBox[j][i] {
                result[i] += 1
            } else if giftBox[i][j] < giftBox[j][i] {
                result[j] += 1
            }else{
                if amount[i] > amount[j] {
                    result[i] += 1
                } else if amount[i] < amount[j] {
                    result[j] += 1
                }
            }
        }
    }

    return result.max()!
}