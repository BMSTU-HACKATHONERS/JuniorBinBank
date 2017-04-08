//
//  ViewController.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(logInCallback(_:)), name: .logInCallback, object: nil)
    }
    @IBAction func logIn(_ sender: Any) {
        /*
        child.email = emailTextfield.text!
        child.password = passwordTextfield.text!
         */
        let child = Child()
        
        child.email = "child@mail.ru"
        child.password = "1234"
        
        APIHelper.logInRequest(child: child)
    }

    func logInCallback(_ notification: NSNotification){
        let data = notification.userInfo
        let child = Child()
        let child_data = data?["child"] as! [String: Any]
        let id = child_data["child_id"] as! Int
        let email = child_data["email"] as! String
        let firstname = child_data["first_name"] as! String
        let lastname = child_data["last_name"] as! String
        let phone = child_data["phone"] as! String
        let balance = child_data["balance"] as! Int
        let parent_ID = child_data["parent_id"] as! Int
        let online_cashing_bit = child_data["online_cashing_bit"] as! Int
        let max_per_day = child_data["max_per_day"] as! Int
        let max_payment = child_data["max_payment"] as! Int
        let low_balance = child_data["low_balance"] as! Int
        let max_cashing = child_data["max_cashing"] as! Int
        DatabaseHelper.setChild(child: child, id: id, email: email, firstname: firstname, lastname: lastname, phone: phone, balance: balance, parent_ID: parent_ID, online_cashing_bit: online_cashing_bit, max_per_day: max_per_day, max_payment: max_payment, low_balance: low_balance, max_cashing: max_cashing)
        performSegue(withIdentifier: "toBalance", sender: child)
    }
}

