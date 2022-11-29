func solution(_ x:Int, _ n:Int) -> [Int] {
    
    var list : [Int] = []
    
    if x == 0 {
        list = Array(repeating:0, count:n)
    } else{
        for i in stride(from: x, through: x*n, by: x) {
        list.append(i)
        }
    }
    
    return list
    
}