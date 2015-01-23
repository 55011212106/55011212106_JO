class Zoo {
    let animals:[String:String] = ["Panda":"bamboo","lion":"Meat","alligator":"Meat"]
    
    let animal2:String
    
    
    init(animal: String) {
        self.animal2=animal
    }
    
    
    
    func processing() ->String {
        var ans:String = ""
        for (key,value) in animals {
            
            if(key==animal2){
                 ans=value
                
            }
        }
        return ans
    }
    
    
    
}
let start = Zoo(animal: "lion")
start.processing()
