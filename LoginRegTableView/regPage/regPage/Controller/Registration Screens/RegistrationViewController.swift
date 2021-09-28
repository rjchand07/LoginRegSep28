//
//  RegistrationViewController.swift
//  regPage
//
//  Created by ekincare on 21/09/21.
//

import UIKit

class RegistrationViewController: UIViewController,UITableViewDelegate,  UITableViewDataSource, UITextFieldDelegate, ButtonClickedProtocol {

    var clickedPath: IndexPath? = nil
    var data = [String:[String]]()
    
    @IBOutlet weak var regTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [
            "Label":["Username","Fullname","Email","Password"],
            "Text":["","","",""]
            ]
        regTableView.register(RegistrationTableViewCell.nib(), forCellReuseIdentifier: RegistrationTableViewCell.identifier)
        regTableView.register(SecondRegCell.nib(), forCellReuseIdentifier: SecondRegCell.identifier)
        regTableView.delegate = self
        regTableView.dataSource = self
//        self.regTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier:"RegistrationTableViewCell") as? RegistrationTableViewCell {
//                cell.configure(myLabel: labelsArray[indexPath.row], textField: Array(dataDetails.values)[indexPath.row])
                cell.configure(myLabel: (data["Label"]![indexPath.row]), textField: "")
                cell.regCellTextField.delegate = self
                cell.regCellTextField.tag = indexPath.row
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SecondRegCell") as? SecondRegCell {
                cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(true)
        self.regTableView.reloadData()
   }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged(_ textField: UITextField){
        switch textField.tag {
        case textFieldDetails.userName.rawValue:
//            dataDetails["Username"] = textField.text
            data["Text"]?[0] = textField.text!
        case textFieldDetails.fullName.rawValue:
//            dataDetails["Fullname"] = textField.text
            data["Text"]?[1] = textField.text!

        case textFieldDetails.Email.rawValue:
//            dataDetails["Email"] = textField.text
            data["Text"]?[2] = textField.text!

        case textFieldDetails.password.rawValue:
//            dataDetails["Password"] = textField.text
            data["Text"]?[3] = textField.text!

            textField.isSecureTextEntry = true
        default:
            break
        }
    }
    
    func btnClicked(_ cell: SecondRegCell) {
    
        if let indexPath = self.regTableView.indexPath(for: cell) {
                clickedPath = indexPath
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let VC = storyboard.instantiateViewController(identifier: "RegDetailsVC") as? RegDetailsVC{
                    VC.userNameText = data["Text"]![0]
                    VC.fullNameText = data["Text"]![1]
                    VC.emailText = data["Text"]![2]
                    self.present(VC, animated: true, completion: nil)
                }
           
        }
    }

}
