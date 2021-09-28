//
//  RegSuccessViewController.swift
//  regPage
//
//  Created by ekincare on 16/09/21.
//

import UIKit

class RegSuccessViewController: UIViewController {
    


    @IBOutlet weak var regSuccessLabel: UILabel!
    
    var usernameReg: String?
    var emailReg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func viewDetailsBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
