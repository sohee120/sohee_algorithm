import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var ans = 0
    var delivery = 0
    var pickup = 0
    
    for i in stride(from:n-1, through:0, by:-1) {
        var cnt = 0
        delivery += deliveries[i]
        pickup += pickups[i]
        
        while (delivery > 0 || pickup > 0) {
            delivery -= cap
            pickup -= cap
            
            cnt += 1   
        }
        ans += (i+1) * 2 * cnt
    }

    return Int64(ans)
}