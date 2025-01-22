//
//  MovieCell.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 03.01.25.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieTime: UILabel!
    @IBOutlet private weak var movieYear: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func callBackData(name: String, image: String, time: String, year: String) {
        movieName.text = name
        movieTime.text = time
        movieYear.text = year
        movieImage.image = UIImage(named: image)
    }
}
