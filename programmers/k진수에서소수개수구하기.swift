import Foundation

// 소수 판별 함수
func isPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    if n <= 3 { return true }
    if n % 2 == 0 || n % 3 == 0 { return false }
    var i = 5
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

// 진수 변환 함수
func convertToBase(_ num: Int, _ base: Int) -> String {
    var n = num
    var result = ""
    while n > 0 {
        result = String(n % base) + result
        n /= base
    }
    return result
}

func solution(_ n: Int, _ k: Int) -> Int {
    let baseKString = convertToBase(n, k)
    let candidates = baseKString.split(separator: "0").map { String($0) }
    
    var primeCount = 0
    
    for candidate in candidates {
        if let num = Int(candidate), isPrime(num) {
            primeCount += 1
        }
    }
    
    return primeCount
}