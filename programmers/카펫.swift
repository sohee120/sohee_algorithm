import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var w = 0, h = 0
    let sum = brown + yellow
    
    for i in 1...sum {
        if sum % i == 0 {
            w = sum / i
            h = i
        }
                
        if (w-2) * (h-2) == yellow {
            break
        }
    }
    
    return [w, h]
}