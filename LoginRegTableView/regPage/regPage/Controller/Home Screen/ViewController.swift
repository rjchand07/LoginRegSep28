//
//  ViewController.swift
//  regPage
//
//  Created by ekincare on 16/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login/Register"
    }

    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBAction func homeLoginBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let VC = storyboard.instantiateViewController(identifier: "loginPageVC") as? LoginPageViewController {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    @IBAction func homeRegBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let VC = storyboard.instantiateViewController(identifier: "RegistrationViewController") as? RegistrationViewController {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
}
