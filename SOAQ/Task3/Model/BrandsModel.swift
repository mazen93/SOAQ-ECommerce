//
//  BrandsModel.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import SwiftyJSON
class BrandsModel {
    var id:Int?
    var titleAR:String?
    var titleEn:String?
    var photo:String?
    
    
    init(id:Int,titleAR:String,titleEn:String,photo:String) {
        self.id=id
        self.titleAR=titleAR
        self.titleEn=titleEn
        self.photo=photo
    }
    
    
    
    init?(dic:[String:JSON]) {
        
        
        self.photo = (dic["Photo"]?.object as? String)!
        self.id = (dic["Id"]?.object as? Int)!
        self.titleAR = (dic["TitleAR"]?.object as? String)!
        self.titleEn = (dic["TitleEN"]?.object as? String)!
        
        
        
    }
   
}
