func solution(_ n:Int64) -> [Int] {
    var x = Int(n)
    var resultArr : [Int] = []
    
    while(x != 0) {
        resultArr.append(x%10)
        x /= 10
    }
    

    return resultArr
}