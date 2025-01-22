//
//  CoreDataForProduct.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 05.01.25.
//

import Foundation
import CoreData

class CoreDataForProduct {
    var context = AppDelegate().persistentContainer.viewContext
    private var items = [ProductList]()
    var productItems = [ProductModel]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveData (productModel: ProductModel) {
        let model = ProductList(context: context)
        model.name = productModel.name
        model.house = productModel.house
        model.price = productModel.price
        model.image = productModel.image
        model.category = productModel.category?.name
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchItems() {
        do {
            items = try context.fetch(ProductList.fetchRequest())
            productItems = items.map({
                ProductModel(image: $0.image,
                             name: $0.name,
                             house: $0.house,
                             price: $0.price,
                             category: .init(name: $0.category,
                                             image: "", isSelected: true))
            })
            print(productItems)
        } catch {
            print(error.localizedDescription)
        }
    }
}
