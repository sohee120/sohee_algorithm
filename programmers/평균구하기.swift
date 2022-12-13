func solution(_ arr:[Int]) -> Double {
    
    var sum = 0
    
    for i in 0 ..< arr.count{
        
        sum += arr[i]
    }
    
    let aver = Double(sum)/Double(arr.count)
    
    return aver
}