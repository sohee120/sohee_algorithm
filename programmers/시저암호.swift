func solution(_ s:String, _ n:Int) -> String {
    
    let lower = Array("abcdefghijklmnopqrstuvwxyz")
    let upper = Array("abcdefghijklmnopqrstuvwxyz".uppercased())
    var arr = Array(s)
    
    for i in 0..<arr.count {
        if lower.contains(arr[i]) {
            let index = (lower.firstIndex(of: arr[i])!+n)%26
            arr[i] = lower[index]
        } else if upper.contains(arr[i]) {
            let index = (upper.firstIndex(of: arr[i])!+n)%26
            arr[i] = upper[index]
        }
    }

    return String(arr)
}