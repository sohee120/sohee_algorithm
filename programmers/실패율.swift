import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var countArr = Array(repeating:0, count:N+2)
    var total = Double(stages.count)
    var fail = [Int:Double]()
    var answer = [Int]()
    
    for i in stages {
        countArr[i] += 1
    }
    
    for i in 1...N {
        if countArr[i] == 0 {
            fail[i] = 0.0
        }else{
            total = total - Double(countArr[i])
            fail[i] = Double(countArr[i]) / total
            print("\(i),\(total),\(countArr[i])")
        }
    }
    
    var answerArr = fail.sorted(by:<).sorted{$0.1 > $1.1}
    
    answer = answerArr.map{ $0.key }

    return answer
}