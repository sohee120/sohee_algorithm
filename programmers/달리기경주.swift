//달리기 경주
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var players = players
    var calls = callings
    var playersDic = [String:Int]()
    
    for (idx,player) in players.enumerated() {
        playersDic.updateValue(idx, forKey:player)
    }
    
    for call in calls {
        var idx = playersDic[call]! //추월한 선수의 추월하기 전 등수
        let name = players[idx-1] //추월당한 선수 이름
        // 추월한 선수랑 추월 당한 선수 순서 바꿔치기 
        players[idx-1] = call
        players[idx] = name
        //
        
        //순위 업데이트
        playersDic[call]! -= 1
        playersDic[players[idx]]! += 1
        
    }
    
    return players
}