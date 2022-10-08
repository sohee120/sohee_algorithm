//  BaekJoon9012

import Foundation

let a: Int = Int(readLine()!)!

for _ in 1 ... a {
    
    var answer:String = "YES"
    var stack: Array<Character> = []
    
    let input: String = readLine()!
    
    for character in input{
        if character == "(" {
            stack.append(character)
        }else if character == ")" {
            if stack.isEmpty == true {
                answer = "NO"
            } else {
            stack.removeLast()
            }
        }
    }
    
    if stack.isEmpty == false {
        answer = "NO"
    }
    print(answer)
}


