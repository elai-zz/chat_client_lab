//
//  ChatViewController.swift
//  ChatClient
//
//  Created by Minnie Lai on 10/27/16.
//  Copyright © 2016 minnie. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    var user: PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUser(user: PFUser) {
        self.user = user
    }
    
    @IBAction func sendButtonOnClick(_ sender: AnyObject) {
        if let validUser = user {
            let message = messageField.text
            let parseObject = PFObject(className: "Message")
            parseObject["userEmail"] = validUser.username
            parseObject["text"] = message
            parseObject.saveInBackground(block: { (success: Bool, error: Error?) in
                if (success) {
                   NSLog("Message \(message) successfully saved")
                } else {
                    // no
                }
            })
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
