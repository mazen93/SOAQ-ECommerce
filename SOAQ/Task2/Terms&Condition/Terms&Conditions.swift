//
//  Terms&Conditions.swift
//  SOAQ
//
//  Created by mac on 2/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WebKit
class Terms_Conditions: UIViewController {
    
    @IBOutlet weak var refresh: UIActivityIndicatorView!
    //MARK:- Outlet
    @IBOutlet weak var mywebview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        BackgroundProcess()
        setupView()
        
        
    }
  
    
    func setupView()  {
        self.navigationItem.title="Terms & Conditions"
        //        self.navigationItem.backBarButtonItem=UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        //        self.navigationController?.navigationBar.tintColor=UIColor.white
    }
    func BackgroundProcess()  {
        DispatchQueue.global(qos: .background).async {
            //background code
            DispatchQueue.main.async {
                //  self.activityIndicatorCall()
                self.loadWebView()
            }
        }
    }
    func loadWebView(){
        
        
        let urrl=URLs.terms
        
        let url = URL(string:  urrl)
        
        mywebview.load(URLRequest(url: url!))
        
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.refresh.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
        self.refresh.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.refresh.stopAnimating()
        // create the alert
        
        print("error : \(error.localizedDescription)")
        
    }

}
