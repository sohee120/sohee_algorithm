import Foundation

var result = 0

func solution(_ a:[Int], _ b:[Int]) -> Int {

    for i in 0...a.count-1 {
        result += a[i]*b[i]
    }


    return result
}
