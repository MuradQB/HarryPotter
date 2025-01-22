//
//  AllDatas.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 05.01.25.
//

import Foundation
import CoreData

class AllDatas {
    let productData = CoreDataForProduct(context: AppDelegate().persistentContainer.viewContext)
    let categoryData = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    
    func loadData() {
        
//        let hogwarts = CategoryModel(name: "Hogwarts", image: "hogwarts")
//        categoryData.saveData(categoryModel: hogwarts)
        
        
        let gryffindor = CategoryModel(name: "Gryffindor", image: "gryffindor", isSelected: true)
        categoryData.saveData(categoryModel: gryffindor)
        
        let hufflepuff = CategoryModel(name: "Hufflepuff", image: "hufflepuff", isSelected: true)
        categoryData.saveData(categoryModel: hufflepuff)
        
        let ravenclaw = CategoryModel(name: "Ravenclaw", image: "ravenclaw", isSelected: true)
        categoryData.saveData(categoryModel: ravenclaw)
        
        let slytherin = CategoryModel(name: "Slytherin", image: "slytherin", isSelected: true)
        categoryData.saveData(categoryModel: slytherin)
        
        let cup1 = ProductModel(image: "cup1", name: "cup", house: "Gryffindor", price: "5.50 $", category: gryffindor)
        productData.saveData(productModel: cup1)
        let cup2 = ProductModel(image: "cup2", name: "cup", house: "Hufflepuff", price: "5.50 $", category: hufflepuff)
        productData.saveData(productModel: cup2)
        
        let cup3 = ProductModel(image: "cup3", name: "cup", house: "Ravenclaw", price: "5.50 $", category: ravenclaw)
        productData.saveData(productModel: cup3)
        
        let cup4 = ProductModel(image: "cup4", name: "cup", house: "Slytherin", price: "5.50 $", category: slytherin)
        productData.saveData(productModel: cup4)
        
        let wand1 = ProductModel(image: "wand1", name: "wand", house: "Gryffindor", price: "12.50 $", category: gryffindor)
        productData.saveData(productModel: wand1)
        
        let wand2 = ProductModel(image: "wand2", name: "wand", house: "Hufflepuff", price: "12.50 $", category: hufflepuff)
        productData.saveData(productModel: wand2)
        
        let wand3 = ProductModel(image: "wand3", name: "wand", house: "Ravenclaw", price: "12.50 $", category: ravenclaw)
        productData.saveData(productModel: wand3)
        
        let wand4 = ProductModel(image: "wand4", name: "wand", house: "Slytherin", price: "12.50 $", category: slytherin)
        productData.saveData(productModel: wand4)
        let hoodie1 = ProductModel(image: "hoodie1", name: "hoodie", house: "Gryffindor", price: "45 $", category: gryffindor)
        productData.saveData(productModel: hoodie1)
        
        let hoodie2 = ProductModel(image: "hoodie2", name: "hoodie", house: "Hufflepuff", price: "45 $", category: hufflepuff)
        productData.saveData(productModel: hoodie2)
        
        let hoodie3 = ProductModel(image: "hoodie3", name: "hoodie", house: "Ravenclaw", price: "45 $", category: ravenclaw)
        productData.saveData(productModel: hoodie3)
        
        let hoodie4 = ProductModel(image: "hoodie4", name: "hoodie", house: "Slytherin", price: "45 $", category: slytherin)
        productData.saveData(productModel: hoodie4)
        
        let tshirt1 = ProductModel(image: "tshirt1", name: "t-shirt", house: "Gryffindor", price: "45 $", category: gryffindor)
        productData.saveData(productModel: tshirt1)
        
        let tshirt2 = ProductModel(image: "tshirt2", name: "t-shirt", house: "Hufflepuff", price: "45 $", category: hufflepuff)
        productData.saveData(productModel: tshirt2)
        
        let tshirt3 = ProductModel(image: "tshirt3", name: "t-shirt", house: "Ravenclaw", price: "45 $", category: ravenclaw)
        productData.saveData(productModel: tshirt3)
        
        let tshirt4 = ProductModel(image: "tshirt4", name: "t-shirt", house: "Slytherin", price: "45 $", category: slytherin)
        productData.saveData(productModel: tshirt4)
        
        let bag1 = ProductModel(image: "bag1", name: "bag", house: "Gryffindor", price: "45 $", category: gryffindor)
        productData.saveData(productModel: bag1)
        
        let bag2 = ProductModel(image: "bag2", name: "bag", house: "Hufflepuff", price: "45 $", category: hufflepuff)
        productData.saveData(productModel: bag2)
        
        let bag3 = ProductModel(image: "bag3", name: "bag", house: "Ravenclaw", price: "45 $", category: ravenclaw)
        productData.saveData(productModel: bag3)
        
        let bag4 = ProductModel(image: "bag4", name: "bag", house: "Slytherin", price: "45 $", category: slytherin)
        productData.saveData(productModel: bag4)
        }
    
}
