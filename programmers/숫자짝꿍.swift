import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xArr = Array(repeating:0, count:10)
    var yArr = Array(repeating:0, count:10)
    var xyArr = Array(repeating:0, count:10)
    var str = ""
    
    for i in X.map{Int(String($0))!} {
        xArr[i] += 1
    }
    for i in Y.map{Int(String($0))!} {
        yArr[i] += 1
    }
    
    for i in 0..<10 {
        if xArr[i] != 0 && yArr[i] != 0 {
            xyArr [i] = min(xArr[i], yArr[i])
        }
    }
    
   for i in stride(from: 9, through: 0, by: -1) {
        if xyArr[i] != 0 {
            str += String(repeating: String(i), count: xyArr[i])
        }
    }
        
    if str == "" {
        str = "-1"
    } else if str.first == "0" {
        return "0"
    }

    return str
}