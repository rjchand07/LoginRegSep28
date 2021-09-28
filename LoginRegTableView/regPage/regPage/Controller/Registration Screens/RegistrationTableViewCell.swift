//
//  RegistrationTableViewCell.swift
//  regPage
//
//  Created by ekincare on 21/09/21.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var regCellLabel: UILabel!
    @IBOutlet weak var regCellTextField: UITextField!
    
    static let identifier = "RegistrationTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "RegistrationTableViewCell", bundle: nil)
    }
    
    var placeholder: String? {
        didSet {
            guard let item = placeholder else{return}
            regCellTextField.placeholder = item
        }
    }
    
    public func configure(myLabel: String,textField: String?) {
        regCellLabel.text = myLabel
        regCellTextField?.text = textField
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        regCellTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    

}
