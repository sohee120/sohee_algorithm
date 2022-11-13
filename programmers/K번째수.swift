import Foundation

var answerArr = [Int]()

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    for i in 0..<commands.count {

        let a = commands[i][0] - 1
        let b = commands[i][1] - 1
        let c = commands[i][2] - 1

        var slicedArr = array[a...b]
        var sortArr = slicedArr.sorted()

        answerArr.append(sortArr[c])

    }

    return answerArr
}