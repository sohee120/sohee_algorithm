func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cities = cities.map{$0.lowercased()}
    
    var cache = [String]()
    var answer = 0
    
    if cacheSize == 0 {
        return 5 * cities.count
    }
    
    for city in cities {
        if let index = cache.firstIndex(of:city) {
            answer += 1
            cache.remove(at:index)
        } else {
            answer += 5
            if cache.count == cacheSize {
                cache.removeFirst()
            }
        }
        cache.append(city)
    }
    return answer
}