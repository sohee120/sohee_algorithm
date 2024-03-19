import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var leftLocation = (0,0)
    var rightLocation = (0,2)
    var key : [Int: (Int,Int)] = [
        0:(0,1), 
        7:(1,0), 8:(1,1), 9:(1,2),
        4:(2,0), 5:(2,1), 6:(2,2),
        1:(3,0), 2:(3,1), 3:(3,2)
    ]

    for num in numbers {
        if num == 1 || num == 4 || num == 7 {
            result += "L"
            leftLocation = key[num]!
        }else if num == 3 || num == 6 || num == 9 {
            result += "R"
            rightLocation = key[num]!
        }else{
            let lDistance = abs(key[num]!.0-leftLocation.0)+abs(key[num]!.1-leftLocation.1)
            let rDistance = abs(key[num]!.0-rightLocation.0)+abs(key[num]!.1-rightLocation.1)
            if rDistance < lDistance {
                result += "R"
                rightLocation = key[num]!
            } else if rDistance > lDistance {
                result += "L"
                leftLocation = key[num]!
            }else{
                if hand == "right" {
                    result += "R"
                    rightLocation = key[num]!
                } else {
                    result += "L"
                    leftLocation = key[num]!
                }
            }
        }   
    }
    return result
}