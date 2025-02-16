//
//  main.swift
//  BJ2357
//
//  Created by 윤소희 on 2/4/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
let INF = Int(1e9)
var arr = Array(repeating: 0, count: n)
var tree = Array(repeating: (INF,0), count: 4*n)

for i in 0..<n {
    arr[i] = Int(readLine()!)!
    print(arr)
}

func makeMinMaxTree(_ start: Int, _ end: Int, _ node: Int) -> (Int,Int) {
    if start == end {
        tree[node] = (arr[start], arr[start])
        return tree[node]
    }
        let mid = (start+end)/2
        let leftChild = makeMinMaxTree(start, mid, node*2)
        let rightChild = makeMinMaxTree(mid + 1, end, node*2+1)
        tree[node] = (min(leftChild.0, rightChild.0), max(leftChild.1, rightChild.1))
        return tree[node]
}

makeMinMaxTree(0, n-1, 1)
print(tree)

func getMinMax(_ start: Int, _ end: Int, _ node: Int, _ left: Int, _ right:Int) -> (Int, Int) {
    if right < start || left > end { return (Int.max, 0) }
    if left >= start && right <= end {
        return tree[node]
    }
    
    let mid = (start+end)/2
    let leftChild = getMinMax(start, mid, node*2, left, right)
    let rightChild = getMinMax(mid + 1, end, node*2+1, left, right)
    return (min(leftChild.0, rightChild.0), max(leftChild.1, rightChild.1))
}

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let ans = getMinMax(0, n-1, 1, temp[0]-1, temp[1]-1)
    print("\(ans.0) \(ans.1)")
}
