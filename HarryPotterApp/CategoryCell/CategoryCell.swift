//
//  CategoryCell.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 01.01.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func showData(image: String, name: String) {
        categoryImage.image = UIImage(named: image)
        houseName.text = name
    }
}
