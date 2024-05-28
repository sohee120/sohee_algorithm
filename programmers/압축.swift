import Foundation

func lzwCompress(input: String) -> [Int] {
    // 초기 사전 구성: A-Z
    var dictionary: [String: Int] = [:]
    var dictSize = 1
    for char in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
        dictionary[String(char)] = dictSize
        dictSize += 1
    }
    
    var currentString = ""
    var result: [Int] = []
    
    for char in input {
        let nextString = currentString + String(char)
        if dictionary[nextString] != nil {
            currentString = nextString
        } else {
            result.append(dictionary[currentString]!)
            dictionary[nextString] = dictSize
            dictSize += 1
            currentString = String(char)
        }
    }
    
    if !currentString.isEmpty {
        result.append(dictionary[currentString]!)
    }
    
    return result
}