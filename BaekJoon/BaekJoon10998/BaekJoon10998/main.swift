//  BaekJoon10998

import Foundation

let word : String = readLine()!
let reverseWord = word.reversed()

if word == reverseWord {
    print(1)
}else{
    print(0)
}

