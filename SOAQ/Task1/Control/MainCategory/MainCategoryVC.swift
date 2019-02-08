//
//  MainCategoryVC.swift
//  Soaq
//
//  Created by mac on 1/14/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainCategoryVC: UIViewController{

    
    
     @IBOutlet weak var refresh: UIActivityIndicatorView!
     var array:[MainCategoryModel]=[]
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let logo = UIImage(named: "top_bar_logo")
        
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
//        
//        collection.delegate=self
//        collection.dataSource=self
        loadData()
    
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func loadData() {
        
        refresh.startAnimating()
        API.MainCategoryAPI { (error, dataArray) in
            self.refresh.stopAnimating()
            if error != nil {
                print(error!.localizedDescription)
            }else{
                self.array=dataArray!
                self.collection.reloadData()
            }
        }
    }


    @IBAction func languageButton(_ sender: Any) {
        print("language Pressed")
//        
//        if General.CurrentLanguage() == "ar"
//        {
//            CheckLanguage.ChangeLanguage(NewLang: "en")
//        }else
//        {
//            CheckLanguage.ChangeLanguage(NewLang: "ar")
//        }
//        helper.restartApp()
    }
    
}
extension MainCategoryVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCategoryCell", for: indexPath) as! MainCategoryCell
        cell.setData(data: array[indexPath.row])
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      performSegue(withIdentifier: "go", sender: array[indexPath.row])
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go"{
        let destination=storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as? SubCategoryVC
            destination?.item=(sender as! MainCategoryModel)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  5
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    
}
