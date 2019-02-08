//
//  popViewController.swift
//  pickercodesoaq
//
//  Created by tr on 2/5/19.
//  Copyright © 2019 tr. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class popViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    @IBOutlet weak var popupview: UIView!
    @IBOutlet weak var tableview: UITableView!
    var type=""
    var Countrylist:[CountryModel]=[]
    
    
    var CityList:[CityModel]=[]
    
    var AreaList:[AreaModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        
        
        print("type of segue is \(type)")
        
        
        if type == "country"{
         loadCountriesData()
        }
        else if type == "city"{
            loadCitiesData()
        }else{
            loadAreaData()
        }
        
        // Apply radius to Popupview
        popupview.layer.cornerRadius = 10
        popupview.layer.masksToBounds = true
        
        
        
    }
    func loadCountriesData()  {
        API.CountriesAPI { (error, CodesDATA) in
            if error != nil {
                print("error \(error?.localizedDescription)")
            }else{
                self.Countrylist=CodesDATA!
                self.tableview.reloadData()
            }
        }

    }
    
    func loadCitiesData()  {
        API.CitiesAPI { (error, CodesDATA) in
            if error != nil {
                print("error \(error?.localizedDescription)")
            }else{
                self.CityList=CodesDATA!
                self.tableview.reloadData()
            }
        }
        
    }
    
    
    
    func loadAreaData()  {
        API.AreaAPI { (error, CodesDATA) in
            if error != nil {
                print("error \(error?.localizedDescription )")
            }else{
                self.AreaList=CodesDATA!
                self.tableview.reloadData()
            }
        }
        
    }
    
    
    // Returns count of items in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if type == "country"{
            return Countrylist.count
        }
        else if type == "city"{
           return  CityList.count
        }else{
        return AreaList.count
            
        }
        
        
        
    }
    
    
    // Select item from tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print("Code : \(Countrylist[indexPath.row])")
        
            if type == "country"{
                
                 Sharedd.shareddd.countryId = Countrylist[indexPath.row].id
                if General.CurrentLanguage() == "en"
                {
                    
                    Sharedd.shareddd.country = Countrylist[indexPath.row].titleEn
                   
                }else{
                    
                    Sharedd.shareddd.country = Countrylist[indexPath.row].titleAR
                    
                }
                
            }
            else if type == "city"{
                if General.CurrentLanguage() == "en"
                {
                    
                     Share.share.city=CityList[indexPath.row].titleEn
                }else{
                      Share.share.city=CityList[indexPath.row].titleAr
                    
                }
              
            }else{
                if General.CurrentLanguage() == "en"
                {
                      Area.area.Areaa=AreaList[indexPath.row].titleEn
                    
                }else{
                    
                      Area.area.Areaa=AreaList[indexPath.row].titleAr
                }
                
            }
            
    
        
        
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.present(newViewController, animated: true, completion: nil)
//
        // UserDefaults.standard.removeObject(forKey:"country")
        dismiss(animated: true, completion: nil)
    }
    
    //Assign values for tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        
        
        if General.CurrentLanguage() == "en"
        {
            
            
            
            if type == "country"{
               cell.title.text = Countrylist[indexPath.row].titleEn
            }
            else if type == "city"{
               cell.title.text = CityList[indexPath.row].titleEn
            }else{
                cell.title.text = AreaList[indexPath.row].titleEn
                
            }
            
            
            
            
            
        }else
        {
            if type == "country"{
                cell.title.text = Countrylist[indexPath.row].titleAR
            }
            else if type == "city"{
                cell.title.text = CityList[indexPath.row].titleAr
            }else{
                cell.title.text = AreaList[indexPath.row].titleAr
                
            }
            
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    // Close PopUp
    @IBAction func closePopup(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
