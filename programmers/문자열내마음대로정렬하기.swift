func solution(_ strings:[String], _ n:Int) -> [String] {
    
    let idx = strings[0].index(strings[0].startIndex, offsetBy:n)
    
    let result = strings.sorted(by: {(s1:String, s2:String) -> Bool in
        if s1[idx] == s2[idx] {
            return s1 < s2
        }else{
            return s1[idx] < s2[idx]
        }
    })
    return result
}