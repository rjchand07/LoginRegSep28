import UIKit


enum textFieldDetails: Int {
    case userName = 0
    case fullName
    case Email
    case password
    
}

struct ImageData {
    var image: UIImage
    var title: String
}

let images : [ImageData] = [
    ImageData(image: UIImage(imageLiteralResourceName: "1.png"), title: "Sample1"),
    ImageData(image: UIImage(imageLiteralResourceName: "2.png"), title: "Sample2"),
    ImageData(image: UIImage(imageLiteralResourceName: "3.png"), title: "Sample3"),
    ImageData(image: UIImage(imageLiteralResourceName: "4.png"), title: "Sample4"),
    ImageData(image: UIImage(imageLiteralResourceName: "5.png"), title: "Sample5"),
    ImageData(image: UIImage(imageLiteralResourceName: "6.png"), title: "Sample6"),
    ImageData(image: UIImage(imageLiteralResourceName: "7.png"), title: "Sample7"),
    ImageData(image: UIImage(imageLiteralResourceName: "8.png"), title: "Sample8"),
    ImageData(image: UIImage(imageLiteralResourceName: "9.png"), title: "Sample9"),
    ImageData(image: UIImage(imageLiteralResourceName: "10.png"), title: "Sample10")
]


var defaults = UserDefaults.standard

var usernameData = defaults.string(forKey: "Username")
var passwordData = defaults.string(forKey: "Password")
