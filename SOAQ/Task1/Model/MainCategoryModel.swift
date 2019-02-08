//
//  MainCategoryModel.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import SwiftyJSON
class MainCategoryModel {

    var id:Int?
    var titleAR:String?
    var titleEn:String?
    var photo:String?
    var productCount:String?
    
    init(id:Int,titleAR:String,titleEn:String,photo:String,productCount:String) {
        self.id=id
        self.titleAR=titleAR
        self.titleEn=titleEn
        self.photo=photo
        self.productCount=productCount
    }

    init?(dic:[String:JSON]) {
        
      
        self.photo = (dic["Photo"]?.object as? String)!
        self.id = (dic["Id"]?.object as? Int)!
        self.titleAR = (dic["TitleAR"]?.object as? String)!
        self.titleEn = (dic["TitleEN"]?.object as? String)!
        self.productCount = (dic["ProductCount"]?.object as? String)!
      
        
        
    }
}
