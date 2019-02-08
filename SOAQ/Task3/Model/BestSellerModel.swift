//
//  BestSellerModel.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import SwiftyJSON
class bestSellerModel {
    var id:Int?
    var titleAR:String?
    var titleEn:String?
    var photo:String?
    var final_price:String?
    var currencyAr:String?
    var currencyEn:String?
    
  
    
    init?(dic:[String:JSON]) {
        
        
        self.photo = (dic["Photo"]?.object as? String)!
        self.id = (dic["Id"]?.object as? Int)!
        self.titleAR = (dic["TitleAR"]?.object as? String)!
        self.titleEn = (dic["TitleEN"]?.object as? String)!
        self.final_price = (dic["FinalPrice"]?.object as? String)!
        self.currencyAr = (dic["CurrencyAR"]?.object as? String)!
        self.currencyEn = (dic["CurrencyEN"]?.object as? String)!
        
    }
    
    
    
    
}
