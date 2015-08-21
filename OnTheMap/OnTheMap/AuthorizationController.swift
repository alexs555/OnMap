//
//  ViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
        
        showOverlayView()
        Alamofire.request(UdacityRouter.SignIn(emailField.text, passwordField.text)).validate().response { (request, response, data, error)  in
            
            self.hideOverlay()
            
            if (response == nil) {
                self.showAlertWithText(error!.localizedDescription)
                return
            }
            
            let newData = data!.subdataWithRange(NSMakeRange(5, data!.length - 5)) /* subset response data! */
            let json = JSON(data: newData)
            
            if (json["status"] == 403) {
                self.showAlertWithText("Email or password are wrong")
            } else {
                self.performSegueWithIdentifier("showContent", sender: nil)
            }
            
            println(NSString(data: newData, encoding: NSUTF8StringEncoding))
            
        }
    
    }
    
    func showAlertWithText(text:String) {
        
        var alert = UIAlertController(title: "Error", message: text, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
}

