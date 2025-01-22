//
//  ShopController.swift
//  HarryPotterApp
//,
//  Created by Murad Qarayev on 01.01.25.
//

import UIKit

class ShopController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    let manager = FileManagerHelper()
    var selectedProducts = [ProductModel]()
    
    let productData = CoreDataForProduct(context: AppDelegate().persistentContainer.viewContext)
    let categoryData = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        updateItems()
    }
    
    func configureUi() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        collection.register(UINib(nibName: "Header", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "basket"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action:
                                                                    #selector(rightBarButtonAction))
    }
    
    func updateItems() {
        let isDataLoaded = UserDefaults.standard.bool(forKey: "dataLoaded")
            if !isDataLoaded {
                AllDatas().loadData()
                UserDefaults.standard.set(true, forKey: "dataLoaded")
            }
        productData.fetchItems()
        categoryData.fetchItems()
    }
    
    func filterProducts(by category: CategoryList) {
        let filteredProducts = productData.productItems.filter { $0.category?.name == category.name}
        selectedProducts = filteredProducts
        collection.reloadData()
    }
    
    @objc func rightBarButtonAction() {
        let controller = storyboard?.instantiateViewController(identifier: "\(BasketController.self)") as! BasketController
        controller.basketProducts = self.selectedProducts
        navigationController?.show(controller, sender: nil)
    }
    
    func addItemToBasket(index: Int) {
        let newArray = productData.productItems
        let selectedItem = newArray[index]
        manager.readData { products in
            self.selectedProducts = products
            self.selectedProducts.append(selectedItem)
        }
        self.manager.writeData(product: self.selectedProducts)
    }
}

extension ShopController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productData.productItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductCell.self)", for: indexPath) as! ProductCell
        cell.showDatas(image: productData.productItems[indexPath.row].image ?? "",
                       name: productData.productItems[indexPath.row].name ?? "",
                       house: productData.productItems[indexPath.row].house ?? "",
                       price: productData.productItems[indexPath.row].price ?? "")
       
        cell.plusActionHandler = {
            self.addItemToBasket(index: indexPath.item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 10, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! Header
        header.category = categoryData.category
        header.sendCollection = { name in
            }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 200)
    }
    
}
