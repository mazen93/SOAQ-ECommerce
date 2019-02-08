
//  API.swift
//  Tadlaly
//
//  Created by mahmoudhajar on 10/21/18.
//  Copyright © 2018 MahmoudHajar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class API: NSObject {
    
    
    
    class func MainCategoryAPI( completion: @escaping (_ error: Error? ,  _ data:[MainCategoryModel]?)-> Void) {
        
        let url=URLs.mainCategoryURL
       
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                   
                    var categoryData = [MainCategoryModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = MainCategoryModel.init(dic: data) {
                            categoryData.append(result)
                        }
                    }
                    completion(nil,categoryData)
                    
                }
                
                
        }
       
    }
    

        // second Category
    
    
    
    class func SecondCategoryAPI( completion: @escaping (_ error: Error? ,  _ data:[SubCategoryModel]?)-> Void) {
        
        
        
        
        //  refresh.startAnimating()
        let url=URLs.secondCategoryURL
        
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    
                    var subCategoryData = [SubCategoryModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = SubCategoryModel.init(dic: data) {
                            subCategoryData.append(result)
                        }
                    }
                    completion(nil,subCategoryData)
                    
                }
                
                
        }
        
    }
    
    
    
    // best seller
    
    
    class func BestSellerAPI( completion: @escaping (_ error: Error? ,  _ data:[bestSellerModel]?)-> Void) {
        
        
        
        
        //  refresh.startAnimating()
        let url=URLs.bestSellerURL
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    
                    var subCategoryData = [bestSellerModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = bestSellerModel.init(dic: data) {
                            subCategoryData.append(result)
                        }
                    }
                    completion(nil,subCategoryData)
                    
                }
                
                
        }
        
    }
    
    
    // brands

    
  
    class func Brands( completion: @escaping (_ error: Error? ,  _ data:[BrandsModel]?)-> Void) {
        
        
        
        
        //  refresh.startAnimating()
        let url=URLs.brandsURL
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    
                    var subCategoryData = [BrandsModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = BrandsModel.init(dic: data) {
                            subCategoryData.append(result)
                        }
                    }
                    completion(nil,subCategoryData)
                    
                }
                
                
        }
        
    }
 

    
    
  
    
    
   // countries API
    
    
    
    
    class func CountriesAPI( completion: @escaping (_ error: Error? ,  _ data:[CountryModel]?)-> Void) {
        
        //  refresh.startAnimating()
        let url=URLs.countriesURL
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    
                    var subCategoryData = [CountryModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = CountryModel.init(dic: data) {
                            subCategoryData.append(result)
                        }
                    }
                    completion(nil,subCategoryData)
                    
                }
                
                
        }
        
    }
    
    
    
    // cities
    
    class func CitiesAPI( completion: @escaping (_ error: Error? ,  _ data:[CityModel]?)-> Void) {
        
        //  refresh.startAnimating()
        let url=URLs.cityURL
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    
                    var subCategoryData = [CityModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = CityModel.init(dic: data) {
                            subCategoryData.append(result)
                        }
                    }
                    completion(nil,subCategoryData)
                    
                }
                
                
        }
        
    }
    
    // Area
    
    
    
    
    class func AreaAPI( completion: @escaping (_ error: Error? ,  _ data:[AreaModel]?)-> Void) {
        
        //  refresh.startAnimating()
        let url=URLs.areaURL
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    guard let dataArr = json.array else{
                        completion(nil , nil)
                        return
                    }
                    
                    var subCategoryData = [AreaModel]()
                    for data in dataArr {
                        if let data = data.dictionary ,let result = AreaModel.init(dic: data) {
                            subCategoryData.append(result)
                        }
                    }
                    completion(nil,subCategoryData)
                    
                }
                
                
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}







