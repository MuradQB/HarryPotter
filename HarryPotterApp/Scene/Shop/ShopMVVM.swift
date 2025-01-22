//
//  ShopMVVM.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 12.01.25.
//

//import Foundation
//import UIKit
// 
//class ShopMVVM {
//    let manager = FileManagerHelper()
//    
//    @IBOutlet weak var collection: UICollectionView!
//    
//    var selectedProducts = [ProductModel]()
//    
//    let productData = CoreDataForProduct(context: AppDelegate().persistentContainer.viewContext)
//    
//    let categoryData = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
//    
//    func configureUi() {
//        collection.delegate = self
//        collection.dataSource = self
//        collection.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
//        collection.register(UINib(nibName: "Header", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "basket"),
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: #selector(rightBarButtonAction))
//    
//    
//}
