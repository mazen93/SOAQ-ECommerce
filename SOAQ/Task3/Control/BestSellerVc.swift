//
//  BestSellerVc.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit


class BestSellerVc: UITableViewController {

    
    
   // @IBOutlet weak var refresh: UIActivityIndicatorView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Brandscollection: UICollectionView!

    var array:[bestSellerModel]=[]
    var BrandsArray:[BrandsModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout=self.collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset=UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        layout.minimumInteritemSpacing=5
        
        loadBestSelelr()
        loadBrands()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func loadBrands() {
        API.Brands { (error, data) in
       //     self.refresh.startAnimating()
            API.MainCategoryAPI { (error, dataArray) in
          //      self.refresh.stopAnimating()
                if error != nil {
                    print(error!.localizedDescription)
                }else{
                    self.BrandsArray=data!
                    self.Brandscollection.reloadData()
                }
            }
        }
    }

    func loadBestSelelr()  {
        API.BestSellerAPI { (error, data) in
         //   self.refresh.startAnimating()
            API.MainCategoryAPI { (error, dataArray) in
           //     self.refresh.stopAnimating()
                if error != nil {
                    print(error!.localizedDescription)
                }else{
                    self.array=data!
                    self.collection.reloadData()
                }
            }
        }
    }
}



extension BestSellerVc:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collection {
              return array.count
        }else{
            return BrandsArray.count
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection {
            

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as! BestSellerCell
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1
            cell.setData(data: array[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCell", for: indexPath) as! BrandsCell
            cell.setData(data: BrandsArray[indexPath.row])
            return cell
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == collection{
            
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
        }else{
            
            
            return CGSize(width: 120.0, height: 120.0)
        }
        
    }
    
    
}
