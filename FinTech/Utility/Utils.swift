//
//  Utils.swift
//  FinTech
//
//  Created by Stenley Tok on 2/6/18.
//  Copyright © 2018 Stenley Tok. All rights reserved.
//
import UIKit
import Foundation

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

func showPopUp(view:UIViewController, title:String, message:String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
    view.present(alert, animated: true, completion: nil)
}

func getString(text:String, comment:String? = "") -> String{
    let str = NSLocalizedString(text, comment: comment!)
    return str
}

