//
//  SignUpViewController.swift
//  CustomLoginDemo
//
//  Created by Baymurat Abdumuratov on 08/10/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        //Hide the error Label
        errorLabel.alpha = 0
        //Style Elements
        Utilisties.styleTextField(firstNameTextField)
        Utilisties.styleTextField(lastNameTextField)
        Utilisties.styleTextField(emailTextField)
        Utilisties.styleTextField(passwordTextField)
        
        Utilisties.styleFilledButton(signUpButton)
        
    }

    //check the fields and validate that the data is correct. If everything is correct, this method retuns nil. Otherwise, it returns the error message as a String
    func validateField() -> String? {
        
        // check that all fields are filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
            
            }
        
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilisties.isPassword(cleanedPassword) == false{
            return "Please make sure your password is at least 8 characters, contains a speacial character and a number."
        }
        
        //check if the password is secure
        
       
        
        return nil
        
        
    }
    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
      
        let error = validateField()
            if error != nil {
                //There's something wrong with the fields, show error message
                showError(error!)
            }else{
                
                //create cleaned versions of the data
                let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

                
                //create the user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err)  in
                    if let err = err {
                        // there wasn't an error creating the user
                        self.showError("Error creating user")
                    }else{
                        // user was created succussfully, now store the first name and last name
                        
                        let db = Firestore.firestore()
                        db.collection("users").addDocument(data: ["firstName": firstName, "lastName": lastName, "uid": result!.user.uid]) { error in
                            if error != nil {
                                self.showError("Error saving user data")
                            }
                        } // Collection name in Firebase
                        
                        print(result?.user.uid)
                    }
                    // Transition to the home screen
                    self.transitionToHome()
                    
                }
                
            }
        
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        
       let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
        
    }
    

}
