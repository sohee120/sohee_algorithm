import Foundation

var column0 = [Int]()
var column1 = [Int]()
var max = [Int]()

func solution(_ sizes:[[Int]]) -> Int {
    
    var sortedSizes : [[Int]] = Array(repeating: Array(repeating: 0,count:2 ), count: sizes.count)

    for i in 0..<sizes.count {
        sortedSizes[i]=sizes[i].sorted()
    }  
    
    for i in 0..<sortedSizes.count {
        column0.append(sortedSizes[i][0])
        column1.append(sortedSizes[i][1])
    }
    
    return (column0.max() ?? 0) * (column1.max() ?? 0)
    
}