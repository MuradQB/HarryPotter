//
//  Header.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 01.01.25.
//

import UIKit

class Header: UICollectionReusableView {
    
    var category = [CategoryList]()
    var selectedItem = [ProductList]()
    
//    var onCategorySelected: ((CategoryList) -> Void)?
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUi()
        
    }
    
    func configureUi() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "CategoryCell", bundle: nil),
                            forCellWithReuseIdentifier: "CategoryCell")
    }

    var sendCollection: ((String) -> Void)?
    
}

extension Header: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.showData(image: category[indexPath.row].image ?? "" , name: category[indexPath.row].name ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for (index, _) in category.enumerated() {
            category[index].isSelected = index == indexPath.item ? true : false
        }
        sendCollection?(category[indexPath.row].name ?? "")
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2.2 , height: collectionView.frame.height - 30)
    }
}
