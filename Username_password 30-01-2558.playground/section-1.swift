class login {
    
    let user: String
    let passwd:String
    let typeKey:Int
    
    
    var account:Dictionary<String,String> = ["Wasan":"55011212106","Prawit":"55011212158"]
    
    init(user:String,passwd:String,typeKey:Int){
        
        self.user = user
        self.passwd = passwd
        self.typeKey = typeKey
        
        
    }
    
    
    func Check() ->String{
        
        var result:String = ""
        if(typeKey==1){
            
            // login
            
        }
            
        
        else if(typeKey==2){
            
            // Add
            if let oldValue = account.updateValue(passwd, forKey: user){
                
            }
        }
        
        else if(typeKey==3){
            
            //Delete
            if let removedValue = account.removeValueForKey(user){
                
            }
        }
        
        else if(typeKey==4){
            
            //Updete
            if let oldValue = account.updateValue(passwd, forKey: user){
                
                
            }
                
        }
        
        else{
            result = "Not Option to process"
            
        }
        
        for(key,values) in account{
            println(" \(key) : \(values)")
        }
        
        return result
        
    }

}

let test = login(user: "Wasan", passwd: "55011212106", typeKey: 4)
    

    
        
        
    
    