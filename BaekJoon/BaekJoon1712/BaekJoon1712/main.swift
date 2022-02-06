
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer = 0

if input[1] >= input[2] {
    answer = -1
}else{
    answer = input[0] / (input[2]-input[1]) + 1
}
 print(answer)


