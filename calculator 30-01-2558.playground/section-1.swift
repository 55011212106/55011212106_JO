

class calculator{
    
    let num1 : Double
    let num2 : Double
    let op : String
    
    init(num1:Double,num2:Double,op:String){

        self.num1 = num1
        self.num2 = num2
        self.op = op
        
    }
    
    func op2 () -> Double{
        
        if (op == "+"){
            var sum = a()
            println("\(num1) + \(num2) = \(sum)")
            return sum
        }
        
        if (op == "-"){
            var sum = b()
            println("\(num1) - \(num2) = \(sum)")
            return sum
        }
        
        if (op == "*"){
            var sum = c()
            println("\(num1) * \(num2) = \(sum)")
            return sum
        }
        
        if ( op == "/"){
            var sum = d()
            println("\(num1) / \(num2) = \(sum)")
            return sum
        }
        return 0
        
    }
    
    func a () -> Double{
        
        let x = num1+num2
        
        return x
    }
    
    
    func b () -> Double{
        
        
        let x = num1-num2
        return x
    }
    
    
    func c () -> Double{
        
        
        let x = num1*num2
        return x
    }
    
    
    func d () -> Double{
        
        
        let x = num1/num2
        return x
    }
    
    
    
}
let calculator2=calculator( num1:100, num2:200,op: "-")
calculator2.op2()