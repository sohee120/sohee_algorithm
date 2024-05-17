import Foundation
func solution(_ s:String) -> Int {
    
    var s = s
    if s.count % 2 != 0 {return 0}
    var cnt = 0
    
    for _ in 0..<s.count {
        let first = s.removeFirst()
        s = "\(s)\(first)"
        if check(s) {
            cnt += 1
        }
    }
    return cnt
}

func check(_ input:String) -> Bool {
    let dic : [Character:Character] = ["[":"]", "(":")", "{":"}"]
    var stack = [Character]()
    
    for i in input {
        if let tempLast = stack.last {
            if let tempDic = dic[tempLast] {
                if i == tempDic {
                    stack.removeLast()
                    continue
                }
            }
        }
        stack.append(i)
    }
    return stack.isEmpty
}