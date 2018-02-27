//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Angel Chara'e Mitchell on 2/27/18.
//  Copyright © 2018 Angel Chara'e Mitchell. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var missingAlert: UILabel!
    
    let missingFieldAlert = UIAlertController(title: "Fields Required", message: "Missing Username or Password", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create an OK action & add the OK action to the alert controller
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in }
        missingFieldAlert.addAction(OKAction)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitLogin(_ sender: UIButton) {
        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
            present(missingFieldAlert, animated: true)
        } else {
            loginUser() }
    }
    
    func loginUser() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                
                // Error Alert
                let loginErrorAlert = UIAlertController(title: "Try Again", message: error.localizedDescription, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in }
                loginErrorAlert.addAction(OKAction)
                // Present Alert
                self.present(loginErrorAlert, animated: true)
                
                self.usernameField.text = ""
                self.passwordField.text = ""
                
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
