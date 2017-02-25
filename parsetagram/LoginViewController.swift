//
//  LoginViewController.swift
//  parsetagram
//
//  Created by Dustyn August on 3/2/16.
//  Copyright © 2016 Dustyn August. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: AnyObject) {
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                print("Bruh! You logged in.")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                let logInFailureAlert = UIAlertController(title: "Wait a minute...", message: "there was an error", preferredStyle: UIAlertControllerStyle.alert)
                logInFailureAlert.addAction(UIAlertAction(title: "try again", style: .default) { _ in })
                self.present(logInFailureAlert, animated: true){}

            }
        }
    }
    
    @IBAction func onSignUp(_ sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) -> Void in
            if success {
                
                let signUpSuccessAlert = UIAlertController(title: "Awesome!", message: "you created a user", preferredStyle: .alert)
                signUpSuccessAlert.addAction(UIAlertAction(title: "please click sign in", style: .default) { _ in })
                self.present(signUpSuccessAlert, animated: true){}
                
                print("Bruh! You created a user!")
            } else {
                if (error as! NSError).code == 202 {
                    
                    let signUpFailureAlert = UIAlertController(title: "Wait a minute...", message: "that username already exists", preferredStyle: UIAlertControllerStyle.alert)
                    signUpFailureAlert.addAction(UIAlertAction(title: "try signing in", style: .default) { _ in })
                    self.present(signUpFailureAlert, animated: true){}
                    
                }
            }
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
