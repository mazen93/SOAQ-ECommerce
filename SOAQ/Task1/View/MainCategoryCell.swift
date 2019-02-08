//
//  MainCategoryCell.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher
class MainCategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryCount: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    
    
    
    func setData(data:MainCategoryModel) {
        
//        
//        if General.CurrentLanguage() == "en"
//        {
//            self.categoryName.text=data.titleEn!
//        }else
//        {
//            self.categoryName.text=data.titleAR
//        }
        
        
        
        
        
        self.categoryCount.text="(\(data.productCount!))"
        
        let url=URL(string: data.photo!)
        photo.kf.setImage(with: url)
    }
}
