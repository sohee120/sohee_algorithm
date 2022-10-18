//  BaekJoon2902

import Foundation

let input = readLine()!.components(separatedBy: "-")

for i in 0..<input.count {
    let elem = input[i]
    print(elem[elem.startIndex], terminator: "")
}


