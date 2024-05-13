func solution(_ n:Int) -> Int {
    var dp = [Int](repeating: 0, count: n+2)
    dp[1] = 1
    dp[2] = 2
    
    if n >= 3{
        for idx in 3...n+1{
            dp[idx] = (dp[idx - 1] + dp[idx - 2]) % 1234567
        }
    }
    return dp[n]
}