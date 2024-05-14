import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var arr = [String]()
    var num = 0 //차례 (턴수)
    var time = 0 //몇번째인지
    
    outerLoop: for (i, word) in words.enumerated() {
        //중복된 단어나 한글자인 단어를 말한 사람
        if arr.contains(word) || word.count <= 1 {
            num = i/n + 1
            time = i%n + 1
            break outerLoop
        }
        
        let tempLast = word.last!
        if i < words.count-1 {
             var tempFirst = words[i+1].first!
             if tempLast != tempFirst {
                 num = ((i+1)/n) + 1
                 time = ((i+1)%n) + 1
                 break outerLoop
             }
        }
        arr.append(word)
    }
    return [time,num]
}