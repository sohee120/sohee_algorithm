import Foundation

let num = Int(readLine()!)!

for i in 1...num {
    
   for _ in 1...i {
       print("*",terminator: "")
   }
    
   print("")
}
