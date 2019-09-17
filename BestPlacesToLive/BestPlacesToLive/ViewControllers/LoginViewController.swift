//
//  LoginViewController.swift
//  BestPlacesToLive
//
//  Created by Thomas Cacciatore on 8/26/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}

class LoginViewController: UIViewController {
    
    var loginController = LoginController()
    var loginType = LoginType.signUp

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
            if loginType == .signUp {
                if let name = usernameTextField.text,
                    !name.isEmpty,
                    let email = emailTextField.text,
                    !email.isEmpty,
                    let password = passwordTextField.text,
                    !password.isEmpty,
                    let password2 = password2TextField.text,
                    !password2.isEmpty {
                    let user = User(name: name, email: email, password: password, password2: password2)
                
                loginController.signUp(with: user) { (error) in
                    if let error = error {
                        // Maybe add an alert here
                        // Use message object being returned with error
                        print("Error occured during sign up: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Sign Up Successful", message: "Now please log in.", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: {
                                self.loginType = .signIn
                                self.loginTypeSegmentedControl.selectedSegmentIndex = 1
                                self.loginButton.setTitle("Sign In", for: .normal)
                                self.usernameTextField.isHidden = true
                                self.password2TextField.isHidden = true
                            })
                        }
                    }
                }
            }
                
            } else {
                    if let email = emailTextField.text,
                        !email.isEmpty,
                        let password = passwordTextField.text,
                        !password.isEmpty {
                        let signInUser = SignInUser(email: email, password: password)
                        
                loginController.signIn(with: signInUser) { (error) in
                    if let error = error {
                        // Maybe add an alert here
                        print("Error occured during sign in: \(error)")
                    } else {
                        UserDefaults.standard.set(self.loginController.bearer?.token, forKey: "token")
                        //Checking if token was saved to UserDefaults
                        let str = UserDefaults.standard.object(forKey: "token") as! String
                        print(str)
                        //end
                        
                        DispatchQueue.main.async {
                            print("Log In Success!")
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }
        }
        
        
    }
    
    @IBAction func signInTypeChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            loginType = .signUp
            loginButton.setTitle("Sign Up", for: .normal)
            password2TextField.isHidden = false
            usernameTextField.isHidden = false
        } else {
            loginType = .signIn
            loginButton.setTitle("Sign In", for: .normal)
            password2TextField.isHidden = true
            usernameTextField.isHidden = true
            
        }
    }
    
    
    
}
