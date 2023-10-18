//
//  LoginViewController.swift
//  CustomLoginDemo
//
//  Created by Baymurat Abdumuratov on 08/10/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    
    func setUpElements() {
        //Hide the error Label
        errorLabel.alpha = 0
        
        // Style Elements
        
        Utilisties.styleTextField(emailTextField)
        Utilisties.styleTextField(passwordTextField)

        Utilisties.styleFilledButton(loginButton)
        
    }
    
    
    
    
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        // Validate text fields
        
        
       //Create cleaned versions of text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        
        
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            
            if error != nil {
                //Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            }else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                 
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
            
            
        }
        
        
        
        
    }
    
    
    
    
    

    
    
}
