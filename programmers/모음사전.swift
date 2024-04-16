import Foundation

func solution(_ word:String) -> Int {
    var dictionary = [String]()
    var aeiou = ["A", "E", "I", "O", "U"]
    var words = ""
    
    func dfs() {
        if words.count == 5 {
            dictionary.append(words)
            return
        }
        dictionary.append(words)
        for i in 0..<5 {
            words += String(aeiou[i])
            dfs()
            words.removeLast()
        }
        return
    } 
    dfs()
    return dictionary.firstIndex(of: word)!
}