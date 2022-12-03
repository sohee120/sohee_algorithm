import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var totalPrice = 0
    
    for i in 1...count {
        totalPrice += i*price
    }
    
    if money - totalPrice < 0{
        answer = -(Int64(money-totalPrice))
    }else{
        answer = 0
    }
    
    return answer
}