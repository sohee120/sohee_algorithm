func solution(_ arr:[Int]) -> [Int] {
   
    var newArr:[Int] = arr
    
    if arr.count == 1 {
        return [-1]
    }
    
    if let min = newArr.firstIndex(of:newArr.min()!) {
        newArr.remove(at: min)
    }
    
    
    return newArr
}