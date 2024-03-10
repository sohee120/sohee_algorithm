import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {

    var answer = [Int]()
    
    for i in 1...number {
        var count = 0
    
        for j in 1...Int(sqrt(Double(i))) {
            if i%j == 0 {
                if j*j == i {
                    count += 1
                } else {
                    count += 2
                }
            }
        }
        count = count > limit ? power : count
        answer.append(count)
    }
    return answer.reduce(0){$0 + $1}
}