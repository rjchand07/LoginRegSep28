//
//  RegDetailsVC.swift
//  regPage
//
//  Created by ekincare on 25/09/21.
//

import UIKit

class RegDetailsVC: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    var userNameText: String?
    var fullNameText: String?
    var emailText: String?
    var passwordText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userNameText
        fullNameLabel.text = fullNameText
        emailLabel.text = emailText
    
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidLoad()
        userNameLabel.text = ""
        fullNameLabel.text = ""
        emailLabel.text = ""
    }

}
