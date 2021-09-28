//
//  LoginCVC.swift
//  regPage
//
//  Created by ekincare on 27/09/21.
//

import UIKit

class LoginCVC: UICollectionViewCell {
    @IBOutlet weak var sampleImage: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    
    func configure(with image: ImageData) {
        sampleImage.image = image.image
        imageTitle.text = image.title
    }
   
}
