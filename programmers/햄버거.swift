import Foundation

func solution(_ ingredient:[Int]) -> Int {

    var stack = [Int]()
    var count = 0
    
    for i in ingredient {
        stack.append(i)
        if stack.count >= 4 {
            if stack[stack.count-4...stack.count-1] == [1, 2, 3, 1] {
                stack.removeLast(4)
                count += 1
            }
        }
    }
    
    return count
}