//
//  LoginPageViewController.swift
//  regPage
//
//  Created by ekincare on 16/09/21.
//

import UIKit

class LoginPageViewController: UIViewController, ChangePasswordDelegate {

    @IBOutlet weak var pwChangedLabel: UILabel!
    
    @IBOutlet weak var loginUsername: UITextField!
    
    @IBOutlet weak var loginPW: UITextField!
    
    @IBOutlet weak var isValidLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        isValidLabel.isHidden = true
        pwChangedLabel.isHidden = true

    }
    
    @IBAction func loginLogBtn(_ sender: UIButton) {
        
        pwChangedLabel.isHidden = true
        
        isValidLabel.isHidden = true
        
        if let _ = loginUsername.text, loginUsername.text?.count != 0 {
            
        } else {
            isValidLabel.isHidden = false
            isValidLabel.text = "Fill the required details"
            
        }
        
        if let password = loginPW.text, loginPW.text?.count != 0 {
            if isValidpassword(password: password) == false {
                isValidLabel.isHidden = false
                isValidLabel.text = "Enter a Valid password"
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let VC = storyboard.instantiateViewController(identifier: "loginSuccessVC") as? LoginSuccessViewController {
                    self.navigationController?.pushViewController(VC, animated: true)
                }
            }
        } else {
            isValidLabel.isHidden = false
            isValidLabel.text = "Fill the required details"
            return
        }
        
        defaults.setValue(loginUsername.text, forKey: "Username")
        defaults.setValue(loginPW.text, forKey: "Username")

    }
    
    @IBAction func loginForgotPwBtn(_ sender: UIButton) {
        pwChangedLabel.isHidden = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let VC = storyboard.instantiateViewController(identifier: "ChangePwVC") as? ChangePWViewController {
            VC.changePassword = self
            self.present(VC, animated: true, completion: nil)
        }
    }
    
    func isValidpassword(password:String)->Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: password)
    }
    func didChangedPW(label: String?, color: UIColor) {
        isValidLabel.isHidden = true
        
        pwChangedLabel.isHidden = true
        pwChangedLabel.text = label
        pwChangedLabel.textColor = color
    }
    
}
