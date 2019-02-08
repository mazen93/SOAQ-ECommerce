//
//  BestSellerCell.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher
class BestSellerCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func setData(data:bestSellerModel) {
        
//        if General.CurrentLanguage() == "en"
//        {
//            self.price.text="\(data.final_price!) \(data.currencyEn!)"
//            self.title.text=data.titleEn!
//        }else
//        {
//            self.price.text="\(data.final_price!) \(data.currencyAr!)"
//            self.title.text=data.titleAR
//        }
        
        
        
        
        
        
        let url=URL(string: data.photo!)
        photo.kf.setImage(with: url)
    }
    
    
}
