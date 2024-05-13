import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var a = a
    var b = b
    
    while a != b {
        answer += 1
        
        a = (a+1)/2
        b = (b+1)/2
    }
        
    return answer
}