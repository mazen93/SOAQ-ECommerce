//
//  Config.swift
//  SOAQ
//
//  Created by mac on 2/7/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
class URLs {
    
    
    static let mainURL="http://souq.hardtask.co/app/app.asmx/"
    
    
    // task 3 main url
    static let mainURLTask3="http://www.salonidepot.com/app/app.asmx/"
  
    
    //task 2
   // static let mainURLTask2="http://www.salonidepot.com/app/app.asmx/"
    
     // main Category url
    static let mainCategory="GetCategories?categoryId=0&countryId=1"
    static let mainCategoryURL = mainURL + mainCategory
    
    
    // second Category url
    
    static let secondCategory="GetCategories?categoryId=1&countryId=1"
    static let secondCategoryURL=mainURL+secondCategory
    
    
    
    
    // brands
    static let brands="GetBrands?pageIndex=-1&userId=0&countryId=1&currencyId=1"
    static let brandsURL=mainURLTask3+brands
    
    
    //best seller
    static let bestSeller="GetBestSellers?pageIndex=-1&loginUserId=0&countryId=1&currencyId=1"
    static let bestSellerURL=mainURLTask3+bestSeller
    
    
    
    // term & condition
    static let terms="https://termsfeed.com/blog/sample-terms-and-conditions-template/"
    
    
    
    // get  country codes
    static let countries="GetCountries"
    static let countriesURL=mainURLTask3+countries
    // get  countries
    
    
   
    // get Area
    static let area="GetAreas?cityId=1"
    static let areaURL=mainURLTask3+area
    
    
    // get city
    
   static let city="GetCities?countryId=1"
   static let cityURL=mainURLTask3+city
    
    
    
    
    
}
