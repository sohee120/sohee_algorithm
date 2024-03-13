import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    let rank: [Int:Int] = [6:1, 5:2, 4:3, 3:4, 2:5]
    var result = [Int]()
    
    var win = 0
    var zero = lottos.filter{$0 == 0}.count
    
    for num in lottos.filter{$0 != 0} {
        if win_nums.contains(num) {win += 1}
    }
    
    result.append(rank[win+zero] ?? 6)
    result.append(rank[win] ?? 6)
    
    return result
}