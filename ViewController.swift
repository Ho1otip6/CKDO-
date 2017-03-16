//
//  ViewController.swift
//  CKDODesign
//
//  Created by Hollis Edwards on 2/22/17.
//  Copyright © 2017 Hollis Edwards. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
    }
     override func viewDidAppear(_ animated: Bool) {
        
         let alert:UIAlertController = UIAlertController(title: "Welcome", message: "Thank you for downloading the Collegekids and Dropouts Application. Please enter your Name and Email to recieve notifcation about our latest Events and new clothes.", preferredStyle: .alert)
        let action1:UIAlertAction = UIAlertAction(title: "Okay", style: .cancel)
        {
            (_:UIAlertAction) in print("Cancelled!")
            
        }
        alert.addAction(action1)
        self.present(alert, animated: true)
        {
            print("present complete")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButton(_ sender: UIButton) {
        guard let email = email.text, let name = name.text
            else{
                print("form is not valid")
                return
        }
        FIRAuth.auth()?.createUser(withEmail: email, password: name, completion: {
            (user: FIRUser?, error) in
            
            if error !=  nil{
                let alert:UIAlertController = UIAlertController(title: "Error", message: "Please enter a valid email address!", preferredStyle: .alert)
                let action1:UIAlertAction = UIAlertAction(title: "Okay", style: .cancel)
                {
                    (_:UIAlertAction) in print("Cancelled!")
                    
                }
                alert.addAction(action1)
                self.present(alert, animated: true)
                {
                    print("present complete")
                }

            }else{
                let alert:UIAlertController = UIAlertController(title: "Congrats!", message: "You have been successfully added to our email list!", preferredStyle: .alert)
                let action1:UIAlertAction = UIAlertAction(title: "Okay", style: .cancel)
                {
                    (_:UIAlertAction) in print("Done")
                    
                }
                alert.addAction(action1)
                self.present(alert, animated: true)
                {
                    print("present complete")
                }

            }
            // Succesfully saved to Database
            guard let uid = user?.uid else {
                return
    }
            
            let ref = FIRDatabase.database().reference(fromURL: "https://ckdodesign.firebaseio.com/")
            let usersReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: {(err, ref) in
                if err != nil {
                    print(err as Any)
                    return
                }
                
                print("Saved user Succesfully in Database")
                
                })
         
        })
        
         
        
        
    }
    
}

