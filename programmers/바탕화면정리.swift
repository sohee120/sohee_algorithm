import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    
    var lux = 0, luy = 0, rdx = 0, rdy = 0
    var newArr = [String]()
    
    for i in 0..<wallpaper.count {
        if wallpaper[i].contains("#") {
            lux = i
            break
        }
    }
    
    for i in stride(from:wallpaper.count-1, through:0, by:-1) {
        if wallpaper[i].contains("#") {
            rdx = i+1
            break
        }
    }

    var wallpaper = wallpaper.map{$0.map{String($0)}}
    for i in 0..<wallpaper[0].count {
        var str = ""
        for j in 0..<wallpaper.count {
            str += wallpaper[j][i]
        }
        newArr.append(str)
    }
   
    for i in 0..<newArr.count {
        if newArr[i].contains("#") {
            luy = i
            break
        }
    }
    
    for i in stride(from:newArr.count-1, through:0, by:-1) {
        if newArr[i].contains("#") {
            rdy = i+1
            break
        }
    }
    
    return [lux, luy, rdx, rdy]
}