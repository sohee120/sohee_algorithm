func solution(_ phone_number:String) -> String {

    var phoneNum = Array(phone_number)

    for i in 0..<(phoneNum.count-4) {
        phoneNum[i] = "*"
    }

    return String(phoneNum)
}