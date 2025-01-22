//
//  CoreDataForCategory.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 05.01.25.
//

import Foundation
import CoreData

class CoreDataForCategory {
    var context = AppDelegate().persistentContainer.viewContext
    var category = [CategoryList]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveData(categoryModel: CategoryModel) {
        let model = CategoryList(context: context)
        model.name = categoryModel.name
        model.image = categoryModel.image
        model.isSelected = true
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchItems() {
        do {
            category = try context.fetch(CategoryList.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
    }
}


