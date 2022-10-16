//  BaekJoon1764

let input = readLine()!.split(separator:" ").map{Int(String($0))}
let m : Int = input[0]!
let n : Int = input[1]!

var set1: Set<String> = []
var set2: Set<String> = []

for _ in 0..<m {
    set1.insert(readLine()!)
}
for _ in 0..<n {
    set2.insert(readLine()!)
}

var setCross = set1.intersection(set2)
print(setCross.count)

for i in setCross.sorted() {
    print(i)
}

