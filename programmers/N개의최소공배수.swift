func solution(_ arr:[Int]) -> Int {
    
    var arr = arr
    
    while arr.count >= 2 {
        let n1 = arr.popLast()!
        let n2 = arr.popLast()!
        arr.append(lcm(n1,n2))
    }
    
    return arr.first!
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}