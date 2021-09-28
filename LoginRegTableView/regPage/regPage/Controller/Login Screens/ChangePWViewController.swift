//
//  ChangePWViewController.swift
//  regPage
//
//  Created by ekincare on 17/09/21.
//

import UIKit

protocol ChangePasswordDelegate {
    func didChangedPW(label: String?, color: UIColor)
}


class ChangePWViewController: UIViewController {
    
    @IBOutlet weak var isValidPasswordLabel: UILabel!
    let label = "New password created"
    var changePassword: ChangePasswordDelegate!
    
    @IBOutlet weak var changePwLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        isValidPasswordLabel.isHidden = true

    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        changePassword.didChangedPW(label: label, color: .systemGreen)
        isValidPasswordLabel.isHidden = true
        
        let password = changePwLabel.text
        if password?.count != nil {
            if isValidpassword(password: password) == true {
                dismiss(animated: true, completion: nil)
            } else {
                isValidPasswordLabel.isHidden = false
                isValidPasswordLabel.text = "Enter a valid password"
                return
            }
        } else {
            isValidPasswordLabel.isHidden = false
            isValidPasswordLabel.text = "Enter a valid password"
            return
        }
    }
    
    func isValidpassword(password:String?)->Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: password)
    }
}
