//
//  SubCategoryVC.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SubCategoryVC: UIViewController {

    
    
    var item:MainCategoryModel!
    var array:[SubCategoryModel]=[]
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var refresh: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loadData() {
        
        refresh.startAnimating()
        API.SecondCategoryAPI { (error, dataArray) in
            self.refresh.stopAnimating()
            if error != nil {
                print(error!.localizedDescription)
            }else{
                self.array=dataArray!
                self.collection.reloadData()
            }
        }
    }

}
extension SubCategoryVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCell", for: indexPath) as! SubCategoryCell
        cell.setData(data: array[indexPath.row])
        return cell
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}
