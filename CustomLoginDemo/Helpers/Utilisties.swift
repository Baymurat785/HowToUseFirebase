//
//  Utilisties.swift
//  CustomLoginDemo
//
//  Created by Baymurat Abdumuratov on 10/10/23.
//

import Foundation
import UIKit

class Utilisties{
    static func styleTextField(_ textField: UITextField){
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width:textField.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        textField.borderStyle = .none
        
        textField.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button: UIButton){
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPassword(_ password: String) -> Bool {
        let passwordText = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$Q$#1%*?&])[A-Za-z\\d$@$#1%*?&]{8,}")
        
        return passwordText.evaluate(with: password)
    }
}
