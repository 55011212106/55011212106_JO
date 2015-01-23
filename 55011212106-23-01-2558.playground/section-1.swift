class UserPassword {
    let UserAndPassword:[String:String] = ["wasan":"wa55011212106","somsuk":"so55011212118","saharat":"sa55011212111"]
    
    let userInput:String
    
    
    init(user: String) {
        self.userInput=user
    }
    
    
    
    func processing() ->String {
        var uap:String = ""
        for (key,value) in UserAndPassword {
            
            if(key==userInput){
                uap=value
                
            }
        }
        return uap
    }
    
    
    
}
let start = UserPassword(user: "Wasan")
start.processing()
