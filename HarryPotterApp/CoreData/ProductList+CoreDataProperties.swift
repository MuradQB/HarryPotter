//
//  ProductList+CoreDataProperties.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 10.01.25.
//
//

import Foundation
import CoreData


extension ProductList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductList> {
        return NSFetchRequest<ProductList>(entityName: "ProductList")
    }

    @NSManaged public var category: String?
    @NSManaged public var house: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?

}

extension ProductList : Identifiable {

}
