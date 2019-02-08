//
//  BrandsCell.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher

class BrandsCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    func setData(data:BrandsModel) {
        let url=URL(string: data.photo!)
        photo.kf.setImage(with: url)
    }
}
