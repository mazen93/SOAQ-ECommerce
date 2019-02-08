//
//  CityModel.swift
//  SOAQ
//
//  Created by mac on 2/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import SwiftyJSON
class CityModel {
    var titleEn:String?
    var titleAr:String?
    var id:Int?
    
    
    init?(dic:[String:JSON]) {
        self.id = (dic["Id"]?.object as? Int)!
        self.titleAr = (dic["TitleAR"]?.object as? String)!
        self.titleEn = (dic["TitleEN"]?.object as? String)!
     
    }
    
}
