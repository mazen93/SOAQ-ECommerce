//
//  ViewController.swift
//  pickercodesoaq
//
//  Created by tr on 2/5/19.
//  Copyright © 2019 tr. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
 
    
    @IBOutlet weak var country: UIButton!
    @IBOutlet weak var FullName: UITextField!
    @IBOutlet weak var codeTxt: UITextField!
    @IBOutlet weak var EmilTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
   
   
    @IBOutlet weak var CityBtn: UIButton!
    @IBOutlet weak var AreaBtn: UIButton!
    
      var text: String = ""
      var Name: String = ""
      var Email: String = ""
      var password: String = ""
      var codetxt: String = ""
    
    
    

    var selectpiroty : String?
    var pirorty :[CountryModel]=[]
    
   
    
   
   
        
    
    @IBOutlet weak var txtfeildpicker: UITextField!
    func cratepickerview(){
        
        let pickcerview = UIPickerView()
        pickcerview.delegate = self
        pickcerview.dataSource = self
        txtfeildpicker.inputView = pickcerview
      
    }
    @objc func dismispicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let donebutton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismiskeyboard))
        toolbar.setItems([donebutton], animated: false)
        toolbar.isUserInteractionEnabled =  true
        txtfeildpicker.inputAccessoryView = toolbar

      
        
    }
    @objc func dismiskeyboard(){
        view.endEditing(true)
        text = txtfeildpicker.text!
        Name = FullName.text!
        Email = EmilTxt.text!
        password = passwordTxt.text!

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       cratepickerview()
        dismispicker()
        loadCodesData()
       // setupUI()
        
        
        
      
        self.FullName.delegate = self
        self.codeTxt.delegate = self
        self.passwordTxt.delegate = self
        self.EmilTxt.delegate = self
        txtfeildpicker.delegate = self
        

        
    }
    
    func setupUI()  {
        
        
        self.FullName.delegate = self
        self.codeTxt.delegate = self
        self.passwordTxt.delegate = self
        self.EmilTxt.delegate = self
        txtfeildpicker.delegate = self
        // placeholder
        FullName.attributedPlaceholder = NSAttributedString(string: "Full Name",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        EmilTxt.attributedPlaceholder = NSAttributedString(string: "Email",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        codeTxt.attributedPlaceholder = NSAttributedString(string: "123456",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        txtfeildpicker.attributedPlaceholder = NSAttributedString(string: "Code",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        // left padging text
        FullName.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: FullName.frame.height))
        FullName.leftViewMode = .always
        //
        passwordTxt.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: passwordTxt.frame.height))
        passwordTxt.leftViewMode = .always
        //
        codeTxt.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: codeTxt.frame.height))
        codeTxt.leftViewMode = .always
        
        EmilTxt.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: EmilTxt.frame.height))
        EmilTxt.leftViewMode = .always
        
        txtfeildpicker.leftView = UIView(frame: CGRect(x: 10, y: 0, width: 10, height: txtfeildpicker.frame.height))
        txtfeildpicker.leftViewMode = .always
        // button padging
        
        //
        CityBtn.titleEdgeInsets.top = 0
        CityBtn.titleEdgeInsets.left = 10
        
        CityBtn.titleEdgeInsets.bottom = 0
        CityBtn.titleEdgeInsets.right = 0
        //
        AreaBtn.titleEdgeInsets.top = 0
        AreaBtn.titleEdgeInsets.left = 10
        
        AreaBtn.titleEdgeInsets.bottom = 0
        AreaBtn.titleEdgeInsets.right = 0
        //
        
        country.titleEdgeInsets.top = 0
        country.titleEdgeInsets.left = 10
        
        country.titleEdgeInsets.bottom = 0
        country.titleEdgeInsets.right = 0
        txtfeildpicker.rightViewMode = UITextField.ViewMode.always
        txtfeildpicker.rightViewMode = .always
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
     
        var cb  = Sharedd.shareddd.country
        if General.CurrentLanguage() == "ar"
        {
             cb = Sharedd.shareddd.country ?? "الدوله"
            
        }else{
             cb = Sharedd.shareddd.country ?? "Country"
        }
        
        country.setTitle(cb,for: .normal)
        
        
        
        
        var ci = Share.share.city
       
        
        if General.CurrentLanguage() == "ar"
        {
           ci = Share.share.city ?? "المدينه"
            
        }else{
             ci = Share.share.city ?? "City"
        }
        
        
        
        CityBtn.setTitle(ci,for: .normal)
        //
        
        var Ar = Area.area.Areaa
       
        
        
        if General.CurrentLanguage() == "ar"
        {
            Ar = Area.area.Areaa ?? "المنطقه"
        }else{
             Ar = Area.area.Areaa ?? "Area"
        }
        AreaBtn.setTitle(Ar,for: .normal)
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        FullName.resignFirstResponder()
        EmilTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        txtfeildpicker.resignFirstResponder()
      
        
        return true
    }

    // load codes
    func loadCodesData()  {
        
        
        API.CountriesAPI { (error, CodesDATA) in
            if error != nil {
                print("error \(error?.localizedDescription)")
            }else{
                self.pirorty=CodesDATA!
            }
        }
        
    }
    
    
    
    

    @IBAction func changelanguage(_ sender: Any) {
        
        if General.CurrentLanguage() == "ar"
        {
            CheckLanguage.ChangeLanguage(NewLang: "en")
        }else
        {
            CheckLanguage.ChangeLanguage(NewLang: "ar")
        }
        helper.restartApp()
        
    }
    @IBAction func city(_ sender: Any) {
        performSegue(withIdentifier: "toCities", sender: nil)

    }
    
    
    @IBAction func CountryButton(_ sender: Any) {
          performSegue(withIdentifier: "toCountries", sender: nil)
    }
    
    @IBAction func AreaButton(_ sender: Any) {
        performSegue(withIdentifier: "toArea", sender: nil)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
        let destination=segue.destination as! popViewController
        if segue.identifier == "toCountries"{
            destination.type="country"
        }else if segue.identifier == "toCities"{
            destination.type="city"
        }else{
            destination.type="area"
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pirorty.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pirorty[row].code
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        
        //print("Code :  \(pirorty[row])")
        Shared.shared.code = pirorty[row].titleEn
        
        selectpiroty = pirorty[row].titleEn
        txtfeildpicker.text = selectpiroty
        
        
        
    }
}

