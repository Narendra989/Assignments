//
//  FlypeLoader.swift
//  LoaderDemo
//
//  Created by Narendra Satpute on 29/01/17.
//  Copyright © 2017 Naresh. All rights reserved.
//

import UIKit

class AppLoader: UIView {

    class func showLoaderWithTitle(message: String, view: UIView){
        let spinner = MBProgressHUD.showAdded(to: view, animated: true)
        
        spinner.label.text = message
        
        
    }
    class func showLoader(view: UIView){
         MBProgressHUD.showAdded(to: view, animated: true)
       
    }
    
    
    class func hideLoader(view: UIView){
         MBProgressHUD.hide(for: view, animated: true)
    }
    
}
