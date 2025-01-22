//
//  ProductCell.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 01.01.25.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var imageProduc: UIImageView!
   
    @IBOutlet weak var productHouse: UILabel!
  
    @IBOutlet weak var productName: UILabel!
 
    @IBOutlet weak var productPrice: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    var plusActionHandler: (() -> Void)?
    
    @IBAction func tappedPlus(_ sender: Any) {
        plusActionHandler?()
    }
    
    func showDatas(image: String, name: String, house: String, price: String) {
        imageProduc.image = UIImage(named: image)
        productName.text = name
        productHouse.text = house
        productPrice.text = price
    }
    
}
