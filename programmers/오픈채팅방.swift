import Foundation

func solution(_ record:[String]) -> [String] {

    let message: [String:String] = ["Enter":"들어왔습니다.", "Leave":"나갔습니다."]
    var nickname: [String:String] = [:]
    var records = record.map{$0.split(separator: " ").map{String($0)}}
    var result = [String]()

    for record in records {
        if record[0] == "Leave" {continue}
        nickname[record[1]] = record[2]
    }

    for record in records {
       if record[0] == "Change" {continue}
        result.append("\(nickname[record[1]]!)님이 \(message[record[0]]!)")
    }

    return result
}