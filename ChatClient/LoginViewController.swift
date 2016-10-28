//
//  ViewController.swift
//  ChatClient
//
//  Created by Minnie Lai on 10/27/16.
//  Copyright © 2016 minnie. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    let currentUser: PFUser? = nil
    
    // Sign up on click
    @IBAction func onClick(_ sender: AnyObject) {
        let user = getUser()
        user.signUpInBackground { (succeeded: Bool, error: Error?) in
            if let error = error {
                self.createAlert(title: "Uh oh", message: error.localizedDescription)
            } else {
                self.createAlert(title: "Cool", message: "You signed up, now please log in.")
            }
        }
        
    }
    
    // login on click
    @IBAction func loginOnClick(_ sender: AnyObject) {
        let user = getUser()
        PFUser.logInWithUsername(inBackground: user.email!, password: user.password!) { (user: PFUser?, error: Error?) in
            if let error = error {
                self.createAlert(title: "Uh oh", message: error.localizedDescription)
            } else {
                self.createAlert(title: "Cool", message: "You signed up, now please log in.")
            }
            
        }
        
    }
    
    func getUser() -> PFUser {
        if currentUser != nil {
            return currentUser!
        }
        let user = PFUser()
        user.username = emailTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        return user
    }
    
    func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

