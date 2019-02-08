//
//  CountryModel.swift
//  SOAQ
//
//  Created by mac on 2/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import SwiftyJSON
class CountryModel{
    
    var titleAR:String?
    var titleEn:String?
    var id:Int?
    var code:String?
    
    init?(dic:[String:JSON]) {
        

        self.id = (dic["Id"]?.object as? Int)!
        self.titleAR = (dic["TitleAR"]?.object as? String)!
        self.titleEn = (dic["TitleEN"]?.object as? String)!
        self.code = (dic["Code"]?.object as? String)!
        
        
        
    }
    
    
}
