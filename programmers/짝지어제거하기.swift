import Foundation

func solution(_ s:String) -> Int{
    var stack = [Character]()
    if s.count % 2 != 0 {return 0}

    for i in s {
        if stack.last == i {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }

    return stack.isEmpty ? 1 : 0
}