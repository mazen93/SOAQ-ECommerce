//
//  helper.swift
//  Tadlaly
//
//  Created by mahmoudhajar on 10/21/18.
//  Copyright © 2018 MahmoudHajar. All rights reserved.
//

import UIKit

class helper: NSObject {
    
    
    class func restartApp() {
        
    guard let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        
        
        //MainCategoryVC
        //ViewController
        vc = sb.instantiateViewController(withIdentifier: "ViewController")
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
    
 
  
    
}
