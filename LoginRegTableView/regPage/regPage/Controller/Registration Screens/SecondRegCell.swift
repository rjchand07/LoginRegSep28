//
//  SecondRegCell.swift
//  regPage
//
//  Created by ekincare on 22/09/21.
//

import UIKit

protocol ButtonClickedProtocol {
    func btnClicked(_ cell: SecondRegCell)
}

class SecondRegCell: UITableViewCell {
    
    var delegate: ButtonClickedProtocol?
    
    var usernameData:String?
    var fullnameData:String?
    var emailData:String?
    var passwordData:String?
    
   
    
    static let identifier = "SecondRegCell"
    static func nib() -> UINib {
        return UINib(nibName: "SecondRegCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func regBtnPressed(_ sender: UIButton) {
        self.delegate?.btnClicked(self)
    }
    
}
