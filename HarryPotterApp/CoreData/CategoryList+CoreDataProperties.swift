//
//  CategoryList+CoreDataProperties.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 10.01.25.
//
//

import Foundation
import CoreData


extension CategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var isSelected: Bool

}

extension CategoryList : Identifiable {

}
