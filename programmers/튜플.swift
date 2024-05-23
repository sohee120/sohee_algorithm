import Foundation

func solution(_ s: String) -> [Int] {
    
    let clean = s.dropFirst(2).dropLast(2)
    let sets = clean.components(separatedBy: "},{")
    let sortedSets = sets.map { $0.split(separator: ",").map { Int($0)! } }.sorted { $0.count < $1.count }
    
    var result = [Int]()
    var seen = Set<Int>()
   
    for set in sortedSets {
        for num in set {
            if !seen.contains(num) {
                seen.insert(num)
                result.append(num)
            }
        }
    }
    
    return result
}