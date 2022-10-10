//  BaekJoon1181

import Foundation

var count : Array<String> = []
var strDic : [String:Int] = [:]

var num : Int = Int(readLine()!)!

for _ in 0..<num {
    
    let word : String = readLine()!
    strDic[word, default: 0] += 1

}

var sortedDict = strDic.sorted {
    $0.key.count == $1.key.count ? $0 < $1 : $0.key.count < $1.key.count
}

for i in 0..<sortedDict.count {
    print("\(sortedDict[i].key)")
}



