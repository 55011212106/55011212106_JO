//
//  data.swift
//  CustomtableView
//
//  Created by iStudents on 2/27/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class data: NSObject {
   
    
    func getData() -> Array<balloon> {
        var tempArray = Array<balloon>()
        
        
        let b1 = balloon(bImage: UIImage (named: "green.png"), bName: "green")
        tempArray.append(b1)
        
        let b2 = balloon(bImage: UIImage (named: "red.png"), bName: "red")
        tempArray.append(b2)
        
        let b3 = balloon(bImage: UIImage (named: "white.png"), bName: "white")
        tempArray.append(b3)
        
        let b4 = balloon(bImage: UIImage (named: "yellow.png"), bName: "yellow")
        tempArray.append(b4)
        
        return tempArray
        
        
    
    
    
    }
}
