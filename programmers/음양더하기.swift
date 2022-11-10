import Foundation

var result = 0

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {

    for i in 0..<absolutes.count {

        result += signs[i] ? absolutes[i] : -absolutes[i]

    }

    return result
}
