import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var alphabet = "abcdefghijklmnopqrstuvwxyz".map{$0}
    var str = ""

    for i in skip {
        if let temp = alphabet.firstIndex(of:i) {
            alphabet.remove(at: temp)
        }
    }
    
    for i in s {
        if let temp = alphabet.firstIndex(of:i) {
            var idx = temp + index
            while idx >= alphabet.count {
                idx -= alphabet.count
            }
            str += String(alphabet[idx])
        }
    }
    return str
}