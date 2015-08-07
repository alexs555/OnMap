//
//  ViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import Alamofire

class AuthorizationController: BaseViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureTextFields()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureTextFields() {
        
        passwordField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        passwordField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordField.leftView = UIView(frame: CGRectMake(0, 0, 10, 10))
        passwordField.leftViewMode = UITextFieldViewMode.Always
    
        emailField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        emailField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        emailField.leftView = UIView(frame: CGRectMake(0, 0, 10, 10))
        emailField.leftViewMode = UITextFieldViewMode.Always
        
    }

    @IBAction func loginPressed(sender: UIButton) {
        
        
        println("email  \(emailField.text)")
        println("password  \(passwordField.text)")
        
        showOverlayView()
        Alamofire.request(UdacityRouter.SignIn(emailField.text, passwordField.text)).responseJSON { _, _, JSON, _ in
            println(JSON)
        }
        
        /*let UdacityProvider = MoyaProvider<UdacityAPI>(networkActivityClosure:{ (change: Moya.NetworkActivityChangeType) -> () in
            
            switch (change) {
                case .Began:
                    self.showOverlayView()
                case .Ended:
                    self.hideOverlay()
            }
            
        })*/
        
        
        /*UdacityProvider.request(.SignIn(email:emailField.text, password:passwordField.text)){ (data, statusCode, response, error) in
            if let data = data {
                // do something with the data
                self.performSegueWithIdentifier("showContent", sender: self)
                
            }
        }*/
        
    }
    
  
    
    
}

