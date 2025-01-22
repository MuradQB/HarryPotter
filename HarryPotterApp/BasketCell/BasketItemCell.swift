//
//  BasketItemCell.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 12.01.25.
//

import UIKit

class BasketItemCell: UITableViewCell {

    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func showData(image: String, house: String, item
                  : String, price: String) {
        tableImage.image = UIImage(named: image)
        houseName.text = house
        itemName.text = item
        itemPrice.text = price
    }
}
