//
//  RegPageViewController.swift
//  regPage
//
//  Created by ekincare on 16/09/21.
//

import UIKit

class RegPageViewController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var isvalidReg: UILabel!
    @IBOutlet weak var regUsername: UITextField!
    @IBOutlet weak var regEmail: UITextField!
    
    @IBOutlet weak var regPassword: UITextField!
    @IBOutlet weak var regConfirmPassword: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        isvalidReg.isHidden = true
        
        regUsername.delegate = self
        regEmail.delegate = self
        regPassword.delegate = self
        regConfirmPassword.delegate = self
//        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func regRegBtn(_ sender: UIButton) {
        isvalidReg.isHidden = true
        
        self.regUsername.endEditing(true)
        
        let username = self.regUsername.text
        let email = self.regEmail.text
        let password = self.regPassword.text
        let confirmPassword = self.regConfirmPassword.text
        if (((username?.count) != nil) || ((email?.count) != nil) || ((password?.count) != nil) || ((confirmPassword?.count) != nil)) && (password == confirmPassword) {
            if isValidpassword(password: password) == false {
                isvalidReg.isHidden = false
                isvalidReg.text = "Enter a Valid password"
                return
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let VC = storyboard.instantiateViewController(identifier: "regSuccessVC") as? RegSuccessViewController {

                    self.present(VC, animated: true, completion: nil)
                }
            }
        } else {
            isvalidReg.isHidden = false
            isvalidReg.text = "Fill all the required fields"
            return
        }

    }
    
    func isValidpassword(password:String?)->Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: password)
    }
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        true
//    }

}
