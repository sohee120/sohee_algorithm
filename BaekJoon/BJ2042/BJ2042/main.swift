
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1], k = input[2]
var arr = Array(repeating: 0, count: n)
var tree = Array(repeating: 0, count: 4 * n)

for i in 0..<n {
    arr[i] = Int(readLine()!)!
}

@discardableResult
func makeSegmentTree(_ start:Int, _ end: Int, _ node:Int) -> Int {
    if start == end {
        tree[node] = arr[start]
        return tree[node]
    }
    
    let mid = (start + end) / 2
    let leftChild = makeSegmentTree(start, mid, node*2)
    let rightChild = makeSegmentTree(mid + 1, end, node*2+1)
    tree[node] = leftChild+rightChild
    
    return tree[node]
}

makeSegmentTree(0, n-1, 1)

func getSum(_ start:Int, _ end:Int, _ node:Int, _ left:Int, _ right: Int) -> Int {
    if right < start || left > end {
        return 0
    }
    
    if left <= start && right >= end {
        return tree[node]
    }
    
    let mid = (start+end)/2
    let leftChild = getSum(start, mid, node*2, left, right)
    let rightChild = getSum(mid + 1, end, node*2+1, left, right)
    return leftChild + rightChild
}

func update(_ start:Int, _ end: Int, _ node: Int, _ index: Int, _ value: Int) {
    if start > index || end < index { return }
    tree[node] += value
    if start == end { return }
    
    let mid = (start+end)/2
    update(start, mid, node*2, index, value)
    update(mid + 1, end, node*2+1, index, value)
}


for _ in 0..<m+k {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    if temp[0] == 1 {
        let index = temp[1] - 1
        let newValue = temp[2]
        let diff = newValue - arr[index]
        arr[index] = newValue
        update(0, n-1, 1, index, diff)
    } else if temp[0] == 2 {
        print(getSum(0, n-1, 1, temp[1]-1, temp[2]-1))
    }
}
