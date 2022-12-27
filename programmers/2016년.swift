func solution(_ a:Int, _ b:Int) -> String {

    let month = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let day = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]

    var sumMonth = [0]

    for i in 1...12 {
        sumMonth.append(sumMonth[i-1]+month[i])
    }

    let n = ((b-1) + sumMonth[a-1]) % 7

    return day[n]
}